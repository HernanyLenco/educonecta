import express from 'express';
import { getAll, registerUser, updateUser } from '../controllers/authController.js';

const router = express.Router();

router.get('/', getAll)
router.post('/register', registerUser);
router.put('/update/:id', updateUser);

export default router;