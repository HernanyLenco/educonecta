import express from "express";
import { createProfCadeira } from "../controllers/ProfCadeiraController.js";

const router = express.Router();

router.post('/create', createProfCadeira);

export default router