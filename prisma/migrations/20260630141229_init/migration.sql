-- CreateTable
CREATE TABLE "aluno_curso" (
    "id" TEXT NOT NULL,
    "alunoId" TEXT NOT NULL,
    "cursoId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "aluno_curso_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "aluno_curso_alunoId_cursoId_key" ON "aluno_curso"("alunoId", "cursoId");

-- AddForeignKey
ALTER TABLE "aluno_curso" ADD CONSTRAINT "aluno_curso_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "aluno"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aluno_curso" ADD CONSTRAINT "aluno_curso_cursoId_fkey" FOREIGN KEY ("cursoId") REFERENCES "curso"("id") ON DELETE CASCADE ON UPDATE CASCADE;
