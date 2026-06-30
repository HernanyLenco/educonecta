import { prisma } from "../config/db.js";

export const createProfAluno = async (req, res) => {
  const { professorId, alunoId } = req.body;

  try {
    await prisma.professorAluno.create({
      data: {
        professorId: professorId,
        alunoId: alunoId,
      },
    });

    return res.status(201).json({
      message: "Relacionamento Professor <-> Aluno Criado com sucesso",
    });
  } catch (error) {
    console.error("Erro completo:", JSON.stringify(error, null, 2));
    console.error("Mensagem:", error.message);
    console.error("Stack:", error.stack);
    return res.status(500).json({ error: "Internal server error" });
  }
};
