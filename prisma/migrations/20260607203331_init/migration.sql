/*
  Warnings:

  - You are about to drop the column `nivel` on the `user` table. All the data in the column will be lost.

*/
-- CreateEnum
CREATE TYPE "nivelAcesso" AS ENUM ('ALUNO', 'PROFESSOR', 'ENCARREGADO', 'ADMIN');

-- AlterTable
ALTER TABLE "aluno" ALTER COLUMN "numeroDeEstudante" DROP DEFAULT,
ALTER COLUMN "numeroDeEstudante" SET DATA TYPE TEXT;
DROP SEQUENCE "aluno_numeroDeEstudante_seq";

-- AlterTable
ALTER TABLE "cadeiras" ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT;
DROP SEQUENCE "cadeiras_id_seq";

-- AlterTable
ALTER TABLE "user" DROP COLUMN "nivel",
ADD COLUMN     "nivelAcesso" "nivelAcesso" NOT NULL DEFAULT 'ALUNO';

-- DropEnum
DROP TYPE "acesso";

-- CreateTable
CREATE TABLE "aluno_cadeira" (
    "id" TEXT NOT NULL,
    "alunoId" TEXT NOT NULL,
    "cadeiraId" TEXT NOT NULL,

    CONSTRAINT "aluno_cadeira_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "aluno_cadeira_id_key" ON "aluno_cadeira"("id");

-- CreateIndex
CREATE UNIQUE INDEX "aluno_cadeira_alunoId_cadeiraId_key" ON "aluno_cadeira"("alunoId", "cadeiraId");

-- AddForeignKey
ALTER TABLE "aluno_cadeira" ADD CONSTRAINT "aluno_cadeira_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "aluno"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aluno_cadeira" ADD CONSTRAINT "aluno_cadeira_cadeiraId_fkey" FOREIGN KEY ("cadeiraId") REFERENCES "cadeiras"("id") ON DELETE CASCADE ON UPDATE CASCADE;
