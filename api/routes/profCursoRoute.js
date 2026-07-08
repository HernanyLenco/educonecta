import express from "express";
import { createProfCurso } from "../controllers/ProfCursoController.js";

const router = express.Router();

router.post('/create', createProfCurso);

export default router