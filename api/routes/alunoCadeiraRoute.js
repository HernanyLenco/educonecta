import express from "express";
import { createAlunoCadeira } from "../controllers/alunoCadeiraController.js";

const router = express.Router();

router.post('/create', createAlunoCadeira);

export default router