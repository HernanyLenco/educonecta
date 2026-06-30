import express from "express";
import { createProfAluno } from "../controllers/profAlunoController.js";

const router = express.Router();

router.post('/create', createProfAluno);

export default router