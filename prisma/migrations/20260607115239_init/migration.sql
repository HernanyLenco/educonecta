-- CreateEnum
CREATE TYPE "acesso" AS ENUM ('ALUNO', 'PROFESSOR', 'ENCARREGADO', 'ADMIN');

-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "nivel" "acesso" NOT NULL DEFAULT 'ALUNO',

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "aluno" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "numeroDeEstudante" SERIAL NOT NULL,
    "idade" INTEGER NOT NULL,
    "genero" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL,

    CONSTRAINT "aluno_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "encarregado" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "profissao" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "numeroDeTelefone" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL,

    CONSTRAINT "encarregado_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "faculdade" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,

    CONSTRAINT "faculdade_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cadeiras" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "professor" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "numeroDeTelefone" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "professor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "areaAdministrativa" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "areaAdministrativa_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_id_key" ON "user"("id");

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "aluno_id_key" ON "aluno"("id");

-- CreateIndex
CREATE UNIQUE INDEX "aluno_email_key" ON "aluno"("email");

-- CreateIndex
CREATE UNIQUE INDEX "aluno_numeroDeEstudante_key" ON "aluno"("numeroDeEstudante");

-- CreateIndex
CREATE UNIQUE INDEX "aluno_userId_key" ON "aluno"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "encarregado_id_key" ON "encarregado"("id");

-- CreateIndex
CREATE UNIQUE INDEX "encarregado_email_key" ON "encarregado"("email");

-- CreateIndex
CREATE UNIQUE INDEX "encarregado_numeroDeTelefone_key" ON "encarregado"("numeroDeTelefone");

-- CreateIndex
CREATE UNIQUE INDEX "encarregado_userId_key" ON "encarregado"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "faculdade_id_key" ON "faculdade"("id");

-- CreateIndex
CREATE UNIQUE INDEX "cadeiras_id_key" ON "cadeiras"("id");

-- CreateIndex
CREATE UNIQUE INDEX "professor_id_key" ON "professor"("id");

-- CreateIndex
CREATE UNIQUE INDEX "professor_email_key" ON "professor"("email");

-- CreateIndex
CREATE UNIQUE INDEX "professor_numeroDeTelefone_key" ON "professor"("numeroDeTelefone");

-- CreateIndex
CREATE UNIQUE INDEX "professor_userId_key" ON "professor"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "areaAdministrativa_id_key" ON "areaAdministrativa"("id");

-- CreateIndex
CREATE UNIQUE INDEX "areaAdministrativa_email_key" ON "areaAdministrativa"("email");

-- CreateIndex
CREATE UNIQUE INDEX "areaAdministrativa_userId_key" ON "areaAdministrativa"("userId");

-- AddForeignKey
ALTER TABLE "aluno" ADD CONSTRAINT "aluno_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "encarregado" ADD CONSTRAINT "encarregado_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "professor" ADD CONSTRAINT "professor_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "areaAdministrativa" ADD CONSTRAINT "areaAdministrativa_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;
