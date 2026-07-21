import { prisma } from "../config/db.js";

export const createAlunoCurso = async (req, res) => {
  const { alunoId, cursoId } = req.body;

  try {
    await prisma.alunoCurso.create({
      data: {
         alunoId: alunoId,
        cursoId: cursoId,
      },
    });

    return res.status(201).json({
      message: "Relacionamento Aluno <-> Curso Criado com sucesso",
    });
  } catch (error) {
    console.error("Erro completo:", JSON.stringify(error, null, 2));
    console.error("Mensagem:", error.message);
    console.error("Stack:", error.stack);
    return res.status(500).json({ error: "Internal server error" });
  }
};
