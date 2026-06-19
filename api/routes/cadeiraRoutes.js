import express from "express";
import { createCadeira } from "../controllers/cadeiraController.js";

const router = express.Router();

router.post('/create', createCadeira);

export default router