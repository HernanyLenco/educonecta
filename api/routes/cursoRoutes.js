import express from "express";
import { createCurso } from "../controllers/cursoController.js";


const router = express.Router();

router.post('/create', createCurso);

export default router;