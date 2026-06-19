/*
  Warnings:

  - A unique constraint covering the columns `[email]` on the table `aluno` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `email` to the `aluno` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "aluno" ADD COLUMN     "email" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "aluno_email_key" ON "aluno"("email");
