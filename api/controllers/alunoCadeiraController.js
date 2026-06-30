import { prisma } from "../config/db.js";

export const createAlunoCadeira = async (req, res) => {
  const { alunoId, cadeiraId } = req.body;

  try {
    await prisma.alunoCadeira.create({
      data: {
        alunoId: alunoId,
        cadeiraId: cadeiraId,
      },
    });

    return res
      .status(201)
      .json({ message: "Aluno <-> Cadeira Criada com Sucesso" });
  } catch (error) {
    console.error("Erro completo:", JSON.stringify(error, null, 2));
    console.error("Mensagem:", error.message);
    console.error("Stack:", error.stack);
    return res.status(500).json({ error: "Internal server error" });
  }
};
