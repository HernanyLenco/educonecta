import express from "express";
import dotenv from "dotenv";
import { connectDB } from "./config/db.js";

// Routes
import authRoutes from "./routes/authRoutes.js";
import cursoRoutes from "./routes/cursoRoutes.js";
import cadeiraRoutes from "./routes/cadeiraRoutes.js";
import encarregadoAlunoRoutes from "./routes/encarregadoAlunoRoutes.js";

dotenv.config(); // sempre primeiro

const app = express();
const port = process.env.PORT || 3333;

// Middleware antes de tudo
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Rotas
app.use("/auth", authRoutes);
app.use("/curso", cursoRoutes);
app.use("/cadeira", cadeiraRoutes);
app.use("/encarregadoAluno", encarregadoAlunoRoutes);

// Ligar à BD e só depois iniciar o servidor
connectDB().then(() => {
  app.listen(port, () => {
    console.log(`Server is running!`);
  });
});
