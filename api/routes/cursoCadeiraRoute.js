import express from "express";
import { createCursoCadeira } from "../controllers/cursoCadeiraController.js";

const router = express.Router();

router.post('/create', createCursoCadeira);

export default router