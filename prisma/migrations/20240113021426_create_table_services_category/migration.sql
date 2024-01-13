/*
  Warnings:

  - Added the required column `id_categoria_servico` to the `servicos` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "servicos" ADD COLUMN     "id_categoria_servico" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "categoria_servicos" (
    "id" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,

    CONSTRAINT "categoria_servicos_pkey" PRIMARY KEY ("id")
);
