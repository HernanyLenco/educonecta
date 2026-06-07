import express from "express";
import dotenv from "dotenv";
import { connectDB } from "./config/db.js";

// routes import

import authRoutes from "./routes/authRoutes.js";

dotenv.config();
connectDB();
const app = express();
const port = process.env.PORT || 3333;

app.use('/auth', authRoutes);


app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
