CREATE TABLE `dbpedido_venda`.`tb_clientes` (
  `CODIGO` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(100) NULL,
  `CIDADE` VARCHAR(45) NULL,
  `UF` VARCHAR(2) NULL,
  PRIMARY KEY (`CODIGO`));
  
  CREATE TABLE `dbpedido_venda`.`tb_produtos` (
  `CODIGO` VARCHAR(13) NOT NULL,
  `DESCRICAO` VARCHAR(60) NULL,
  `PRECO_VENDA` DOUBLE NULL,
  PRIMARY KEY (`CODIGO`));
  
  
  CREATE TABLE `dbpedido_venda`.`tb_pedidovenda` (
  `NUMPEDIDO` INT NOT NULL AUTO_INCREMENT,
  `DATAEMISSAO` DATE NULL,
  `CODCLIENTE` INT NOT NULL,
  `VALOR_TOTAL` DOUBLE NULL,
  PRIMARY KEY (`NUMPEDIDO`),
  INDEX `FK_CODCLIENTE_idx` (`CODCLIENTE` ASC) VISIBLE,
  CONSTRAINT `FK_CODCLIENTE`
    FOREIGN KEY (`CODCLIENTE`)
    REFERENCES `dbpedido_venda`.`tb_clientes` (`CODIGO`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION);
	
	
CREATE TABLE `dbpedido_venda`.`tb_pedidos_produtos` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NUMPEDIDO` INT NOT NULL,
  `CODPRODUTO` VARCHAR(13) NOT NULL,
  `QUANTIDADE` DOUBLE NULL,
  `VALOR_UNITARIO` DOUBLE NULL,
  `VALOR_TOTAL` DOUBLE NULL,
  PRIMARY KEY (`ID`),
  INDEX `FK_NUMPEDIDO_idx` (`NUMPEDIDO` ASC) VISIBLE,
  INDEX `FK_PRODUTO_idx` (`CODPRODUTO` ASC) VISIBLE,
  CONSTRAINT `FK_NUMPEDIDO`
    FOREIGN KEY (`NUMPEDIDO`)
    REFERENCES `dbpedido_venda`.`tb_pedidovenda` (`NUMPEDIDO`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PRODUTO`
    FOREIGN KEY (`CODPRODUTO`)
    REFERENCES `dbpedido_venda`.`tb_produtos` (`CODIGO`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION);
	