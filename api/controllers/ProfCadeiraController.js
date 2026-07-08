import { prisma } from "../config/db.js";

export const createProfCadeira = async (req, res) => {
  const { professorId, cadeiraId } = req.body;

  try {
    await prisma.profCadeira.create({
      data: {
        professorId: professorId,
        cadeiraId: cadeiraId,
      },
    });

    return res.status(201).json({
      message: "Profesor-Cadeira relacionado com sucesso",
    });
  } catch (error) {
    console.error("Erro completo:", JSON.stringify(error, null, 2));
    console.error("Mensagem:", error.message);
    console.error("Stack:", error.stack);
    return res.status(500).json({ error: "Internal server error" });
  }
};
