import express from "express";
import { createEncAluno } from "../controllers/encAlunoController.js";

const router = express.Router();

router.post("/create", createEncAluno);

export default router;
