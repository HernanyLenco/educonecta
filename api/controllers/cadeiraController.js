import { prisma } from "../config/db.js";

export const createCadeira = async (req, res) => {
  const { nome } = req.body;
  try {
    await prisma.cadeira.create({
      data: {
        nome: nome,
      },
    });
    return res.status(201).json({
      message: "Cadeira criada com sucesso",
    });
  } catch (error) {
    console.error("Erro completo:", JSON.stringify(error, null, 2));
    console.error("Mensagem:", error.message);
    console.error("Stack:", error.stack);
    return res.status(500).json({ error: "Internal server error" });
  }
};
