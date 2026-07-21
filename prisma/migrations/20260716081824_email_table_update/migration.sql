/*
  Warnings:

  - You are about to drop the column `email` on the `aluno` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `area_administrativa` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `encarregado` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `professor` table. All the data in the column will be lost.
  - Added the required column `profissao` to the `professor` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "aluno_email_key";

-- DropIndex
DROP INDEX "area_administrativa_email_key";

-- DropIndex
DROP INDEX "encarregado_email_key";

-- DropIndex
DROP INDEX "professor_email_key";

-- AlterTable
ALTER TABLE "aluno" DROP COLUMN "email";

-- AlterTable
ALTER TABLE "area_administrativa" DROP COLUMN "email";

-- AlterTable
ALTER TABLE "encarregado" DROP COLUMN "email";

-- AlterTable
ALTER TABLE "professor" DROP COLUMN "email",
ADD COLUMN     "profissao" TEXT NOT NULL;
