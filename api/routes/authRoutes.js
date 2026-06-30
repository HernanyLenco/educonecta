import express from 'express';
import { getAll, registerUser } from '../controllers/authController.js';

const router = express.Router();

router.post('/register', registerUser);
router.get('/', getAll)

export default router;