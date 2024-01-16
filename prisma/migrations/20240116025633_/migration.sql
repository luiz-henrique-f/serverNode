/*
  Warnings:

  - You are about to drop the column `emailVerified` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `image` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `agendamento` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `categoria_servicos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `clientes` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `colaboradores` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `cupom` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `servicos` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterTable
ALTER TABLE "User" DROP COLUMN "emailVerified",
DROP COLUMN "image";

-- DropTable
DROP TABLE "agendamento";

-- DropTable
DROP TABLE "categoria_servicos";

-- DropTable
DROP TABLE "clientes";

-- DropTable
DROP TABLE "colaboradores";

-- DropTable
DROP TABLE "cupom";

-- DropTable
DROP TABLE "servicos";

-- CreateTable
CREATE TABLE "Clientes" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "celular" TEXT NOT NULL,
    "sexo" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Clientes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Colaboradores" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "celular" TEXT NOT NULL,
    "foto" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Colaboradores_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cupom" (
    "id" TEXT NOT NULL,
    "codigo_cupom" TEXT NOT NULL,
    "id_servico" TEXT NOT NULL,
    "ativo" TEXT NOT NULL,

    CONSTRAINT "Cupom_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Servicos" (
    "id" TEXT NOT NULL,
    "id_categoria_servico" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "valor" TEXT NOT NULL,
    "duracao" TEXT NOT NULL,

    CONSTRAINT "Servicos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Categoria_Servicos" (
    "id" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,

    CONSTRAINT "Categoria_Servicos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Agendamento" (
    "id" TEXT NOT NULL,
    "id_cliente" TEXT NOT NULL,
    "id_colaborador" TEXT NOT NULL,
    "id_servico" TEXT NOT NULL,
    "data" TEXT NOT NULL,
    "hora_inicial" TEXT NOT NULL,
    "hora_final" TEXT NOT NULL,
    "forma_pagamento" TEXT NOT NULL,
    "status" TEXT NOT NULL,

    CONSTRAINT "Agendamento_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Cupom_codigo_cupom_key" ON "Cupom"("codigo_cupom");
