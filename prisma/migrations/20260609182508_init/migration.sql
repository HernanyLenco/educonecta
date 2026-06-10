/*
  Warnings:

  - You are about to drop the `aluno` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `aluno_cadeira` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `areaAdministrativa` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `encarregado` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `faculdade` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `professor` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[nome]` on the table `cadeiras` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `updatedAt` to the `cadeiras` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "NivelAcesso" AS ENUM ('ALUNO', 'PROFESSOR', 'ENCARREGADO', 'ADMIN');

-- DropForeignKey
ALTER TABLE "aluno" DROP CONSTRAINT "aluno_userId_fkey";

-- DropForeignKey
ALTER TABLE "aluno_cadeira" DROP CONSTRAINT "aluno_cadeira_alunoId_fkey";

-- DropForeignKey
ALTER TABLE "aluno_cadeira" DROP CONSTRAINT "aluno_cadeira_cadeiraId_fkey";

-- DropForeignKey
ALTER TABLE "areaAdministrativa" DROP CONSTRAINT "areaAdministrativa_userId_fkey";

-- DropForeignKey
ALTER TABLE "encarregado" DROP CONSTRAINT "encarregado_userId_fkey";

-- DropForeignKey
ALTER TABLE "professor" DROP CONSTRAINT "professor_userId_fkey";

-- AlterTable
ALTER TABLE "cadeiras" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ADD CONSTRAINT "cadeiras_pkey" PRIMARY KEY ("id");

-- DropIndex
DROP INDEX "cadeiras_id_key";

-- DropTable
DROP TABLE "aluno";

-- DropTable
DROP TABLE "aluno_cadeira";

-- DropTable
DROP TABLE "areaAdministrativa";

-- DropTable
DROP TABLE "encarregado";

-- DropTable
DROP TABLE "faculdade";

-- DropTable
DROP TABLE "professor";

-- DropTable
DROP TABLE "user";

-- DropEnum
DROP TYPE "nivelAcesso";

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "nivelAcesso" "NivelAcesso" NOT NULL DEFAULT 'ALUNO',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "alunos" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "numeroDeEstudante" INTEGER NOT NULL,
    "idade" INTEGER NOT NULL,
    "genero" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "cursoId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "alunos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "encarregados" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "profissao" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "numeroDeTelefone" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "encarregados_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "encarregado_alunos" (
    "id" TEXT NOT NULL,
    "encarregadoId" TEXT NOT NULL,
    "alunoId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "encarregado_alunos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "professores" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "numeroDeTelefone" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "professores_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "professor_alunos" (
    "id" TEXT NOT NULL,
    "professorId" TEXT NOT NULL,
    "alunoId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "professor_alunos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cursos" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "cursos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "curso_cadeiras" (
    "id" TEXT NOT NULL,
    "cursoId" TEXT NOT NULL,
    "cadeiraId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "curso_cadeiras_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "professor_cadeiras" (
    "id" TEXT NOT NULL,
    "professorId" TEXT NOT NULL,
    "cadeiraId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "professor_cadeiras_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "professor_cursos" (
    "id" TEXT NOT NULL,
    "professorId" TEXT NOT NULL,
    "cursoId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "professor_cursos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "aluno_cadeiras" (
    "id" TEXT NOT NULL,
    "alunoId" TEXT NOT NULL,
    "cadeiraId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "aluno_cadeiras_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "area_administrativas" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "area_administrativas_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "alunos_numeroDeEstudante_key" ON "alunos"("numeroDeEstudante");

-- CreateIndex
CREATE UNIQUE INDEX "alunos_userId_key" ON "alunos"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "encarregados_email_key" ON "encarregados"("email");

-- CreateIndex
CREATE UNIQUE INDEX "encarregados_numeroDeTelefone_key" ON "encarregados"("numeroDeTelefone");

-- CreateIndex
CREATE UNIQUE INDEX "encarregados_userId_key" ON "encarregados"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "encarregado_alunos_encarregadoId_alunoId_key" ON "encarregado_alunos"("encarregadoId", "alunoId");

-- CreateIndex
CREATE UNIQUE INDEX "professores_email_key" ON "professores"("email");

-- CreateIndex
CREATE UNIQUE INDEX "professores_numeroDeTelefone_key" ON "professores"("numeroDeTelefone");

-- CreateIndex
CREATE UNIQUE INDEX "professores_userId_key" ON "professores"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "professor_alunos_professorId_alunoId_key" ON "professor_alunos"("professorId", "alunoId");

-- CreateIndex
CREATE UNIQUE INDEX "cursos_nome_key" ON "cursos"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "curso_cadeiras_cursoId_cadeiraId_key" ON "curso_cadeiras"("cursoId", "cadeiraId");

-- CreateIndex
CREATE UNIQUE INDEX "professor_cadeiras_professorId_cadeiraId_key" ON "professor_cadeiras"("professorId", "cadeiraId");

-- CreateIndex
CREATE UNIQUE INDEX "professor_cursos_professorId_cursoId_key" ON "professor_cursos"("professorId", "cursoId");

-- CreateIndex
CREATE UNIQUE INDEX "aluno_cadeiras_alunoId_cadeiraId_key" ON "aluno_cadeiras"("alunoId", "cadeiraId");

-- CreateIndex
CREATE UNIQUE INDEX "area_administrativas_email_key" ON "area_administrativas"("email");

-- CreateIndex
CREATE UNIQUE INDEX "area_administrativas_userId_key" ON "area_administrativas"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "cadeiras_nome_key" ON "cadeiras"("nome");

-- AddForeignKey
ALTER TABLE "alunos" ADD CONSTRAINT "alunos_cursoId_fkey" FOREIGN KEY ("cursoId") REFERENCES "cursos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "alunos" ADD CONSTRAINT "alunos_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "encarregados" ADD CONSTRAINT "encarregados_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "encarregado_alunos" ADD CONSTRAINT "encarregado_alunos_encarregadoId_fkey" FOREIGN KEY ("encarregadoId") REFERENCES "encarregados"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "encarregado_alunos" ADD CONSTRAINT "encarregado_alunos_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "alunos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professores" ADD CONSTRAINT "professores_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_alunos" ADD CONSTRAINT "professor_alunos_professorId_fkey" FOREIGN KEY ("professorId") REFERENCES "professores"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_alunos" ADD CONSTRAINT "professor_alunos_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "alunos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "curso_cadeiras" ADD CONSTRAINT "curso_cadeiras_cursoId_fkey" FOREIGN KEY ("cursoId") REFERENCES "cursos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "curso_cadeiras" ADD CONSTRAINT "curso_cadeiras_cadeiraId_fkey" FOREIGN KEY ("cadeiraId") REFERENCES "cadeiras"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_cadeiras" ADD CONSTRAINT "professor_cadeiras_professorId_fkey" FOREIGN KEY ("professorId") REFERENCES "professores"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_cadeiras" ADD CONSTRAINT "professor_cadeiras_cadeiraId_fkey" FOREIGN KEY ("cadeiraId") REFERENCES "cadeiras"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_cursos" ADD CONSTRAINT "professor_cursos_professorId_fkey" FOREIGN KEY ("professorId") REFERENCES "professores"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor_cursos" ADD CONSTRAINT "professor_cursos_cursoId_fkey" FOREIGN KEY ("cursoId") REFERENCES "cursos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aluno_cadeiras" ADD CONSTRAINT "aluno_cadeiras_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "alunos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aluno_cadeiras" ADD CONSTRAINT "aluno_cadeiras_cadeiraId_fkey" FOREIGN KEY ("cadeiraId") REFERENCES "cadeiras"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "area_administrativas" ADD CONSTRAINT "area_administrativas_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
