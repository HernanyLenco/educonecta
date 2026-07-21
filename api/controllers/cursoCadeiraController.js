import { prisma } from "../config/db.js";

export const createCursoCadeira = async (req, res) => {
  const { cursoId, cadeiraId } = req.body;
  try {
    await prisma.cadeira.create({
      data: {
        cursoId: cursoId,
        cadeiraId: cadeiraId,
      },
    });
    return res.status(201).json({
      message: "Curso - Cadeira relacionado com sucesso",
    });
  } catch (error) {
    console.error("Erro completo:", JSON.stringify(error, null, 2));
    console.error("Mensagem:", error.message);
    console.error("Stack:", error.stack);
    return res.status(500).json({ error: "Internal server error" });
  }
};
