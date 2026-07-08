import express from "express";
import { createAlunoCurso } from "../controllers/alunoCursoController.js";

const router = express.Router();

router.post('/create', createAlunoCurso);

export default router