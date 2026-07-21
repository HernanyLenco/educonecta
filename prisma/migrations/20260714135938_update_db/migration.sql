/*
  Warnings:

  - Changed the type of `numeroDeEstudante` on the `aluno` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "aluno" DROP COLUMN "numeroDeEstudante",
ADD COLUMN     "numeroDeEstudante" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "aluno_numeroDeEstudante_key" ON "aluno"("numeroDeEstudante");
