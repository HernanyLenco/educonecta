import { prisma } from "../config/db.js";
import bcrypt from "bcryptjs";

export const getAll = async (req, res) => {
  try {
    const users = await prisma.user.findMany();

    res.json(
      users.map((user) => ({
        email: user.email,
        nivelAcesso: user.nivelAcesso,
      })),
    );
  } catch (error) {
    console.error("Erro completo:", JSON.stringify(error, null, 2));
    console.error("Mensagem:", error.message);
    console.error("Stack:", error.stack);
    return res.status(500).json({ error: "Internal server error" });
  }
};

export const registerUser = async (req, res) => {
  const { email, senha, nivelAcesso, ...resto } = req.body;

  try {
    // 1. Verificação prévia
    const userExists = await prisma.user.findUnique({ where: { email } });
    if (userExists) {
      return res.status(409).json({ error: "Email já registado." });
    }

    // 2. Hash da senha
    const passwordHash = await bcrypt.hash(senha, 12);

    // 3. Prisma Interactive Transaction (Tudo ou nada)
    const result = await prisma.$transaction(async (tx) => {
      // Cria o usuário base
      const user = await tx.user.create({
        data: { email, senha: passwordHash, nivelAcesso },
      });

      // Cria o perfil específico usando a mesma transação (tx)
      switch (nivelAcesso) {
        case "ALUNO":
          const numeroDeEstudante = Math.floor(100000 + Math.random() * 900000);
          await tx.aluno.create({
            data: {
              userId: user.id,
              nome: resto.nome,
              numeroDeEstudante,
              idade: resto.idade,
              genero: resto.genero,
              cursoId: resto.cursoId,
            },
          });
          break;
        case "PROFESSOR":
          await tx.professor.create({
            data: {
              userId: user.id,
              nome: resto.nome,
              numeroDeTelefone: resto.numeroDeTelefone,
            },
          });
          break;
        // ... (Adicione os cases ENCARREGADO e ADMIN de forma semelhante)
        default:
          // Se cair aqui, lança um erro, o que cancela (rollback) a criação do User automaticamente!
          throw new Error("Acesso inválido.");
      }

      return user; // Retorna o usuário criado caso dê tudo certo
    });

    return res.status(201).json({
      message: "Utilizador registado com sucesso.",
      user: {
        id: result.id,
        nome: resto.nome,
        email: result.email,
        nivelAcesso: result.nivelAcesso,
      },
    });
  } catch (error) {
    // Se o erro foi o que nós lançamos no switch, retorna 400
    if (error.message === "Nível de acesso inválido.") {
      return res.status(400).json({ error: error.message });
    }

    console.error("Erro no registo:", error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

export const updateUser = async (req, res) => {
  const { id } = req.params;
  // Note que removemos o nivelAcesso daqui para não confiar na entrada do utilizador
  const { email, senha, ...resto } = req.body;

  try {
    // 1. Buscar o utilizador para validar existência e descobrir o nível real
    const userExists = await prisma.user.findUnique({ where: { id } });
    if (!userExists) {
      return res.status(404).json({ error: "Utilizador não encontrado." });
    }

    // 2. Preparar os dados de atualização do User base
    const userDataToUpdate = { email };
    
    // Se o utilizador enviou uma nova senha, fazemos o hash. Caso contrário, ignoramos.
    if (senha) {
      userDataToUpdate.senha = await bcrypt.hash(senha, 12);
    }

    // 3. Iniciar Transação (Garante que ambas as tabelas atualizam juntas)
    const result = await prisma.$transaction(async (tx) => {
      
      // Atualiza a tabela User
      const user = await tx.user.update({
        where: { id },
        data: userDataToUpdate,
      });

      // 4. Usa o nível de acesso que veio do BANCO DE DADOS (userExists)
      switch (userExists.nivelAcesso) {
        case "ALUNO":
          await tx.aluno.update({
            where: { userId: user.id },
            data: {
              nome: resto.nome,
              numeroDeEstudante: resto.numeroDeEstudante,
              idade: resto.idade,
              genero: resto.genero,
              cursoId: resto.cursoId,
            },
          });
          break;

        case "PROFESSOR":
          await tx.professor.update({
            where: { userId: user.id },
            data: {
              nome: resto.nome,
              profissao: resto.profissao,
              numeroDeTelefone: resto.numeroDeTelefone,
            },
          });
          break;

        case "ENCARREGADO":
          await tx.encarregado.update({
            where: { userId: user.id },
            data: {
              nome: resto.nome,
              profissao: resto.profissao,
              numeroDeTelefone: resto.numeroDeTelefone,
            },
          });
          break;

        case "ADMIN":
          await tx.areaAdministrativa.update({
            where: { userId: user.id },
            data: {
              nome: resto.nome,
            },
          });
          break;

        default:
          throw new Error("Estado inconsistente: Nível de acesso inválido no banco de dados.");
      }

      return user; // Retorna o usuário atualizado se tudo der certo
    });

    return res.status(200).json({
      message: "Utilizador atualizado com sucesso.",
      user: {
        id: result.id,
        email: result.email,BB
        nivelAcesso: result.nivelAcesso
      },
    });

  } catch (error) {
    console.error("Erro na atualização:", error);
    
    // Tratamento de erro comum do Prisma para registros não encontrados no update filho
    if (error.code === 'P2025') {
      return res.status(404).json({ error: "Perfil associado não encontrado." });
    }

    return res.status(500).json({ error: "Internal server error" });
  }
};
