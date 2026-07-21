import { prisma } from "../config/db.js";

export const createProfCurso = async (req, res) => {
  const { professorId, cursoId } = req.body;

  try {
    await prisma.profCurso.create({
      data: {
        professorId: professorId,
        cursoId: cursoId,
      },
    });

    return res.status(201).json({
      message: "Profesor-Curso associado com sucesso",
    });
  } catch (error) {
    console.error("Erro completo:", JSON.stringify(error, null, 2));
    console.error("Mensagem:", error.message);
    console.error("Stack:", error.stack);
    return res.status(500).json({ error: "Internal server error" });
  }
};
