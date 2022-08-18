-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Ago-2022 às 03:41
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbpedido_venda`
--

-- --------------------------------------------------------

DROP DATABASE IF EXISTS`dbpedido_venda`;


CREATE DATABASE IF NOT EXISTS `dbpedido_venda`;

--
-- Estrutura da tabela `tb_clientes`
--

CREATE TABLE `tb_clientes` (
  `CODIGO` int(11) NOT NULL,
  `NOME` varchar(100) DEFAULT NULL,
  `CIDADE` varchar(45) DEFAULT NULL,
  `UF` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_clientes`
--

INSERT INTO `tb_clientes` (`CODIGO`, `NOME`, `CIDADE`, `UF`) VALUES
(1, 'CLIENTE PC CONSUMIDOR FINAL', 'Caucaia', 'CE'),
(2, 'CLIENTE PC CONSUMIDOR FINAL', 'Fortaleza', 'CE'),
(3, 'A C F NEGREIROS', 'Tabuleiro do Norte', 'CE'),
(4, 'A DE OLIVEIRA GOMES MERCEARIA ME', 'Limoeiro do Norte', 'CE'),
(5, 'A V C DE SOUSA ALIMENTOS  - EPP', 'Quixeré', 'CE'),
(6, 'ALEX JOSE DE ARAUJO LIMA MS', 'Russas', 'CE'),
(7, 'AMADEU RICARDO DE MATOS EPP', 'Russas', 'CE'),
(8, 'ANA MARIA PAULA DA SILVA LOPES MICROEMPR', 'São João do Jaguaribe', 'CE'),
(9, 'COMERCIAL MERCADINHO DO FRANGO LTDA - ME', 'Limoeiro do Norte', 'CE'),
(10, 'SUPER ECONOMICO LTDA', 'Tabuleiro do Norte', 'CE'),
(11, 'MASTER DISTRIB. DE ALIMENTOS EIRELI ME', 'Maracanaú', 'CE'),
(12, 'ANTONIO EUDES SALES GOMES - ME', 'Limoeiro do Norte', 'CE'),
(13, 'ANTONIO FILGUEIRA GUIMARAES - ME', 'Limoeiro do Norte', 'CE'),
(14, 'BRUMATI & BIZONHIN LTDA', 'Limoeiro do Norte', 'CE'),
(15, 'DANIELLE ALEXANDRE MAIA', 'Limoeiro do Norte', 'CE'),
(16, 'CLEISON JOSE F DE LIMA', 'Limoeiro do Norte', 'CE'),
(17, 'EDMAR SOUSA & FILHA LTDA', 'Limoeiro do Norte', 'CE'),
(18, 'E M DA SILVA MICROEMPRESA', 'Limoeiro do Norte', 'CE'),
(19, 'EDSON LIMA - ME', 'Limoeiro do Norte', 'CE'),
(20, 'F G A SILVA DE SOUZA-ME', 'Limoeiro do Norte', 'CE'),
(21, 'F J RIBEIRO FILHO ME', 'Limoeiro do Norte', 'CE'),
(22, 'F J  VIEIRA DE LIMA ME', 'Limoeiro do Norte', 'CE'),
(23, 'ANA CLAUDIA DA SILVA NOGUEIRA - EPP', 'Russas', 'CE'),
(24, 'AURELIANO RIBEIRO DA SILVA', 'Russas', 'CE'),
(25, 'ANTONIO ALDIZIO DE LIMA MICROEMPRESA', 'Russas', 'CE'),
(26, 'CERAMICA FROTA COMERCIO E INDUSTRIA LTDA', 'Russas', 'CE'),
(27, 'CERAMICA IRMAOS GOMES IND. E COM. LTDA', 'Russas', 'CE'),
(28, 'FLORINDA RODRIGUES LIMA EPP', 'Limoeiro do Norte', 'CE'),
(29, 'FRANCISCA ALVES MONTEIRO', 'Limoeiro do Norte', 'CE'),
(30, 'FRANCISCO AURINOR MAIA - MICROEMPRESA', 'Limoeiro do Norte', 'CE'),
(31, 'FREITAS & RODRIGUES COMERCIAL DE ALIMENT', 'Limoeiro do Norte', 'CE'),
(32, 'GECILDO MOREIRA DE OLIVEIRA MS', 'Limoeiro do Norte', 'CE'),
(33, 'SUPERMERCADO NOSSA FAMILIA LTDA', 'Limoeiro do Norte', 'CE'),
(34, 'H MOREIRA FILHO ME', 'Limoeiro do Norte', 'CE'),
(35, 'D. FERNANDES DE LIMA - ME', 'Russas', 'CE'),
(36, 'J V MOREIRA DE MIRANDA MICROEMPRESA', 'Limoeiro do Norte', 'CE'),
(37, 'ELIANA SANTIAGO DE LIMA - EPP', 'Russas', 'CE'),
(38, 'EVAMBERGUE FREIRE MOREIRA - EPP', 'Russas', 'CE'),
(39, 'JANUETE HOLANDA MAIA - EPP', 'Limoeiro do Norte', 'CE'),
(40, 'JOAO ARAUJO LIMA ME', 'Quixeré', 'CE'),
(41, 'F.D. OLIVEIRA ME', 'Russas', 'CE'),
(42, 'JOSE NILO DE LIMA MICROEMPRESA', 'Limoeiro do Norte', 'CE'),
(43, 'F N G SOMBRA MICROEMPRESA', 'Russas', 'CE'),
(44, 'F. RENE OLIVEIRA PINHEIRO', 'Russas', 'CE'),
(45, 'F VEUDO GONCALVES - ME', 'Russas', 'CE'),
(46, 'JURACI LIMA FERREIRA', 'Russas', 'CE'),
(47, 'FRANCIEUDO DE OLIVEIRA GONCALVES ME', 'Russas', 'CE'),
(48, 'LIGIA REGINA ALVES NOGUEIRA MICROEMPRESA', 'Limoeiro do Norte', 'CE'),
(49, 'FRANCISCA AMANDA SAMPAIO DA COSTA ME', 'Russas', 'CE'),
(50, 'LUCIANO GRANJA SENA ME', 'Limoeiro do Norte', 'CE');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pedidos_produtos`
--

CREATE TABLE `tb_pedidos_produtos` (
  `ID` int(11) NOT NULL,
  `NUMPEDIDO` int(11) NOT NULL,
  `CODPRODUTO` varchar(13) NOT NULL,
  `QUANTIDADE` double DEFAULT NULL,
  `VALOR_UNITARIO` double DEFAULT NULL,
  `VALOR_TOTAL` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_pedidos_produtos`
--

INSERT INTO `tb_pedidos_produtos` (`ID`, `NUMPEDIDO`, `CODPRODUTO`, `QUANTIDADE`, `VALOR_UNITARIO`, `VALOR_TOTAL`) VALUES
(0, 4, '0000000000010', 5, 186, 930),
(1, 1, '0000000000006', 2, 145.35, 290.7),
(2, 1, '0000000000008', 1, 186, 186),
(3, 1, '0000000000004', 2, 40, 80),
(4, 2, '0000000000005', 2, 60, 120),
(5, 2, '0000000000010', 2, 186, 372),
(6, 2, '0000000000014', 3, 88.4, 265.2),
(15, 6, '0000000000006', 1, 145.35, 145.35),
(16, 6, '0000000000008', 3, 186, 558),
(17, 6, '0000000000008', 1, 186, 186),
(18, 6, '0000000000011', 3, 20, 60),
(19, 6, '0000000000012', 4, 14, 56),
(20, 6, '0000000000014', 2, 88.4, 176.8),
(21, 6, '0000000000006', 2, 145.35, 290.7),
(22, 6, '0000000000004', 2, 40, 80),
(23, 5, '0000000000014', 1, 88.4, 88.4),
(24, 5, '0000000000006', 5, 145.35, 726.75),
(25, 5, '0000000000008', 3, 186, 558),
(26, 5, '0000000000010', 5, 186, 930);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pedidovenda`
--

CREATE TABLE `tb_pedidovenda` (
  `NUMPEDIDO` int(11) NOT NULL,
  `DATAEMISSAO` date DEFAULT NULL,
  `CODCLIENTE` int(11) NOT NULL,
  `VALOR_TOTAL` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_pedidovenda`
--

INSERT INTO `tb_pedidovenda` (`NUMPEDIDO`, `DATAEMISSAO`, `CODCLIENTE`, `VALOR_TOTAL`) VALUES
(1, '2022-08-15', 1, 556.7),
(2, '2022-08-15', 4, 757.2),
(4, '2022-08-15', 3, 386),
(5, '2022-08-15', 12, 1373.15),
(6, '2022-08-17', 10, 1552.85);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_produtos`
--

CREATE TABLE `tb_produtos` (
  `CODIGO` varchar(13) NOT NULL,
  `DESCRICAO` varchar(60) DEFAULT NULL,
  `PRECO_VENDA` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_produtos`
--

INSERT INTO `tb_produtos` (`CODIGO`, `DESCRICAO`, `PRECO_VENDA`) VALUES
('0000000000001', 'MONTAGEM', 15),
('0000000000003', 'BALCAO LONDRES BRANCO C/FRUTA/ MARMORIZADO', 52.5),
('0000000000004', 'FRUTEIRA NOBRE BRANCO C/FRUTA / MARMORIZADO', 40),
('0000000000005', 'ACENTO KORINO PRETO', 60),
('0000000000006', 'BABY LIGHT D18 SELADO SM 0700X700X01400', 145.35),
('0000000000007', 'KIT ESPELHO ROUPEIRO PAMPULHA REF. 683 - ESPELHO', 46),
('0000000000008', 'KIT 6PTS PAMPULHA II REF. 683 PRETO/BRANCO/GEOMETRICO PTO', 186),
('0000000000009', 'KIT 6PTS PAMPULHA II REF. 683 PRETO/GRIGIO', 186),
('0000000000010', 'KIT 6PTS PAMPULHA II REF. 683 PRETO/CARVALHO', 186),
('0000000000011', 'KIT C/ 1 ESPELHO ROUP. COLORADO/FILADELFIA/MONT/PARD. IV -', 20),
('0000000000012', 'JG C/8 PES DE PLASTICO REF. 705 BRANCO', 14),
('0000000000013', 'JG C/8 PES DE PLASTICO REF. 705 CINZA', 13),
('0000000000014', 'JG C/8 PES DE PLASTICO REF. 705 TABACO', 88.4),
('0000000000015', 'DESPESAS COM FRETE', 10),
('0000000000016', 'EXPOSITOR DE COZINHA BRANCO (2444) BRANCO', 339),
('0000000000017', 'MESA ELEGANCE LAT MG BECHARA', 215),
('0000000000018', 'JG C/4 PES DE PLASTICO REF. 705 TABACO', 44.2),
('0000000000019', 'BANCADA TOPAZIO ATACAMA/PRETO', 398.4),
('0000000000020', 'MESA FOLHA C.MF BECHARA', 25),
('0000000000021', 'PAINEL AMETISTA ATACAMA/PRETO', 181.9),
('0000000000022', 'MESA ELEG CENTRO MF BECHARA', 84),
('0000000000023', 'DESPESAS COM MANUTEN��O', 100),
('0000000000024', 'MESA ELEGANCE LAT MF BECHARA', 155.45),
('0000000000025', 'ESTANTE ICARO MG BECHARA', 69.8),
('0000000000026', 'ESTANTE ICARO MF BECHARA', 78.56),
('0000000000027', 'FRUTEIRA TUBULAR', 60),
('0000000000028', 'CONJ C/4LUG TURB QUAD/RED', 75),
('0000000000029', 'MESA DIAMANTE P/ CHOCOLATE 1.55', 88.4),
('0000000000030', 'CADEIRA DIAMANTE P/CHOCOLATE/ASS.ENC.CHIN BR/MES', 32),
('0000000000031', 'PORTA TAUA STATUS ESP 4515 BCO/PRE', 831.2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_clientes`
--
ALTER TABLE `tb_clientes`
  ADD PRIMARY KEY (`CODIGO`);

--
-- Índices para tabela `tb_pedidos_produtos`
--
ALTER TABLE `tb_pedidos_produtos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_NUMPEDIDO_idx` (`NUMPEDIDO`),
  ADD KEY `FK_PRODUTO_idx` (`CODPRODUTO`);

--
-- Índices para tabela `tb_pedidovenda`
--
ALTER TABLE `tb_pedidovenda`
  ADD PRIMARY KEY (`NUMPEDIDO`),
  ADD KEY `FK_CODCLIENTE_idx` (`CODCLIENTE`);

--
-- Índices para tabela `tb_produtos`
--
ALTER TABLE `tb_produtos`
  ADD PRIMARY KEY (`CODIGO`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_pedidos_produtos`
--
ALTER TABLE `tb_pedidos_produtos`
  ADD CONSTRAINT `FK_NUMPEDIDO` FOREIGN KEY (`NUMPEDIDO`) REFERENCES `tb_pedidovenda` (`NUMPEDIDO`),
  ADD CONSTRAINT `FK_PRODUTO` FOREIGN KEY (`CODPRODUTO`) REFERENCES `tb_produtos` (`CODIGO`);

--
-- Limitadores para a tabela `tb_pedidovenda`
--
ALTER TABLE `tb_pedidovenda`
  ADD CONSTRAINT `FK_CODCLIENTE` FOREIGN KEY (`CODCLIENTE`) REFERENCES `tb_clientes` (`CODIGO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
