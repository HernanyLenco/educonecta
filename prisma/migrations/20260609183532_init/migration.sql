/*
  Warnings:

  - You are about to drop the `aluno_cadeiras` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `alunos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `area_administrativas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `cadeiras` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `curso_cadeiras` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `cursos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `encarregado_alunos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `encarregados` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `professor_alunos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `professor_cadeiras` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `professor_cursos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `professores` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `users` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "aluno_cadeiras" DROP CONSTRAINT "aluno_cadeiras_alunoId_fkey";

-- DropForeignKey
ALTER TABLE "aluno_cadeiras" DROP CONSTRAINT "aluno_cadeiras_cadeiraId_fkey";

-- DropForeignKey
ALTER TABLE "alunos" DROP CONSTRAINT "alunos_cursoId_fkey";

-- DropForeignKey
ALTER TABLE "alunos" DROP CONSTRAINT "alunos_userId_fkey";

-- DropForeignKey
ALTER TABLE "area_administrativas" DROP CONSTRAINT "area_administrativas_userId_fkey";

-- DropForeignKey
ALTER TABLE "curso_cadeiras" DROP CONSTRAINT "curso_cadeiras_cadeiraId_fkey";

-- DropForeignKey
ALTER TABLE "curso_cadeiras" DROP CONSTRAINT "curso_cadeiras_cursoId_fkey";

-- DropForeignKey
ALTER TABLE "encarregado_alunos" DROP CONSTRAINT "encarregado_alunos_alunoId_fkey";

-- DropForeignKey
ALTER TABLE "encarregado_alunos" DROP CONSTRAINT "encarregado_alunos_encarregadoId_fkey";

-- DropForeignKey
ALTER TABLE "encarregados" DROP CONSTRAINT "encarregados_userId_fkey";

-- DropForeignKey
ALTER TABLE "professor_alunos" DROP CONSTRAINT "professor_alunos_alunoId_fkey";

-- DropForeignKey
ALTER TABLE "professor_alunos" DROP CONSTRAINT "professor_alunos_professorId_fkey";

-- DropForeignKey
ALTER TABLE "professor_cadeiras" DROP CONSTRAINT "professor_cadeiras_cadeiraId_fkey";

-- DropForeignKey
ALTER TABLE "professor_cadeiras" DROP CONSTRAINT "professor_cadeiras_professorId_fkey";

-- DropForeignKey
ALTER TABLE "professor_cursos" DROP CONSTRAINT "professor_cursos_cursoId_fkey";

-- DropForeignKey
ALTER TABLE "professor_cursos" DROP CONSTRAINT "professor_cursos_professorId_fkey";

-- DropForeignKey
ALTER TABLE "professores" DROP CONSTRAINT "professores_userId_fkey";

-- DropTable
DROP TABLE "aluno_cadeiras";

-- DropTable
DROP TABLE "alunos";

-- DropTable
DROP TABLE "area_administrativas";

-- DropTable
DROP TABLE "cadeiras";

-- DropTable
DROP TABLE "curso_cadeiras";

-- DropTable
DROP TABLE "cursos";

-- DropTable
DROP TABLE "encarregado_alunos";

-- DropTable
DROP TABLE "encarregados";

-- DropTable
DROP TABLE "professor_alunos";

-- DropTable
DROP TABLE "professor_cadeiras";

-- DropTable
DROP TABLE "professor_cursos";

-- DropTable
DROP TABLE "professores";

-- DropTable
DROP TABLE "users";

-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "nivelAcesso" "NivelAcesso" NOT NULL DEFAULT 'ALUNO',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "aluno" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "numeroDeEstudante" INTEGER NOT NULL,
    "idade" INTEGER NOT NULL,
    "genero" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "cursoId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "aluno_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "encarregado" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "profissao" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "numeroDeTelefone" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "encarregado_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "encarregado_aluno" (
    "id" TEXT NOT NULL,
    "encarregadoId" TEXT NOT NULL,
    "alunoId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "encarregado_aluno_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "professor" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "numeroDeTelefone" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "professor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "professor_aluno" (
    "id" TEXT NOT NULL,
    "professorId" TEXT NOT NULL,
    "alunoId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "professor_aluno_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "curso" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "curso_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cadeira" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "cadeira_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "curso_cadeira" (
    "id" TEXT NOT NULL,
    "cursoId" TEXT NOT NULL,
    "cadeiraId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "curso_cadeira_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "professor_cadeira" (
    "id" TEXT NOT NULL,
    "professorId" TEXT NOT NULL,
    "cadeiraId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "professor_cadeira_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "professor_curso" (
    "id" TEXT NOT NULL,
    "professorId" TEXT NOT NULL,
    "cursoId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "professor_curso_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "aluno_cadeira" (
    "id" TEXT NOT NULL,
    "alunoId" TEXT NOT NULL,
    "cadeiraId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "aluno_cadeira_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "area_administrativa" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "area_administrativa_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "aluno_numeroDeEstudante_key" ON "aluno"("numeroDeEstudante");

-- CreateIndex
CREATE UNIQUE INDEX "aluno_userId_key" ON "aluno"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "encarregado_email_key" ON "encarregado"("email");

-- CreateIndex
CREATE UNIQUE INDEX "encarregado_numeroDeTelefone_key" ON "encarregado"("numeroDeTelefone");

-- CreateIndex
CREATE UNIQUE INDEX "encarregado_userId_key" ON "encarregado"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "encarregado_aluno_encarregadoId_alunoId_key" ON "encarregado_aluno"("encarregadoId", "alunoId");

-- CreateIndex
CREATE UNIQUE INDEX "professor_email_key" ON "professor"("email");

-- CreateIndex
CREATE UNIQUE INDEX "professor_numeroDeTelefone_key" ON "professor"("numeroDeTelefone");

-- CreateIndex
CREATE UNIQUE INDEX "professor_userId_key" ON "professor"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "professor_aluno_professorId_alunoId_key" ON "professor_aluno"("professorId", "alunoId");

-- CreateIndex
CREATE UNIQUE INDEX "curso_nome_key" ON "curso"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "cadeira_nome_key" ON "cadeira"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "curso_cadeira_cursoId_cadeiraId_key" ON "curso_cadeira"("cursoId", "cadeiraId");

-- CreateIndex
CREATE UNIQUE INDEX "professor_cadeira_professorId_cadeiraId_key" ON "professor_cadeira"("professorId", "cadeiraId");

-- CreateIndex
CREATE UNIQUE INDEX "professor_curso_professorId_cursoId_key" ON "professor_curso"("professorId", "cursoId");

-- CreateIndex
CREATE UNIQUE INDEX "aluno_cadeira_alunoId_cadeiraId_key" ON "aluno_cadeira"("alunoId", "cadeiraId");

-- CreateIndex
CREATE UNIQUE INDEX "area_administrativa_email_key" ON "area_administrativa"("email");

-- CreateIndex
CREATE UNIQUE INDEX "area_administrativa_userId_key" ON "area_administrativa"("userId");

-- AddForeignKey
ALTER TABLE "aluno" ADD CONSTRAINT "aluno_cursoId_fkey" FOREIGN KEY ("cursoId") REFERENCES "curso"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aluno" ADD CONSTRAINT "aluno_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "encarregado" ADD CONSTRAINT "encarregado_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "encarregado_aluno" ADD CONSTRAINT "encarregado_aluno_encarregadoId_fkey" FOREIGN KEY ("encarregadoId") REFERENCES "encarregado"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "encarregado_aluno" ADD CONSTRAINT "encarregado_aluno_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "aluno"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor" ADD CONSTRAINT "professor_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_aluno" ADD CONSTRAINT "professor_aluno_professorId_fkey" FOREIGN KEY ("professorId") REFERENCES "professor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_aluno" ADD CONSTRAINT "professor_aluno_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "aluno"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "curso_cadeira" ADD CONSTRAINT "curso_cadeira_cursoId_fkey" FOREIGN KEY ("cursoId") REFERENCES "curso"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "curso_cadeira" ADD CONSTRAINT "curso_cadeira_cadeiraId_fkey" FOREIGN KEY ("cadeiraId") REFERENCES "cadeira"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_cadeira" ADD CONSTRAINT "professor_cadeira_professorId_fkey" FOREIGN KEY ("professorId") REFERENCES "professor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_cadeira" ADD CONSTRAINT "professor_cadeira_cadeiraId_fkey" FOREIGN KEY ("cadeiraId") REFERENCES "cadeira"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_curso" ADD CONSTRAINT "professor_curso_professorId_fkey" FOREIGN KEY ("professorId") REFERENCES "professor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_curso" ADD CONSTRAINT "professor_curso_cursoId_fkey" FOREIGN KEY ("cursoId") REFERENCES "curso"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aluno_cadeira" ADD CONSTRAINT "aluno_cadeira_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "aluno"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aluno_cadeira" ADD CONSTRAINT "aluno_cadeira_cadeiraId_fkey" FOREIGN KEY ("cadeiraId") REFERENCES "cadeira"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "area_administrativa" ADD CONSTRAINT "area_administrativa_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;
