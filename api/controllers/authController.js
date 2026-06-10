import { prisma } from "../config/db.js";
import bcrypt from "bcryptjs";

export const registerUser = async (req, res) => {
  const { email, senha, nivelAcesso, ...resto } = req.body;

  try {
    // Verificar se email já existe
    const userExists = await prisma.user.findUnique({ where: { email } });
    if (userExists) {
      return res.status(409).json({ error: "Email já registado." });
    }

    
    const passwordHash = await bcrypt.hash(senha, 12);

    // Criar criar usuario 
    const user = await prisma.user.create({
      data: { email, senha: passwordHash, nivelAcesso },
    });

    // Criar registo específico para cada nível de acesso
    if (nivelAcesso === "ALUNO") {
      const numeroDeEstudante = Math.floor(
        100000 + Math.random() * 900000,
      ).toString();

      await prisma.aluno.create({
        data: {
          userId: user.id,
          nome: resto.nome,
          email: email,
          numeroDeEstudante: numeroDeEstudante,
          idade: resto.idade,
          genero: resto.genero,
          curso: resto.curso
        },
      });
    } else if (nivelAcesso === "PROFESSOR") {
      await prisma.professor.create({
        data: {
          userId: user.id,
          nome: resto.nome,
          email: email,
          numeroDeTelefone: resto.numeroDeTelefone,
        },
      });
    } else if (nivelAcesso === "ENCARREGADO") {
      await prisma.encarregado.create({
        data: {
          userId: user.id,
          nome: resto.nome,
          email: email,
          profissao: resto.profissao,
          numeroDeTelefone: resto.numeroDeTelefone,
        },
      });
    } else if (nivelAcesso === "ADMIN") {
      await prisma.areaAdministrativa.create({
        data: {
          userId: user.id,
          nome: resto.nome,
          email: email,
        },
      });
    } else {
      await prisma.user.delete({ where: { id: user.id } });
      return res.status(400).json({ error: "Nível de acesso inválido." });
    }

    return res.status(201).json({
      message: "Utilizador registado com sucesso.",
      user: { id: user.id, email: user.email, nivelAcesso: user.nivelAcesso },
    });
  } catch (error) {
    console.error("Erro completo:", JSON.stringify(error, null, 2));
    console.error("Mensagem:", error.message);
    console.error("Stack:", error.stack);
    return res.status(500).json({ error: "Internal server error" });
  }
};
