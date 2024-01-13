/*
  Warnings:

  - A unique constraint covering the columns `[codigo_cupom]` on the table `cupom` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `codigo_cupom` to the `cupom` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "cupom" ADD COLUMN     "codigo_cupom" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "cupom_codigo_cupom_key" ON "cupom"("codigo_cupom");
