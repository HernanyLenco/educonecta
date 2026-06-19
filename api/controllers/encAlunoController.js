import { prisma } from "../config/db.js";

export const createEncAluno = async (req, res) => {
  const { encarregadoId, alunoId } = req.body;

  try {
    await prisma.encarregadoAluno.create({
      data: {
        encarregadoId: encarregadoId,
        alunoId: alunoId,
      },
    });
    return res.status(201).json({
      message: "Relacionamento Encarregado <-> Aluno Criado com sucesso",
    });
  } catch (error) {
    console.error("Erro completo:", JSON.stringify(error, null, 2));
    console.error("Mensagem:", error.message);
    console.error("Stack:", error.stack);
    return res.status(500).json({ error: "Internal server error" });
  }
};
