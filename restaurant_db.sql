-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12/04/2026 às 22:48
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `restaurant_db`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `auditlog`
--

CREATE TABLE `auditlog` (
  `id` varchar(191) NOT NULL,
  `action` varchar(191) NOT NULL,
  `entity` varchar(191) NOT NULL,
  `entityId` varchar(191) NOT NULL,
  `details` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `userId` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `auditlog`
--

INSERT INTO `auditlog` (`id`, `action`, `entity`, `entityId`, `details`, `createdAt`, `userId`) VALUES
('cmmxfn0810003bxlkyhxui1st', 'CASH_REGISTER_OPENED', 'CashRegisterSession', 'cmmxfn02j0001bxlklng6x39x', '{\"openingAmount\":127,\"notes\":null,\"openedAt\":\"2026-03-19T12:14:32.929Z\"}', '2026-03-19 12:14:32.930', 'cmms2mx360000a4lsi76gdcwf'),
('cmmxfo4ui0007bxlkxlkp4yyg', 'CASH_WITHDRAWAL', 'CashWithdrawal', 'cmmxfo4l40005bxlk1jwvvlcj', '{\"amount\":4,\"reason\":\"alcool\",\"withdrawnAt\":\"2026-03-19T12:15:25.576Z\",\"sessionId\":\"cmmxfn02j0001bxlklng6x39x\"}', '2026-03-19 12:15:25.578', 'cmms2mx360000a4lsi76gdcwf'),
('cmmxq5bd30001co5p3cgz7bng', 'CASH_REGISTER_CLOSED', 'CashRegisterSession', 'cmmxfn02j0001bxlklng6x39x', '{\"openingAmount\":127,\"totalEntries\":262,\"closingAmount\":151,\"withdrawalTotal\":4,\"expectedAmount\":385,\"difference\":-234,\"closedAt\":\"2026-03-19T17:08:43.257Z\",\"duration\":294,\"pixTotal\":175,\"cre', '2026-03-19 17:08:43.335', 'cmms2mx360000a4lsi76gdcwf'),
('cmmxq6xpt0005co5pc20sx96d', 'CASH_REGISTER_OPENED', 'CashRegisterSession', 'cmmxq6xd90003co5p880fbwfc', '{\"openingAmount\":151,\"notes\":null,\"openedAt\":\"2026-03-19T17:09:58.960Z\"}', '2026-03-19 17:09:58.961', 'cmms2mx360000a4lsi76gdcwf'),
('cmn0mcbx30001tga3mhwckz7w', 'CASH_REGISTER_CLOSED', 'CashRegisterSession', 'cmmxq6xd90003co5p880fbwfc', '{\"openingAmount\":151,\"totalEntries\":205,\"closingAmount\":0,\"withdrawalTotal\":0,\"expectedAmount\":356,\"difference\":-356,\"closedAt\":\"2026-03-21T17:45:30.373Z\",\"duration\":2916,\"pixTotal\":214,\"cred', '2026-03-21 17:45:30.711', 'cmms2mx360000a4lsi76gdcwf'),
('cmn37ep56000etga37xdtn9d1', 'CASH_REGISTER_OPENED', 'CashRegisterSession', 'cmn37eotg000ctga3g88qezgk', '{\"openingAmount\":124,\"notes\":null,\"openedAt\":\"2026-03-23T13:10:45.448Z\"}', '2026-03-23 13:10:45.450', 'cmms2mx360000a4lsi76gdcwf'),
('cmn3g3shc004btga3xgq27wlt', 'CASH_REGISTER_CLOSED', 'CashRegisterSession', 'cmn37eotg000ctga3g88qezgk', '{\"openingAmount\":124,\"totalEntries\":266.5,\"closingAmount\":392,\"withdrawalTotal\":0,\"expectedAmount\":390.5,\"difference\":1.5,\"closedAt\":\"2026-03-23T17:14:12.698Z\",\"duration\":243,\"pixTotal\":236,\"', '2026-03-23 17:14:13.105', 'cmms2mx360000a4lsi76gdcwf'),
('cmn4nlgbm0003g2zq01ihm63t', 'CASH_REGISTER_OPENED', 'CashRegisterSession', 'cmn4nlg270001g2zqq2cuccoq', '{\"openingAmount\":142,\"notes\":null,\"openedAt\":\"2026-03-24T13:31:40.640Z\"}', '2026-03-24 13:31:40.642', 'cmms2mx360000a4lsi76gdcwf'),
('cmn62q06s0050g2zq4r8mk85v', 'CASH_REGISTER_CLOSED', 'CashRegisterSession', 'cmn4nlg270001g2zqq2cuccoq', '{\"openingAmount\":142,\"totalEntries\":146,\"closingAmount\":354,\"withdrawalTotal\":0,\"expectedAmount\":288,\"difference\":66,\"closedAt\":\"2026-03-25T13:22:53.089Z\",\"duration\":1431,\"pixTotal\":201,\"cred', '2026-03-25 13:22:53.429', 'cmms2mx360000a4lsi76gdcwf'),
('cmn62qmkf0054g2zqy5pazupv', 'CASH_REGISTER_OPENED', 'CashRegisterSession', 'cmn62qm3j0052g2zqd2cg7q1h', '{\"openingAmount\":171,\"notes\":null,\"openedAt\":\"2026-03-25T13:23:22.431Z\"}', '2026-03-25 13:23:22.432', 'cmms2mx360000a4lsi76gdcwf'),
('cmn6agnft00b6g2zqyt1i2e3p', 'CASH_REGISTER_CLOSED', 'CashRegisterSession', 'cmn62qm3j0052g2zqd2cg7q1h', '{\"openingAmount\":171,\"totalEntries\":107.9,\"closingAmount\":117,\"withdrawalTotal\":0,\"expectedAmount\":278.9,\"difference\":-161.89999999999998,\"closedAt\":\"2026-03-25T16:59:33.599Z\",\"duration\":216,', '2026-03-25 16:59:33.930', 'cmms2mx360000a4lsi76gdcwf'),
('cmn7g8xlx0003g6fv964wqygy', 'CASH_REGISTER_OPENED', 'CashRegisterSession', 'cmn7g8xk90001g6fv2weu9cyt', '{\"openingAmount\":132,\"notes\":null,\"openedAt\":\"2026-03-26T12:29:17.728Z\"}', '2026-03-26 12:29:17.734', 'cmms2mx360000a4lsi76gdcwf'),
('cmn7pudox005nhsrvhrwfr342', 'CASH_REGISTER_CLOSED', 'CashRegisterSession', 'cmn7g8xk90001g6fv2weu9cyt', '{\"openingAmount\":132,\"totalEntries\":274.5,\"closingAmount\":384,\"withdrawalTotal\":0,\"expectedAmount\":406.5,\"difference\":-22.5,\"closedAt\":\"2026-03-26T16:57:54.549Z\",\"duration\":269,\"pixTotal\":124.42,\"creditTotal\":155,\"debitTotal\":116.08}', '2026-03-26 16:57:54.897', 'cmms2mx360000a4lsi76gdcwf'),
('cmn7spe200003zu9uhfa14j0d', 'CASH_REGISTER_OPENED', 'CashRegisterSession', 'cmn7spe0b0001zu9ulw07vg16', '{\"openingAmount\":0,\"notes\":null,\"openedAt\":\"2026-03-26T18:18:00.936Z\"}', '2026-03-26 18:18:00.937', 'cmms2mx360000a4lsi76gdcwf'),
('cmnacdnew001ah6f0sm60dy7o', 'CASH_REGISTER_CLOSED', 'CashRegisterSession', 'cmn7spe0b0001zu9ulw07vg16', '{\"openingAmount\":0,\"totalEntries\":0,\"closingAmount\":111,\"withdrawalTotal\":0,\"expectedAmount\":0,\"difference\":111,\"closedAt\":\"2026-03-28T13:04:17.790Z\",\"duration\":2566,\"pixTotal\":0,\"creditTotal\":1355.5,\"debitTotal\":0}', '2026-03-28 13:04:17.865', 'cmms2mx360000a4lsi76gdcwf'),
('cmnacdu0w001eh6f0f3e3f970', 'CASH_REGISTER_OPENED', 'CashRegisterSession', 'cmnacdtwv001ch6f0sue4vaxp', '{\"openingAmount\":111,\"notes\":null,\"openedAt\":\"2026-03-28T13:04:26.431Z\"}', '2026-03-28 13:04:26.432', 'cmms2mx360000a4lsi76gdcwf'),
('cmnam4g4p008ih6f0q0psrync', 'CASH_REGISTER_CLOSED', 'CashRegisterSession', 'cmnacdtwv001ch6f0sue4vaxp', '{\"openingAmount\":111,\"totalEntries\":271,\"closingAmount\":530,\"withdrawalTotal\":0,\"expectedAmount\":382,\"difference\":148,\"closedAt\":\"2026-03-28T17:37:04.274Z\",\"duration\":273,\"pixTotal\":406.14,\"creditTotal\":335.75,\"debitTotal\":335.39}', '2026-03-28 17:37:04.681', 'cmms2mx360000a4lsi76gdcwf'),
('cmnd81rv40003gdg2c2pzc3h8', 'CASH_REGISTER_OPENED', 'CashRegisterSession', 'cmnd81rt20001gdg2qlxltv1v', '{\"openingAmount\":124,\"notes\":null,\"openedAt\":\"2026-03-30T13:26:23.823Z\"}', '2026-03-30 13:26:23.825', 'cmms2mx360000a4lsi76gdcwf'),
('cmnepdvr70001hijdln1rll17', 'CASH_REGISTER_CLOSED', 'CashRegisterSession', 'cmnd81rt20001gdg2qlxltv1v', '{\"openingAmount\":124,\"totalEntries\":191,\"closingAmount\":0,\"withdrawalTotal\":0,\"expectedAmount\":315,\"difference\":-315,\"closedAt\":\"2026-03-31T14:19:28.070Z\",\"duration\":1493,\"pixTotal\":158.5,\"creditTotal\":47,\"debitTotal\":79}', '2026-03-31 14:19:28.388', 'cmms2mx360000a4lsi76gdcwf'),
('cmnepekdz0005hijdyq1oef98', 'CASH_REGISTER_OPENED', 'CashRegisterSession', 'cmnepejur0003hijdj4tnoyqs', '{\"openingAmount\":91,\"notes\":null,\"openedAt\":\"2026-03-31T14:20:00.310Z\"}', '2026-03-31 14:20:00.311', 'cmms2mx360000a4lsi76gdcwf'),
('cmnhj12ie0001tr3b1903drls', 'CASH_REGISTER_CLOSED', 'CashRegisterSession', 'cmnepejur0003hijdj4tnoyqs', '{\"openingAmount\":91,\"totalEntries\":142,\"closingAmount\":0,\"withdrawalTotal\":0,\"expectedAmount\":233,\"difference\":-233,\"closedAt\":\"2026-04-02T13:44:51.122Z\",\"duration\":2845,\"pixTotal\":443.49,\"creditTotal\":103,\"debitTotal\":489.14}', '2026-04-02 13:44:51.446', 'cmms2mx360000a4lsi76gdcwf'),
('cmnhj1f0f0005tr3b6gwstv7a', 'CASH_REGISTER_OPENED', 'CashRegisterSession', 'cmnhj1ez00003tr3bjyber9ao', '{\"openingAmount\":25,\"notes\":null,\"openedAt\":\"2026-04-02T13:45:07.646Z\"}', '2026-04-02 13:45:07.648', 'cmms2mx360000a4lsi76gdcwf'),
('cmnkepzyg00015c8b5ap3jfug', 'CASH_REGISTER_CLOSED', 'CashRegisterSession', 'cmnhj1ez00003tr3bjyber9ao', '{\"openingAmount\":25,\"totalEntries\":89.78,\"closingAmount\":114.78,\"withdrawalTotal\":0,\"expectedAmount\":114.78,\"difference\":0,\"closedAt\":\"2026-04-04T14:07:34.890Z\",\"duration\":2902,\"pixTotal\":167,\"creditTotal\":38.58,\"debitTotal\":0}', '2026-04-04 14:07:34.984', 'cmms2mx360000a4lsi76gdcwf'),
('cmnkeqyst00055c8bmrkf4h2q', 'CASH_REGISTER_OPENED', 'CashRegisterSession', 'cmnkeqyk100035c8b0h421j9d', '{\"openingAmount\":81,\"notes\":null,\"openedAt\":\"2026-04-04T14:08:20.140Z\"}', '2026-04-04 14:08:20.142', 'cmms2mx360000a4lsi76gdcwf'),
('cmnkmaxb0000p6ptysctqema4', 'CASH_REGISTER_CLOSED', 'CashRegisterSession', 'cmnkeqyk100035c8b0h421j9d', '{\"openingAmount\":81,\"totalEntries\":353.5,\"closingAmount\":509,\"withdrawalTotal\":0,\"expectedAmount\":434.5,\"difference\":74.5,\"closedAt\":\"2026-04-04T17:39:48.300Z\",\"duration\":211,\"pixTotal\":186.46,\"creditTotal\":523,\"debitTotal\":71}', '2026-04-04 17:39:48.636', 'cmms2mx360000a4lsi76gdcwf'),
('cmnnagd6800039rpam9djmwbg', 'CASH_REGISTER_OPENED', 'CashRegisterSession', 'cmnnagd4500019rpa4kzbcaxx', '{\"openingAmount\":71,\"notes\":null,\"openedAt\":\"2026-04-06T14:31:25.616Z\"}', '2026-04-06 14:31:25.617', 'cmms2mx360000a4lsi76gdcwf'),
('cmnng1dgi00549rpafvfad1p2', 'CASH_REGISTER_CLOSED', 'CashRegisterSession', 'cmnnagd4500019rpa4kzbcaxx', '{\"openingAmount\":71,\"totalEntries\":50,\"closingAmount\":137,\"withdrawalTotal\":0,\"expectedAmount\":121,\"difference\":16,\"closedAt\":\"2026-04-06T17:07:43.669Z\",\"duration\":156,\"pixTotal\":542.6,\"creditTotal\":108,\"debitTotal\":74.05}', '2026-04-06 17:07:43.842', 'cmms2mx360000a4lsi76gdcwf'),
('cmnoo88tt00589rpaf44e33b1', 'CASH_REGISTER_OPENED', 'CashRegisterSession', 'cmnoo88rh00569rpa4jaxdwnr', '{\"openingAmount\":137,\"notes\":null,\"openedAt\":\"2026-04-07T13:44:47.535Z\"}', '2026-04-07 13:44:47.537', 'cmms2mx360000a4lsi76gdcwf'),
('cmnq35hqi0001xtoloxjeqg3s', 'CASH_REGISTER_CLOSED', 'CashRegisterSession', 'cmnoo88rh00569rpa4jaxdwnr', '{\"openingAmount\":137,\"totalEntries\":46,\"closingAmount\":106,\"withdrawalTotal\":0,\"expectedAmount\":183,\"difference\":-77,\"closedAt\":\"2026-04-08T13:30:19.186Z\",\"duration\":1426,\"pixTotal\":0,\"creditTotal\":50,\"debitTotal\":25}', '2026-04-08 13:30:19.530', 'cmms2mx360000a4lsi76gdcwf'),
('cmnq3708b0005xtoliwquyvzw', 'CASH_REGISTER_OPENED', 'CashRegisterSession', 'cmnq36zwi0003xtolj7ihrrsy', '{\"openingAmount\":106,\"notes\":null,\"openedAt\":\"2026-04-08T13:31:30.154Z\"}', '2026-04-08 13:31:30.156', 'cmms2mx360000a4lsi76gdcwf'),
('cmnrirnr1001iq8w6aevuph9h', 'CASH_REGISTER_CLOSED', 'CashRegisterSession', 'cmnq36zwi0003xtolj7ihrrsy', '{\"openingAmount\":106,\"totalEntries\":100,\"closingAmount\":116,\"withdrawalTotal\":0,\"expectedAmount\":206,\"difference\":-90,\"closedAt\":\"2026-04-09T13:35:14.091Z\",\"duration\":1444,\"pixTotal\":359,\"creditTotal\":25,\"debitTotal\":21}', '2026-04-09 13:35:14.173', 'cmms2mx360000a4lsi76gdcwf'),
('cmnrirxa9001mq8w631b6vkyu', 'CASH_REGISTER_OPENED', 'CashRegisterSession', 'cmnrirx8q001kq8w6f9bqiu9e', '{\"openingAmount\":116,\"notes\":null,\"openedAt\":\"2026-04-09T13:35:26.528Z\"}', '2026-04-09 13:35:26.530', 'cmms2mx360000a4lsi76gdcwf'),
('cmnsyxay1006rq8w636kolp8k', 'CASH_REGISTER_CLOSED', 'CashRegisterSession', 'cmnrirx8q001kq8w6f9bqiu9e', '{\"openingAmount\":116,\"totalEntries\":132.5,\"closingAmount\":0,\"withdrawalTotal\":0,\"expectedAmount\":248.5,\"difference\":-248.5,\"closedAt\":\"2026-04-10T13:55:17.368Z\",\"duration\":1460,\"pixTotal\":125,\"creditTotal\":154.51,\"debitTotal\":133}', '2026-04-10 13:55:17.545', 'cmms2mx360000a4lsi76gdcwf'),
('cmnsz0yp6006vq8w6s3kerllf', 'CASH_REGISTER_OPENED', 'CashRegisterSession', 'cmnsz0yfu006tq8w6e93bfdkj', '{\"openingAmount\":106,\"notes\":null,\"openedAt\":\"2026-04-10T13:58:08.298Z\"}', '2026-04-10 13:58:08.298', 'cmms2mx360000a4lsi76gdcwf'),
('cmnue9qg0008mq8w6cuj3ouph', 'CASH_REGISTER_CLOSED', 'CashRegisterSession', 'cmnsz0yfu006tq8w6e93bfdkj', '{\"openingAmount\":106,\"totalEntries\":15,\"closingAmount\":335,\"withdrawalTotal\":0,\"expectedAmount\":121,\"difference\":214,\"closedAt\":\"2026-04-11T13:52:37.838Z\",\"duration\":1434,\"pixTotal\":0,\"creditTotal\":0,\"debitTotal\":84}', '2026-04-11 13:52:37.921', 'cmms2mx360000a4lsi76gdcwf'),
('cmnuetmkp0006ba6vqyn7zubd', 'CASH_REGISTER_OPENED', 'CashRegisterSession', 'cmnuetmib0004ba6vyu3r9xxw', '{\"openingAmount\":55,\"notes\":null,\"openedAt\":\"2026-04-11T14:08:06.024Z\"}', '2026-04-11 14:08:06.026', 'cmms2mx360000a4lsi76gdcwf');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cashregistersession`
--

CREATE TABLE `cashregistersession` (
  `id` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'OPEN',
  `openingAmount` double NOT NULL,
  `closingAmount` double DEFAULT NULL,
  `withdrawalTotal` double NOT NULL DEFAULT 0,
  `notes` varchar(191) DEFAULT NULL,
  `openedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `closedAt` datetime(3) DEFAULT NULL,
  `openedById` varchar(191) NOT NULL,
  `closedById` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `cashregistersession`
--

INSERT INTO `cashregistersession` (`id`, `status`, `openingAmount`, `closingAmount`, `withdrawalTotal`, `notes`, `openedAt`, `closedAt`, `openedById`, `closedById`) VALUES
('cmmxfn02j0001bxlklng6x39x', 'CLOSED', 127, 151, 4, NULL, '2026-03-19 12:14:32.731', '2026-03-19 17:08:43.257', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf'),
('cmmxq6xd90003co5p880fbwfc', 'CLOSED', 151, 0, 0, NULL, '2026-03-19 17:09:58.509', '2026-03-21 17:45:30.373', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf'),
('cmn37eotg000ctga3g88qezgk', 'CLOSED', 124, 392, 0, NULL, '2026-03-23 13:10:45.028', '2026-03-23 17:14:12.698', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf'),
('cmn4nlg270001g2zqq2cuccoq', 'CLOSED', 142, 354, 0, NULL, '2026-03-24 13:31:40.304', '2026-03-25 13:22:53.089', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf'),
('cmn62qm3j0052g2zqd2cg7q1h', 'CLOSED', 171, 117, 0, NULL, '2026-03-25 13:23:21.823', '2026-03-25 16:59:33.599', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf'),
('cmn7g8xk90001g6fv2weu9cyt', 'CLOSED', 132, 384, 0, NULL, '2026-03-26 12:29:17.673', '2026-03-26 16:57:54.549', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf'),
('cmn7spe0b0001zu9ulw07vg16', 'CLOSED', 0, 111, 0, NULL, '2026-03-26 18:18:00.875', '2026-03-28 13:04:17.790', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf'),
('cmnacdtwv001ch6f0sue4vaxp', 'CLOSED', 111, 530, 0, NULL, '2026-03-28 13:04:26.288', '2026-03-28 17:37:04.274', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf'),
('cmnd81rt20001gdg2qlxltv1v', 'CLOSED', 124, 0, 0, NULL, '2026-03-30 13:26:23.748', '2026-03-31 14:19:28.070', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf'),
('cmnepejur0003hijdj4tnoyqs', 'CLOSED', 91, 0, 0, NULL, '2026-03-31 14:19:59.619', '2026-04-02 13:44:51.122', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf'),
('cmnhj1ez00003tr3bjyber9ao', 'CLOSED', 25, 114.78, 0, NULL, '2026-04-02 13:45:07.596', '2026-04-04 14:07:34.890', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf'),
('cmnkeqyk100035c8b0h421j9d', 'CLOSED', 81, 509, 0, NULL, '2026-04-04 14:08:19.825', '2026-04-04 17:39:48.300', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf'),
('cmnnagd4500019rpa4kzbcaxx', 'CLOSED', 71, 137, 0, NULL, '2026-04-06 14:31:25.542', '2026-04-06 17:07:43.669', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf'),
('cmnoo88rh00569rpa4jaxdwnr', 'CLOSED', 137, 106, 0, NULL, '2026-04-07 13:44:47.454', '2026-04-08 13:30:19.186', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf'),
('cmnq36zwi0003xtolj7ihrrsy', 'CLOSED', 106, 116, 0, NULL, '2026-04-08 13:31:29.730', '2026-04-09 13:35:14.091', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf'),
('cmnrirx8q001kq8w6f9bqiu9e', 'CLOSED', 116, 0, 0, NULL, '2026-04-09 13:35:26.474', '2026-04-10 13:55:17.368', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf'),
('cmnsz0yfu006tq8w6e93bfdkj', 'CLOSED', 106, 335, 0, NULL, '2026-04-10 13:58:07.962', '2026-04-11 13:52:37.838', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf'),
('cmnuetmib0004ba6vyu3r9xxw', 'OPEN', 55, NULL, 0, NULL, '2026-04-11 14:08:05.939', NULL, 'cmms2mx360000a4lsi76gdcwf', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cashwithdrawal`
--

CREATE TABLE `cashwithdrawal` (
  `id` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `reason` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `sessionId` varchar(191) NOT NULL,
  `createdById` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `cashwithdrawal`
--

INSERT INTO `cashwithdrawal` (`id`, `amount`, `reason`, `createdAt`, `sessionId`, `createdById`) VALUES
('cmmxfo4l40005bxlk1jwvvlcj', 4, 'alcool', '2026-03-19 12:15:25.240', 'cmmxfn02j0001bxlklng6x39x', 'cmms2mx360000a4lsi76gdcwf');

-- --------------------------------------------------------

--
-- Estrutura para tabela `category`
--

CREATE TABLE `category` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `isMealCategory` tinyint(1) NOT NULL DEFAULT 0,
  `pricePerKg` double DEFAULT NULL,
  `selfServicePricePerKg` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `category`
--

INSERT INTO `category` (`id`, `name`, `isMealCategory`, `pricePerKg`, `selfServicePricePerKg`) VALUES
('cmms3ed7d00004mokxg8cy98y', 'BEBIDAS', 0, NULL, NULL),
('cmms3em1a00014mokh4zcodnf', 'REFEIÇÕES', 1, 59.9, 40),
('cmms3eqqs00024mok9fslu3cr', 'MARMITAS', 0, NULL, NULL),
('cmn64mji8006wg2zqqpo2blm9', 'PRATO FEITO', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `credittransaction`
--

CREATE TABLE `credittransaction` (
  `id` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `customerId` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `credittransaction`
--

INSERT INTO `credittransaction` (`id`, `type`, `amount`, `description`, `createdAt`, `customerId`) VALUES
('cmn4pieb3001zg2zq7tsm1d3r', 'CHARGE', 64, '23/03/2026 - 2 M +COCA 2L', '2026-03-24 14:25:17.296', 'cmn4phep8001wg2zqfcad2fd2'),
('cmn4q0ecv002fg2zqni4dmp6w', 'CHARGE', 21, 'Fiado do pedido #ZQ777Q', '2026-03-24 14:39:17.167', 'cmn4pj6nl0020g2zqq1wrypt2'),
('cmn4q1am0002ig2zqjxzmv1uz', 'CHARGE', 8, 'KUAT', '2026-03-24 14:39:58.968', 'cmn4pj6nl0020g2zqq1wrypt2'),
('cmn631afm005mg2zqqel9rn0n', 'CHARGE', 177, '18/03 - 3 ALMOÇO + 3 JANTAS', '2026-03-25 13:31:39.923', 'cmn62zqqk005jg2zqnglqrce9'),
('cmn632uv7005pg2zqyqfnmbn3', 'CHARGE', 159.51, '19/03 - 3 ALMOÇO + 3 JANTAS', '2026-03-25 13:32:53.060', 'cmn62zqqk005jg2zqnglqrce9'),
('cmn634074005sg2zqfnu693qd', 'CHARGE', 163.8, '20/03 - 3 ALMOÇO + 3 JANTA', '2026-03-25 13:33:46.624', 'cmn62zqqk005jg2zqnglqrce9'),
('cmn636upw005vg2zqbt46jn6a', 'CHARGE', 225, '21/03 - 2 ALMOÇO + 7 JANTAS', '2026-03-25 13:35:59.493', 'cmn62zqqk005jg2zqnglqrce9'),
('cmn637jqe005yg2zqseri53du', 'CHARGE', 525, '22/03 - 7 ALMOÇO + 7 JANTA', '2026-03-25 13:36:31.910', 'cmn62zqqk005jg2zqnglqrce9'),
('cmn640185006eg2zqqi7jf9hj', 'CHARGE', 35, 'Fiado do pedido #3HJXQN', '2026-03-25 13:58:40.950', 'cmn4pj6nl0020g2zqq1wrypt2'),
('cmn642soi006hg2zqze3s1l6y', 'CHARGE', 383, '23/03 - 7 ALMOÇO + 7 JANTAS', '2026-03-25 14:00:49.842', 'cmn62zqqk005jg2zqnglqrce9'),
('cmn643aby006kg2zqmi3mbclm', 'CHARGE', 175, '24/03 - 7 JANTAS', '2026-03-25 14:01:12.718', 'cmn62zqqk005jg2zqnglqrce9'),
('cmn646ncz006ng2zqn4reuu05', 'CHARGE', 64, '24/03', '2026-03-25 14:03:49.571', 'cmn4phep8001wg2zqfcad2fd2'),
('cmn64aj2r006rg2zqsrwnur06', 'CHARGE', 278, 'Lançamento manual no fiado', '2026-03-25 14:06:50.643', 'cmn6499d2006og2zql9sr8y8s'),
('cmn7garsm0006g6fvpnqdg01c', 'CHARGE', 175, '7marnitas para  janta com guaraná 2l ', '2026-03-26 12:30:43.511', 'cmn62zqqk005jg2zqnglqrce9'),
('cmnaem37n0023h6f0btxnuj81', 'CHARGE', 175, '26/03 - 7 JANTAS', '2026-03-28 14:06:50.819', 'cmn62zqqk005jg2zqnglqrce9'),
('cmnaemlg40026h6f0xvllgiag', 'CHARGE', 175, '27/03 - 7 JANTAS', '2026-03-28 14:07:14.452', 'cmn62zqqk005jg2zqnglqrce9'),
('cmnal0rzs0082h6f0yymanefm', 'CHARGE', 175, '28/03 - 7 JANTAS', '2026-03-28 17:06:13.817', 'cmn62zqqk005jg2zqnglqrce9'),
('cmnd9je2k0018gdg2n94ye08q', 'CHARGE', 350, '29/03 - 7 ALMOÇO + 7 JANTA ', '2026-03-30 14:08:05.373', 'cmn62zqqk005jg2zqnglqrce9'),
('cmnepme86000dhijdue9ad9k5', 'CHARGE', 175, '30/03 - 7 JANTAS', '2026-03-31 14:26:05.575', 'cmn62zqqk005jg2zqnglqrce9'),
('cmnepo3ax000hhijdbkj2shnn', 'CHARGE', 26, '31/03 - 1 MARMITA \'G\' C/ DESCONTO', '2026-03-31 14:27:24.730', 'cmnepnhbn000ehijduwcthqrz'),
('cmnepxmbw0013hijdnibphur8', 'CHARGE', 42, 'Fiado do pedido #ZJBNN4', '2026-03-31 14:34:49.293', 'cmn6499d2006og2zql9sr8y8s'),
('cmnergi88002ohijdxagw5ql3', 'CHARGE', 21, 'Fiado do pedido #FZBRUM', '2026-03-31 15:17:30.057', 'cmn6499d2006og2zql9sr8y8s'),
('cmnes91y0004ahijdcau5ao18', 'PAYMENT', 2858.31, 'Pagamento de fiado', '2026-03-31 15:39:41.977', 'cmn62zqqk005jg2zqnglqrce9'),
('cmnesviku0051hijddb9mea7n', 'CHARGE', 40, '30/03 - ALMOÇO', '2026-03-31 15:57:09.966', 'cmnesu7kx004yhijdmm2fh5k1'),
('cmnev566n005ahijdonicwa88', 'CHARGE', 21, 'MOCA DO BECO EMILENE ', '2026-03-31 17:00:39.696', 'cmn6499d2006og2zql9sr8y8s'),
('cmnev5put005dhijddcw9zvei', 'CHARGE', 40, 'ALMOÇO ', '2026-03-31 17:01:05.190', 'cmnesu7kx004yhijdmm2fh5k1'),
('cmnev6yft005ghijd2mkhymcs', 'CHARGE', 10, '2 SUCO 30 E 31', '2026-03-31 17:02:02.970', 'cmnesu7kx004yhijdmm2fh5k1'),
('cmng5fczo001sefj71dwaajrp', 'CHARGE', 29, 'Fiado do pedido #SXK6RO', '2026-04-01 14:36:17.413', 'cmnepnhbn000ehijduwcthqrz'),
('cmng5fx01001vefj7bwu67zpm', 'PAYMENT', 3, 'Pagamento de fiado', '2026-04-01 14:36:43.346', 'cmnepnhbn000ehijduwcthqrz'),
('cmng5p23o0026efj770djvkr9', 'CHARGE', 42, 'Fiado do pedido #QIUL6C', '2026-04-01 14:43:49.860', 'cmn6499d2006og2zql9sr8y8s'),
('cmng8ojqe004wefj7wattu7y7', 'CHARGE', 62, 'Fiado do pedido #DJB4WQ', '2026-04-01 16:07:24.902', 'cmn4phep8001wg2zqfcad2fd2'),
('cmng8ossk0051efj7cvg5vtep', 'CHARGE', 33, 'Fiado do pedido #PGI70R', '2026-04-01 16:07:36.645', 'cmn6499d2006og2zql9sr8y8s'),
('cmnhl76gp001wtr3b27kr0fog', 'CHARGE', 58, 'Fiado do pedido #9ILKQ9', '2026-04-02 14:45:35.737', 'cmn4phep8001wg2zqfcad2fd2'),
('cmnkih8f3003d5c8bkzkdpdzs', 'CHARGE', 175, '31/03 - 7 JANTAS', '2026-04-04 15:52:44.512', 'cmn62zqqk005jg2zqnglqrce9'),
('cmnkihirn003g5c8b0vepsohl', 'CHARGE', 175, '01/04 - 7 JANTAS', '2026-04-04 15:52:57.923', 'cmn62zqqk005jg2zqnglqrce9'),
('cmnkihup1003j5c8bqhxdy1m4', 'CHARGE', 175, '02/04 - 7 JANTAS', '2026-04-04 15:53:13.381', 'cmn62zqqk005jg2zqnglqrce9'),
('cmnkii97j003m5c8b8u2yf2h8', 'CHARGE', 250, '03/04 - 3 ALMOÇOS + 7 JANTAS', '2026-04-04 15:53:32.191', 'cmn62zqqk005jg2zqnglqrce9'),
('cmnkijftf003p5c8ba7r51dg3', 'CHARGE', 175, '04/04 - 7 JANTAS', '2026-04-04 15:54:27.411', 'cmn62zqqk005jg2zqnglqrce9'),
('cmnkj6pkx00026ptyecqvuhcr', 'CHARGE', 356, '01/04 - 8 ALMOÇOS + BEBIDAS', '2026-04-04 16:12:33.154', 'cmnhitzcp005qefj7ybht7573'),
('cmnkj7rmo00066ptyzmnv2eeg', 'CHARGE', 21, 'JESSICA', '2026-04-04 16:13:22.464', 'cmnkj7jle00036ptyp9d6ouo9'),
('cmnnb6l33000j9rpaztus925h', 'CHARGE', 50, 'Fiado do pedido #RRV809', '2026-04-06 14:51:48.927', 'cmnnaytzp00059rpafcl8e9nt'),
('cmnop6xpy005w9rpaot5edd4p', 'CHARGE', 50, 'Fiado do pedido #ESVVNM', '2026-04-07 14:11:46.102', 'cmnnaytzp00059rpafcl8e9nt'),
('cmnq7fodq002gxtoljued55lm', 'CHARGE', 63, '07/04 - 3 MARMITAS P', '2026-04-08 15:30:13.166', 'cmn6499d2006og2zql9sr8y8s'),
('cmnq7nc7k002jxtolxpifxvkx', 'CHARGE', 350, '05/04 - 7 ALMOÇO + 7 JANTAS', '2026-04-08 15:36:10.640', 'cmn62zqqk005jg2zqnglqrce9'),
('cmnq7nqcz002mxtol9k0rniv2', 'CHARGE', 175, '06/04 - 7 JANTAS', '2026-04-08 15:36:28.979', 'cmn62zqqk005jg2zqnglqrce9'),
('cmnq7o3jw002pxtolcfg76bhw', 'CHARGE', 175, '07/04 - 7 JANTAS', '2026-04-08 15:36:46.077', 'cmn62zqqk005jg2zqnglqrce9'),
('cmnq7pvtt0030xtolcvdzalyu', 'CHARGE', 59.22, 'Fiado do pedido #T6U24I', '2026-04-08 15:38:09.378', 'cmn62zqqk005jg2zqnglqrce9'),
('cmnq7qer70033xtol3e7jrfxh', 'CHARGE', 225, '08/04 - 9 JANTAS', '2026-04-08 15:38:33.908', 'cmn62zqqk005jg2zqnglqrce9'),
('cmnq7yrwi003cxtol3ox8s0s1', 'CHARGE', 25, 'Fiado do pedido #7B0FGY', '2026-04-08 15:45:04.194', 'cmnnaytzp00059rpafcl8e9nt'),
('cmnrjzhmm002rq8w6i7701lep', 'CHARGE', 76, 'Fiado do pedido #8Z2NAK', '2026-04-09 14:09:19.102', 'cmnnaytzp00059rpafcl8e9nt'),
('cmnrnjr8v0065q8w62cas8mxu', 'CHARGE', 263, '08/04 - ALMOÇO', '2026-04-09 15:49:03.536', 'cmnrnjcnn0062q8w61evt6c3t'),
('cmnrnjxn00068q8w6v3uwpjvl', 'CHARGE', 209, '08/04 - JANTA', '2026-04-09 15:49:11.820', 'cmnrnjcnn0062q8w61evt6c3t'),
('cmnrnkvmu006bq8w61nrnl39k', 'CHARGE', 242, '09/04 - ALMOÇO', '2026-04-09 15:49:55.879', 'cmnrnjcnn0062q8w61evt6c3t'),
('cmnt32go80085q8w6omt0zill', 'CHARGE', 58, 'Fiado do pedido #T0BD3N', '2026-04-10 15:51:16.712', 'cmnepnhbn000ehijduwcthqrz'),
('cmnt36gef008kq8w6iqkrw7r0', 'CHARGE', 94, 'Fiado do pedido #UAAOJ3', '2026-04-10 15:54:22.983', 'cmn6499d2006og2zql9sr8y8s'),
('cmnuf7y7l0011ba6vdbtfjsfs', 'CHARGE', 75, 'Fiado do pedido #4SJ9KR', '2026-04-11 14:19:14.289', 'cmnnaytzp00059rpafcl8e9nt'),
('cmnuhzprt0046ba6vtrr0vzff', 'CHARGE', 21, 'Fiado do pedido #K2C9FX', '2026-04-11 15:36:48.954', 'cmnnaytzp00059rpafcl8e9nt'),
('cmnuigfcc004zba6vakoqha57', 'CHARGE', 30, 'Fiado do pedido #QO034F', '2026-04-11 15:49:48.588', 'cmnrnjcnn0062q8w61evt6c3t');

-- --------------------------------------------------------

--
-- Estrutura para tabela `customer`
--

CREATE TABLE `customer` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `creditLimit` double NOT NULL DEFAULT 0,
  `creditUsed` double NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `customer`
--

INSERT INTO `customer` (`id`, `name`, `phone`, `email`, `address`, `creditLimit`, `creditUsed`, `createdAt`, `updatedAt`) VALUES
('cmn4phep8001wg2zqfcad2fd2', 'PAOLA SITIO ', '17996166921', NULL, NULL, 250, 248, '2026-03-24 14:24:31.148', '2026-04-02 14:48:57.075'),
('cmn4pj6nl0020g2zqq1wrypt2', 'ROBSON PEDREIRO ', '18996281630', NULL, NULL, 500, 64, '2026-03-24 14:25:54.033', '2026-03-25 14:02:57.340'),
('cmn62zqqk005jg2zqnglqrce9', 'JOSÉ MARIA', '18996409139', NULL, NULL, 3000, 2109.2200000000003, '2026-03-25 13:30:27.740', '2026-04-08 15:38:33.943'),
('cmn6499d2006og2zql9sr8y8s', 'FABIO TOBIAS', NULL, NULL, NULL, 1000, 594, '2026-03-25 14:05:51.399', '2026-04-10 15:54:22.981'),
('cmnepnhbn000ehijduwcthqrz', 'ELIANA  OTTONI', NULL, NULL, NULL, 200, 110, '2026-03-31 14:26:56.243', '2026-04-10 15:51:16.710'),
('cmnesu7kx004yhijdmm2fh5k1', 'IGREJA ADVENTISTA', NULL, NULL, NULL, 500, 90, '2026-03-31 15:56:09.058', '2026-03-31 17:02:03.262'),
('cmnhitzcp005qefj7ybht7573', 'PREFEITURA', NULL, NULL, NULL, 1500, 356, '2026-04-02 13:39:20.761', '2026-04-04 16:12:33.156'),
('cmnkj7jle00036ptyp9d6ouo9', 'CASARÃO', NULL, NULL, NULL, 1500, 21, '2026-04-04 16:13:12.050', '2026-04-06 14:46:00.114'),
('cmnnaytzp00059rpafcl8e9nt', 'THIAGO TOBIAS', NULL, NULL, NULL, 500, 297, '2026-04-06 14:45:47.222', '2026-04-11 15:36:48.951'),
('cmnrnjcnn0062q8w61evt6c3t', 'TOKSON EVENTOS', '018996409139', NULL, NULL, 2000, 744, '2026-04-09 15:48:44.627', '2026-04-11 15:49:48.586');

-- --------------------------------------------------------

--
-- Estrutura para tabela `marmitamenuitem`
--

CREATE TABLE `marmitamenuitem` (
  `id` varchar(191) NOT NULL,
  `dayOfWeek` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `group` varchar(191) NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `sortOrder` int(11) NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `marmitamenuitem`
--

INSERT INTO `marmitamenuitem` (`id`, `dayOfWeek`, `name`, `group`, `price`, `isActive`, `sortOrder`, `createdAt`, `updatedAt`) VALUES
('cmmx5cvsg00062dxqvgzalh73', 4, 'Arroz', 'BASE', 0, 1, 0, '2026-03-19 07:26:44.464', '2026-03-19 07:26:44.464'),
('cmmx5czn100072dxqfubvdibl', 4, 'Feijão', 'BASE', 0, 1, 0, '2026-03-19 07:26:49.454', '2026-03-19 07:26:49.454'),
('cmmx5eyam00082dxqfo2ry8vp', 4, 'Strogonoff de Frango', 'PROTEINA', 0, 1, 0, '2026-03-19 07:28:21.021', '2026-03-19 13:09:50.686'),
('cmmxhmkmq003obxlk4i1myfml', 4, 'Isca de Carne com Pimentão', 'PROTEINA', 0, 1, 0, '2026-03-19 13:10:11.954', '2026-03-19 13:10:11.954'),
('cmmxhmshh003pbxlkgxa534fs', 4, 'Calabresa Acebolada', 'PROTEINA', 0, 1, 0, '2026-03-19 13:10:22.134', '2026-03-19 13:10:22.134'),
('cmmxhnhcr003qbxlkzmgu55ku', 4, 'Farofa', 'ACOMPANHAMENTO', 0, 1, 0, '2026-03-19 13:10:54.363', '2026-03-19 13:10:54.363'),
('cmmxho3jz003rbxlko5g068ao', 4, 'Brócolis com Cenoura', 'ACOMPANHAMENTO', 0, 1, 0, '2026-03-19 13:11:23.135', '2026-03-19 13:11:23.135'),
('cmmxhorwg003sbxlkkx4jm438', 4, 'Chuchu na Salsa', 'ACOMPANHAMENTO', 0, 1, 0, '2026-03-19 13:11:54.688', '2026-03-19 13:11:54.688'),
('cmmxhoxgr003tbxlkai4qtuxp', 4, 'Couve Refogada', 'ACOMPANHAMENTO', 0, 1, 0, '2026-03-19 13:12:01.899', '2026-03-19 13:12:01.899'),
('cmmxhpjhp003ubxlki9yd1drj', 4, 'Macarrão Alho e Óleo', 'MASSA', 0, 1, 0, '2026-03-19 13:12:30.445', '2026-03-19 13:12:30.445'),
('cmmyy8qd900003r61f8p51ovb', 5, 'feijoada', 'BASE', 0, 1, 0, '2026-03-20 13:43:05.853', '2026-03-20 13:43:05.853'),
('cmmyy9vcv00013r61721m2dnc', 5, 'feijao', 'BASE', 0, 1, 0, '2026-03-20 13:43:58.975', '2026-03-20 13:43:58.975'),
('cmmyya0vv00023r618ztk3j0s', 5, 'arroz', 'BASE', 0, 1, 0, '2026-03-20 13:44:06.140', '2026-03-20 13:44:06.140'),
('cmmyyaksf00033r61jmpf3ktf', 5, 'peixe', 'PROTEINA', 0, 1, 0, '2026-03-20 13:44:31.935', '2026-03-20 13:44:31.935'),
('cmmyyb67300053r613azds2wx', 5, 'frango grelhado', 'PROTEINA', 0, 1, 0, '2026-03-20 13:44:59.677', '2026-03-20 13:44:59.677'),
('cmmyybiws00063r615mjuxbut', 5, 'couve refogado', 'ACOMPANHAMENTO', 0, 1, 0, '2026-03-20 13:45:16.156', '2026-03-20 13:45:16.156'),
('cmmyybtwr00073r61hcji29f0', 5, 'banana a milanesa', 'ACOMPANHAMENTO', 0, 1, 0, '2026-03-20 13:45:30.411', '2026-03-20 13:45:30.411'),
('cmmyycsv000093r61ycxcvl54', 5, 'vagem c/ batata', 'ACOMPANHAMENTO', 0, 1, 0, '2026-03-20 13:46:15.708', '2026-03-20 13:46:15.708'),
('cmmyyd4ds000a3r61q9i2y0n4', 5, 'farofa', 'ACOMPANHAMENTO', 0, 1, 0, '2026-03-20 13:46:30.640', '2026-03-20 13:46:30.640'),
('cmn376stq0002tga33mp07u4e', 1, 'arroz branco', 'BASE', 0, 1, 0, '2026-03-23 13:04:36.973', '2026-03-23 13:04:36.973'),
('cmn376zgs0003tga35ddg843j', 1, 'feijão', 'BASE', 0, 1, 0, '2026-03-23 13:04:45.581', '2026-03-23 13:04:45.581'),
('cmn377m5c0004tga3az0qtbhm', 1, 'macarrão ao molho sugo', 'BASE', 0, 1, 0, '2026-03-23 13:05:14.976', '2026-03-23 13:05:14.976'),
('cmn37877m0005tga3aznnrzop', 1, 'file de frango a milanesa', 'PROTEINA', 0, 1, 0, '2026-03-23 13:05:42.274', '2026-03-23 13:05:42.274'),
('cmn378ibr0006tga3beg8exu8', 1, 'costela com mandioca', 'PROTEINA', 0, 1, 0, '2026-03-23 13:05:56.679', '2026-03-23 13:05:56.679'),
('cmn379do30007tga34957zm1u', 1, 'toscana no molho c/pimentão', 'PROTEINA', 0, 1, 0, '2026-03-23 13:06:37.299', '2026-03-23 13:06:37.299'),
('cmn37a42i0008tga3yhkoe900', 1, 'virado de repolho', 'ACOMPANHAMENTO', 0, 1, 0, '2026-03-23 13:07:11.515', '2026-03-23 13:07:11.515'),
('cmn37aqsy0009tga3obvkshy3', 1, 'abobrinha refogada', 'ACOMPANHAMENTO', 0, 1, 0, '2026-03-23 13:07:40.978', '2026-03-23 13:07:40.978'),
('cmn37bjuf000atga3t4y3aps8', 1, 'batata sute', 'ACOMPANHAMENTO', 0, 1, 0, '2026-03-23 13:08:18.614', '2026-03-23 13:08:18.614'),
('cmn38oi8c000otga370xznof5', 1, 'Farofa', 'ACOMPANHAMENTO', 0, 1, 0, '2026-03-23 13:46:22.668', '2026-03-23 13:46:22.668'),
('cmn4nx0tc000ag2zqi0rzupmc', 2, 'ARROZ BRANCO', 'GUARNICAO', 0, 1, 0, '2026-03-24 13:40:40.416', '2026-03-24 13:40:40.416'),
('cmn4nx46t000bg2zq1uaeeqiq', 2, 'FEIJÃO', 'GUARNICAO', 0, 1, 0, '2026-03-24 13:40:44.789', '2026-03-24 13:40:44.789'),
('cmn4nyl3f000gg2zq6tmc83ur', 2, 'REPOLHO REFOGADO', 'GUARNICAO', 0, 1, 0, '2026-03-24 13:41:53.356', '2026-04-07 13:57:26.392'),
('cmn4nzke9000jg2zqrs14gcxu', 2, 'FILÉ DE FRANGO GRELHADO', 'CARNE', 0, 1, 0, '2026-03-24 13:42:39.105', '2026-03-24 14:13:22.600'),
('cmn62s0lg0055g2zqarhbhiqm', 3, 'ARROZ BRANCO', 'GUARNICAO', 0, 1, 0, '2026-03-25 13:24:27.269', '2026-03-25 13:24:27.269'),
('cmn62s9e80057g2zq70kl3pbl', 3, 'FEIJÃO', 'GUARNICAO', 0, 1, 0, '2026-03-25 13:24:38.672', '2026-03-25 13:24:38.672'),
('cmn62scj90058g2zqljp5g0lw', 3, 'FAROFA', 'GUARNICAO', 0, 1, 0, '2026-03-25 13:24:42.741', '2026-03-25 13:24:42.741'),
('cmn62sn5l005ag2zq4aeanuap', 3, 'FRITAS', 'GUARNICAO', 0, 1, 0, '2026-03-25 13:24:56.506', '2026-04-08 13:33:08.748'),
('cmn62stdp005bg2zqc379pbhs', 3, 'PURE DE BATATA', 'GUARNICAO', 0, 1, 0, '2026-03-25 13:25:04.573', '2026-04-08 13:32:30.774'),
('cmn62szim005cg2zqori8hup4', 3, 'PEIXE FRITO', 'CARNE', 0, 1, 0, '2026-03-25 13:25:12.527', '2026-03-25 13:25:12.527'),
('cmn62t48t005dg2zqyvcezwxe', 3, 'STROGONOFE  DE FRANGO', 'CARNE', 0, 1, 0, '2026-03-25 13:25:18.654', '2026-04-08 13:35:17.697'),
('cmn62taza005eg2zqcao0rpj8', 3, 'PANQUECA DE CARNE', 'CARNE', 0, 1, 0, '2026-03-25 13:25:27.382', '2026-04-08 13:34:16.094'),
('cmn7i16qi00003d8nam4037i4', 4, 'ARROZ', 'GUARNICAO', 0, 1, 0, '2026-03-26 13:19:15.547', '2026-04-02 13:47:06.372'),
('cmn7i19uu00013d8nc2hsy569', 4, 'FEIJÃO', 'GUARNICAO', 0, 1, 0, '2026-03-26 13:19:19.590', '2026-03-26 13:19:19.590'),
('cmn7i20wi00023d8nws39mze7', 4, 'FAROFA', 'GUARNICAO', 0, 1, 0, '2026-03-26 13:19:54.642', '2026-03-26 13:19:54.642'),
('cmnacexd6001fh6f0qap6fex9', 6, 'ARROZ', 'GUARNICAO', 0, 1, 0, '2026-03-28 13:05:17.418', '2026-03-28 13:05:17.418'),
('cmnacf0mv001gh6f0dxrrgxyr', 6, 'FEIJÃO', 'GUARNICAO', 0, 1, 0, '2026-03-28 13:05:21.656', '2026-03-28 13:05:21.656'),
('cmnacf8qg001hh6f0w9pdss2n', 6, 'FAROFA', 'GUARNICAO', 0, 1, 0, '2026-03-28 13:05:32.152', '2026-03-28 13:05:32.152'),
('cmnacfclx001ih6f0utfddk0h', 6, 'MANDIOCA FRITA', 'GUARNICAO', 0, 1, 0, '2026-03-28 13:05:37.173', '2026-04-11 14:05:59.145'),
('cmnacfztb001mh6f0g8aizmcg', 6, 'MIX CHURRASCO', 'CARNE', 0, 1, 0, '2026-03-28 13:06:07.248', '2026-03-28 13:06:07.248'),
('cmnd83kyx0004gdg2m60ko2k9', 1, 'ARROZ', 'GUARNICAO', 0, 1, 0, '2026-03-30 13:27:48.202', '2026-03-30 13:27:48.202'),
('cmnd83r8p0005gdg2xl2anjzz', 1, 'MACARRÃO', 'GUARNICAO', 0, 1, 0, '2026-03-30 13:27:56.330', '2026-04-06 14:27:54.534'),
('cmnd83u270006gdg2p4xcbb4q', 1, 'FAROFA', 'GUARNICAO', 0, 1, 0, '2026-03-30 13:27:59.984', '2026-03-30 13:27:59.984'),
('cmnd845i70008gdg2g20inf9w', 1, 'ABOBRINHA', 'GUARNICAO', 0, 1, 0, '2026-03-30 13:28:14.816', '2026-04-06 14:27:33.372'),
('cmnd84grf0009gdg260tbhel3', 1, 'BERINGELA', 'GUARNICAO', 0, 1, 0, '2026-03-30 13:28:29.403', '2026-04-06 14:27:21.892'),
('cmnd84wvi000bgdg21or0qrev', 1, 'PICADINHO', 'CARNE', 0, 1, 0, '2026-03-30 13:28:50.286', '2026-04-06 14:37:35.203'),
('cmnd852ea000cgdg2bmlrbd1r', 1, 'LINGUIÇA', 'CARNE', 0, 1, 0, '2026-03-30 13:28:57.442', '2026-04-06 14:30:58.993'),
('cmnd857m9000dgdg226x7tslo', 1, 'FRICASSÊ', 'CARNE', 0, 1, 0, '2026-03-30 13:29:04.209', '2026-04-06 14:30:41.715'),
('cmnepgq9l0006hijdbbm2ieit', 2, 'OVO FRITO', 'GUARNICAO', 0, 1, 0, '2026-03-31 14:21:41.241', '2026-04-07 13:58:17.566'),
('cmneph0180007hijdb821ktct', 2, 'FAROFA', 'GUARNICAO', 0, 1, 0, '2026-03-31 14:21:53.901', '2026-04-07 13:57:10.872'),
('cmneph4yj0008hijd6yrksh8a', 2, 'VAGEM COM CENOURA', 'GUARNICAO', 0, 1, 0, '2026-03-31 14:22:00.284', '2026-04-07 13:57:52.847'),
('cmnephbu00009hijdmqcl3xhs', 2, 'BIFE ACEBOLADO', 'CARNE', 0, 1, 0, '2026-03-31 14:22:09.193', '2026-04-07 13:58:43.669'),
('cmnephk5h000ahijdgn3b4qm3', 2, 'BISTECA', 'CARNE', 0, 1, 0, '2026-03-31 14:22:19.974', '2026-04-07 13:58:52.089'),
('cmng3zo8q0000ayxossynixcd', 3, 'QUIABO REFOGADO', 'GUARNICAO', 0, 1, 0, '2026-04-01 13:56:05.882', '2026-04-08 13:32:55.079'),
('cmnhj2r2t0006tr3bzp39v5ks', 4, 'CENOURA REFOGAGADA', 'GUARNICAO', 0, 1, 0, '2026-04-02 13:46:09.942', '2026-04-09 13:38:18.766'),
('cmnhj2tvf0007tr3b1fq5tz34', 4, 'COUVE', 'GUARNICAO', 0, 1, 0, '2026-04-02 13:46:13.564', '2026-04-09 13:37:39.325'),
('cmnhj2xf90008tr3b2cg0zlwr', 4, 'FRITAS', 'GUARNICAO', 0, 1, 0, '2026-04-02 13:46:18.166', '2026-04-02 13:46:18.166'),
('cmnhj37i90009tr3bspgoz4gz', 4, 'MACARRÃOPRIMAVERA', 'GUARNICAO', 0, 1, 0, '2026-04-02 13:46:31.233', '2026-04-09 13:38:31.929'),
('cmnhj3fk4000atr3bysdm4i5d', 4, 'FRANGO GRELHADO', 'CARNE', 0, 1, 0, '2026-04-02 13:46:41.668', '2026-04-02 13:46:41.668'),
('cmnhj3jfs000btr3b9cxd9psq', 4, 'FEIJOADA', 'CARNE', 0, 1, 0, '2026-04-02 13:46:46.696', '2026-04-02 13:46:46.696'),
('cmnhj3nne000ctr3bxx99mz6e', 4, 'TORRESMO', 'GUARNICAO', 0, 1, 0, '2026-04-02 13:46:52.155', '2026-04-02 13:46:52.155'),
('cmnhj3r1c000dtr3bqkftr8lj', 4, 'LARANJA', 'GUARNICAO', 0, 1, 0, '2026-04-02 13:46:56.544', '2026-04-02 13:46:56.544'),
('cmnnagusz00049rpa27lt48ke', 1, 'FEIJÃO', 'GUARNICAO', 0, 1, 0, '2026-04-06 14:31:48.468', '2026-04-06 14:31:48.468'),
('cmnszc8wu006wq8w6juf7fh6j', 5, 'ARROZ', 'GUARNICAO', 0, 1, 0, '2026-04-10 14:06:54.751', '2026-04-10 14:06:54.751'),
('cmnsztd1h006xq8w69msn611p', 5, 'FEIJÃO', 'GUARNICAO', 0, 1, 0, '2026-04-10 14:20:13.239', '2026-04-10 14:20:13.239'),
('cmnszu1xy006yq8w618z35itt', 5, 'FAROFA', 'GUARNICAO', 0, 1, 0, '2026-04-10 14:20:45.526', '2026-04-10 14:20:45.526'),
('cmnszu6vo006zq8w6h1n8h3cn', 5, 'POLENTA FRITA', 'GUARNICAO', 0, 1, 0, '2026-04-10 14:20:51.924', '2026-04-10 14:20:51.924'),
('cmnszudxn0070q8w64tcmtvxv', 5, 'COBOTIÁ', 'GUARNICAO', 0, 1, 0, '2026-04-10 14:21:01.067', '2026-04-10 14:21:01.067'),
('cmnszupgu0071q8w6mgynfg21', 5, 'MAIONESE', 'GUARNICAO', 0, 1, 0, '2026-04-10 14:21:16.014', '2026-04-10 14:21:16.014'),
('cmnszuxiv0072q8w67ht10kbx', 5, 'MACARRÃO', 'GUARNICAO', 0, 1, 0, '2026-04-10 14:21:26.456', '2026-04-10 14:21:26.456'),
('cmnszv5v50073q8w67qoj8a4h', 5, 'MIX CHURRASCO', 'CARNE', 0, 1, 0, '2026-04-10 14:21:37.266', '2026-04-10 14:21:37.266'),
('cmnuer3kp0000ba6vlfyszewm', 6, 'QUIABO', 'GUARNICAO', 0, 1, 0, '2026-04-11 14:06:08.089', '2026-04-11 14:06:08.089'),
('cmnueravn0001ba6vlgaijnwf', 6, 'PURÊ DE ABÓBORA', 'GUARNICAO', 0, 1, 0, '2026-04-11 14:06:17.555', '2026-04-11 14:06:17.555'),
('cmnuerdl40002ba6v5iwf32v7', 6, 'MAIONESE', 'GUARNICAO', 0, 1, 0, '2026-04-11 14:06:21.064', '2026-04-11 14:06:21.064');

-- --------------------------------------------------------

--
-- Estrutura para tabela `order`
--

CREATE TABLE `order` (
  `id` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'NEW',
  `total` double NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `deliveryStreet` varchar(191) DEFAULT NULL,
  `deliveryNumber` varchar(191) DEFAULT NULL,
  `deliveryNeighborhood` varchar(191) DEFAULT NULL,
  `deliveryReference` varchar(191) DEFAULT NULL,
  `deliveryPhone` varchar(191) DEFAULT NULL,
  `deliveryNotes` text DEFAULT NULL,
  `tableId` varchar(191) DEFAULT NULL,
  `userId` varchar(191) NOT NULL,
  `waiterId` varchar(191) DEFAULT NULL,
  `customerId` varchar(191) DEFAULT NULL,
  `customerName` varchar(191) DEFAULT NULL,
  `deliveryFee` double NOT NULL DEFAULT 0,
  `deliveryType` varchar(191) DEFAULT 'URBAN',
  `cashRegisterSessionId` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `order`
--

INSERT INTO `order` (`id`, `type`, `status`, `total`, `createdAt`, `updatedAt`, `deliveryStreet`, `deliveryNumber`, `deliveryNeighborhood`, `deliveryReference`, `deliveryPhone`, `deliveryNotes`, `tableId`, `userId`, `waiterId`, `customerId`, `customerName`, `deliveryFee`, `deliveryType`, `cashRegisterSessionId`) VALUES
('cmmxhrovh003wbxlkj0234ahw', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-19 13:14:10.733', '2026-03-19 13:15:33.638', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'wal retirada 10:20', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxi8wwz0044bxlkqv0m9gt6', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-19 13:27:34.307', '2026-03-19 13:37:54.082', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LUCINEIA RETIRADA ', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxij42p0048bxlk8m9gxti2', 'DELIVERY', 'FINISHED', 22, '2026-03-19 13:35:30.145', '2026-03-19 14:21:15.845', 'RUA CLARINDO DE SOUZA DIAS', '31', 'N', 'N', '17 988076445', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JULIANA ', 1, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxit6ek004ebxlkftxriygc', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-19 13:43:19.724', '2026-03-19 13:43:54.560', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JOAO ', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxiyvr8004kbxlkvjpzplu8', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-19 13:47:45.860', '2026-03-19 13:49:24.880', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JOAO BONFIM', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxj6kpw004qbxlkrtu2p8mr', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-19 13:53:44.804', '2026-03-19 13:55:17.154', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JULIO', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxj7hl8004ubxlkv67nkofa', 'TAKE_AWAY', 'CANCELED', 5, '2026-03-19 13:54:27.404', '2026-03-19 13:54:39.587', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JULIO', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxj861t004ybxlky08sh6s2', 'TAKE_AWAY', 'FINISHED', 5, '2026-03-19 13:54:59.106', '2026-03-19 13:55:19.278', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JULIO', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxjl3ix0056bxlkv9nox52v', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-19 14:05:02.361', '2026-03-19 14:05:07.589', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LAURA', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxk47kf005cbxlke600uys9', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-19 14:19:54.064', '2026-03-19 14:20:47.555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JOSE MARTINO', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxkdl0o005kbxlkbunclt9i', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-19 14:27:11.400', '2026-03-19 14:28:21.260', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ZE CARLOS', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxkmwte005qbxlk62ludm4l', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-19 14:34:26.594', '2026-03-19 14:34:58.637', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MARILZA', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxkw3dk005wbxlkl21twhab', 'TAKE_AWAY', 'FINISHED', 50, '2026-03-19 14:41:35.000', '2026-03-19 15:29:39.635', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'PAOLA', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxlb7kp0061bxlkq8msg42a', 'TAKE_AWAY', 'FINISHED', 8, '2026-03-19 14:53:20.281', '2026-03-19 15:29:46.359', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'PAOLA', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxlgrty0065bxlk49jxeo6e', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-19 14:57:39.814', '2026-03-19 14:57:45.003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MOÇA', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxllxtv006bbxlk0d2gb7w4', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-19 15:01:40.867', '2026-03-19 15:02:42.120', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ADIELSON', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxlxk5j006hbxlkmu07nd34', 'TAKE_AWAY', 'FINISHED', 30, '2026-03-19 15:10:43.015', '2026-03-19 15:10:50.804', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'PAULO', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxm12ba006obxlkg4ltal44', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-19 15:13:26.519', '2026-03-19 15:17:32.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'EDMAR', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxm3k98006sbxlkstwygt5m', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-19 15:15:23.085', '2026-03-19 15:17:23.116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'VILMA', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxm9pdw0070bxlkdrrvvdms', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-19 15:20:09.668', '2026-03-19 15:24:15.829', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MAGAL', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxmci4y0074bxlkrxjok2j3', 'DELIVERY', 'FINISHED', 30, '2026-03-19 15:22:20.242', '2026-03-19 15:51:40.948', 'ALTINO ARANTES ', '1390', ',', ',', '18997112160', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JULIO TECNICO CELULAR', 1, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxndvl3007ebxlkcmrtnv4v', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-19 15:51:23.943', '2026-03-19 15:51:29.568', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'GERSON', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmxnhgna007mbxlk2xn7mppz', 'TAKE_AWAY', 'FINISHED', 26, '2026-03-19 15:54:11.206', '2026-03-19 15:54:55.881', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FERNANDA', 0, 'URBAN', 'cmmxfn02j0001bxlklng6x39x'),
('cmmyyhkya000c3r61e1b999en', 'TAKE_AWAY', 'FINISHED', 42, '2026-03-20 13:49:58.739', '2026-03-20 13:50:04.745', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'vera ', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmyyjamy000j3r61c9frj5u3', 'TAKE_AWAY', 'FINISHED', 89, '2026-03-20 13:51:18.683', '2026-03-20 13:51:24.373', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'augusto', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmyyk6j2000t3r61thnsbn38', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-20 13:52:00.014', '2026-03-20 13:52:29.753', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'sueli', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmyyoc88000z3r618ngcjh9o', 'TAKE_AWAY', 'FINISHED', 42, '2026-03-20 13:55:14.025', '2026-03-20 14:06:57.232', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'emily', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmyyu67w00143r6173ff5cug', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-20 13:59:46.172', '2026-03-20 14:19:23.203', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'maria eduarda ', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmyz9m6m001a3r61kg15bvrk', 'TAKE_AWAY', 'NEW', 25, '2026-03-20 14:11:46.702', '2026-03-20 14:11:46.702', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'raicar', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmyze1wc001e3r61czgdasqx', 'TAKE_AWAY', 'FINISHED', 8, '2026-03-20 14:15:13.692', '2026-03-20 14:15:44.832', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'raicar', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmyziack001k3r61px6zrnk5', 'TAKE_AWAY', 'FINISHED', 58, '2026-03-20 14:18:31.269', '2026-03-20 14:19:26.767', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'marcos', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmyzwkx0001t3r611ytk0ylv', 'TAKE_AWAY', 'FINISHED', 29, '2026-03-20 14:29:38.149', '2026-03-20 14:31:23.118', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'geni', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmyzylyc001x3r615lpj66dv', 'TAKE_AWAY', 'FINISHED', 55, '2026-03-20 14:31:12.805', '2026-03-20 14:31:18.985', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'alexandre', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmz0245h00273r61il0x74v4', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-20 14:33:56.357', '2026-03-20 14:34:19.305', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'hercules', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmz09e6m002d3r61pqe55b5a', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-20 14:39:35.949', '2026-03-20 14:40:22.237', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'vania', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmz0bnhq002j3r614n1nyxfy', 'TAKE_AWAY', 'FINISHED', 29, '2026-03-20 14:41:21.326', '2026-03-20 14:44:38.696', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ecilio', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmz0iopo002p3r611r1hls4x', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-20 14:46:49.500', '2026-03-20 17:19:49.570', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'edilaine retirada 13:30', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmz0mgl2002t3r61dnt0kcxj', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-20 14:49:45.590', '2026-03-20 15:04:50.154', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'gabriel entregar no samu saida p jose bonifacio', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmz133lp002x3r61zpzyhwj6', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-20 15:02:41.917', '2026-03-20 15:05:01.944', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'juliana', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmz14tcf00313r61kx0vqflc', 'TAKE_AWAY', 'FINISHED', 51, '2026-03-20 15:04:01.935', '2026-03-20 15:04:31.206', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'thaina', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmz17qzw003d3r61vwru19z6', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-20 15:06:18.860', '2026-03-20 15:06:42.029', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'edneia', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmz1az0h003j3r61z3bvo83r', 'TAKE_AWAY', 'CANCELED', 30, '2026-03-20 15:08:49.218', '2026-03-20 15:09:33.615', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'vilson', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmz1clyd003p3r61xhuuioou', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-20 15:10:05.606', '2026-03-20 15:10:46.251', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'valcilia', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmz1hup3003v3r611x799luu', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-20 15:14:10.215', '2026-03-20 15:15:20.589', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'elias', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmz1j2xx003z3r61m73vk9q7', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-20 15:15:07.557', '2026-03-20 15:17:25.161', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'joao vitor', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmz2a2ot00493r61bt4e16il', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-20 15:36:06.941', '2026-03-20 15:36:46.307', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'maraisa', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmz40cz9004f3r61hhlkk8r0', 'DELIVERY', 'NEW', 30, '2026-03-20 16:24:32.949', '2026-03-20 16:24:32.949', '700', '0000', '000', '0000', '00000', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'natan ', 1, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmmz45b1a004j3r61iirx13dh', 'TAKE_AWAY', 'NEW', 21, '2026-03-20 16:28:23.710', '2026-03-20 16:28:23.710', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'rico', 0, 'URBAN', 'cmmxq6xd90003co5p880fbwfc'),
('cmn387jqm000gtga3w8glcfbk', 'TAKE_AWAY', 'FINISHED', 29, '2026-03-23 13:33:11.470', '2026-03-23 14:08:46.092', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Jorge', 0, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn38l77g000ktga3b3hm95cw', 'DELIVERY', 'FINISHED', 53, '2026-03-23 13:43:48.413', '2026-03-23 17:08:20.251', 'Sitio Boa Vista', '000', '000', NULL, '(17)996166921', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Paola', 3, 'RURAL', 'cmn37eotg000ctga3g88qezgk'),
('cmn38slm0000qtga3jqfbr694', 'DELIVERY', 'FINISHED', 22, '2026-03-23 13:49:33.672', '2026-03-23 14:09:24.261', 'Pompilio Fernandes Pereira', '927', '0', NULL, '18997308329', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Pamela Matos', 1, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn395vk2000utga382ntmt1q', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-23 13:59:53.090', '2026-03-23 14:06:34.386', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Leandro', 0, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn3987nz000ytga38tglnlfo', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-23 14:01:42.095', '2026-03-23 14:07:28.299', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Sonia', 0, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn39auov0012tga3wa6dy6ae', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-23 14:03:45.248', '2026-03-23 14:08:35.558', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Luciana', 0, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn39lcx3001gtga3e8cndn3r', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-23 14:11:55.431', '2026-03-23 14:45:41.364', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Deysere', 0, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn3a5bip001ktga3paqbasef', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-23 14:27:26.737', '2026-03-23 15:05:22.201', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'le vedekin', 0, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn3ai47q001otga3nt2kgrsm', 'DELIVERY', 'FINISHED', 26, '2026-03-23 14:37:23.798', '2026-03-23 14:58:26.843', 'avenida rio branco ', '832', 'bbbb', NULL, '18996045701', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'cassio', 1, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn3as76z001stga3ijk5nhjr', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-23 14:45:14.219', '2026-03-23 15:10:20.962', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Fernanda Bonfim', 0, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn3aufi1001ytga31ariqwnx', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-23 14:46:58.298', '2026-03-23 14:59:26.223', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Maria Helena', 0, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn3bdtsi0026tga308shdpik', 'TAKE_AWAY', 'FINISHED', 48.5, '2026-03-23 15:02:03.282', '2026-03-23 15:05:29.556', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Carlos fez direto s/ pedido', 0, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn3bhg3q002ctga356ydf62w', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-23 15:04:52.166', '2026-03-23 15:19:14.971', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Rose', 0, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn3bur75002mtga3dcbokkdy', 'TAKE_AWAY', 'FINISHED', 50, '2026-03-23 15:15:13.073', '2026-03-23 15:17:06.130', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Dudu', 0, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn3cdlxc002vtga3qly3zmhl', 'TAKE_AWAY', 'FINISHED', 29, '2026-03-23 15:29:52.704', '2026-03-23 15:30:19.094', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'moto', 0, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn3cpj460031tga3hpxunvcd', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-23 15:39:08.935', '2026-03-23 15:48:52.026', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Marcelo', 0, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn3d1rn20035tga36luq2sy3', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-23 15:48:39.854', '2026-03-23 15:48:54.770', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Fernando', 0, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn3ddpa3003dtga31cu1rb6k', 'DELIVERY', 'FINISHED', 22, '2026-03-23 15:57:56.668', '2026-03-23 16:09:13.653', 'Av Barbosa', '1373', '0', NULL, '18996159066', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Lucilene', 1, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn3dnewy003htga3lxxf6zn7', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-23 16:05:29.794', '2026-03-23 16:14:18.504', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Malica', 0, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn3dvyu7003ntga3sf225b4g', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-23 16:12:08.864', '2026-03-23 16:12:45.721', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Flavia', 0, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn3dzizv003vtga3fociisd5', 'TAKE_AWAY', 'FINISHED', 26, '2026-03-23 16:14:54.956', '2026-03-23 16:15:03.940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Bebidas ', 0, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn3e5q930043tga3hxzqvmyb', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-23 16:19:44.295', '2026-03-23 17:08:13.528', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Galdino', 0, 'URBAN', 'cmn37eotg000ctga3g88qezgk'),
('cmn4ocdyk000ug2zq4nspij0k', 'TAKE_AWAY', 'FINISHED', 50, '2026-03-24 13:52:37.292', '2026-03-24 14:19:01.520', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LUIZ FERNANDO', 0, NULL, 'cmn4nlg270001g2zqq2cuccoq'),
('cmn4pa7rx001gg2zqganyg6tj', 'DELIVERY', 'NEW', 64, '2026-03-24 14:18:55.582', '2026-03-24 14:20:21.425', 'Sitio', '0', '0', '', '0', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'Paola', 0, NULL, 'cmn4nlg270001g2zqq2cuccoq'),
('cmn4pfoe6001rg2zqzoufowd9', 'DELIVERY', 'FINISHED', 29, '2026-03-24 14:23:10.398', '2026-03-24 14:23:19.135', '0', '0', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ELIANA', 0, 'URBAN', 'cmn4nlg270001g2zqq2cuccoq'),
('cmn4ply7r0022g2zqzkzq777q', 'DELIVERY', 'FINISHED', 21, '2026-03-24 14:28:03.063', '2026-03-24 14:39:17.064', 'RUA CAETANO DOURADO 513', '513', '0', NULL, '18996281630', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmn4pj6nl0020g2zqq1wrypt2', 'ROBSON ', 0, 'URBAN', 'cmn4nlg270001g2zqq2cuccoq'),
('cmn4po0ih0026g2zqee38qnn6', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-24 14:29:39.353', '2026-03-24 14:39:03.031', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'HUDSON', 0, 'URBAN', 'cmn4nlg270001g2zqq2cuccoq'),
('cmn4q8fij002kg2zqg6gjcjkk', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-24 14:45:31.915', '2026-03-24 15:15:42.787', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ALEXA', 0, 'URBAN', 'cmn4nlg270001g2zqq2cuccoq'),
('cmn4qoivw002og2zqlkt51dgs', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-24 14:58:02.781', '2026-03-24 15:16:15.967', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'CHICO', 0, 'URBAN', 'cmn4nlg270001g2zqq2cuccoq'),
('cmn4qporw002sg2zqgt5sbyu7', 'TAKE_AWAY', 'FINISHED', 13, '2026-03-24 14:58:57.069', '2026-03-24 15:16:22.034', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'CHICO', 0, 'URBAN', 'cmn4nlg270001g2zqq2cuccoq'),
('cmn4qvhxe002wg2zqjouiukas', 'DELIVERY', 'FINISHED', 58, '2026-03-24 15:03:28.130', '2026-03-24 15:15:09.497', 'RUA LUIZ AMERICO DE FREITAS', '531', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'BAR DO JEFIN', 0, 'URBAN', 'cmn4nlg270001g2zqq2cuccoq'),
('cmn4qzlzt0031g2zql81rtijb', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-24 15:06:40.025', '2026-03-24 15:16:38.957', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'VANIA', 0, 'URBAN', 'cmn4nlg270001g2zqq2cuccoq'),
('cmn4r9c720035g2zqz0k65e3b', 'DELIVERY', 'FINISHED', 21, '2026-03-24 15:14:13.886', '2026-03-24 15:23:29.147', 'RUA FERNANDES POMPILIO', '838', '-', NULL, '18996507238', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'GUDRYAM', 0, 'URBAN', 'cmn4nlg270001g2zqq2cuccoq'),
('cmn4ri5x2003jg2zq5r8r0slb', 'TAKE_AWAY', 'FINISHED', 42, '2026-03-24 15:21:05.655', '2026-03-24 15:23:23.858', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHORA', 0, 'URBAN', 'cmn4nlg270001g2zqq2cuccoq'),
('cmn4riq61003og2zqov4vi75q', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-24 15:21:31.898', '2026-03-24 15:31:02.962', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'EVERTON', 0, 'URBAN', 'cmn4nlg270001g2zqq2cuccoq'),
('cmn4rpwur003wg2zq3oxcbm05', 'DINE_IN', 'FINISHED', 22.91, '2026-03-24 15:27:07.156', '2026-03-24 16:33:58.530', '', '', '', '', '', '', 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SIMONE MEDICA', 0, NULL, 'cmn4nlg270001g2zqq2cuccoq'),
('cmn4rrsmc0041g2zq47oeqb7i', 'DINE_IN', 'FINISHED', 23.94, '2026-03-24 15:28:34.980', '2026-03-24 16:33:51.496', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3l0002a4lsihfjel0w', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SIMONE TB', 0, 'URBAN', 'cmn4nlg270001g2zqq2cuccoq'),
('cmn4u37ad004eg2zq1ilxce0f', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-24 16:33:26.438', '2026-03-24 16:33:48.185', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'REUZA', 0, 'URBAN', 'cmn4nlg270001g2zqq2cuccoq'),
('cmn4uwioz004og2zqd8pc8ej6', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-24 16:56:14.244', '2026-03-24 16:56:23.484', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'OK', 0, 'URBAN', 'cmn4nlg270001g2zqq2cuccoq'),
('cmn4uxl2n004ug2zqooqzjav3', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-24 16:57:03.984', '2026-03-24 16:57:22.387', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SUCO', 0, 'URBAN', 'cmn4nlg270001g2zqq2cuccoq'),
('cmn62vdf7005gg2zqjozuxy3q', 'DELIVERY', 'FINISHED', 29, '2026-03-25 13:27:03.859', '2026-03-25 14:23:49.198', 'RUA DO BANCO DO BRASIL', '612', '0', 'CASA DO OTTONI', '18998121085', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ELIANA', 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn639lon0060g2zq28gnj5i7', 'TAKE_AWAY', 'FINISHED', 29, '2026-03-25 13:38:07.752', '2026-03-25 13:43:07.585', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JORGE', 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn63r16e0066g2zqk23hjxqn', 'DELIVERY', 'FINISHED', 35, '2026-03-25 13:51:40.983', '2026-03-25 13:58:40.815', '0', '0', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmn4pj6nl0020g2zqq1wrypt2', 'ROBSON', 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn64lfwt006tg2zq6rw1c0kq', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-25 14:15:19.757', '2026-03-25 14:18:58.549', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FILINTO', 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn64nlie0070g2zqj5onba89', 'DINE_IN', 'FINISHED', 25, '2026-03-25 14:17:00.327', '2026-03-25 14:19:30.218', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, NULL, 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn64yk6l007ag2zq0symm44r', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-25 14:25:31.822', '2026-03-25 14:36:12.196', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'RYAN', 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn65cugv007ig2zqn8drek4l', 'TAKE_AWAY', 'FINISHED', 23, '2026-03-25 14:36:38.335', '2026-03-25 14:37:42.045', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LUCIENE', 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn65pty3007og2zqmmevbw9k', 'DELIVERY', 'FINISHED', 21, '2026-03-25 14:46:44.188', '2026-03-25 15:37:23.070', 'RUA RUI BARBOSA', '0', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MARCIA', 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn6606a2007sg2zqwvm95gqc', 'DINE_IN', 'FINISHED', 35.4, '2026-03-25 14:54:46.731', '2026-03-25 15:37:40.426', '', '', '', '', '', '', 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ISABELI TOLOY', 0, NULL, 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn6617w4007xg2zqd49fe9r4', 'DINE_IN', 'FINISHED', 26, '2026-03-25 14:55:35.476', '2026-03-25 15:25:28.529', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3l0002a4lsihfjel0w', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SIMONE TB', 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn664ayt0086g2zqmu0pl3eh', 'DINE_IN', 'FINISHED', 60, '2026-03-25 14:57:59.429', '2026-03-25 15:25:08.362', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3p0003a4lsiss1l4vl', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHORES', 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn66a2x3008cg2zqcsskvr8c', 'DELIVERY', 'FINISHED', 59, '2026-03-25 15:02:28.935', '2026-03-25 15:41:21.205', 'RUA DOM PEDRO II', '721', '0', '', '0', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LUIZ CARLOS', 1, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn66epev008hg2zqvzlm64hm', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-25 15:06:04.711', '2026-03-25 15:11:29.326', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ANTONIO', 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn66jbni008og2zq7hhrsgey', 'DELIVERY', 'FINISHED', 21, '2026-03-25 15:09:40.158', '2026-03-25 15:20:32.779', 'RUA CLARINDO DE SOUZA', '31', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JULIANA', 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn66oj8n008ug2zqndx4xoxp', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-25 15:13:43.271', '2026-03-25 15:39:43.611', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FERNANDA', 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn66qsmt008yg2zq0024lhwd', 'DELIVERY', 'FINISHED', 25, '2026-03-25 15:15:28.757', '2026-03-25 15:38:58.587', 'JOCONIAS RIBEIRO DOS SANTOS', '220', '-', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'TELMA', 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn66tu2j0092g2zqfnm34gc8', 'TAKE_AWAY', 'FINISHED', 54, '2026-03-25 15:17:50.588', '2026-03-25 15:30:36.391', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'RENATO', 0, NULL, 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn6781z8009hg2zqturyy16s', 'DINE_IN', 'FINISHED', 83, '2026-03-25 15:28:54.020', '2026-03-25 15:41:36.029', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3v0005a4lsyea0z57j', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHORES', 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn679psw009mg2zqbte9jm7w', 'DINE_IN', 'FINISHED', 15.9, '2026-03-25 15:30:11.553', '2026-03-25 15:30:17.957', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LUCIANA', 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn67hh3r00a0g2zqp7ibq25u', 'DINE_IN', 'FINISHED', 35, '2026-03-25 15:36:13.527', '2026-03-25 15:44:27.695', '', '', '', '', '', '', 'cmms2mx3s0004a4lsnswxuujf', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MOÇA', 0, NULL, 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn67qwsk00alg2zqrfizpeob', 'DINE_IN', 'FINISHED', 23.57, '2026-03-25 15:43:33.764', '2026-03-25 15:59:17.175', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3s0004a4lsnswxuujf', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SIMONE MEDICA', 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn682qcc00asg2zqmtcpqg91', 'TAKE_AWAY', 'FINISHED', 5, '2026-03-25 15:52:45.277', '2026-03-25 15:52:53.979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'APSRECIDO', 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn68cdrt00b0g2zq6z2fi7bh', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-25 16:00:15.545', '2026-03-25 16:24:16.475', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'EDILAINE ', 0, 'URBAN', 'cmn62qm3j0052g2zqd2cg7q1h'),
('cmn7iqb010001hsrvge2qvclc', 'TAKE_AWAY', 'FINISHED', 43, '2026-03-26 13:38:47.473', '2026-03-26 13:43:00.559', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JOAO', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7itiab0007hsrvou6zvozu', 'DELIVERY', 'FINISHED', 21, '2026-03-26 13:41:16.884', '2026-03-26 14:33:29.675', 'AV CARLOS GOMES', '1114', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MARILDA', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7iwqjt000dhsrv2hszpvsa', 'TAKE_AWAY', 'FINISHED', 20, '2026-03-26 13:43:47.561', '2026-03-26 13:43:59.907', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JOAO', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7iyooq000jhsrvkb9z1ukb', 'TAKE_AWAY', 'NEW', 75, '2026-03-26 13:45:18.458', '2026-03-26 13:45:18.458', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FUNC. FABIO TOBIAS', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7jcpuz000phsrvckfqdg2t', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-26 13:56:13.164', '2026-03-26 14:01:51.468', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JULIO', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7jsvbg000vhsrv7c1bcaqg', 'TAKE_AWAY', 'FINISHED', 42, '2026-03-26 14:08:46.733', '2026-03-26 14:16:34.607', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'BRUNO', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7jxxwf0010hsrvtkfhggz3', 'DINE_IN', 'FINISHED', 56.5, '2026-03-26 14:12:43.360', '2026-03-26 14:14:38.945', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MENINAS', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7k08zr0015hsrv92k0eq0j', 'DINE_IN', 'NEW', 58, '2026-03-26 14:14:31.048', '2026-03-26 14:14:31.048', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3l0002a4lsihfjel0w', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'OKEI MENINOS', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7k67ri001ehsrv5y8ls36n', 'TAKE_AWAY', 'FINISHED', 42, '2026-03-26 14:19:09.391', '2026-03-26 14:44:22.992', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SR ', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7ka1oj001jhsrv6kbppjey', 'DELIVERY', 'DELIVERED', 29, '2026-03-26 14:22:08.132', '2026-03-26 14:41:58.210', 'BORACHARIAS FABAO', '000', '000', NULL, '18', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FELIPE ', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7kkuz8001nhsrvpd09nqbp', 'DELIVERY', 'FINISHED', 48.5, '2026-03-26 14:30:32.661', '2026-03-26 14:41:42.160', 'AV. ALTINO ARANTES', '746', '-', '', '-', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'DANTHIELE', 0, NULL, 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7krada001yhsrve506srt0', 'TAKE_AWAY', 'READY', 63, '2026-03-26 14:35:32.542', '2026-03-26 15:04:29.601', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHOR ', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7l8q86002ghsrvkvouc8fk', 'TAKE_AWAY', 'FINISHED', 63, '2026-03-26 14:49:06.246', '2026-03-26 14:50:05.878', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SR', 0, NULL, 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7lb3ra002xhsrvtom6sbqk', 'DELIVERY', 'FINISHED', 25, '2026-03-26 14:50:57.094', '2026-03-26 15:03:44.436', 'AV RIO BRANCO', '832', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'CASSIO', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7lxz5v0033hsrvqaqmy0xq', 'DINE_IN', 'FINISHED', 58, '2026-03-26 15:08:44.227', '2026-03-26 15:08:52.642', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3l0002a4lsihfjel0w', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'OQUEI', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7mebaw003ahsrv4ypdjtya', 'DINE_IN', 'FINISHED', 59, '2026-03-26 15:21:26.456', '2026-03-26 15:22:30.222', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3l0002a4lsihfjel0w', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'PATURY', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7mfdri003ghsrvdp42q7ua', 'DELIVERY', 'NEW', 29, '2026-03-26 15:22:16.302', '2026-03-26 15:24:14.396', 'USINA ', '-', '-', '', '-', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LEONARDO', 0, NULL, 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7mhgot003mhsrvuisiuirx', 'TAKE_AWAY', 'NEW', 21, '2026-03-26 15:23:53.406', '2026-03-26 15:23:53.406', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, '0', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7mks8t003thsrvwhtiawf8', 'TAKE_AWAY', 'FINISHED', 16.53, '2026-03-26 15:26:28.349', '2026-03-26 15:28:43.567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'DENISE', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7monsd003zhsrv1omw56rm', 'DINE_IN', 'FINISHED', 33.39, '2026-03-26 15:29:29.197', '2026-03-26 15:29:57.270', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3l0002a4lsihfjel0w', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MENINAS', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7mqglm0047hsrvjxchbczy', 'DINE_IN', 'FINISHED', 28.08, '2026-03-26 15:30:53.195', '2026-03-26 15:33:29.850', '', '', '', '', '', '', 'cmms2mx3l0002a4lsihfjel0w', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SIMONE', 0, NULL, 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7mwenw004ghsrvah0l3ck9', 'DINE_IN', 'NEW', 20, '2026-03-26 15:35:30.620', '2026-03-26 15:36:05.614', '', '', '', '', '', '', 'cmms2mx3l0002a4lsihfjel0w', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MARA', 0, NULL, 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7mz828004nhsrv4f474ms6', 'DINE_IN', 'NEW', 26, '2026-03-26 15:37:42.032', '2026-03-26 15:47:35.632', '', '', '', '', '', '', 'cmms2mx3l0002a4lsihfjel0w', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FERNANDA', 0, NULL, 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7nij0a004uhsrvk3n0cvdn', 'DINE_IN', 'FINISHED', 29, '2026-03-26 15:52:42.682', '2026-03-26 15:52:58.806', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3l0002a4lsihfjel0w', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'OGEMIL', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7nl2080051hsrvk8tfbwu2', 'DINE_IN', 'FINISHED', 30, '2026-03-26 15:54:40.616', '2026-03-26 15:55:07.846', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3l0002a4lsihfjel0w', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MOÇO', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7npgjc0058hsrvcbg6nuym', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-26 15:58:06.072', '2026-03-26 16:56:13.713', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'GABRIEL', 0, 'URBAN', 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn7nqiz8005chsrvfh2nh97e', 'TAKE_AWAY', 'FINISHED', 26, '2026-03-26 15:58:55.892', '2026-03-26 16:56:04.835', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'NATHALIA', 0, NULL, 'cmn7g8xk90001g6fv2weu9cyt'),
('cmn91olmw0001h6f029wd70mk', 'DINE_IN', 'FINISHED', 25, '2026-03-27 15:17:06.822', '2026-03-27 15:17:18.480', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'e-machine', 0, 'URBAN', 'cmn7spe0b0001zu9ulw07vg16'),
('cmnac27iq0007h6f02c51l5jw', 'TAKE_AWAY', 'FINISHED', 1330.5, '2026-03-28 12:55:24.050', '2026-03-28 13:04:04.230', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LANÇAMENTO 27/03', 0, NULL, 'cmn7spe0b0001zu9ulw07vg16'),
('cmnach5l7001oh6f0axifu74k', 'DELIVERY', 'FINISHED', 25, '2026-03-28 13:07:01.387', '2026-03-28 13:56:58.631', 'RUA LUIZ AMERICO DE FREITAS', '645', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ARLENE (LUCIA)', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnacjc0j001sh6f02w9qy4ow', 'DELIVERY', 'FINISHED', 160.14, '2026-03-28 13:08:43.027', '2026-03-28 17:04:19.766', 'AV. RIO BRANCO', '958', '-', '', '-', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'IZABELLY TOLOY', 0, NULL, 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnado1ha001wh6f0oupr1t4k', 'DELIVERY', 'FINISHED', 21, '2026-03-28 13:40:22.270', '2026-03-28 14:11:06.789', 'AV. CARLOS GOMES', '1114', '-', 'AO LADO DO ESCRITORIO DO FLAVIO CASTILHO', '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MARILDA', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnaeqpgr0028h6f0w17190rz', 'TAKE_AWAY', 'FINISHED', 50, '2026-03-28 14:10:26.283', '2026-03-28 14:10:45.322', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JOÃO TOLOY', 0, NULL, 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnaexzug002jh6f09oxi7mvd', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-28 14:16:06.328', '2026-03-28 14:22:24.583', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHOR DO VIDRO', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnaf3xrw002nh6f0svmi79zb', 'TAKE_AWAY', 'FINISHED', 29, '2026-03-28 14:20:43.580', '2026-03-28 14:46:40.389', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ALEXIA', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnaf9ymd002th6f0xu0vdap5', 'DELIVERY', 'NEW', 50, '2026-03-28 14:25:24.613', '2026-03-28 14:25:24.613', 'RUA MANOEL FERREIRA FILHO', '533', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JESSICA', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnafk85z002yh6f03cwfl2od', 'DELIVERY', 'FINISHED', 58, '2026-03-28 14:33:23.543', '2026-03-28 14:47:29.225', 'RUA ARTUR CAETANO DOURADO', '763', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ANA CRISTINA', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnafoq6a0033h6f08yc8laum', 'DELIVERY', 'FINISHED', 21, '2026-03-28 14:36:53.507', '2026-03-28 15:56:51.731', 'RUA ALTINO ARANTES', '1131', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ALESSANDRA', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnafyqrt0037h6f0n8gp9lkd', 'DELIVERY', 'FINISHED', 51, '2026-03-28 14:44:40.841', '2026-03-28 15:40:04.361', 'RUA RUI BARBOSA', '1385', '-', '', '-', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'VAL', 1, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnag23a5003hh6f0upsx7mfm', 'DINE_IN', 'FINISHED', 58, '2026-03-28 14:47:17.021', '2026-03-28 15:56:40.030', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'DANILO', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnagb4o5003oh6f0qluclkzx', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-28 14:54:18.725', '2026-03-28 15:53:15.063', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'NEILSON', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnagfbr4003sh6f0mz9cwq6p', 'DELIVERY', 'FINISHED', 50, '2026-03-28 14:57:34.528', '2026-03-28 15:39:27.593', 'RUA CONCEIÇÃO AP. RUIZ SEBASTIÃO', '181', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LUCIENE', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnagh5u4003xh6f0t2sb7byu', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-28 14:59:00.173', '2026-03-28 15:09:02.621', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'CLEITON', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnagss4q0041h6f08e9fszp1', 'DELIVERY', 'FINISHED', 25, '2026-03-28 15:08:02.282', '2026-03-28 15:38:07.611', 'RUA PEDRO SOUZA BRANDÃO', '640', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'GRAZIELA PROFESSORA', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnagw7cu0047h6f08gxk52ty', 'TAKE_AWAY', 'FINISHED', 26, '2026-03-28 15:10:41.982', '2026-03-28 15:16:34.214', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'GABI', 0, NULL, 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnah0wl2004eh6f0hqgl0qkz', 'TAKE_AWAY', 'FINISHED', 84, '2026-03-28 15:14:21.302', '2026-03-28 15:37:35.286', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MOÇA', 0, NULL, 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnahghk3004zh6f0mdt0q834', 'DELIVERY', 'FINISHED', 21, '2026-03-28 15:26:28.323', '2026-03-28 15:37:28.364', 'RUA RUI BARBOSA', '1500', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'EVA', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnai9iv0005dh6f0duvu186a', 'TAKE_AWAY', 'FINISHED', 46, '2026-03-28 15:49:03.036', '2026-03-28 15:52:57.806', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'PAULINHO', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnailnyw005qh6f0vc9rj4ra', 'DINE_IN', 'FINISHED', 69.39, '2026-03-28 15:58:29.529', '2026-03-28 15:58:39.704', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3l0002a4lsihfjel0w', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'TATIANE', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnaip0i10060h6f0ky0hi2e4', 'DINE_IN', 'FINISHED', 143.75, '2026-03-28 16:01:05.737', '2026-03-28 16:04:21.179', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3l0002a4lsihfjel0w', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LUISA', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnaiup6q006eh6f0hhpi8mse', 'TAKE_AWAY', 'FINISHED', 36, '2026-03-28 16:05:31.011', '2026-03-28 16:05:47.906', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'PM ', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnaixyzs006kh6f0lu4rj4j7', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-28 16:08:03.688', '2026-03-28 16:10:11.389', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ANTONIO', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnaj464y006qh6f0sv126hy3', 'DINE_IN', 'FINISHED', 29, '2026-03-28 16:12:52.883', '2026-03-28 16:13:09.887', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3l0002a4lsihfjel0w', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'DEYSERE', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnak5yml006xh6f0des2qfqa', 'TAKE_AWAY', 'FINISHED', 116, '2026-03-28 16:42:16.077', '2026-03-28 16:54:41.243', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ARLETE', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnaklfa30075h6f0od0ctxqn', 'TAKE_AWAY', 'FINISHED', 5, '2026-03-28 16:54:17.499', '2026-03-28 16:55:43.347', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ARLENE', 0, NULL, 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnakonxv007jh6f0fd60zwtv', 'TAKE_AWAY', 'FINISHED', 60, '2026-03-28 16:56:48.691', '2026-03-28 16:57:05.997', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MAGAL', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnal6p660084h6f0xuhgga95', 'TAKE_AWAY', 'FINISHED', 30, '2026-03-28 17:10:50.094', '2026-03-28 17:35:23.208', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JACKSON', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnalz3wy0089h6f0kho49ltx', 'TAKE_AWAY', 'FINISHED', 50, '2026-03-28 17:32:55.570', '2026-03-28 17:33:08.055', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SELAS BETA', 0, 'URBAN', 'cmnacdtwv001ch6f0sue4vaxp'),
('cmnd870dt000fgdg2t8p4k905', 'DELIVERY', 'FINISHED', 21, '2026-03-30 13:30:28.145', '2026-03-30 14:04:50.151', 'CARTÓRIO', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MARCOS VINICIUS', 0, 'URBAN', 'cmnd81rt20001gdg2qlxltv1v'),
('cmnd8az9m000jgdg2gbdf2vlw', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-30 13:33:33.323', '2026-03-30 13:36:14.102', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'BELLA LIMA', 0, 'URBAN', 'cmnd81rt20001gdg2qlxltv1v'),
('cmnd8dekm000ngdg2d6yfl7lr', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-30 13:35:26.470', '2026-03-30 13:36:34.792', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JOÃO', 0, 'URBAN', 'cmnd81rt20001gdg2qlxltv1v'),
('cmnd8hh5p000vgdg20axj0hvi', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-30 13:38:36.446', '2026-03-30 13:38:47.866', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'WALL CAMARIM', 0, 'URBAN', 'cmnd81rt20001gdg2qlxltv1v'),
('cmnd9d8rw0011gdg2sp4lcus4', 'DELIVERY', 'NEW', 21, '2026-03-30 14:03:18.572', '2026-03-30 14:03:18.572', 'AV. RUI BARBOSA', '1385', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'VAL', 0, 'URBAN', 'cmnd81rt20001gdg2qlxltv1v'),
('cmnd9sg64001agdg2bkris40o', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-30 14:15:07.996', '2026-03-30 14:16:33.047', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SR', 0, 'URBAN', 'cmnd81rt20001gdg2qlxltv1v'),
('cmnda99hv001ggdg2n42lb0e6', 'DELIVERY', 'FINISHED', 21, '2026-03-30 14:28:12.499', '2026-03-30 15:04:17.720', 'RUA APARECIDO SOARES', '231', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MAYNE', 0, 'URBAN', 'cmnd81rt20001gdg2qlxltv1v'),
('cmndaa6ir001kgdg2bx1jraeu', 'DELIVERY', 'FINISHED', 21, '2026-03-30 14:28:55.299', '2026-03-30 14:39:58.081', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JULIANA', 0, 'URBAN', 'cmnd81rt20001gdg2qlxltv1v'),
('cmndahnwr001ogdg2v2ioqvsp', 'TAKE_AWAY', 'FINISHED', 29, '2026-03-30 14:34:44.427', '2026-03-30 14:39:54.304', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'NATHI', 0, 'URBAN', 'cmnd81rt20001gdg2qlxltv1v'),
('cmndaqtiv001wgdg28av4edfs', 'DELIVERY', 'FINISHED', 21, '2026-03-30 14:41:51.608', '2026-03-30 14:58:26.378', 'SORVETERIA KAPILÉ', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'GLORIA', 0, 'URBAN', 'cmnd81rt20001gdg2qlxltv1v'),
('cmndb3vo50020gdg2adtq76zx', 'TAKE_AWAY', 'FINISHED', 46.5, '2026-03-30 14:52:00.917', '2026-03-30 14:52:38.203', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MATHEUS', 0, 'URBAN', 'cmnd81rt20001gdg2qlxltv1v');
INSERT INTO `order` (`id`, `type`, `status`, `total`, `createdAt`, `updatedAt`, `deliveryStreet`, `deliveryNumber`, `deliveryNeighborhood`, `deliveryReference`, `deliveryPhone`, `deliveryNotes`, `tableId`, `userId`, `waiterId`, `customerId`, `customerName`, `deliveryFee`, `deliveryType`, `cashRegisterSessionId`) VALUES
('cmndbdkoa0029gdg2lsp27tae', 'DELIVERY', 'FINISHED', 28, '2026-03-30 14:59:33.226', '2026-03-30 15:04:09.319', 'RUA RUI BARBOSA', '1296', '-', '', '-', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MARLUZIA', 0, NULL, 'cmnd81rt20001gdg2qlxltv1v'),
('cmndbmh87002ngdg26wkmw7t5', 'DINE_IN', 'DELIVERED', 29, '2026-03-30 15:06:28.663', '2026-03-30 15:20:12.514', '', '', '', '', '', '', 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'E-MACHINE', 0, NULL, 'cmnd81rt20001gdg2qlxltv1v'),
('cmndbrcpx002vgdg2yuqvms3y', 'TAKE_AWAY', 'NEW', 21, '2026-03-30 15:10:16.102', '2026-03-30 15:10:16.102', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ANTONIO', 0, 'URBAN', 'cmnd81rt20001gdg2qlxltv1v'),
('cmndbtblh002zgdg2idi6udha', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-30 15:11:47.958', '2026-03-30 15:11:52.335', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SR', 0, 'URBAN', 'cmnd81rt20001gdg2qlxltv1v'),
('cmndc722v0035gdg25h89cg6e', 'TAKE_AWAY', 'IN_PROGRESS', 59, '2026-03-30 15:22:28.807', '2026-03-30 15:22:33.050', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FERNANDO', 0, 'URBAN', 'cmnd81rt20001gdg2qlxltv1v'),
('cmndcigu4003cgdg2f56c5sua', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-30 15:31:21.148', '2026-03-30 15:54:39.871', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FEDEGOS', 0, 'URBAN', 'cmnd81rt20001gdg2qlxltv1v'),
('cmndd44lh003ggdg2etvdxhvd', 'DELIVERY', 'FINISHED', 26, '2026-03-30 15:48:11.717', '2026-03-31 14:11:05.604', 'PERCILIANO PINTO', '927', '-', '', '-', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ARTHUR', 0, NULL, 'cmnd81rt20001gdg2qlxltv1v'),
('cmndd9t3s003kgdg2fmyncrgc', 'DINE_IN', 'FINISHED', 120, '2026-03-30 15:52:36.761', '2026-03-30 15:52:48.531', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'HIGOR', 0, 'URBAN', 'cmnd81rt20001gdg2qlxltv1v'),
('cmnepstpl000jhijdjvfi9enq', 'DELIVERY', 'FINISHED', 25, '2026-03-31 14:31:05.577', '2026-03-31 14:31:13.315', 'RUA ANGELO DE SOUSA', '590', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LANAYA', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmnepv9c8000phijdmufikfba', 'TAKE_AWAY', 'FINISHED', 25, '2026-03-31 14:32:59.144', '2026-03-31 14:36:51.867', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHOR', 0, NULL, 'cmnepejur0003hijdj4tnoyqs'),
('cmnepxg0p000vhijde8zjbnn4', 'DELIVERY', 'FINISHED', 42, '2026-03-31 14:34:41.113', '2026-03-31 14:34:49.288', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmn6499d2006og2zql9sr8y8s', 'EMILENE', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmneq00dy0015hijd4tv39u3z', 'TAKE_AWAY', 'FINISHED', 6, '2026-03-31 14:36:40.822', '2026-03-31 14:36:45.467', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MOÇO', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmneq77vv001dhijdrtby1b7f', 'TAKE_AWAY', 'FINISHED', 46, '2026-03-31 14:42:17.132', '2026-03-31 14:42:23.686', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'CLIENTE', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmneq7vsy001khijds5371mto', 'TAKE_AWAY', 'FINISHED', 21, '2026-03-31 14:42:48.130', '2026-03-31 14:42:51.376', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FABÃO', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmner1z9u001qhijdlw00b2jb', 'TAKE_AWAY', 'CANCELED', 16, '2026-03-31 15:06:12.307', '2026-03-31 15:06:25.706', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'TESTE', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmner702u001vhijdv2fzbrum', 'DELIVERY', 'FINISHED', 21, '2026-03-31 15:10:06.631', '2026-03-31 15:17:29.957', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmn6499d2006og2zql9sr8y8s', 'EMILENE', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmner96sp001zhijdsxt610lk', 'DELIVERY', 'NEW', 42, '2026-03-31 15:11:48.650', '2026-03-31 15:11:48.650', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MAGAL', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmnerc8pc0024hijd5vez7sz6', 'DINE_IN', 'FINISHED', 79, '2026-03-31 15:14:11.089', '2026-03-31 15:26:49.953', '', '', '', '', '', '', 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MESA 1', 0, NULL, 'cmnepejur0003hijdj4tnoyqs'),
('cmnerddgd002ahijdnzp2bjtj', 'DINE_IN', 'FINISHED', 19, '2026-03-31 15:15:03.902', '2026-03-31 15:32:08.382', '', '', '', '', '', '', 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FLAVIA', 0, NULL, 'cmnepejur0003hijdj4tnoyqs'),
('cmneres2n002hhijd27sp783g', 'DINE_IN', 'FINISHED', 34.95, '2026-03-31 15:16:09.503', '2026-03-31 16:00:40.869', '', '', '', '', '', '', 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'DRA. SIMONE', 0, NULL, 'cmnepejur0003hijdj4tnoyqs'),
('cmneriqay002thijdez40yd1g', 'DINE_IN', 'FINISHED', 30, '2026-03-31 15:19:13.835', '2026-03-31 15:47:48.669', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MOÇO', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmnertc1q0035hijd0qa62tqr', 'DINE_IN', 'FINISHED', 42.48999999999999, '2026-03-31 15:27:28.574', '2026-03-31 15:47:38.580', '', '', '', '', '', '', 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JAQUELINE', 0, NULL, 'cmnepejur0003hijdj4tnoyqs'),
('cmnervx59003ahijdhsnef0bl', 'TAKE_AWAY', 'FINISHED', 54, '2026-03-31 15:29:29.230', '2026-03-31 15:38:20.004', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'PALMEIRAS', 0, NULL, 'cmnepejur0003hijdj4tnoyqs'),
('cmnesmemj004ghijd30x9h09z', 'DINE_IN', 'FINISHED', 50, '2026-03-31 15:50:04.939', '2026-03-31 16:01:18.249', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SR. DA MAQUINA', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmnespy4r004lhijdyyfh6d74', 'DINE_IN', 'FINISHED', 54.12, '2026-03-31 15:52:50.187', '2026-03-31 16:10:02.189', '', '', '', '', '', '', 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'CASAL SENHORES', 0, NULL, 'cmnepejur0003hijdj4tnoyqs'),
('cmng4fgq80001efj7g1rkxkoh', 'TAKE_AWAY', 'FINISHED', 138, '2026-04-01 14:08:22.639', '2026-04-01 14:17:15.171', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JUNÇÃO', 0, NULL, 'cmnepejur0003hijdj4tnoyqs'),
('cmng4lwzy000defj7t0qnbe2y', 'TAKE_AWAY', 'FINISHED', 29, '2026-04-01 14:13:23.663', '2026-04-01 14:17:11.837', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHOR', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng4nsbq000hefj7lvd414vg', 'TAKE_AWAY', 'FINISHED', 34, '2026-04-01 14:14:50.918', '2026-04-01 14:17:08.337', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MOÇO', 0, NULL, 'cmnepejur0003hijdj4tnoyqs'),
('cmng51nz8000uefj7vrnzsxwz', 'DINE_IN', 'FINISHED', 21, '2026-04-01 14:25:38.468', '2026-04-01 14:25:42.421', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHOR', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng5279d0010efj7gc171z2r', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-01 14:26:03.458', '2026-04-01 14:26:55.958', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MOÇA', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng5425i0016efj71od20dm9', 'DELIVERY', 'FINISHED', 21, '2026-04-01 14:27:30.150', '2026-04-02 13:38:08.669', 'RUA PAULO VIERA', '810', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'PAMELA', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng55mdq001aefj72wsxk6ro', 'DELIVERY', 'FINISHED', 29, '2026-04-01 14:28:43.022', '2026-04-01 14:36:17.408', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmnepnhbn000ehijduwcthqrz', 'ELIANA', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng56hp7001eefj7lukm69nw', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-01 14:29:23.611', '2026-04-01 14:36:00.155', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHOR', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng5eh77001iefj7opqiul6c', 'DELIVERY', 'FINISHED', 42, '2026-04-01 14:35:36.211', '2026-04-01 14:43:49.768', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmn6499d2006og2zql9sr8y8s', 'EMILENE', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng5jji2001xefj7cpqk5ffo', 'DELIVERY', 'FINISHED', 25, '2026-04-01 14:39:32.475', '2026-04-02 13:38:15.802', '-', '-', '-', '', '-', 'SEM BACON\nSEM PRESUNTO', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LUANA LIMA', 0, NULL, 'cmnepejur0003hijdj4tnoyqs'),
('cmng5v2n9002aefj7addf5n75', 'DELIVERY', 'FINISHED', 21, '2026-04-01 14:48:30.502', '2026-04-01 14:58:11.552', '-', '-', '-', '', '-', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LOJA REDE TEM TOBIAS', 0, NULL, 'cmnepejur0003hijdj4tnoyqs'),
('cmng60cxa002iefj7kwlrg7lg', 'DELIVERY', 'NEW', 25, '2026-04-01 14:52:37.102', '2026-04-01 14:52:37.102', 'BAR DO TONI', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MARCELO', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng6b8y2002oefj7ere3b8gg', 'DELIVERY', 'NEW', 29, '2026-04-01 15:01:05.162', '2026-04-01 15:01:05.162', 'RUA VALDOMIRO CAMARIM', '1356', 'PASSETI', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JULIA', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng6ehta002sefj73yx22vm3', 'TAKE_AWAY', 'NEW', 21, '2026-04-01 15:03:36.622', '2026-04-01 15:03:36.622', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ELISANGELA', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng6w88f002wefj7y4msoh0n', 'DELIVERY', 'FINISHED', 25, '2026-04-01 15:17:24.015', '2026-04-02 13:38:34.704', 'RUA JOÃO ALEXANDRE DOS SANTOS', '51', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'CARLA', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng705o20030efj7fn2qnw3l', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-01 15:20:27.314', '2026-04-02 13:38:28.454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ALEX', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng728ul0034efj7ak6hi1lc', 'TAKE_AWAY', 'FINISHED', 21, '2026-04-01 15:22:04.750', '2026-04-02 13:38:23.625', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ANTONIO', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng776oh0038efj7g5ouslro', 'DELIVERY', 'FINISHED', 25, '2026-04-01 15:25:55.217', '2026-04-02 13:38:40.760', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MAGAL', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng79653003defj7s3zdx30l', 'TAKE_AWAY', 'FINISHED', 29, '2026-04-01 15:27:27.831', '2026-04-02 13:38:43.237', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MOÇO', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng7cfg6003hefj7umpgi70r', 'TAKE_AWAY', 'FINISHED', 33, '2026-04-01 15:29:59.862', '2026-04-01 16:07:36.540', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmn6499d2006og2zql9sr8y8s', 'FABIO TOBIAS', 0, NULL, 'cmnepejur0003hijdj4tnoyqs'),
('cmng7f2p4003lefj7xnjcckgt', 'TAKE_AWAY', 'FINISHED', 42, '2026-04-01 15:32:03.304', '2026-04-02 13:38:56.350', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MARCIO', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng7ggrc003qefj76k3rtut3', 'TAKE_AWAY', 'FINISHED', 46, '2026-04-01 15:33:08.185', '2026-04-02 13:38:49.527', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JOICE', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng7l8b1003vefj717vgepo9', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-01 15:36:50.509', '2026-04-01 15:55:20.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'PEDRO', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng7osc2003zefj7g5elhlbl', 'DINE_IN', 'FINISHED', 89.07000000000002, '2026-04-01 15:39:36.434', '2026-04-01 15:59:20.671', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'PESSOAS', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmng8hmp9004fefj7psdjb4wq', 'DELIVERY', 'FINISHED', 62, '2026-04-01 16:02:02.157', '2026-04-01 16:07:24.898', '-', '-', '-', '', '-', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmn4phep8001wg2zqfcad2fd2', 'PAOLA', 0, NULL, 'cmnepejur0003hijdj4tnoyqs'),
('cmng8psk00053efj7g3tizsrf', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-01 16:08:22.993', '2026-04-02 13:39:00.494', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHORA', 0, 'URBAN', 'cmnepejur0003hijdj4tnoyqs'),
('cmnhjcx5m000ftr3b3icw5c6l', 'DELIVERY', 'FINISHED', 50, '2026-04-02 13:54:04.379', '2026-04-02 14:06:17.116', 'RUA MARINO MENANDRO', '1043', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ROBERTA', 0, 'URBAN', 'cmnhj1ez00003tr3bjyber9ao'),
('cmnhjmxi5000ktr3bmy253onp', 'TAKE_AWAY', 'FINISHED', 21, '2026-04-02 14:01:51.389', '2026-04-02 14:06:14.906', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MOÇO DE AZUL', 0, 'URBAN', 'cmnhj1ez00003tr3bjyber9ao'),
('cmnhjv80g000str3bnmh3cxze', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-02 14:08:18.256', '2026-04-02 14:11:45.068', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MOÇO CORINTHIANS', 0, 'URBAN', 'cmnhj1ez00003tr3bjyber9ao'),
('cmnhk1ge0000ytr3bqycouk3d', 'DELIVERY', 'FINISHED', 25, '2026-04-02 14:13:09.049', '2026-04-02 14:31:19.622', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FERNANDA BONFIM', 0, 'URBAN', 'cmnhj1ez00003tr3bjyber9ao'),
('cmnhkdihb0012tr3by8eixf19', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-02 14:22:31.632', '2026-04-02 14:31:15.911', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, '000', 0, 'URBAN', 'cmnhj1ez00003tr3bjyber9ao'),
('cmnhkqku2001atr3bbioccqb4', 'DELIVERY', 'FINISHED', 25, '2026-04-02 14:32:41.211', '2026-04-02 15:15:32.815', 'CHACARA PERTO DA CDHU', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ROSANGELA', 0, 'URBAN', 'cmnhj1ez00003tr3bjyber9ao'),
('cmnhks20h001etr3bmr9ilkq9', 'DELIVERY', 'FINISHED', 58, '2026-04-02 14:33:50.129', '2026-04-02 14:45:35.733', '-', '-', '-', '', '-', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmn4phep8001wg2zqfcad2fd2', 'PAOLA', 0, NULL, 'cmnhj1ez00003tr3bjyber9ao'),
('cmnhm4wxt001ytr3bhftth5hr', 'DELIVERY', 'FINISHED', 21, '2026-04-02 15:11:49.698', '2026-04-02 15:22:17.204', 'RUA LINO DOS SANTOS MOREIRA', '1283', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'KAROLINE', 0, 'URBAN', 'cmnhj1ez00003tr3bjyber9ao'),
('cmnhmac8b0024tr3bwx51o8fd', 'TAKE_AWAY', 'NEW', 25, '2026-04-02 15:16:02.795', '2026-04-02 15:16:02.795', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LORHANA', 0, 'URBAN', 'cmnhj1ez00003tr3bjyber9ao'),
('cmnhmknq7002atr3bhs1xc6p3', 'DELIVERY', 'NEW', 21, '2026-04-02 15:24:04.255', '2026-04-02 15:24:04.255', 'RUA JOÃO ALEXANDRE DOS SANTOS', '51', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'CARLA', 0, 'URBAN', 'cmnhj1ez00003tr3bjyber9ao'),
('cmnhmmlg9002etr3bhn4jky3d', 'DINE_IN', 'FINISHED', 14.78, '2026-04-02 15:25:34.617', '2026-04-02 15:29:07.393', '', '', '', '', '', '', 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHOR', 0, NULL, 'cmnhj1ez00003tr3bjyber9ao'),
('cmnhmoguc002ltr3bujjl5rr2', 'DINE_IN', 'FINISHED', 38.58, '2026-04-02 15:27:01.956', '2026-04-02 15:45:18.604', '', '', '', '', '', '', 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'IZA TOLOY', 0, NULL, 'cmnhj1ez00003tr3bjyber9ao'),
('cmnhmp5mv002qtr3b6gzotezd', 'TAKE_AWAY', 'NEW', 30, '2026-04-02 15:27:34.087', '2026-04-02 15:29:15.460', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'AGRO', 0, NULL, 'cmnhj1ez00003tr3bjyber9ao'),
('cmnhmu4pn0037tr3bvjrpgtsr', 'DINE_IN', 'FINISHED', 29, '2026-04-02 15:31:26.172', '2026-04-02 15:49:07.767', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'VILSON', 0, 'URBAN', 'cmnhj1ez00003tr3bjyber9ao'),
('cmnhn0dm2003ctr3bxx7feo35', 'DELIVERY', 'FINISHED', 21, '2026-04-02 15:36:17.642', '2026-04-02 15:46:52.975', 'AV. RIO BRANCO', '855', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LEANDRO', 0, 'URBAN', 'cmnhj1ez00003tr3bjyber9ao'),
('cmnhnfk87003ktr3b385a82fj', 'DINE_IN', 'NEW', 29, '2026-04-02 15:48:06.055', '2026-04-02 15:54:47.204', '', '', '', '', '', '', 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MOÇA', 0, NULL, 'cmnhj1ez00003tr3bjyber9ao'),
('cmnhop8xf003utr3bh7wsa0s4', 'TAKE_AWAY', 'NEW', 46, '2026-04-02 16:23:37.587', '2026-04-02 16:23:37.587', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, '000', 0, 'URBAN', 'cmnhj1ez00003tr3bjyber9ao'),
('cmnket1p600075c8bheqjmu3r', 'TAKE_AWAY', 'NEW', 42, '2026-04-04 14:09:57.210', '2026-04-04 14:09:57.210', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHORA', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnketfcp000c5c8b51nqh0ge', 'DELIVERY', 'DELIVERED', 25, '2026-04-04 14:10:14.905', '2026-04-04 16:10:00.122', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LEANDRO', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkeuraz000g5c8beofe8qjm', 'TAKE_AWAY', 'FINISHED', 58, '2026-04-04 14:11:17.051', '2026-04-04 16:09:44.053', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ANA CRIS', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkf077y000l5c8bv1920j7r', 'DELIVERY', 'FINISHED', 48.5, '2026-04-04 14:15:30.958', '2026-04-04 16:09:52.710', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'IMPERIO', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkf2i5h000r5c8bpvtzdn32', 'TAKE_AWAY', 'FINISHED', 107, '2026-04-04 14:17:18.437', '2026-04-04 16:09:57.110', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'WILLIAN', 0, NULL, 'cmnkeqyk100035c8b0h421j9d'),
('cmnkf8pij00165c8bkrixznoa', 'DELIVERY', 'FINISHED', 26, '2026-04-04 14:22:07.916', '2026-04-04 14:22:19.278', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ELAINE', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkfe3aj001d5c8bi3nfzgqn', 'DELIVERY', 'FINISHED', 35, '2026-04-04 14:26:19.052', '2026-04-04 16:09:38.220', 'AV DOM PEDRO II', '1355', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'GRASIELA', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkfg8lu001i5c8b9dv6jebv', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-04 14:27:59.251', '2026-04-04 16:09:33.587', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ALEMÃO', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkfiewy001m5c8bwuztkkph', 'TAKE_AWAY', 'FINISHED', 29, '2026-04-04 14:29:40.738', '2026-04-04 16:09:24.053', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MÃE DO GABRIEL', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkfo3q8001q5c8bspkb4gxh', 'DINE_IN', 'FINISHED', 225, '2026-04-04 14:34:06.176', '2026-04-04 16:01:23.558', '', '', '', '', '', '', 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LUCIANA BERCE', 0, NULL, 'cmnkeqyk100035c8b0h421j9d'),
('cmnkfvc35001z5c8bx9kg6d3t', 'TAKE_AWAY', 'FINISHED', 42, '2026-04-04 14:39:43.602', '2026-04-04 16:00:52.723', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'DENIL', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkgrtgb00285c8b6cnwg5hj', 'DELIVERY', 'FINISHED', 46, '2026-04-04 15:04:59.099', '2026-04-04 16:00:48.256', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'DANTHIELLE', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkgwcuc002d5c8bvxdrmxyo', 'TAKE_AWAY', 'FINISHED', 42, '2026-04-04 15:08:30.852', '2026-04-04 16:09:17.618', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, '00', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkgwtyt002i5c8bq63jivan', 'TAKE_AWAY', 'FINISHED', 21, '2026-04-04 15:08:53.045', '2026-04-04 16:09:11.440', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SR. VIDRO', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkh4b63002m5c8bcqo4bd11', 'DELIVERY', 'FINISHED', 29, '2026-04-04 15:14:41.932', '2026-04-04 16:09:03.985', 'AO LADO DO ESCRITORIO DO KIM', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JULIANA', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkh9xtg002q5c8bwp0g2pai', 'TAKE_AWAY', 'FINISHED', 42, '2026-04-04 15:19:04.565', '2026-04-04 16:00:43.700', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MI ', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkhc8vi002v5c8by36pgd9b', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-04 15:20:52.206', '2026-04-04 16:00:37.391', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ZACARIAS', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkhqsvb002z5c8b2d2objft', 'TAKE_AWAY', 'FINISHED', 46, '2026-04-04 15:32:11.304', '2026-04-04 16:00:28.743', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'OLIVIA', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkhu5rl00345c8bdveiq0li', 'DELIVERY', 'FINISHED', 21, '2026-04-04 15:34:47.986', '2026-04-04 16:00:22.065', 'MARINO MENANDRO ', '1083', '000', '000', '0000', '000', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'DAIANE', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnki24gk00385c8bxp3clay9', 'DELIVERY', 'FINISHED', 25, '2026-04-04 15:40:59.540', '2026-04-04 16:00:18.043', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'TULIO', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkilloj003r5c8bnz2izcxf', 'TAKE_AWAY', 'FINISHED', 63, '2026-04-04 15:56:08.323', '2026-04-04 15:59:53.175', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHOR ', 0, NULL, 'cmnkeqyk100035c8b0h421j9d'),
('cmnkivvq5004o5c8bjvrg6dut', 'DINE_IN', 'FINISHED', 60, '2026-04-04 16:04:07.902', '2026-04-04 16:04:12.524', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'CASAL', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkiyxmz004v5c8bz9grcayn', 'DELIVERY', 'FINISHED', 25, '2026-04-04 16:06:30.348', '2026-04-04 16:54:56.353', 'BAR DO TONI', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MARCELO', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkkoc3j00086ptymmz68hrk', 'TAKE_AWAY', 'FINISHED', 46, '2026-04-04 16:54:15.103', '2026-04-04 16:54:49.730', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, '00', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnkkoyz7000d6ptyfnf33nov', 'DINE_IN', 'FINISHED', 47.46, '2026-04-04 16:54:44.756', '2026-04-04 17:37:35.495', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'CASAL', 0, 'URBAN', 'cmnkeqyk100035c8b0h421j9d'),
('cmnnb2nb100079rpadjm7uf5f', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-06 14:48:45.182', '2026-04-06 14:55:09.067', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MOÇA DO POSTO', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnnb65mw000b9rpao0rrv809', 'DELIVERY', 'FINISHED', 50, '2026-04-06 14:51:28.904', '2026-04-06 14:51:48.922', '-', '-', '-', NULL, '--', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmnnaytzp00059rpafcl8e9nt', 'THIAGO TOBIAS', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnnb9mwv000l9rpacc2cp8fv', 'DELIVERY', 'FINISHED', 21, '2026-04-06 14:54:11.263', '2026-04-06 14:54:26.687', 'LOTERICA', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'DANIELA', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnnbbyrd000t9rpaz35zs98y', 'DELIVERY', 'FINISHED', 21, '2026-04-06 14:55:59.930', '2026-04-06 14:56:04.949', '-', '----', '-', NULL, '--', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ALESSANDRA', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnnbd8zo000z9rpadufm23hm', 'DELIVERY', 'FINISHED', 25, '2026-04-06 14:56:59.845', '2026-04-06 14:57:06.329', 'SAMU', '0', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'CARLA SAMU', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnnc42lf00159rpaq8x5w3by', 'DELIVERY', 'FINISHED', 42, '2026-04-06 15:17:51.268', '2026-04-06 15:19:49.128', '0', '0', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'RAFAEL', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnnc6bwa001a9rpaea14ih8z', 'DELIVERY', 'FINISHED', 29, '2026-04-06 15:19:36.635', '2026-04-06 15:19:43.650', '0', '0', '0', NULL, '00', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'AMIGO MAGAL', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnnc7pt7001i9rpa0b3eo26r', 'DELIVERY', 'FINISHED', 50, '2026-04-06 15:20:41.323', '2026-04-06 15:20:45.831', '0', '0', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ANDREIA ROSSETO', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnnc90rp001p9rpa9dmyj0gt', 'DELIVERY', 'FINISHED', 25, '2026-04-06 15:21:42.181', '2026-04-06 15:21:47.302', '0', '0', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'VILELA', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnncfbkn001v9rpackvsanmb', 'DELIVERY', 'FINISHED', 21, '2026-04-06 15:26:36.120', '2026-04-06 15:44:22.257', '0', '0', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ELANIA', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnncjgzl001z9rpa2fb2ivol', 'DELIVERY', 'FINISHED', 21, '2026-04-06 15:29:49.762', '2026-04-06 15:29:54.629', '0', '0', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LUCELENA', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnnckide00259rpabdd91d9h', 'DELIVERY', 'FINISHED', 29, '2026-04-06 15:30:38.210', '2026-04-06 15:44:13.645', '0', '0', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FERNANDA-', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnncne6c00299rpa6o57kpw9', 'TAKE_AWAY', 'FINISHED', 50, '2026-04-06 15:32:52.740', '2026-04-06 15:33:07.685', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ALEXIA', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnncpspk002g9rpamwe43sqb', 'TAKE_AWAY', 'FINISHED', 83, '2026-04-06 15:34:44.888', '2026-04-06 15:34:57.713', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JUNÇÃO', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnncuufu002o9rparbl3ivfd', 'DELIVERY', 'NEW', 21, '2026-04-06 15:38:40.411', '2026-04-06 15:38:40.411', '0', '0', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MONA0', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnncvw3a002s9rpaydos0wl2', 'DINE_IN', 'FINISHED', 29, '2026-04-06 15:39:29.207', '2026-04-06 15:39:52.896', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'EMACHINE', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnnd0fjd00309rpayccqiq8i', 'DINE_IN', 'FINISHED', 88, '2026-04-06 15:43:01.033', '2026-04-06 15:44:49.980', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'RAPAZ', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnnd37n7003b9rpad1wrriy1', 'TAKE_AWAY', 'FINISHED', 8, '2026-04-06 15:45:10.771', '2026-04-06 15:45:15.615', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'POSTO', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnnd4iqi003h9rpamrzkm5vy', 'DINE_IN', 'FINISHED', 24.05, '2026-04-06 15:46:11.803', '2026-04-06 16:02:20.729', '', '', '', '', '', '', 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'DRA SIMONE', 0, NULL, 'cmnnagd4500019rpa4kzbcaxx'),
('cmnnd6gw2003p9rpaltzi13pu', 'DINE_IN', 'FINISHED', 30.95, '2026-04-06 15:47:42.722', '2026-04-06 15:48:05.202', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JAQUELINE', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnnd87mh003x9rpacobgcheb', 'DINE_IN', 'FINISHED', 31.96, '2026-04-06 15:49:04.025', '2026-04-06 15:50:59.479', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'TIAGO', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnndhion00449rpah0h3o4vp', 'TAKE_AWAY', 'FINISHED', 21, '2026-04-06 15:56:18.264', '2026-04-06 15:57:11.167', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'RITA', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnndiadf00489rpallqmmlsb', 'DINE_IN', 'FINISHED', 58, '2026-04-06 15:56:54.147', '2026-04-06 15:57:02.655', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ELETR', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnndu8m8004j9rpay2zj7n48', 'DINE_IN', 'FINISHED', 20.69, '2026-04-06 16:06:11.744', '2026-04-06 16:14:25.526', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MAURO', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnne9586004q9rpajxxcyt02', 'DELIVERY', 'NEW', 21, '2026-04-06 16:17:47.190', '2026-04-06 16:17:47.190', 'RUA CASTRO ALVES ', '784', '0000', 'LOJA DA VALERIA ', '018', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LILIAN', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnnelb56004u9rpam4t5e74w', 'TAKE_AWAY', 'NEW', 21, '2026-04-06 16:27:14.731', '2026-04-06 16:27:14.731', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'EDILAINE', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnnelb8f004y9rpa1hav2wsv', 'TAKE_AWAY', 'FINISHED', 21, '2026-04-06 16:27:14.848', '2026-04-06 16:27:23.337', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'EDILAINE', 0, 'URBAN', 'cmnnagd4500019rpa4kzbcaxx'),
('cmnoowzsr005a9rpafqk1vc6k', 'TAKE_AWAY', 'FINISHED', 29, '2026-04-07 14:04:02.235', '2026-04-07 14:10:55.239', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHORA', 0, 'URBAN', 'cmnoo88rh00569rpa4jaxdwnr'),
('cmnooxgad005e9rpas5ng2v73', 'TAKE_AWAY', 'FINISHED', 21, '2026-04-07 14:04:23.605', '2026-04-07 14:10:51.449', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHOR', 0, NULL, 'cmnoo88rh00569rpa4jaxdwnr'),
('cmnop6qje005o9rpanxesvvnm', 'DELIVERY', 'FINISHED', 50, '2026-04-07 14:11:36.795', '2026-04-07 14:11:46.098', '0', '0', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmnnaytzp00059rpafcl8e9nt', 'BARRACÃO TB', 0, 'URBAN', 'cmnoo88rh00569rpa4jaxdwnr'),
('cmnopliry005y9rpa4748c5ct', 'DELIVERY', 'FINISHED', 21, '2026-04-07 14:23:06.574', '2026-04-07 14:23:12.302', 'BECO', '0', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LARISSA', 0, 'URBAN', 'cmnoo88rh00569rpa4jaxdwnr'),
('cmnopsbiv00649rpa7sqtlfir', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-07 14:28:23.768', '2026-04-07 14:28:29.131', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MOTOQUEIRO', 0, 'URBAN', 'cmnoo88rh00569rpa4jaxdwnr'),
('cmnopz33a006a9rpa9qrgqpw6', 'DELIVERY', 'NEW', 25, '2026-04-07 14:33:39.431', '2026-04-07 14:33:39.431', '0', '0', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JK', 0, 'URBAN', 'cmnoo88rh00569rpa4jaxdwnr'),
('cmnoq6pw2006e9rpaiy12akzv', 'TAKE_AWAY', 'NEW', 25, '2026-04-07 14:39:35.570', '2026-04-07 14:39:35.570', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FLAMENGO', 0, 'URBAN', 'cmnoo88rh00569rpa4jaxdwnr'),
('cmnoqb2yj006i9rparkzhv561', 'TAKE_AWAY', 'NEW', 21, '2026-04-07 14:42:59.131', '2026-04-07 14:42:59.131', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FERNANDA BONFIM', 0, 'URBAN', 'cmnoo88rh00569rpa4jaxdwnr'),
('cmnoqradi006m9rpaql0a64e2', 'DELIVERY', 'NEW', 29, '2026-04-07 14:55:35.238', '2026-04-07 15:04:49.843', '0', '0', '0', '', '0', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MADRINHA ', 0, NULL, 'cmnoo88rh00569rpa4jaxdwnr'),
('cmnor2mjw006q9rpa8fw6uaj6', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-07 15:04:24.237', '2026-04-07 15:05:57.857', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'PICAP', 0, 'URBAN', 'cmnoo88rh00569rpa4jaxdwnr'),
('cmnor5zam00729rpaxpkiyapq', 'TAKE_AWAY', 'NEW', 35, '2026-04-07 15:07:00.719', '2026-04-07 15:07:54.401', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ESTRADEIRO', 0, NULL, 'cmnoo88rh00569rpa4jaxdwnr'),
('cmnor8khl00789rpaww2qsjzf', 'TAKE_AWAY', 'NEW', 42, '2026-04-07 15:09:01.497', '2026-04-07 15:09:01.497', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MAGAL', 0, 'URBAN', 'cmnoo88rh00569rpa4jaxdwnr'),
('cmnora6rr007d9rpadfjk0wr1', 'TAKE_AWAY', 'NEW', 25, '2026-04-07 15:10:17.031', '2026-04-07 15:10:17.031', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'OTAIDE', 0, 'URBAN', 'cmnoo88rh00569rpa4jaxdwnr'),
('cmnorn4ro007h9rpaf88u6i15', 'DELIVERY', 'NEW', 21, '2026-04-07 15:20:20.964', '2026-04-07 15:20:20.964', '0', '0', '0', '0', '0', '0', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'GABI EVARISTO', 0, 'URBAN', 'cmnoo88rh00569rpa4jaxdwnr'),
('cmnorpo48007l9rpasouu0yeq', 'DELIVERY', 'NEW', 63, '2026-04-07 15:22:19.352', '2026-04-07 15:22:19.352', '0', '0', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'EMILENE', 0, 'URBAN', 'cmnoo88rh00569rpa4jaxdwnr'),
('cmnorr1ru007r9rpamndg9qb7', 'TAKE_AWAY', 'NEW', 25, '2026-04-07 15:23:23.706', '2026-04-07 15:23:23.706', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'PISO', 0, 'URBAN', 'cmnoo88rh00569rpa4jaxdwnr'),
('cmnorz1oe007v9rpapkzx3wbq', 'TAKE_AWAY', 'NEW', 25, '2026-04-07 15:29:36.830', '2026-04-07 15:29:36.830', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ZOI CLARO', 0, 'URBAN', 'cmnoo88rh00569rpa4jaxdwnr'),
('cmnos63gm007z9rpagangx9dh', 'TAKE_AWAY', 'NEW', 21, '2026-04-07 15:35:05.735', '2026-04-07 15:35:05.735', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MOÇA', 0, 'URBAN', 'cmnoo88rh00569rpa4jaxdwnr'),
('cmnq3dsdm0007xtolqs1mc06g', 'TAKE_AWAY', 'FINISHED', 21, '2026-04-08 13:36:46.571', '2026-04-08 14:15:01.438', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'WEELL', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq3fskr000bxtolwakpd9jo', 'TAKE_AWAY', 'FINISHED', 21, '2026-04-08 13:38:20.139', '2026-04-08 14:14:51.959', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'CRIS', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq3ihz3000fxtolva7iqog6', 'DELIVERY', 'FINISHED', 21, '2026-04-08 13:40:26.367', '2026-04-08 14:14:48.670', 'LOTERICA', '000', '000', NULL, '0000', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'DANIELA ', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq4ncrm000jxtol2rn7t2ib', 'DELIVERY', 'FINISHED', 25, '2026-04-08 14:12:12.515', '2026-04-08 14:23:42.878', ' rua Luiz Cividanes Martinez 619', '619', '000 ', 'FRETE AO PINHEZINHO', '000', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, '000', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq4wvp8000txtolsqn99py1', 'DELIVERY', 'FINISHED', 129, '2026-04-08 14:19:36.956', '2026-04-08 15:55:16.018', '000', '000', '0000', '0000', '000', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ALEMAO', 1, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq51oil0014xtoly226wir0', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-08 14:23:20.925', '2026-04-08 14:23:26.465', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SR', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq5ifh3001cxtolmk7b0fgy', 'DELIVERY', 'FINISHED', 25, '2026-04-08 14:36:22.359', '2026-04-08 15:45:04.179', '0', '00', '0', NULL, '00', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmnnaytzp00059rpafcl8e9nt', 'THIAGO TOBIAS', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq5ju9f001gxtolazfig3v9', 'DELIVERY', 'FINISHED', 25, '2026-04-08 14:37:28.180', '2026-04-08 15:45:25.129', 'BORRACHARIA', '0', '0', '', '0', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FELIPE LIMA', 0, NULL, 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq5qyxo001mxtolenlosw6q', 'DELIVERY', 'FINISHED', 25, '2026-04-08 14:43:00.828', '2026-04-08 15:45:38.563', 'RUA JOÃO ALEXANDRE DOS SANTOS', '51', '-', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'CARLA', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq5xdfb001qxtolbapdkjbj', 'DELIVERY', 'FINISHED', 21, '2026-04-08 14:47:59.543', '2026-04-08 15:45:41.296', 'RUA POMPILIO FERNANDES PEREIRA', '752', '-', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'GABI', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq61ma4001uxtolw4dxgbjg', 'TAKE_AWAY', 'FINISHED', 21, '2026-04-08 14:51:17.645', '2026-04-08 15:45:44.774', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHOR BAIXINHO', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq62wc3001yxtolabugp23s', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-08 14:52:17.332', '2026-04-08 15:45:49.275', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'RAPAZ DO PISO', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq68em40022xtolccpxjcqd', 'TAKE_AWAY', 'FINISHED', 21, '2026-04-08 14:56:34.301', '2026-04-08 15:45:51.464', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JOSÉ ROBERTO', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq70oxh0026xtolkbaj6kps', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-08 15:18:34.037', '2026-04-08 15:45:54.642', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MAGAL', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq73s5p002axtol6tymgooc', 'TAKE_AWAY', 'READY', 54, '2026-04-08 15:20:58.190', '2026-04-08 15:46:06.795', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ESTEVÃO', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq7pkar002rxtolk2t6u24i', 'TAKE_AWAY', 'FINISHED', 59.22, '2026-04-08 15:37:54.435', '2026-04-08 15:38:09.374', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmn62zqqk005jg2zqnglqrce9', 'MENINOS JOSE MARIA', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq7x1my0035xtol37i5pvrw', 'DELIVERY', 'FINISHED', 25, '2026-04-08 15:43:43.498', '2026-04-08 15:45:58.319', 'BARACAO', '000', '000', NULL, '000', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FERNANDA', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq83xod0001q8w6iwhwwca9', 'TAKE_AWAY', 'FINISHED', 263, '2026-04-08 15:49:04.957', '2026-04-08 15:51:22.457', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'TOKSON', 0, NULL, 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq8em5q000sq8w6p9bthx8u', 'DELIVERY', 'FINISHED', 25, '2026-04-08 15:57:23.247', '2026-04-08 15:59:37.410', 'BAR DO TONI', '0', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MARCELO', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq8jmje000yq8w65xhl27nl', 'TAKE_AWAY', 'NEW', 58.07, '2026-04-08 16:01:17.018', '2026-04-08 16:01:17.018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JUNÇÃO', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq8k6tj0016q8w6zam9izud', 'DELIVERY', 'FINISHED', 25, '2026-04-08 16:01:43.303', '2026-04-08 16:01:47.573', '0', '0', '0', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'EDILAINE', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnq9aihx001cq8w62nvglyj2', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-08 16:22:11.493', '2026-04-08 16:22:23.220', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SR', 0, 'URBAN', 'cmnq36zwi0003xtolj7ihrrsy'),
('cmnrix0f0001oq8w6qskwfrc7', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-09 13:39:23.868', '2026-04-09 13:59:41.167', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FLA', 0, 'URBAN', 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnrj1m7p001sq8w6kq8z2nak', 'DELIVERY', 'FINISHED', 76, '2026-04-09 13:42:58.741', '2026-04-09 14:09:19.012', 'BARACAO ', '000', '000', '', '000', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmnnaytzp00059rpafcl8e9nt', 'THIAGO TOBIAS', 1, 'URBAN', 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnrjo8530028q8w6smqm4vqs', 'TAKE_AWAY', 'FINISHED', 75, '2026-04-09 14:00:33.592', '2026-04-09 15:15:59.069', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SITIO ', 0, NULL, 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnrjr95d002fq8w6nceod92k', 'TAKE_AWAY', 'FINISHED', 50, '2026-04-09 14:02:54.865', '2026-04-09 14:17:34.816', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'CARLOS MIGUEL', 0, 'URBAN', 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnrjtk8x002kq8w63f1xeyia', 'TAKE_AWAY', 'FINISHED', 29, '2026-04-09 14:04:42.561', '2026-04-09 14:17:30.671', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JORGE', 0, 'URBAN', 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnrk4drp002tq8w6dxuvwr8y', 'TAKE_AWAY', 'FINISHED', 21, '2026-04-09 14:13:07.381', '2026-04-09 14:16:37.138', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHOR', 0, 'URBAN', 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnrknx4e0033q8w6fnz8kb2a', 'TAKE_AWAY', 'FINISHED', 21, '2026-04-09 14:28:18.926', '2026-04-09 15:15:25.256', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'RUTH', 0, 'URBAN', 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnrlchky0037q8w6h0n75ox4', 'TAKE_AWAY', 'FINISHED', 50, '2026-04-09 14:47:25.187', '2026-04-09 14:53:37.159', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JACI', 0, NULL, 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnrljmdn003bq8w6hrbatxr7', 'TAKE_AWAY', 'FINISHED', 21, '2026-04-09 14:52:57.996', '2026-04-09 14:53:04.957', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ENZO', 0, 'URBAN', 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnrllh0l003mq8w6v7ldx7jx', 'DELIVERY', 'FINISHED', 25, '2026-04-09 14:54:24.358', '2026-04-09 15:15:18.555', '0000', '000', '000', NULL, '000', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MACUMBA', 0, 'URBAN', 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnrlo9yk003qq8w6ow3uq71s', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-09 14:56:35.180', '2026-04-09 15:14:58.621', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ALEXIA', 0, 'URBAN', 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnrmaq1x003uq8w6u33iwbbd', 'TAKE_AWAY', 'FINISHED', 60, '2026-04-09 15:14:02.470', '2026-04-09 15:14:28.419', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'OQUEI', 0, 'URBAN', 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnrmbsl20042q8w6ketgxp6d', 'TAKE_AWAY', 'READY', 30, '2026-04-09 15:14:52.406', '2026-04-09 15:43:19.448', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'RAPAZ DE AZUL', 0, 'URBAN', 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnrme8f1004fq8w6g8cam97b', 'TAKE_AWAY', 'FINISHED', 186, '2026-04-09 15:16:46.237', '2026-04-09 15:45:40.726', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'TOKSOM', 0, NULL, 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnrmljud004kq8w6y8l45pn1', 'TAKE_AWAY', 'FINISHED', 28, '2026-04-09 15:22:27.638', '2026-04-09 15:33:59.818', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'E-MACHINE', 0, 'URBAN', 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnrmx8a0004pq8w6l1xdyi1x', 'TAKE_AWAY', 'FINISHED', 16.51, '2026-04-09 15:31:32.520', '2026-04-09 15:39:34.660', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MOÇA ', 0, NULL, 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnrn1g5v0055q8w6i93skdwb', 'TAKE_AWAY', 'FINISHED', 33, '2026-04-09 15:34:49.363', '2026-04-09 16:13:29.109', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MOÇA E SR', 0, NULL, 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnrn66wj005iq8w6b4sv1a7i', 'TAKE_AWAY', 'FINISHED', 33, '2026-04-09 15:38:30.643', '2026-04-09 15:44:47.522', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'CASAL DE SR', 0, 'URBAN', 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnroe3m4006dq8w68ty0swsq', 'TAKE_AWAY', 'FINISHED', 32.5, '2026-04-09 16:12:39.244', '2026-04-09 16:13:15.687', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'CASIO', 0, NULL, 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnrp0eay006nq8w6cs5pew1e', 'DELIVERY', 'DELIVERED', 25, '2026-04-09 16:29:59.530', '2026-04-10 13:55:02.602', 'JOSE ANTONIO EUZEBIO ', '81', '0', NULL, '000', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'JADY', 0, 'URBAN', 'cmnrirx8q001kq8w6f9bqiu9e'),
('cmnt2a2rh0075q8w66bit6442', 'TAKE_AWAY', 'FINISHED', 15, '2026-04-10 15:29:12.317', '2026-04-10 15:32:25.796', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHORA', 0, 'URBAN', 'cmnsz0yfu006tq8w6e93bfdkj');
INSERT INTO `order` (`id`, `type`, `status`, `total`, `createdAt`, `updatedAt`, `deliveryStreet`, `deliveryNumber`, `deliveryNeighborhood`, `deliveryReference`, `deliveryPhone`, `deliveryNotes`, `tableId`, `userId`, `waiterId`, `customerId`, `customerName`, `deliveryFee`, `deliveryType`, `cashRegisterSessionId`) VALUES
('cmnt2gjay007bq8w63u43z4m4', 'TAKE_AWAY', 'NEW', 38.34, '2026-04-10 15:34:13.691', '2026-04-10 15:34:13.691', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'THAYANE', 0, 'URBAN', 'cmnsz0yfu006tq8w6e93bfdkj'),
('cmnt2h4dk007hq8w60bwx5lmc', 'TAKE_AWAY', 'FINISHED', 26, '2026-04-10 15:34:41.000', '2026-04-10 15:34:57.858', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'DR IGOR', 0, NULL, 'cmnsz0yfu006tq8w6e93bfdkj'),
('cmnt2i0hi007qq8w6qx5gtez3', 'TAKE_AWAY', 'FINISHED', 58, '2026-04-10 15:35:22.614', '2026-04-10 15:35:29.329', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'CASAL', 0, 'URBAN', 'cmnsz0yfu006tq8w6e93bfdkj'),
('cmnt32377007xq8w6ott0bd3n', 'TAKE_AWAY', 'FINISHED', 58, '2026-04-10 15:50:59.252', '2026-04-10 15:51:16.708', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmnepnhbn000ehijduwcthqrz', 'OTONI', 0, 'URBAN', 'cmnsz0yfu006tq8w6e93bfdkj'),
('cmnt33p270087q8w63cuaaoj3', 'TAKE_AWAY', 'FINISHED', 94, '2026-04-10 15:52:14.240', '2026-04-10 15:54:22.963', '', '', '', '', '', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmn6499d2006og2zql9sr8y8s', 'FABIM', 0, NULL, 'cmnsz0yfu006tq8w6e93bfdkj'),
('cmnuf40860008ba6vr8myneeb', 'DELIVERY', 'FINISHED', 84, '2026-04-11 14:16:10.278', '2026-04-11 16:10:00.488', 'RUI BARBOSA', '1087', '-', '', '-', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FABIANO', 0, NULL, 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnuf6dme000fba6v8so88sqg', 'DELIVERY', 'FINISHED', 25, '2026-04-11 14:18:00.950', '2026-04-11 14:18:04.250', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'BEATRIZ CAMARIM', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnuf6xq0000lba6vlq4sj9kr', 'DELIVERY', 'FINISHED', 75, '2026-04-11 14:18:27.001', '2026-04-11 14:19:14.285', '0', '0', '0', '', '0', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmnnaytzp00059rpafcl8e9nt', 'THIAGO TOBIAS', 0, NULL, 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnuf7n83000sba6vdbvk3xuv', 'TAKE_AWAY', 'FINISHED', 21, '2026-04-11 14:19:00.051', '2026-04-11 14:19:04.765', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SR DO VIDRO', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnuffnyi0013ba6v3wv06m9r', 'DELIVERY', 'FINISHED', 58, '2026-04-11 14:25:14.250', '2026-04-11 16:09:52.511', 'RUA ARTUR CAETANO DOURADO', '763', '0', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ANA CRISTINA', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnufhrnj0018ba6vmnf9ij7j', 'DELIVERY', 'FINISHED', 21, '2026-04-11 14:26:52.352', '2026-04-11 14:38:32.372', 'RUA ÂNGELO DE SOUZA ', '571', '-', NULL, '0', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MICHELE', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnufj7xl001cba6vyobc1ttr', 'DELIVERY', 'FINISHED', 75, '2026-04-11 14:28:00.105', '2026-04-11 14:28:21.128', 'SITIO', '-', '-', '', '-', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ALEMÃO', 0, NULL, 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnuft2ni001lba6vfa3qsokx', 'TAKE_AWAY', 'FINISHED', 21, '2026-04-11 14:35:39.823', '2026-04-11 14:40:30.490', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'SENHOR', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnug0bg7001tba6v51cvbfnt', 'DELIVERY', 'FINISHED', 25, '2026-04-11 14:41:17.815', '2026-04-11 15:48:51.873', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ANDERSON', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnugasgf001xba6vy7tneybz', 'DELIVERY', 'FINISHED', 26, '2026-04-11 14:49:26.415', '2026-04-11 15:48:40.228', '-', '-', '-', '', '-', '', NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'YASMIN', 0, NULL, 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnugtpsr0021ba6vckxb3s5j', 'DELIVERY', 'FINISHED', 25, '2026-04-11 15:04:09.436', '2026-04-11 15:48:45.984', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'PAMELA', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnuh2isb0028ba6v46j2g42p', 'DINE_IN', 'FINISHED', 77.5, '2026-04-11 15:11:00.252', '2026-04-11 16:09:46.127', '', '', '', '', '', '', 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'NILDA', 0, NULL, 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnuh6tn1002fba6v78h25j6r', 'DINE_IN', 'FINISHED', 35.48, '2026-04-11 15:14:20.941', '2026-04-11 16:09:41.332', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ISABELA', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnuh7q4n002mba6v329z1fzo', 'DINE_IN', 'FINISHED', 74, '2026-04-11 15:15:03.048', '2026-04-11 15:26:04.608', '', '', '', '', '', '', 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'IBRAIM', 0, NULL, 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnuhbax9002tba6vimmzb7nf', 'DINE_IN', 'FINISHED', 46, '2026-04-11 15:17:49.966', '2026-04-11 15:17:54.558', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3l0002a4lsihfjel0w', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ELEKTRO', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnuhbxv30031ba6v5nw1w1nh', 'DINE_IN', 'FINISHED', 27, '2026-04-11 15:18:19.695', '2026-04-11 15:27:38.258', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3l0002a4lsihfjel0w', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ARI', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnuhgcwb0036ba6vca6qp6ya', 'DINE_IN', 'FINISHED', 69.53, '2026-04-11 15:21:45.803', '2026-04-11 15:33:30.922', '', '', '', '', '', '', 'cmms2mx3p0003a4lsiss1l4vl', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'NAIARA', 0, NULL, 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnuhzgq1003zba6vkek2c9fx', 'TAKE_AWAY', 'FINISHED', 21, '2026-04-11 15:36:37.225', '2026-04-11 15:36:48.949', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmnnaytzp00059rpafcl8e9nt', 'THIAGO TOBIAS', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnui0r4r0048ba6v21qo034f', 'DINE_IN', 'FINISHED', 30, '2026-04-11 15:37:37.371', '2026-04-11 15:49:48.579', '', '', '', '', '', '', 'cmms2mx3s0004a4lsnswxuujf', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', 'cmnrnjcnn0062q8w61evt6c3t', 'TOKSOM', 0, NULL, 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnui2nhi004dba6vxouu4a3c', 'DELIVERY', 'FINISHED', 21, '2026-04-11 15:39:05.958', '2026-04-11 15:48:30.238', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ADRIANO DO NINICO', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnui3w36004hba6vzcvpxy4n', 'TAKE_AWAY', 'FINISHED', 25, '2026-04-11 15:40:03.762', '2026-04-11 16:09:32.465', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'ANA MARIA', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnuiq9gl0051ba6v9a48cjnr', 'DINE_IN', 'FINISHED', 25, '2026-04-11 15:57:27.525', '2026-04-11 16:09:28.765', '', '', '', '', '', '', 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FLA', 0, NULL, 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnuj7osz005lba6vmnaqingj', 'DELIVERY', 'NEW', 25, '2026-04-11 16:11:00.564', '2026-04-11 16:11:00.564', 'BAR DO TONI', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MARCELO', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnuj8xgr005pba6vs24p5ce2', 'DINE_IN', 'FINISHED', 29, '2026-04-11 16:11:58.443', '2026-04-11 16:12:02.651', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3l0002a4lsihfjel0w', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'PATRICIA', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnuj9u5b005wba6vec67h4al', 'DINE_IN', 'FINISHED', 58, '2026-04-11 16:12:40.799', '2026-04-11 16:12:48.354', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'LYRA', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnujamjp0065ba6vsxrhbmy9', 'DINE_IN', 'FINISHED', 45, '2026-04-11 16:13:17.605', '2026-04-11 16:24:06.836', NULL, NULL, NULL, NULL, NULL, NULL, 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'FLAVIA', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnujc2wm006bba6vyye7t7vs', 'DELIVERY', 'FINISHED', 54, '2026-04-11 16:14:25.462', '2026-04-11 16:14:31.482', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'MAURICIO', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnuje5xg006jba6vdb9eat5f', 'DELIVERY', 'FINISHED', 21, '2026-04-11 16:16:02.693', '2026-04-11 16:24:25.048', '-', '-', '-', NULL, '-', NULL, NULL, 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'GABI EVARISTO', 0, 'URBAN', 'cmnuetmib0004ba6vyu3r9xxw'),
('cmnujqboo00057qmjv8q7znk1', 'DINE_IN', 'FINISHED', 169.93, '2026-04-11 16:25:30.025', '2026-04-11 16:37:03.947', '', '', '', '', '', '', 'cmms2mx3h0001a4ls4ikdwhhd', 'cmms2mx360000a4lsi76gdcwf', 'cmms2mx360000a4lsi76gdcwf', NULL, 'CLARICE', 0, NULL, 'cmnuetmib0004ba6vyu3r9xxw');

-- --------------------------------------------------------

--
-- Estrutura para tabela `orderitem`
--

CREATE TABLE `orderitem` (
  `id` varchar(191) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `weight` double DEFAULT NULL,
  `price` double NOT NULL,
  `notes` text DEFAULT NULL,
  `orderId` varchar(191) NOT NULL,
  `productId` varchar(191) NOT NULL,
  `saleType` varchar(191) DEFAULT NULL,
  `unitPrice` double DEFAULT NULL,
  `manualPrice` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `orderitem`
--

INSERT INTO `orderitem` (`id`, `quantity`, `weight`, `price`, `notes`, `orderId`, `productId`, `saleType`, `unitPrice`, `manualPrice`) VALUES
('cmmxhrovh003ybxlkrudo2gsw', 1, NULL, 21, 'Composição da marmita:\n- Arroz x1\n- Feijão x1\n- Isca de Carne com Pimentão x1\n- Chuchu na Salsa x1\n- Brócolis com Cenoura x1', 'cmmxhrovh003wbxlkj0234ahw', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmxi8wwz0046bxlkznm06k1x', 1, NULL, 21, 'Composição da marmita:\n- Arroz x1\n- Feijão x1\n- Strogonoff de Frango x1\n- Couve Refogada x1\n- Chuchu na Salsa x1', 'cmmxi8wwz0044bxlkqv0m9gt6', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmxij42p004abxlks4x1s3sa', 1, NULL, 21, 'Composição da marmita:\n- Arroz x1\n- Feijão x1\n- Brócolis com Cenoura x1\n- Macarrão Alho e Óleo x1\n- Strogonoff de Frango x1', 'cmmxij42p0048bxlk8m9gxti2', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmxit6ek004gbxlkt1p17893', 1, NULL, 25, 'Composição da marmita:\n- Feijão x1\n- Arroz x1\n- Isca de Carne com Pimentão x1\n- Calabresa Acebolada x1\n- Brócolis com Cenoura x1\n- Chuchu na Salsa x1\n- Macarrão Alho e Óleo x1', 'cmmxit6ek004ebxlkftxriygc', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmmxiyvr8004mbxlkbuim0q85', 1, NULL, 21, 'Composição da marmita:\n- Arroz x1\n- Feijão x1\n- Macarrão Alho e Óleo x1\n- Couve Refogada x1\n- Strogonoff de Frango x1', 'cmmxiyvr8004kbxlkvjpzplu8', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmxj6kpw004sbxlkqojlb5i2', 1, NULL, 25, 'Composição da marmita:\n- Arroz x1\n- Feijão x1\n- Brócolis com Cenoura x1\n- Couve Refogada x1\n- Farofa x1\n- Isca de Carne com Pimentão x1\n- Strogonoff de Frango x1', 'cmmxj6kpw004qbxlkrtu2p8mr', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmmxj7hl8004wbxlkjjhvk1mo', 1, NULL, 5, '', 'cmmxj7hl8004ubxlkv67nkofa', 'cmmxfz2nh000fbxlkk0utzon1', 'UNIT', 5, NULL),
('cmmxj861u0050bxlkr3tsrm3h', 1, NULL, 5, '', 'cmmxj861t004ybxlky08sh6s2', 'cmmxgynqo001vbxlk6siyrb91', 'UNIT', 5, NULL),
('cmmxjl3ix0058bxlkz9q7f914', 1, NULL, 25, 'Composição da marmita:\n- Arroz x1\n- Feijão x1\n- Calabresa Acebolada x1\n- Isca de Carne com Pimentão x1\n- Chuchu na Salsa x1\n- Brócolis com Cenoura x1\n- Couve Refogada x1', 'cmmxjl3ix0056bxlkv9nox52v', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmmxk47kf005ebxlksrljbrgh', 1, NULL, 21, 'Composição da marmita:\n- Arroz x1\n- Feijão x1\n- Brócolis com Cenoura x1\n- Chuchu na Salsa x1\n- Macarrão Alho e Óleo x1\n- Isca de Carne com Pimentão x1', 'cmmxk47kf005cbxlke600uys9', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmxkdl0o005mbxlktkg6asjc', 1, NULL, 21, 'Composição da marmita:\n- Arroz x1\n- Feijão x1\n- Isca de Carne com Pimentão x1\n- Macarrão Alho e Óleo x1\n- Chuchu na Salsa x1', 'cmmxkdl0o005kbxlkbunclt9i', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmxkmwte005sbxlkeuoybddy', 1, NULL, 21, 'Composição da marmita:\n- Arroz x1\n- Isca de Carne com Pimentão x1\n- Brócolis com Cenoura x1\n- Chuchu na Salsa x1\n- Macarrão Alho e Óleo x1', 'cmmxkmwte005qbxlk62ludm4l', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmxkw3dk005ybxlkuwsiezc4', 1, NULL, 25, 'Composição da marmita:\n- Arroz x1\n- Feijão x1\n- Macarrão Alho e Óleo x1\n- Farofa x1\n- Calabresa Acebolada x1\n- Strogonoff de Frango x1\nObs: COLOCAR NOME TAMPA PAOLA', 'cmmxkw3dk005wbxlkl21twhab', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmmxkw3dk005zbxlkxvyydqz8', 1, NULL, 25, 'Composição da marmita:\n- Arroz x1\n- Feijão x1\n- Brócolis com Cenoura x1\n- Chuchu na Salsa x1\n- Couve Refogada x1\n- Strogonoff de Frango x1\n- Calabresa Acebolada x1', 'cmmxkw3dk005wbxlkl21twhab', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmmxlb7kp0063bxlk8xcew8m8', 1, NULL, 8, '', 'cmmxlb7kp0061bxlkq8msg42a', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmmxlgrty0067bxlka9fmuz6a', 1, NULL, 21, 'Composição da marmita:\n- Arroz x1\n- Feijão x1\n- Calabresa Acebolada x1\n- Brócolis com Cenoura x1\n- Chuchu na Salsa x1', 'cmmxlgrty0065bxlk49jxeo6e', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmxllxtv006dbxlkhguoj1m9', 1, NULL, 25, 'Composição da marmita:\n- Arroz x1\n- Feijão x1\n- Isca de Carne com Pimentão x1\n- Calabresa Acebolada x1\n- Farofa x1\n- Brócolis com Cenoura x1', 'cmmxllxtv006bbxlk0d2gb7w4', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmmxlxk5j006jbxlkmm74nul9', 1, NULL, 25, 'Composição da marmita:\n- Feijão x1\n- Arroz x1\n- Calabresa Acebolada x1\n- Isca de Carne com Pimentão x1\n- Brócolis com Cenoura x1\n- Chuchu na Salsa x1\n- Couve Refogada x1', 'cmmxlxk5j006hbxlkmu07nd34', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmmxlxk5j006kbxlkt46ubkk0', 1, NULL, 5, '', 'cmmxlxk5j006hbxlkmu07nd34', 'cmmxhuy950042bxlkwq2ti484', 'UNIT', 5, NULL),
('cmmxm12ba006qbxlkv2wyygfi', 1, NULL, 25, 'Composição da marmita:\n- Arroz x1\n- Feijão x1\n- Macarrão Alho e Óleo x1\n- Farofa x1\n- Brócolis com Cenoura x1\n- Strogonoff de Frango x1\n- Calabresa Acebolada x1\nObs: POUCO FEIJAO', 'cmmxm12ba006obxlkg4ltal44', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmmxm3k98006ubxlkcoyl77k5', 1, NULL, 21, 'Composição da marmita:\n- Arroz x1\n- Feijão x1\n- Macarrão Alho e Óleo x1\n- Brócolis com Cenoura x1\n- Strogonoff de Frango x1', 'cmmxm3k98006sbxlkstwygt5m', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmxm9pdw0072bxlkzlm7hxyr', 1, NULL, 25, 'Composição da marmita:\n- Arroz x1\n- Feijão x1\n- Couve Refogada x1\n- Macarrão Alho e Óleo x1\n- Chuchu na Salsa x1\n- Isca de Carne com Pimentão x1\n- Strogonoff de Frango x1', 'cmmxm9pdw0070bxlkdrrvvdms', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmmxmci4y0076bxlkghcno73c', 1, NULL, 29, 'Composição da marmita:\n- Arroz x1\n- Feijão x1\n- Farofa x1\n- Brócolis com Cenoura x1\n- Isca de Carne com Pimentão x2', 'cmmxmci4y0074bxlkrxjok2j3', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmmxndvl3007gbxlkdgpefyr2', 1, NULL, 25, 'Composição da marmita:\n- Arroz x1\n- Feijão x1\n- Calabresa Acebolada x1\n- Isca de Carne com Pimentão x1\n- Brócolis com Cenoura x1\n- Chuchu na Salsa x1\n- Couve Refogada x1', 'cmmxndvl3007ebxlkcmrtnv4v', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmmxnhgna007obxlkm1q0ky1n', 1, NULL, 21, 'Composição da marmita:\n- Arroz x1\n- Feijão x1\n- Brócolis com Cenoura x1\n- Isca de Carne com Pimentão x1', 'cmmxnhgna007mbxlk2xn7mppz', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmxnhgna007pbxlki3chblc2', 1, NULL, 5, '', 'cmmxnhgna007mbxlk2xn7mppz', 'cmmxgynqo001vbxlk6siyrb91', 'UNIT', 5, NULL),
('cmmyyhkyb000e3r61u29eq3a6', 1, NULL, 21, 'Composição da marmita:\n- feijoada x1', 'cmmyyhkya000c3r61e1b999en', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmyyhkyb000f3r612csybihx', 1, NULL, 21, 'Composição da marmita:\n- feijoada x1', 'cmmyyhkya000c3r61e1b999en', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmyyjamz000l3r61n1u0o7ga', 1, NULL, 21, 'Composição da marmita:\n- feijoada x1', 'cmmyyjamy000j3r61c9frj5u3', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmyyjamz000m3r6127nwiden', 1, NULL, 21, 'Composição da marmita:\n- feijoada x1', 'cmmyyjamy000j3r61c9frj5u3', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmyyjamz000n3r61f53zqddg', 1, NULL, 21, 'Composição da marmita:\n- feijoada x1', 'cmmyyjamy000j3r61c9frj5u3', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmyyjamz000o3r61pnwxa5ea', 1, NULL, 21, 'Composição da marmita:\n- feijoada x1', 'cmmyyjamy000j3r61c9frj5u3', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmyyjamz000p3r61o7lclzut', 1, NULL, 5, '', 'cmmyyjamy000j3r61c9frj5u3', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmmyyk6j2000v3r61j2ku88ek', 1, NULL, 21, 'Composição da marmita:\n- feijoada x1', 'cmmyyk6j2000t3r61thnsbn38', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmyyoc8900113r616lpj5gjw', 1, NULL, 21, 'Composição da marmita:\n- arroz x1\n- feijao x1\n- banana a milanesa x1\n- couve refogado x1\n- frango grelhado x1', 'cmmyyoc88000z3r618ngcjh9o', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmyyoc8900123r61jv875zn4', 1, NULL, 21, 'Composição da marmita:\n- arroz x1\n- feijao x1\n- frango grelhado x1\n- banana a milanesa x1\n- couve refogado x1', 'cmmyyoc88000z3r618ngcjh9o', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmyyu67w00163r6126c941dl', 1, NULL, 25, 'Composição da marmita:\n- arroz x1\n- feijoada x1', 'cmmyyu67w00143r6173ff5cug', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmmyz9m6m001c3r61p2sx3qxy', 1, NULL, 25, 'Composição da marmita:\n- arroz x1\n- feijoada x1\n- couve refogado x1\n- farofa x1', 'cmmyz9m6m001a3r61kg15bvrk', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmmyze1wc001g3r61svxqo9u5', 1, NULL, 8, '', 'cmmyze1wc001e3r61czgdasqx', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmmyziacl001m3r61k5bcfkcz', 1, NULL, 29, 'Composição da marmita:\n- arroz x1\n- feijao x1\n- frango grelhado x1\n- peixe x1\n- banana a milanesa x1\n- couve refogado x1\n- vagem c/ batata x1', 'cmmyziack001k3r61px6zrnk5', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmmyziacl001n3r616vb7838m', 1, NULL, 29, 'Composição da marmita:\n- arroz x1\n- feijao x1\n- frango grelhado x1\n- peixe x1\n- banana a milanesa x1\n- couve refogado x1\n- vagem c/ batata x1', 'cmmyziack001k3r61px6zrnk5', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmmyzwkx1001v3r61kpv427rh', 1, NULL, 29, 'Composição da marmita:\n- arroz x1\n- feijao x1\n- frango grelhado x1\n- peixe x1\n- banana a milanesa x1\n- couve refogado x1', 'cmmyzwkx0001t3r611ytk0ylv', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmmyzylyc001z3r61hflbhy7f', 1, NULL, 21, 'Composição da marmita:\n- arroz x1\n- feijao x1\n- feijoada x1\n- frango grelhado x1\n- peixe x1\n- banana a milanesa x1', 'cmmyzylyc001x3r615lpj66dv', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmyzylyc00203r61opafivwe', 1, NULL, 29, 'Composição da marmita:\n- arroz x1\n- feijao x1\n- feijoada x1\n- frango grelhado x1\n- peixe x1\n- banana a milanesa x1', 'cmmyzylyc001x3r615lpj66dv', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmmyzylyc00213r6154epbawx', 1, NULL, 5, '', 'cmmyzylyc001x3r615lpj66dv', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmmz0245h00293r61ov3u2a2v', 1, NULL, 21, 'Composição da marmita:\n- feijoada x1', 'cmmz0245h00273r61il0x74v4', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmz09e6n002f3r610fipv89c', 1, NULL, 25, 'Composição da marmita:\n- feijoada x1\nObs: feijaoda completa', 'cmmz09e6m002d3r61pqe55b5a', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmmz0bnhq002l3r61kzeyb3y4', 1, NULL, 29, 'Composição da marmita:\n- peixe x2\n- arroz x1\n- feijao x1\n- couve refogado x1\n- vagem c/ batata x1\n- banana a milanesa x1', 'cmmz0bnhq002j3r614n1nyxfy', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmmz0iopo002r3r61tritxzky', 1, NULL, 21, 'Composição da marmita:\n- arroz x1\n- banana a milanesa x1\n- couve refogado x1\n- vagem c/ batata x1\n- peixe x2', 'cmmz0iopo002p3r611r1hls4x', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmz0mgl2002v3r61fq6mnfgu', 1, NULL, 21, 'Composição da marmita:\n- feijoada x1\nObs: feijoada completa', 'cmmz0mgl2002t3r61dnt0kcxj', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmz133lp002z3r614654g0mw', 1, NULL, 21, 'Composição da marmita:\n- feijoada x1\n- farofa x1\n- banana a milanesa x1', 'cmmz133lp002x3r61zpzyhwj6', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmz14tcf00333r616utw39fx', 1, NULL, 21, 'Composição da marmita:\n- arroz x1\n- feijao x1\n- peixe x1\n- banana a milanesa x1\n- couve refogado x1', 'cmmz14tcf00313r61kx0vqflc', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmz14tcf00343r61de9q1dhm', 1, NULL, 25, 'Composição da marmita:\n- arroz x1\n- feijao x1\n- peixe x1\n- banana a milanesa x1\n- couve refogado x1', 'cmmz14tcf00313r61kx0vqflc', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmmz14tcf00353r61jnzva3za', 1, NULL, 5, '', 'cmmz14tcf00313r61kx0vqflc', 'cmmxgi7hz001fbxlkeozpyogx', 'UNIT', 5, NULL),
('cmmz17qzw003f3r61guz0hncq', 1, NULL, 21, 'Composição da marmita:\n- arroz x1\n- feijao x1\n- peixe x1\n- banana a milanesa x1\n- couve refogado x1', 'cmmz17qzw003d3r61vwru19z6', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmz1az0i003l3r61n0ycwe9s', 4, NULL, 20, '', 'cmmz1az0h003j3r61z3bvo83r', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmmz1az0i003m3r61et7e8ep2', 1, NULL, 6.5, '', 'cmmz1az0h003j3r61z3bvo83r', 'cmmxgwoyg001rbxlksrpbed26', 'UNIT', 6.5, NULL),
('cmmz1az0i003n3r61fvjyyigt', 1, NULL, 3.5, '', 'cmmz1az0h003j3r61z3bvo83r', 'cmmxg6ogr000pbxlkbkmertzk', 'UNIT', 3.5, NULL),
('cmmz1clye003r3r61yw1xxs82', 1, NULL, 21, 'Composição da marmita:\n- feijoada x1\nObs: so feijoada mais nada', 'cmmz1clyd003p3r61xhuuioou', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmz1hup3003x3r61ed8fz4zz', 1, NULL, 25, 'Composição da marmita:\n- feijoada x1\nObs: feijoada completa', 'cmmz1hup3003v3r611x799luu', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmmz1j2xx00413r61jcr9jlr9', 1, NULL, 25, 'Composição da marmita:\n- feijoada x1\nObs: feijoada completa', 'cmmz1j2xx003z3r61m73vk9q7', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmmz2a2ot004b3r611dio0zim', 1, NULL, 21, 'Composição da marmita:\n- arroz x1\n- feijao x1\n- frango grelhado x1\n- peixe x1\n- banana a milanesa x1\n- couve refogado x1', 'cmmz2a2ot00493r61bt4e16il', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmmz40cz9004h3r61572iemiy', 1, NULL, 29, 'Composição da marmita:\n- arroz x1\n- feijao x1\n- frango grelhado x1\n- peixe x1\n- banana a milanesa x1\n- couve refogado x1\n- farofa x1\n- vagem c/ batata x1', 'cmmz40cz9004f3r61hhlkk8r0', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmmz45b1a004l3r618ha4tyfv', 1, NULL, 21, 'Composição da marmita:\n- arroz x1\n- feijao x1\n- frango grelhado x1\n- banana a milanesa x1\n- couve refogado x1\n- farofa x1', 'cmmz45b1a004j3r61iirx13dh', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn387jqm000itga37tu9aauz', 1, NULL, 29, 'Composição da marmita:\n- arroz branco x1\n- feijão x1\n- macarrão ao molho sugo x1\n- costela com mandioca x1\n- file de frango a milanesa x1\n- toscana no molho c/pimentão x1\n- batata sute x1', 'cmn387jqm000gtga3w8glcfbk', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmn38l77h000mtga3gzg7wog3', 1, NULL, 25, 'Composição da marmita:\n- arroz branco x1\n- feijão x1\n- macarrão ao molho sugo x1\n- costela com mandioca x1\n- file de frango a milanesa x1\n- batata sute x1', 'cmn38l77g000ktga3b3hm95cw', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn38l77h000ntga3ftubk44n', 1, NULL, 25, 'Composição da marmita:\n- arroz branco x1\n- feijão x1\n- macarrão ao molho sugo x1\n- costela com mandioca x1\n- file de frango a milanesa x1\n- abobrinha refogada x1\n- batata sute x1\n- virado de ', 'cmn38l77g000ktga3b3hm95cw', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn38slm0000stga3wa0i5gco', 1, NULL, 21, 'Composição da marmita:\n- arroz branco x1\n- feijão x1\n- Farofa x1\n- batata sute x1\n- costela com mandioca x1\n- toscana no molho c/pimentão x1', 'cmn38slm0000qtga3jqfbr694', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn395vk2000wtga3zrriy1e2', 1, NULL, 25, 'Composição da marmita:\n- arroz branco x1\n- feijão x1\n- macarrão ao molho sugo x1\n- abobrinha refogada x1\n- costela com mandioca x1', 'cmn395vk2000utga382ntmt1q', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn3987nz0010tga3006wk84i', 1, NULL, 21, 'Composição da marmita:\n- arroz branco x1\n- feijão x1\n- macarrão ao molho sugo x1\n- costela com mandioca x1\n- file de frango a milanesa x1\n- Farofa x1\n- virado de repolho x1', 'cmn3987nz000ytga38tglnlfo', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn39auow0014tga3hoorswph', 1, NULL, 25, 'Composição da marmita:\n- arroz branco x1\n- feijão x1\n- macarrão ao molho sugo x1\n- costela com mandioca x1\n- file de frango a milanesa x1\n- toscana no molho c/pimentão x1\n- abobrinha refogada', 'cmn39auov0012tga3wa6dy6ae', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn39lcx3001itga3cd6t0ici', 1, NULL, 25, 'Composição da marmita:\n- arroz branco x1\n- feijão x1\n- macarrão ao molho sugo x1\n- Farofa x1\n- virado de repolho x1\n- batata sute x1\n- costela com mandioca x1\n- file de frango a milanesa x1', 'cmn39lcx3001gtga3e8cndn3r', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn3a5bip001mtga3q1mfdql8', 1, NULL, 21, 'Composição da marmita:\n- arroz branco x1\n- macarrão ao molho sugo x1\n- file de frango a milanesa x1\n- abobrinha refogada x1\n- batata sute x1\n- Farofa x1', 'cmn3a5bip001ktga3paqbasef', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn3ai47q001qtga3hlnore2u', 1, NULL, 25, 'Composição da marmita:\n- arroz branco x1\n- feijão x1\n- macarrão ao molho sugo x1\n- costela com mandioca x1\n- file de frango a milanesa x1\n- toscana no molho c/pimentão x1\n- virado de repolho ', 'cmn3ai47q001otga3nt2kgrsm', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn3as76z001utga3zjh1hr0p', 1, NULL, 21, 'Composição da marmita:\n- arroz branco x1\n- feijão x1\n- macarrão ao molho sugo x1\n- costela com mandioca x1\n- file de frango a milanesa x1\n- virado de repolho x1', 'cmn3as76z001stga3ijk5nhjr', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn3aufi20020tga3vv7116or', 1, NULL, 25, 'Composição da marmita:\n- arroz branco x1\n- feijão x1\n- macarrão ao molho sugo x1\n- costela com mandioca x1\n- file de frango a milanesa x1\n- toscana no molho c/pimentão x1\n- abobrinha refogada', 'cmn3aufi1001ytga31ariqwnx', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn3bdtsi0028tga3wqiwgi2n', 1, NULL, 21, 'Composição da marmita:\n- arroz branco x1\n- feijão x1', 'cmn3bdtsi0026tga308shdpik', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn3bdtsi0029tga31v9lkdv1', 1, NULL, 25, 'Composição da marmita:\n- arroz branco x1\n- feijão x1', 'cmn3bdtsi0026tga308shdpik', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn3bdtsi002atga3yksg5f17', 1, NULL, 2.5, '', 'cmn3bdtsi0026tga308shdpik', 'cmmxg69nt000nbxlk7omoe0uq', 'UNIT', 2.5, NULL),
('cmn3bhg3q002etga31e4yc6eo', 1, NULL, 21, 'Composição da marmita:\n- arroz branco x1\n- feijão x1\n- macarrão ao molho sugo x1\n- costela com mandioca x1\n- file de frango a milanesa x1\n- toscana no molho c/pimentão x1\n- abobrinha refogada', 'cmn3bhg3q002ctga356ydf62w', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn3bur75002otga36jxavmzy', 1, NULL, 25, 'Composição da marmita:\n- arroz branco x1\n- feijão x1', 'cmn3bur75002mtga3dcbokkdy', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn3bur75002ptga3810uoro4', 1, NULL, 25, 'Composição da marmita:\n- arroz branco x1\n- feijão x1', 'cmn3bur75002mtga3dcbokkdy', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn3cdlxc002xtga30ujflnjb', 1, NULL, 29, 'Composição da marmita:\n- arroz branco x1\n- feijão x1\n- macarrão ao molho sugo x1\n- costela com mandioca x1\n- file de frango a milanesa x1\n- toscana no molho c/pimentão x1\n- abobrinha refogada', 'cmn3cdlxc002vtga3qly3zmhl', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmn3cpj460033tga3ltxa5p0s', 1, NULL, 21, 'Composição da marmita:\n- arroz branco x1\n- feijão x1\n- macarrão ao molho sugo x1\n- costela com mandioca x1\n- file de frango a milanesa x1\n- abobrinha refogada x1\n- batata sute x1\n- Farofa x1\n', 'cmn3cpj460031tga3hpxunvcd', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn3d1rn20037tga3umngv955', 1, NULL, 25, 'Composição da marmita:\n- arroz branco x1\n- feijão x1', 'cmn3d1rn20035tga36luq2sy3', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn3ddpa3003ftga33f4laclr', 1, NULL, 21, 'Composição da marmita:\n- arroz branco x1\n- feijão x1\n- macarrão ao molho sugo x1\n- costela com mandioca x1\n- toscana no molho c/pimentão x1\n- abobrinha refogada x1\n- batata sute x1\n- Farofa x', 'cmn3ddpa3003dtga31cu1rb6k', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn3dnewy003jtga3k9mzt1l2', 1, NULL, 21, 'Composição da marmita:\n- arroz branco x1\n- feijão x1\n- Farofa x1\n- batata sute x1\n- costela com mandioca x1', 'cmn3dnewy003htga3lxxf6zn7', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn3dvyu7003ptga3fhodfkgr', 1, NULL, 25, 'Composição da marmita:\n- arroz branco x1\n- feijão x1\n- batata sute x1\n- costela com mandioca x1\n- toscana no molho c/pimentão x1\n- Farofa x1', 'cmn3dvyu7003ntga3sf225b4g', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn3dzizv003xtga3hkrgl6dh', 1, NULL, 5, '', 'cmn3dzizv003vtga3fociisd5', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmn3dzizv003ytga3cvnr4ldv', 1, NULL, 14, '', 'cmn3dzizv003vtga3fociisd5', 'cmmxghmnu001dbxlkdldqvqy3', 'UNIT', 14, NULL),
('cmn3dzizw003ztga30v08stuk', 1, NULL, 7, '', 'cmn3dzizv003vtga3fociisd5', 'cmmxgc1px000xbxlkivkx1j4g', 'UNIT', 7, NULL),
('cmn3e5q930045tga3t631648p', 1, NULL, 21, 'Composição da marmita:\n- arroz branco x1\n- feijão x1\n- macarrão ao molho sugo x1\n- costela com mandioca x1\n- abobrinha refogada x1\n- batata sute x1\n- Farofa x1\n- virado de repolho x1', 'cmn3e5q930043tga3hxzqvmyb', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn4okx260013g2zqhsh9bvct', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- BERINGELA REFOGADA x1\n- CENOURA C/ VAGEM NA MANTEIRGA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO ALHO E ÓLEO x1\n- OVO FRITO x1\n- BISTECA GRELHADA x1\n- FI', 'cmn4ocdyk000ug2zq4nspij0k', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn4okx260014g2zqlv4fehbh', 1, NULL, 29, 'Composição da marmita:\n- ARROZ BRANCO x1\n- BERINGELA REFOGADA x1\n- CENOURA C/ VAGEM NA MANTEIRGA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO ALHO E ÓLEO x1\n- OVO FRITO x1\n- BISTECA GRELHADA x1\n- FI', 'cmn4ocdyk000ug2zq4nspij0k', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmn4pc20h001ng2zq3cmriq9c', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- OVO FRITO x1\n- PANQUECA DE CARNE x1\n- BISTECA x1', 'cmn4pa7rx001gg2zqganyg6tj', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn4pc20h001og2zqgungr56d', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- BERINGELA REFOGADA x1\n- CENOURA C/ VAGEM x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO ALHO E OLEO x1\n- OVO FRITO x1\n- PANQUECA DE CARNE x1\n- BISTECA x1', 'cmn4pa7rx001gg2zqganyg6tj', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn4pc20h001pg2zqw6niib0w', 1, NULL, 14, '', 'cmn4pa7rx001gg2zqganyg6tj', 'cmmxgdc0n0011bxlknea7e0hh', 'UNIT', 14, NULL),
('cmn4pfoe6001tg2zqzn1b0szo', 1, NULL, 29, 'Composição da marmita:\n- ARROZ BRANCO x1\n- BERINGELA REFOGADA x1\n- CENOURA C/ VAGEM x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO ALHO E OLEO x1\n- OVO FRITO x1\n- BISTECA x1\n- FILÉ DE FRANGO GRELHADO ', 'cmn4pfoe6001rg2zqzoufowd9', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmn4ply7r0024g2zqa27i4wpc', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- OVO FRITO x1\n- FEIJÃO x1\n- FILÉ DE FRANGO GRELHADO x1\n- MACARRÃO ALHO E OLEO x1', 'cmn4ply7r0022g2zqzkzq777q', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn4po0ih0028g2zqsi0b0sgv', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- BERINGELA REFOGADA x1\n- CENOURA C/ VAGEM x1\n- FAROFA x1\n- OVO FRITO x1\n- MACARRÃO ALHO E OLEO x1\n- PANQUECA DE CARNE x2', 'cmn4po0ih0026g2zqee38qnn6', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn4q8fij002mg2zqkfdepavh', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- MACARRÃO ALHO E OLEO x1\n- PANQUECA DE CARNE x1\n- FILÉ DE FRANGO GRELHADO x1\n- CENOURA C/ VAGEM x1', 'cmn4q8fij002kg2zqg6gjcjkk', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn4qoivw002qg2zqt3d4cdyu', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- BERINGELA REFOGADA x1\n- CENOURA C/ VAGEM x1', 'cmn4qoivw002og2zqlkt51dgs', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn4qporw002ug2zq2xyn6n99', 2, NULL, 13, '', 'cmn4qporw002sg2zqgt5sbyu7', 'cmmxgf67a0017bxlk6xa8qpbi', 'UNIT', 6.5, NULL),
('cmn4qvhxe002yg2zqepksieb9', 1, NULL, 29, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- CENOURA C/ VAGEM x1\n- BERINGELA REFOGADA x1\n- MACARRÃO ALHO E OLEO x1\n- OVO FRITO x1\n- BISTECA x1\n- FILÉ DE FRANGO GRELHADO ', 'cmn4qvhxe002wg2zqjouiukas', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmn4qvhxe002zg2zqi4k6v0fx', 1, NULL, 29, 'Composição da marmita:\n- ARROZ BRANCO x1\n- BERINGELA REFOGADA x1\n- CENOURA C/ VAGEM x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO ALHO E OLEO x1\n- OVO FRITO x1\n- BISTECA x1\n- FILÉ DE FRANGO GRELHADO ', 'cmn4qvhxe002wg2zqjouiukas', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmn4qzlzt0033g2zqfw54ra8c', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- MACARRÃO ALHO E OLEO x1\n- BERINGELA REFOGADA x1\n- OVO FRITO x1\n- CENOURA C/ VAGEM x1\n- FAROFA x1\n- PANQUECA DE CARNE x2', 'cmn4qzlzt0031g2zql81rtijb', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn4r9c720037g2zqwbdhxq2a', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- OVO FRITO x1\n- FAROFA x1\n- FILÉ DE FRANGO GRELHADO x1\n- PANQUECA DE CARNE x1', 'cmn4r9c720035g2zqz0k65e3b', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn4ri5x2003lg2zq46up64vg', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FILÉ DE FRANGO GRELHADO x1\n- BERINGELA REFOGADA x1\n- CENOURA C/ VAGEM x1', 'cmn4ri5x2003jg2zq5r8r0slb', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn4ri5x2003mg2zqwep7h8k0', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- PANQUECA DE CARNE x1\n- BERINGELA REFOGADA x1', 'cmn4ri5x2003jg2zq5r8r0slb', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn4riq62003qg2zqtuv1oibq', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- BERINGELA REFOGADA x1\n- CENOURA C/ VAGEM x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO ALHO E OLEO x1\n- OVO FRITO x1\n- BISTECA x1\n- FILÉ DE FRANGO GRELHADO ', 'cmn4riq61003og2zqov4vi75q', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn4rrsmc0043g2zq4l4mx92f', 1, NULL, 19.94, '', 'cmn4rrsmc0041g2zq47oeqb7i', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 60, 19.94),
('cmn4rrsmc0044g2zqw12ek9a9', 1, NULL, 4, '', 'cmn4rrsmc0041g2zq47oeqb7i', 'cmmxg372k000jbxlkds2q6i5y', 'UNIT', 4, NULL),
('cmn4rukbc0048g2zq1apgbj3k', 1, NULL, 18.41, '', 'cmn4rpwur003wg2zq3oxcbm05', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 60, 18.41),
('cmn4rukbc0049g2zq5jeqhfxi', 1, NULL, 3.5, '', 'cmn4rpwur003wg2zq3oxcbm05', 'cmmxg6ogr000pbxlkbkmertzk', 'UNIT', 3.5, NULL),
('cmn4rukbc004ag2zqui8cjvn9', 1, NULL, 1, '', 'cmn4rpwur003wg2zq3oxcbm05', 'cmn4ru0mi0046g2zqe5losqc4', 'UNIT', 1, NULL),
('cmn4u37ad004gg2zqdl2095oh', 1, NULL, 21, 'Composição da marmita:\n- PANQUECA DE CARNE x1\n- FILÉ DE FRANGO GRELHADO x1\n- ARROZ BRANCO x1\n- BERINGELA REFOGADA x1\n- CENOURA C/ VAGEM x1\n- FAROFA x1\n- FEIJÃO x1', 'cmn4u37ad004eg2zq1ilxce0f', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn4uwip0004qg2zqy5il7hzt', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- BERINGELA REFOGADA x1', 'cmn4uwioz004og2zqd8pc8ej6', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn4uxl2o004wg2zqlabtd12r', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1', 'cmn4uxl2n004ug2zqooqzjav3', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn62vdf7005ig2zqoedby613', 1, NULL, 29, 'Composição da marmita:\n- ARROZ BRANCO x1\n- ARROZ TEMPERADO x1\n- FAROFA x1\n- FEIJÃO x1\n- PIRÃO DE PEIXE x1\n- PURÊ DE ABOBORA x1\n- REPOLHO ROXO x1\n- FRANGO FRITO x1\n- PEIXE FRITO x1\n- PORCO EM ', 'cmn62vdf7005gg2zqjozuxy3q', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmn639lon0062g2zq8c2rikce', 1, NULL, 29, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FAROFA x1\n- FEIJÃO x1\n- PIRÃO DE PEIXE x1\n- FRANGO FRITO x1\n- PEIXE FRITO x1\n- PORCO EM CUBOS x1', 'cmn639lon0060g2zq28gnj5i7', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmn63r16e0068g2zqpyrwmhcc', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- ARROZ TEMPERADO x1\n- FAROFA x1\n- FEIJÃO x1\n- PIRÃO DE PEIXE x1\n- PURÊ DE ABOBORA x1\n- REPOLHO ROXO x1\n- FRANGO FRITO x1\n- PEIXE FRITO x1', 'cmn63r16e0066g2zqk23hjxqn', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn63r16e0069g2zq2mfyhbgk', 1, NULL, 14, '', 'cmn63r16e0066g2zqk23hjxqn', 'cmmxghmnu001dbxlkdldqvqy3', 'UNIT', 14, NULL),
('cmn64lfwt006vg2zq36byci7q', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- ARROZ TEMPERADO x1\n- FAROFA x1\n- FEIJÃO x1\n- PIRÃO DE PEIXE x1\n- PURÊ DE ABOBORA x1\n- REPOLHO ROXO x1\n- FRANGO FRITO x1\n- PEIXE FRITO x1\n- PORCO EM ', 'cmn64lfwt006tg2zq6rw1c0kq', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn64nlie0072g2zqv5giogr7', 1, NULL, 25, '', 'cmn64nlie0070g2zqj5onba89', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmn64yk6l007cg2zqpdka52dk', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- ARROZ TEMPERADO x1\n- FAROFA x1\n- FEIJÃO x1\n- PIRÃO DE PEIXE x1\n- PURÊ DE ABOBORA x1\n- REPOLHO ROXO x1\n- FRANGO FRITO x1\n- PEIXE FRITO x1\n- PORCO EM ', 'cmn64yk6l007ag2zq0symm44r', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn65cugv007kg2zqgmky5z2s', 1, NULL, 23, '', 'cmn65cugv007ig2zqn8drek4l', 'cmn6545j9007eg2zqqj1sszr7', 'UNIT', 23, NULL),
('cmn65pty3007qg2zqqcg0qdnv', 1, NULL, 21, 'Composição da marmita:\n- ARROZ TEMPERADO x1\n- FAROFA x1\n- PIRÃO DE PEIXE x1\n- PURÊ DE ABOBORA x1\n- REPOLHO ROXO x1\n- FRANGO FRITO x1\n- PEIXE FRITO x1\n- PORCO EM CUBOS x1', 'cmn65pty3007og2zqmmevbw9k', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn6617w4007zg2zqjpnlhy0h', 1, NULL, 22, '', 'cmn6617w4007xg2zqd49fe9r4', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 22),
('cmn6617w40080g2zqp46enbda', 1, NULL, 4, '', 'cmn6617w4007xg2zqd49fe9r4', 'cmmxg372k000jbxlkds2q6i5y', 'UNIT', 4, NULL),
('cmn664ayt0088g2zqc4lmrs6l', 1, NULL, 8, '', 'cmn664ayt0086g2zqmu0pl3eh', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmn664ayt0089g2zqfpe1s9rx', 2, NULL, 2, '', 'cmn664ayt0086g2zqmu0pl3eh', 'cmn4ru0mi0046g2zqe5losqc4', 'UNIT', 1, NULL),
('cmn664ayt008ag2zqi61r2mhe', 2, NULL, 50, '', 'cmn664ayt0086g2zqmu0pl3eh', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmn66epev008jg2zqxg3uwtin', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FRANGO FRITO x1\n- PEIXE FRITO x1', 'cmn66epev008hg2zqvzlm64hm', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn66g1se008lg2zqbfp7c1th', 1, NULL, 29, 'Composição da marmita:\n- ARROZ BRANCO x1\n- ARROZ TEMPERADO x1\n- FAROFA x1\n- FEIJÃO x1\n- PIRÃO DE PEIXE x1\n- PURÊ DE ABOBORA x1\n- REPOLHO ROXO x1\n- PEIXE FRITO x1', 'cmn66a2x3008cg2zqcsskvr8c', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmn66g1se008mg2zqru3sziv6', 1, NULL, 29, 'Composição da marmita:\n- ARROZ BRANCO x1\n- ARROZ TEMPERADO x1\n- FAROFA x1\n- FEIJÃO x1\n- PIRÃO DE PEIXE x1\n- PURÊ DE ABOBORA x1\n- REPOLHO ROXO x1\n- FRANGO FRITO x1\n- PORCO EM CUBOS x1', 'cmn66a2x3008cg2zqcsskvr8c', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmn66jbni008qg2zq5woo0cgb', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- PURÊ DE ABOBORA x1\n- FRANGO FRITO x1\n- PEIXE FRITO x1', 'cmn66jbni008og2zq7hhrsgey', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn66oj8n008wg2zqceybq1dh', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- PURÊ DE ABOBORA x1\n- FRANGO FRITO x1\n- PEIXE FRITO x1', 'cmn66oj8n008ug2zqndx4xoxp', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn66qsmt0090g2zqjo94tvb6', 1, NULL, 25, 'Composição da marmita:\n- ARROZ TEMPERADO x1\n- FEIJÃO x1\n- FAROFA x1\n- PIRÃO DE PEIXE x1\n- PURÊ DE ABOBORA x1\n- REPOLHO ROXO x1\n- FRANGO FRITO x1\n- PEIXE FRITO x1\n- PORCO EM CUBOS x1', 'cmn66qsmt008yg2zq0024lhwd', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn66uun30097g2zqxdgde9o2', 1, NULL, 21, 'Composição da marmita:\n- ARROZ TEMPERADO x1\n- FEIJÃO x1\n- FAROFA x1\n- REPOLHO ROXO x1\n- FRANGO FRITO x1\n- PEIXE FRITO x1', 'cmn66tu2j0092g2zqfnm34gc8', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn66uun30098g2zqvao89l8o', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- PURÊ DE ABOBORA x1\n- REPOLHO ROXO x1\n- FRANGO FRITO x1\n- PEIXE FRITO x1\n- PORCO EM CUBOS x1', 'cmn66tu2j0092g2zqfnm34gc8', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn66uun30099g2zq15ay5qxy', 1, NULL, 8, '', 'cmn66tu2j0092g2zqfnm34gc8', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmn6781z8009jg2zqu5rfqx41', 3, NULL, 75, '', 'cmn6781z8009hg2zqturyy16s', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmn6781z8009kg2zqk5w4k9qj', 1, NULL, 8, '', 'cmn6781z8009hg2zqturyy16s', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmn679psw009og2zqjfjnemjb', 1, NULL, 15.9, '', 'cmn679psw009mg2zqbte9jm7w', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 15.9),
('cmn67f2f3009ug2zqb02gl1fs', 1, NULL, 13.9, '', 'cmn6606a2007sg2zqwvm95gqc', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 13.9),
('cmn67f2f3009vg2zqrby4yhx3', 1, NULL, 11.5, '', 'cmn6606a2007sg2zqwvm95gqc', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 11.5),
('cmn67f2f3009wg2zq5xde4tpk', 1, NULL, 4, '', 'cmn6606a2007sg2zqwvm95gqc', 'cmmxg6ogr000pbxlkbkmertzk', 'UNIT', 4, NULL),
('cmn67f2f3009xg2zqrektjym0', 1, NULL, 4, '', 'cmn6606a2007sg2zqwvm95gqc', 'cmmxg372k000jbxlkds2q6i5y', 'UNIT', 4, NULL),
('cmn67f2f3009yg2zqcdpxiw5v', 2, NULL, 2, '', 'cmn6606a2007sg2zqwvm95gqc', 'cmn4ru0mi0046g2zqe5losqc4', 'UNIT', 1, NULL),
('cmn67mlp100adg2zqyoltltpn', 1, NULL, 25, '', 'cmn67hh3r00a0g2zqp7ibq25u', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmn67mlp100aeg2zqg9ex9hpn', 1, NULL, 5, '', 'cmn67hh3r00a0g2zqp7ibq25u', 'cmmxfz2nh000fbxlkk0utzon1', 'UNIT', 5, NULL),
('cmn67mlp100afg2zq28mfvqo7', 1, NULL, 5, '', 'cmn67hh3r00a0g2zqp7ibq25u', 'cmmxgynqo001vbxlk6siyrb91', 'UNIT', 5, NULL),
('cmn67qwsk00ang2zqe56vuel8', 1, NULL, 5, '', 'cmn67qwsk00alg2zqrfizpeob', 'cmmxhuy950042bxlkwq2ti484', 'UNIT', 5, NULL),
('cmn67qwsk00aog2zqecx2tmmk', 1, NULL, 18.57, '', 'cmn67qwsk00alg2zqrfizpeob', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 18.57),
('cmn682qcd00aug2zqmib5perz', 1, NULL, 5, '', 'cmn682qcc00asg2zqmtcpqg91', 'cmmxh51en0029bxlk8niisc9p', 'UNIT', 5, NULL),
('cmn68cdrt00b2g2zqqvvq39oq', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- PIRÃO DE PEIXE x1\n- PURÊ DE ABOBORA x1\n- PEIXE FRITO x1\nObs: BUSCAR 13:30', 'cmn68cdrt00b0g2zq6z2fi7bh', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7iqb010003hsrv8jbhif6c', 1, NULL, 1, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- ISCA DE FRANGO C/PIMENTÃO x1\n- STROGONOFF DE CARNE x1', 'cmn7iqb010001hsrvge2qvclc', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, 1),
('cmn7iqb010004hsrvkbowz0wc', 1, NULL, 21, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- ISCA DE FRANGO C/PIMENTÃO x1\n- STROGONOFF DE CARNE x1', 'cmn7iqb010001hsrvge2qvclc', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7iqb010005hsrvtjag199o', 1, NULL, 21, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- STROGONOFF DE CARNE x1\n- ISCA DE FRANGO C/PIMENTÃO x1', 'cmn7iqb010001hsrvge2qvclc', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7itiab0009hsrvttmhoc5g', 1, NULL, 21, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- ISCA DE FRANGO C/PIMENTÃO x1\n- STROGONOFF DE CARNE x1', 'cmn7itiab0007hsrvou6zvozu', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7iwqjt000fhsrvhnr800mi', 1, NULL, 20, '', 'cmn7iwqjt000dhsrv2hszpvsa', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 20),
('cmn7iyoor000lhsrv5tca6783', 1, NULL, 25, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- ISCA DE FRANGO C/PIMENTÃO x1\n- STROGONOFF DE CARNE x1', 'cmn7iyooq000jhsrvkb9z1ukb', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn7iyoor000mhsrvprpu78wf', 1, NULL, 25, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- ISCA DE FRANGO C/PIMENTÃO x1\n- STROGONOFF DE CARNE x1', 'cmn7iyooq000jhsrvkb9z1ukb', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn7iyoor000nhsrvjpfgp1z6', 1, NULL, 25, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CHIPS DE BATATA DOCE x1\n- CENOURA REFOGADA x1\n- FAROFA x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- ISCA DE FRANGO C/PIMENTÃO x1\n- STROGONOFF DE CARNE x1', 'cmn7iyooq000jhsrvkb9z1ukb', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn7jcpuz000rhsrv7nm46ix7', 1, NULL, 25, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- STROGONOFF DE CARNE x1\n- CARNE MOIDA C/BATATA x1\n- FAROFA x1\n- CHIPS DE BATATA DOCE x1\n- CENOURA REFOGADA x1\n- CANELONE DE PRES. E QUEIJO x1', 'cmn7jcpuz000phsrvckfqdg2t', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn7jsvbg000xhsrvz4tcqtr3', 1, NULL, 21, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- FAROFA x1\n- STROGONOFF DE CARNE x1', 'cmn7jsvbg000vhsrv7c1bcaqg', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7jsvbg000yhsrvnotxemqn', 1, NULL, 21, 'Composição da marmita:\n- CANELONE DE PRES. E QUEIJO x1\n- BATATA PALHA x1\n- STROGONOFF DE CARNE x1', 'cmn7jsvbg000vhsrv7c1bcaqg', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7jxxwf0012hsrvnud67qnr', 2, NULL, 50, '', 'cmn7jxxwf0010hsrvtkfhggz3', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmn7jxxwf0013hsrvvj2kle15', 1, NULL, 6.5, '', 'cmn7jxxwf0010hsrvtkfhggz3', 'cmmxgf67a0017bxlk6xa8qpbi', 'UNIT', 6.5, NULL),
('cmn7k08zr0017hsrvwagy68tr', 2, NULL, 50, '', 'cmn7k08zr0015hsrv92k0eq0j', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmn7k08zr0018hsrvrgnpek1j', 1, NULL, 8, '', 'cmn7k08zr0015hsrv92k0eq0j', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmn7k67ri001ghsrvcgx1ca9w', 1, NULL, 21, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1', 'cmn7k67ri001ehsrv5y8ls36n', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7k67ri001hhsrvxrh4rghh', 1, NULL, 21, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- ISCA DE FRANGO C/PIMENTÃO x1', 'cmn7k67ri001ehsrv5y8ls36n', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7ka1ok001lhsrvc7puj41c', 1, NULL, 29, 'Composição da marmita:\n- BATATA PALHA x1\n- ARROZ  BRANCO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- ISCA DE FRANGO C/PIMENTÃO x1\n- STROGONOFF DE CARNE x1', 'cmn7ka1oj001jhsrv6kbppjey', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmn7krada0020hsrvfnkrjjlt', 1, NULL, 21, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- ISCA DE FRANGO C/PIMENTÃO x1\n- STROGONOFF DE CARNE x1', 'cmn7krada001yhsrve506srt0', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7krada0021hsrvqenl68zi', 1, NULL, 21, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- ISCA DE FRANGO C/PIMENTÃO x1\n- STROGONOFF DE CARNE x1', 'cmn7krada001yhsrve506srt0', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7krada0022hsrvhbya8bli', 1, NULL, 21, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- STROGONOFF DE CARNE x1\n- ISCA DE FRANGO C/PIMENTÃO x1', 'cmn7krada001yhsrve506srt0', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7ku5fw0028hsrvb77vyrtn', 1, NULL, 21, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- FEIJÃO x1\n- CHIPS DE BATATA DOCE x1\n- CANELONE DE PRES. E QUEIJO x1\n- BATATA PALHA x1\n- STROGONOFF DE CARNE x1', 'cmn7kkuz8001nhsrvpd09nqbp', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7ku5fx0029hsrv5h7r8xra', 1, NULL, 21, 'Composição da marmita:\n- FAROFA x1\n- CHIPS DE BATATA DOCE x1\n- CANELONE DE PRES. E QUEIJO x1\n- ARROZ  BRANCO x1\n- STROGONOFF DE CARNE x1\n- ISCA DE FRANGO C/PIMENTÃO x1\n[EXTRA] SALADA DE TOMATE | 0.00', 'cmn7kkuz8001nhsrvpd09nqbp', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7ku5fx002ahsrvgzd879no', 1, NULL, 6.5, '', 'cmn7kkuz8001nhsrvpd09nqbp', 'cmmxgf67a0017bxlk6xa8qpbi', 'UNIT', 6.5, NULL),
('cmn7l9oel002rhsrvmjxz9srj', 1, NULL, 21, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- ISCA DE FRANGO C/PIMENTÃO x1\n- STROGONOFF DE CARNE x1', 'cmn7l8q86002ghsrvkvouc8fk', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7l9oel002shsrvef0oy9sr', 1, NULL, 21, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- ISCA DE FRANGO C/PIMENTÃO x1\n- STROGONOFF DE CARNE x1', 'cmn7l8q86002ghsrvkvouc8fk', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7l9oel002thsrv3syk3for', 1, NULL, 21, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- ISCA DE FRANGO C/PIMENTÃO x1\n- STROGONOFF DE CARNE x1', 'cmn7l8q86002ghsrvkvouc8fk', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7lb3ra002zhsrvc1ap4lqp', 1, NULL, 25, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- ISCA DE FRANGO C/PIMENTÃO x1\n- STROGONOFF DE CARNE x1', 'cmn7lb3ra002xhsrvtom6sbqk', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn7lxz5v0035hsrvmatov0uv', 1, NULL, 8, '', 'cmn7lxz5v0033hsrvqaqmy0xq', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmn7lxz5v0036hsrvfdny929r', 2, NULL, 50, '', 'cmn7lxz5v0033hsrvqaqmy0xq', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmn7mebaw003chsrvvroylub0', 2, NULL, 50, '', 'cmn7mebaw003ahsrv4ypdjtya', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmn7mebaw003dhsrvno8qsm5h', 1, NULL, 4, '', 'cmn7mebaw003ahsrv4ypdjtya', 'cmmxg70pt000rbxlkrtk49bgt', 'UNIT', 4, NULL),
('cmn7mebaw003ehsrvknnjjl0w', 1, NULL, 5, '', 'cmn7mebaw003ahsrv4ypdjtya', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmn7mhgot003ohsrv2lifly6p', 1, NULL, 21, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- FEIJÃO x1\n- STROGONOFF DE CARNE x1\n- ISCA DE FRANGO C/PIMENTÃO x1\n- BATATA PALHA x1', 'cmn7mhgot003mhsrvuisiuirx', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7mhwvv003qhsrvvlncwjin', 1, NULL, 21, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- STROGONOFF DE CARNE x1', 'cmn7mfdri003ghsrvdp42q7ua', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7mhwvv003rhsrvo8ssanhn', 2, NULL, 8, '', 'cmn7mfdri003ghsrvdp42q7ua', 'cmmxg6ogr000pbxlkbkmertzk', 'UNIT', 4, NULL),
('cmn7mks8t003vhsrviaj9jwrq', 1, NULL, 16.53, '', 'cmn7mks8t003thsrvwhtiawf8', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 16.53),
('cmn7monsd0041hsrvkovrdj6j', 1, NULL, 13.18, '', 'cmn7monsd003zhsrv1omw56rm', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 13.18),
('cmn7monsd0042hsrv0m4oigkb', 1, NULL, 15.21, '', 'cmn7monsd003zhsrv1omw56rm', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 15.21),
('cmn7monsd0043hsrvo7zmb732', 1, NULL, 5, '', 'cmn7monsd003zhsrv1omw56rm', 'cmmxgi7hz001fbxlkeozpyogx', 'UNIT', 5, NULL),
('cmn7mqq3n004bhsrvpyv9q846', 1, NULL, 24.08, '', 'cmn7mqglm0047hsrvjxchbczy', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 24.08),
('cmn7mqq3o004chsrvd7q90vix', 1, NULL, 4, '', 'cmn7mqglm0047hsrvjxchbczy', 'cmmxg6ogr000pbxlkbkmertzk', 'UNIT', 4, NULL),
('cmn7mx5ny004khsrvsp6ma2f2', 1, NULL, 16, '', 'cmn7mwenw004ghsrvah0l3ck9', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 16),
('cmn7mx5ny004lhsrvfle7g14n', 1, NULL, 4, '', 'cmn7mwenw004ghsrvah0l3ck9', 'cmmxg372k000jbxlkds2q6i5y', 'UNIT', 4, NULL),
('cmn7nby33004rhsrvbowl5ow6', 1, NULL, 21, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- FEIJÃO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- ISCA DE FRANGO C/PIMENTÃO x1\n- STROGONOFF DE CARNE x1', 'cmn7mz828004nhsrv4f474ms6', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7nby33004shsrvnvzbym4z', 1, NULL, 5, '', 'cmn7mz828004nhsrv4f474ms6', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmn7nij0a004whsrvldp3go4y', 1, NULL, 25, '', 'cmn7nij0a004uhsrvk3n0cvdn', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmn7nij0a004xhsrvlmttqmhc', 1, NULL, 4, '', 'cmn7nij0a004uhsrvk3n0cvdn', 'cmmxg6ogr000pbxlkbkmertzk', 'UNIT', 4, NULL),
('cmn7nl2080053hsrvxa8l7x8u', 1, NULL, 25, '', 'cmn7nl2080051hsrvk8tfbwu2', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmn7nl2080054hsrvqk4rdpbl', 1, NULL, 5, '', 'cmn7nl2080051hsrvk8tfbwu2', 'cmmxhuy950042bxlkwq2ti484', 'UNIT', 5, NULL),
('cmn7npgjc005ahsrvxvy9nbei', 1, NULL, 25, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- ISCA DE FRANGO C/PIMENTÃO x1\n- STROGONOFF DE CARNE x1', 'cmn7npgjc0058hsrvcbg6nuym', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmn7nqtak005ghsrvv1fbelbk', 1, NULL, 21, 'Composição da marmita:\n- ARROZ  BRANCO x1\n- BATATA PALHA x1\n- CANELONE DE PRES. E QUEIJO x1\n- CENOURA REFOGADA x1\n- CHIPS DE BATATA DOCE x1\n- FAROFA x1\n- FEIJÃO x1\n- CARNE MOIDA C/BATATA x1\n- ISCA DE FRANGO C/PIMENTÃO x1\n- STROGONOFF DE CARNE x1', 'cmn7nqiz8005chsrvfh2nh97e', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmn7nqtal005hhsrv2cmed1wv', 1, NULL, 5, '', 'cmn7nqiz8005chsrvfh2nh97e', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmn91olmw0003h6f0jwonbr3q', 1, NULL, 25, '', 'cmn91olmw0001h6f029wd70mk', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnacd3l60010h6f0yvp47f2q', 1, NULL, 21, 'Composição da marmita:\n[EXTRA] P | 0.00', 'cmnac27iq0007h6f02c51l5jw', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnacd3l60011h6f08ox1kh1n', 1, NULL, 25, 'Composição da marmita:\n[EXTRA] M | 0.00', 'cmnac27iq0007h6f02c51l5jw', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnacd3l60012h6f0588yf4f3', 1, NULL, 29, 'Composição da marmita:\n[EXTRA] G | 0.00', 'cmnac27iq0007h6f02c51l5jw', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnacd3l60013h6f0mle3iagd', 16, NULL, 336, '', 'cmnac27iq0007h6f02c51l5jw', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnacd3l60014h6f02tcppy8r', 2, NULL, 58, '', 'cmnac27iq0007h6f02c51l5jw', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnacd3l60015h6f0vvyetlvk', 6, NULL, 150, '', 'cmnac27iq0007h6f02c51l5jw', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnacd3l60016h6f06oog3ujq', 1, NULL, 711.5, '', 'cmnac27iq0007h6f02c51l5jw', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 711.5),
('cmnach5l7001qh6f00h7nrgdd', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO C/ ERVILHA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1', 'cmnach5l7001oh6f0axifu74k', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnado1ha001yh6f058ehnc2v', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MACARRÃO C/ ERVILHA x1\n- MIX CHURRASCO x1', 'cmnado1ha001wh6f0oupr1t4k', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnaeqw5h002ch6f09kqgwud8', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MANDIOCA x1\n- MACARRÃO C/ ERVILHA x1\n- MIX CHURRASCO x1', 'cmnaeqpgr0028h6f0w17190rz', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnaeqw5h002dh6f04862d626', 1, NULL, 25, '', 'cmnaeqpgr0028h6f0w17190rz', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnaexzug002lh6f0nlt3obeq', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MANDIOCA x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1', 'cmnaexzug002jh6f09oxi7mvd', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnaf3xrw002ph6f02mqn0ela', 1, NULL, 29, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MACARRÃO C/ ERVILHA x1\n- MIX CHURRASCO x1', 'cmnaf3xrw002nh6f0svmi79zb', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnaf9ymd002vh6f0ao5tr3xe', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MIX CHURRASCO x1\n[EXTRA] VINAGRETE | 0.00', 'cmnaf9ymd002th6f0xu0vdap5', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnaf9ymd002wh6f0ygfwpsk2', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MIX CHURRASCO x1\n[EXTRA] VINAGRETE | 0.00', 'cmnaf9ymd002th6f0xu0vdap5', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnafk85z0030h6f0vne7173t', 1, NULL, 29, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MACARRÃO C/ ERVILHA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1', 'cmnafk85z002yh6f03cwfl2od', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL);
INSERT INTO `orderitem` (`id`, `quantity`, `weight`, `price`, `notes`, `orderId`, `productId`, `saleType`, `unitPrice`, `manualPrice`) VALUES
('cmnafk85z0031h6f0k2dr9543', 1, NULL, 29, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- MACARRÃO C/ ERVILHA x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1', 'cmnafk85z002yh6f03cwfl2od', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnafoq6a0035h6f0pgpfrhfh', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- MIX CHURRASCO x1\n- MACARRÃO C/ ERVILHA x1\n- POLENTA FRITA x1\nObs: SOMENTE CARNE - NÃO COLOCAR NEM FRANGO E NEM LINGUIÇA', 'cmnafoq6a0033h6f08yc8laum', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnafzu32003ch6f0uaz2jvt7', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MACARRÃO C/ ERVILHA x1\n- MIX CHURRASCO x1', 'cmnafyqrt0037h6f0n8gp9lkd', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnafzu32003dh6f0wigewh7h', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MACARRÃO C/ ERVILHA x1\n- MIX CHURRASCO x1', 'cmnafyqrt0037h6f0n8gp9lkd', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnag23a5003jh6f0lz7bml9e', 2, NULL, 50, '', 'cmnag23a5003hh6f0upsx7mfm', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnag23a5003kh6f09afpbnqy', 1, NULL, 8, '', 'cmnag23a5003hh6f0upsx7mfm', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmnagb4o5003qh6f0ss0upn7c', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MACARRÃO C/ ERVILHA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1', 'cmnagb4o5003oh6f0qluclkzx', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnagfbr4003uh6f02m05lnka', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MACARRÃO C/ ERVILHA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1', 'cmnagfbr4003sh6f0mz9cwq6p', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnagfbr4003vh6f01j3ogqsf', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MACARRÃO C/ ERVILHA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1', 'cmnagfbr4003sh6f0mz9cwq6p', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnagh5u4003zh6f0edvu85a8', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MANDIOCA x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1', 'cmnagh5u4003xh6f0t2sb7byu', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnagss4q0043h6f0k4jm5m8h', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1\n[EXTRA] VINAGRETE | 0.00', 'cmnagss4q0041h6f08e9fszp1', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnagx4gw004bh6f05n0aqng8', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MACARRÃO C/ ERVILHA x1\n- MIX CHURRASCO x1', 'cmnagw7cu0047h6f08gxk52ty', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnagx4gw004ch6f0py9gw3m8', 1, NULL, 5, '', 'cmnagw7cu0047h6f08gxk52ty', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmnaha4uz004sh6f0jzljg5ux', 1, NULL, 29, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MACARRÃO C/ ERVILHA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1', 'cmnah0wl2004eh6f0hqgl0qkz', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnaha4uz004th6f0tto53atg', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MACARRÃO C/ ERVILHA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1', 'cmnah0wl2004eh6f0hqgl0qkz', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnaha4uz004uh6f0zigg9rhy', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MACARRÃO C/ ERVILHA x1\n- MANDIOCA x1\n- POLENTA FRITA x1\n- MIX LEGUMES x1\n- MIX CHURRASCO x1', 'cmnah0wl2004eh6f0hqgl0qkz', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnaha4uz004vh6f0f4jjhhvp', 1, NULL, 5, '', 'cmnah0wl2004eh6f0hqgl0qkz', 'cmmxh51en0029bxlk8niisc9p', 'UNIT', 5, NULL),
('cmnaha4uz004wh6f0ornom1ep', 1, NULL, 1, '', 'cmnah0wl2004eh6f0hqgl0qkz', 'cmn4ru0mi0046g2zqe5losqc4', 'UNIT', 1, NULL),
('cmnaha4uz004xh6f03ar1x6f3', 1, NULL, 7, '', 'cmnah0wl2004eh6f0hqgl0qkz', 'cmmxgc1px000xbxlkivkx1j4g', 'UNIT', 7, NULL),
('cmnahghk30051h6f0favp8u0k', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MACARRÃO C/ ERVILHA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1', 'cmnahghk3004zh6f0mdt0q834', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnai9iv0005fh6f00n4pfpx6', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MACARRÃO C/ ERVILHA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1', 'cmnai9iv0005dh6f0duvu186a', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnai9iv0005gh6f06jbeff24', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MACARRÃO C/ ERVILHA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1', 'cmnai9iv0005dh6f0duvu186a', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnailnyw005sh6f02gwz8gzo', 1, NULL, 16.77, '', 'cmnailnyw005qh6f0vc9rj4ra', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 16.77),
('cmnailnyw005th6f0yt96i34p', 1, NULL, 14.62, '', 'cmnailnyw005qh6f0vc9rj4ra', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 14.62),
('cmnailnyw005uh6f02xnmd61j', 1, NULL, 25, '', 'cmnailnyw005qh6f0vc9rj4ra', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnailnyw005vh6f0plcvq021', 1, NULL, 8, '', 'cmnailnyw005qh6f0vc9rj4ra', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmnailnyw005wh6f0zohtn6yi', 1, NULL, 5, '', 'cmnailnyw005qh6f0vc9rj4ra', 'cmmxhuy950042bxlkwq2ti484', 'UNIT', 5, NULL),
('cmnaip0i10062h6f06pye70fi', 1, NULL, 25.04, '', 'cmnaip0i10060h6f0ky0hi2e4', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 25.04),
('cmnaip0i10063h6f0ggbnarcu', 1, NULL, 13.9, '', 'cmnaip0i10060h6f0ky0hi2e4', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 13.9),
('cmnaip0i10064h6f0272jiqbu', 1, NULL, 19.89, '', 'cmnaip0i10060h6f0ky0hi2e4', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 19.89),
('cmnaip0i10065h6f0oglppavc', 1, NULL, 25, '', 'cmnaip0i10060h6f0ky0hi2e4', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnaip0i10066h6f0xr4k0ul4', 1, NULL, 8, '', 'cmnaip0i10060h6f0ky0hi2e4', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmnaip0i10067h6f0x7b9v6w5', 1, NULL, 5, '', 'cmnaip0i10060h6f0ky0hi2e4', 'cmmxhuy950042bxlkwq2ti484', 'UNIT', 5, NULL),
('cmnaip0i10068h6f0e4wy9bv3', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MACARRÃO C/ ERVILHA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1', 'cmnaip0i10060h6f0ky0hi2e4', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnaip0i10069h6f0lokgqfq9', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO C/ ERVILHA x1\n- MANDIOCA x1\n- POLENTA FRITA x1\n- MIX LEGUMES x1\n- MIX CHURRASCO x1', 'cmnaip0i10060h6f0ky0hi2e4', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnaip0i1006ah6f0a3sb8pgs', 1, NULL, 4.92, '', 'cmnaip0i10060h6f0ky0hi2e4', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 4.92),
('cmnaiup6q006gh6f06q3ote73', 1, NULL, 36, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MACARRÃO C/ ERVILHA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1', 'cmnaiup6q006eh6f0hhpi8mse', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, 36),
('cmnaixyzs006mh6f0xbll5y7n', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MANDIOCA x1\n- POLENTA FRITA x1\n- MACARRÃO C/ ERVILHA x1\n- MIX CHURRASCO x1', 'cmnaixyzs006kh6f0lu4rj4j7', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnaj464z006sh6f0ofy22kza', 1, NULL, 25, '', 'cmnaj464y006qh6f0sv126hy3', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnaj464z006th6f09dmowkqx', 1, NULL, 4, '', 'cmnaj464y006qh6f0sv126hy3', 'cmmxgkvjg001ibxlkngw31sr1', 'UNIT', 4, NULL),
('cmnak5yml006zh6f0g11lhr8y', 1, NULL, 5, '', 'cmnak5yml006xh6f0des2qfqa', 'cmmxhuy950042bxlkwq2ti484', 'UNIT', 5, NULL),
('cmnak5yml0070h6f0li9jam45', 1, NULL, 5, '', 'cmnak5yml006xh6f0des2qfqa', 'cmmxfz2nh000fbxlkk0utzon1', 'UNIT', 5, NULL),
('cmnak5yml0071h6f0yt6kjffa', 1, NULL, 5, '', 'cmnak5yml006xh6f0des2qfqa', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmnak5yml0072h6f0nl6yetot', 2, NULL, 80, '', 'cmnak5yml006xh6f0des2qfqa', 'cmmxgfsw40019bxlktpojbaog', 'UNIT', 40, NULL),
('cmnak5yml0073h6f0doyt0bkn', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- POLENTA FRITA x1\n- MIX LEGUMES x1', 'cmnak5yml006xh6f0des2qfqa', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnakn3t7007fh6f0ms3e5qh6', 1, NULL, 5, '', 'cmnaklfa30075h6f0od0ctxqn', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmnakonxv007lh6f0kdh2mga2', 2, NULL, 50, '', 'cmnakonxv007jh6f0fd60zwtv', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnakonxv007mh6f0aph7104x', 1, NULL, 10, '', 'cmnakonxv007jh6f0fd60zwtv', 'cmmxgcvsz000zbxlkckqo0vkx', 'UNIT', 10, NULL),
('cmnaksufb007qh6f0zqbgvd9n', 1, NULL, 29, 'Composição da marmita:\n- ARROZ x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO C/ ERVILHA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1\nObs: CAPRICHAR NAS MISTURAS', 'cmnacjc0j001sh6f02w9qy4ow', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnaksufb007rh6f0jmtwmpil', 2, NULL, 50, '', 'cmnacjc0j001sh6f02w9qy4ow', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnaksufb007sh6f09hwhs2dt', 1, NULL, 14.62, '', 'cmnacjc0j001sh6f02w9qy4ow', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 14.62),
('cmnaksufb007th6f07xxyj3mn', 1, NULL, 22.52, '', 'cmnacjc0j001sh6f02w9qy4ow', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 22.52),
('cmnaksufb007uh6f03g2asjdb', 3, NULL, 12, '', 'cmnacjc0j001sh6f02w9qy4ow', 'cmmxg6ogr000pbxlkbkmertzk', 'UNIT', 4, NULL),
('cmnaksufb007vh6f08904f55v', 3, NULL, 3, '', 'cmnacjc0j001sh6f02w9qy4ow', 'cmn4ru0mi0046g2zqe5losqc4', 'UNIT', 1, NULL),
('cmnaksufb007wh6f0b1mrjxfq', 1, NULL, 4, '', 'cmnacjc0j001sh6f02w9qy4ow', 'cmmxg372k000jbxlkds2q6i5y', 'UNIT', 4, NULL),
('cmnaksufb007xh6f08vo502g9', 1, NULL, 25, '', 'cmnacjc0j001sh6f02w9qy4ow', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnal6p660086h6f0fxqdbher', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO C/ ERVILHA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1', 'cmnal6p660084h6f0xuhgga95', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnal6p660087h6f09ol2p442', 1, NULL, 5, '', 'cmnal6p660084h6f0xuhgga95', 'cmmxfyeyu000dbxlkey66ig42', 'UNIT', 5, NULL),
('cmnalz3wy008bh6f02aog4npi', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MACARRÃO C/ ERVILHA x1\n- MANDIOCA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1', 'cmnalz3wy0089h6f0kho49ltx', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnalz3wy008ch6f0przjy2oo', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MANDIOCA x1\n- MACARRÃO C/ ERVILHA x1\n- MIX LEGUMES x1\n- POLENTA FRITA x1\n- MIX CHURRASCO x1', 'cmnalz3wy0089h6f0kho49ltx', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnd870dt000hgdg2saj8q38w', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- ABÓBORA C/ ERVILHA x1\n- ACELGA C/ BACON x1\n- PURÊ DE BATATA x1\n- MACARRÃO ALHO E OLEO x1\n- BISTECA x1\n- ISCA DE CARNE x1\n- PARMEGIANA DE FRANGO x1', 'cmnd870dt000fgdg2t8p4k905', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnd8az9m000lgdg2o0514c0p', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- PARMEGIANA DE FRANGO x1\n- ABÓBORA C/ ERVILHA x1', 'cmnd8az9m000jgdg2gbdf2vlw', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnd8dekm000pgdg2qz5z9z9o', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- PURÊ DE BATATA x1\n- ABÓBORA C/ ERVILHA x1\n- ACELGA C/ BACON x1\n- MACARRÃO ALHO E OLEO x1\n- BISTECA x1\n- ISCA DE CARNE x1\n- PARMEGIANA DE FRANGO x1', 'cmnd8dekm000ngdg2d6yfl7lr', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnd8hh5p000xgdg2tk45xmmq', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- PARMEGIANA DE FRANGO x1', 'cmnd8hh5p000vgdg20axj0hvi', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnd9d8rw0013gdg26u87dnad', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- ABÓBORA C/ ERVILHA x1\n- ACELGA C/ BACON x1\n- PURÊ DE BATATA x1\n- MACARRÃO ALHO E OLEO x1\n- PARMEGIANA DE FRANGO x1\n- ISCA DE CARNE x1\n- BISTECA x1', 'cmnd9d8rw0011gdg2sp4lcus4', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnd9sg64001cgdg22skpfnof', 1, NULL, 25, 'Composição da marmita:\n- ABÓBORA C/ ERVILHA x1\n- ACELGA C/ BACON x1\n- BISTECA x1\n- PURÊ DE BATATA x1\n- ISCA DE CARNE x1\n- PARMEGIANA DE FRANGO x1', 'cmnd9sg64001agdg2bkris40o', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnda99hv001igdg2oq6sew3l', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- ACELGA C/ BACON x1\n- ABÓBORA C/ ERVILHA x1\n- PURÊ DE BATATA x1\n- BISTECA x1\n- ISCA DE CARNE x1\n- PARMEGIANA DE FRANGO x1', 'cmnda99hv001ggdg2n42lb0e6', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmndaa6ir001mgdg2e8lax7bb', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- PURÊ DE BATATA x1\n- ACELGA C/ BACON x1\n- BISTECA x1', 'cmndaa6ir001kgdg2bx1jraeu', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmndahnwr001qgdg28ays6wt7', 1, NULL, 29, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- PURÊ DE BATATA x1\n- ABÓBORA C/ ERVILHA x1\n- ACELGA C/ BACON x1\n- BISTECA x1\n- ISCA DE CARNE x1\n- PARMEGIANA DE FRANGO x1', 'cmndahnwr001ogdg2v2ioqvsp', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmndaqtiv001ygdg2tlpo2csd', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- PURÊ DE BATATA x1\n- FAROFA x1\n- ABÓBORA C/ ERVILHA x1\n- ACELGA C/ BACON x1\n- MACARRÃO ALHO E OLEO x1\n- BISTECA x1\n- ISCA DE CARNE x1\n- PARMEGIANA DE FRANGO x1', 'cmndaqtiv001wgdg28av4edfs', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmndb3vo50022gdg2a7ki7al6', 1, NULL, 40, '', 'cmndb3vo50020gdg2adtq76zx', 'cmmxgfsw40019bxlktpojbaog', 'UNIT', 40, NULL),
('cmndb3vo50023gdg2ma03w71a', 1, NULL, 6.5, '', 'cmndb3vo50020gdg2adtq76zx', 'cmmxgf67a0017bxlk6xa8qpbi', 'UNIT', 6.5, NULL),
('cmndbgehl002ggdg2336u5tzn', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- ACELGA C/ BACON x1\n- ABÓBORA C/ ERVILHA x1\n- PURÊ DE BATATA x1\n- MACARRÃO ALHO E OLEO x1\n- ISCA DE CARNE x1', 'cmndbdkoa0029gdg2lsp27tae', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmndbgehl002hgdg2h3tcdr9r', 1, NULL, 7, '', 'cmndbdkoa0029gdg2lsp27tae', 'cmmxgc1px000xbxlkivkx1j4g', 'UNIT', 7, NULL),
('cmndbmth9002rgdg2gs5wqyme', 1, NULL, 25, '', 'cmndbmh87002ngdg26wkmw7t5', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmndbmth9002sgdg22oela6j3', 1, NULL, 3, '', 'cmndbmh87002ngdg26wkmw7t5', 'cmmxg69nt000nbxlk7omoe0uq', 'UNIT', 3, NULL),
('cmndbmth9002tgdg2lz346mno', 1, NULL, 1, '', 'cmndbmh87002ngdg26wkmw7t5', 'cmn4ru0mi0046g2zqe5losqc4', 'UNIT', 1, NULL),
('cmndbrcpx002xgdg2x730udtw', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- ABÓBORA C/ ERVILHA x1\n- ACELGA C/ BACON x1\n- BISTECA x1\n- ISCA DE CARNE x1', 'cmndbrcpx002vgdg2yuqvms3y', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmndbtblh0031gdg2hrlt24mp', 1, NULL, 25, 'Composição da marmita:\n- ABÓBORA C/ ERVILHA x1', 'cmndbtblh002zgdg2idi6udha', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmndc722v0037gdg2m6m854qv', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- ACELGA C/ BACON x1\n- ABÓBORA C/ ERVILHA x1\n- MACARRÃO ALHO E OLEO x1\n- PURÊ DE BATATA x1\n- BISTECA x1\n- ISCA DE CARNE x1\n- PARMEGIANA DE FRANGO x1', 'cmndc722v0035gdg25h89cg6e', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmndc722v0038gdg24anmi6cz', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- ABÓBORA C/ ERVILHA x1\n- ACELGA C/ BACON x1\n- MACARRÃO ALHO E OLEO x1\n- PURÊ DE BATATA x1\n- BISTECA x1\n- ISCA DE CARNE x1\n- PARMEGIANA DE FRANGO x1', 'cmndc722v0035gdg25h89cg6e', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmndc722v0039gdg2hdrzun87', 1, NULL, 5, '', 'cmndc722v0035gdg25h89cg6e', 'cmmxfyeyu000dbxlkey66ig42', 'UNIT', 5, NULL),
('cmndc722v003agdg231q5x1k2', 1, NULL, 4, '', 'cmndc722v0035gdg25h89cg6e', 'cmmxg372k000jbxlkds2q6i5y', 'UNIT', 4, NULL),
('cmndcigu4003egdg2qsagmytr', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO ALHO E OLEO x1\n- PURÊ DE BATATA x1\n- PARMEGIANA DE FRANGO x1', 'cmndcigu4003cgdg2f56c5sua', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmndd9t3s003mgdg23dfed6i8', 1, NULL, 120, '', 'cmndd9t3s003kgdg2fmyncrgc', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 120),
('cmnddky6p003sgdg2iy7kuawm', 1, NULL, 5, '', 'cmndd44lh003ggdg2etvdxhvd', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmnddky6p003tgdg2wiokxrab', 1, NULL, 21, '', 'cmndd44lh003ggdg2etvdxhvd', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnepstpl000lhijdlv4uyxwr', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- BRÓCOLIS C/ CENOURA x1\n- OMELETE DE FORNO x1\n- QUIABO x1\n- CARNE DE PANELA x1\n- ESCONDIDINHO DE CARNE x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnepstpl000jhijdjvfi9enq', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnepviz9000thijduxixb650', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- BRÓCOLIS C/ CENOURA x1\n- OMELETE DE FORNO x1\n- QUIABO x1\n- CARNE DE PANELA x1\n- ESCONDIDINHO DE CARNE x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnepv9c8000phijdmufikfba', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnepxg0p000xhijdctcfl9ez', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OMELETE DE FORNO x1\n- ESCONDIDINHO DE CARNE x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnepxg0p000vhijde8zjbnn4', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnepxg0p000yhijd9fy00dsi', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- BRÓCOLIS C/ CENOURA x1\n- FAROFA x1\n- OMELETE DE FORNO x1\n- ESCONDIDINHO DE CARNE x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnepxg0p000vhijde8zjbnn4', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmneq00dy0017hijdymfhbuip', 2, NULL, 6, '', 'cmneq00dy0015hijd4tv39u3z', 'cmmxg69nt000nbxlk7omoe0uq', 'UNIT', 3, NULL),
('cmneq77vv001fhijdvhznbwnt', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- BRÓCOLIS C/ CENOURA x1\n- FAROFA x1\n- FEIJÃO x1\n- OMELETE DE FORNO x1\n- QUIABO x1\n- CARNE DE PANELA x1\n- ESCONDIDINHO DE CARNE x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmneq77vv001dhijdrtby1b7f', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmneq77vv001ghijd6wugu6ei', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- BRÓCOLIS C/ CENOURA x1\n- FAROFA x1\n- FEIJÃO x1\n- OMELETE DE FORNO x1\n- QUIABO x1\n- ESCONDIDINHO DE CARNE x1\n- FILÉ DE FRANGO GRELHADO x1\n- CARNE DE PANELA x1', 'cmneq77vv001dhijdrtby1b7f', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmneq7vsy001mhijd346my10g', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- BRÓCOLIS C/ CENOURA x1\n- OMELETE DE FORNO x1\n- QUIABO x1\n- CARNE DE PANELA x1\n- ESCONDIDINHO DE CARNE x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmneq7vsy001khijds5371mto', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmner1z9u001shijd6wcsfxy6', 1, NULL, 4, '', 'cmner1z9u001qhijdlw00b2jb', 'cmmxg6ogr000pbxlkbkmertzk', 'UNIT', 4, NULL),
('cmner1z9u001thijd048wqfrc', 1, NULL, 12, '', 'cmner1z9u001qhijdlw00b2jb', 'cmmxh2k2o0023bxlkl7kim6kh', 'UNIT', 12, NULL),
('cmner702u001xhijd8cycfal5', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FILÉ DE FRANGO GRELHADO x1\n- OMELETE DE FORNO x1\n[EXTRA] SALADA DE ALFACE | 0.00\n[EXTRA] SALADA DE RUCULA | 0.00', 'cmner702u001vhijdv2fzbrum', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmner96sp0021hijdg0zjt4wt', 1, NULL, 21, 'Composição da marmita:\n- FILÉ DE FRANGO GRELHADO x1\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OMELETE DE FORNO x1', 'cmner96sp001zhijdsxt610lk', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmner96sp0022hijdsdcm2o52', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- OMELETE DE FORNO x1\n- FAROFA x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmner96sp001zhijdsxt610lk', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnerdho5002ehijdldg4ym47', 1, NULL, 14, '', 'cmnerddgd002ahijdnzp2bjtj', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 14),
('cmnerdho5002fhijdlum6vpcf', 1, NULL, 5, '', 'cmnerddgd002ahijdnzp2bjtj', 'cmmxhuy950042bxlkwq2ti484', 'UNIT', 5, NULL),
('cmnergsbo002qhijdac5zb70j', 1, NULL, 29.95, '', 'cmneres2n002hhijd27sp783g', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 29.95),
('cmnergsbo002rhijdny6n89za', 1, NULL, 5, '', 'cmneres2n002hhijd27sp783g', 'cmmxhuy950042bxlkwq2ti484', 'UNIT', 5, NULL),
('cmneriqay002vhijdckz15uxg', 1, NULL, 25, '', 'cmneriqay002thijdez40yd1g', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmneriqay002whijd6g18w4oo', 1, NULL, 5, '', 'cmneriqay002thijdez40yd1g', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmnerr7ef002yhijdgzf5zfw9', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- BRÓCOLIS C/ CENOURA x1\n- OMELETE DE FORNO x1\n- QUIABO x1\n- CARNE DE PANELA x1\n- ESCONDIDINHO DE CARNE x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnerc8pc0024hijd5vez7sz6', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnerr7ef002zhijdjwnqunxo', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- BRÓCOLIS C/ CENOURA x1\n- OMELETE DE FORNO x1\n- QUIABO x1\n- CARNE DE PANELA x1\n- ESCONDIDINHO DE CARNE x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnerc8pc0024hijd5vez7sz6', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnerr7ef0030hijdidgj92wj', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- BRÓCOLIS C/ CENOURA x1\n- OMELETE DE FORNO x1\n- QUIABO x1\n- CARNE DE PANELA x1\n- ESCONDIDINHO DE CARNE x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnerc8pc0024hijd5vez7sz6', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnerr7ef0031hijdx6ufmxod', 1, NULL, 8, '', 'cmnerc8pc0024hijd5vez7sz6', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmnes0mg1003phijdmgoblnfj', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- BRÓCOLIS C/ CENOURA x1\n- OMELETE DE FORNO x1\n- QUIABO x1\n- CARNE DE PANELA x1\n- ESCONDIDINHO DE CARNE x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnervx59003ahijdhsnef0bl', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnes0mg1003qhijdska1imb7', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OMELETE DE FORNO x1\n- CARNE DE PANELA x1\n- ESCONDIDINHO DE CARNE x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnervx59003ahijdhsnef0bl', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnes0mg1003rhijdl6i09dbz', 1, NULL, 8, '', 'cmnervx59003ahijdhsnef0bl', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmnes7oc00045hijd59ivzab5', 1, NULL, 22.4, '', 'cmnertc1q0035hijd0qa62tqr', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 22.4),
('cmnes7oc00046hijdf8b4yast', 1, NULL, 15.09, '', 'cmnertc1q0035hijd0qa62tqr', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 15.09),
('cmnes7oc00047hijdxc4g9may', 1, NULL, 5, '', 'cmnertc1q0035hijd0qa62tqr', 'cmnes6hcw003vhijd8bbqxxog', 'UNIT', 5, NULL),
('cmnesmemj004ihijdmeoky80j', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OMELETE DE FORNO x1\n- CARNE DE PANELA x1\n- ESCONDIDINHO DE CARNE x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnesmemj004ghijd30x9h09z', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnesmemj004jhijdv36gsm4h', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OMELETE DE FORNO x1\n- CARNE DE PANELA x1\n- ESCONDIDINHO DE CARNE x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnesmemj004ghijd30x9h09z', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnesqyjx004vhijdpde17brf', 1, NULL, 28.39, '[EXTRA] OVO FRITO | 2.00', 'cmnespy4r004lhijdyyfh6d74', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 61.9, 28.39),
('cmnesqyjx004whijdvgexnlv4', 1, NULL, 20.73, '', 'cmnespy4r004lhijdyyfh6d74', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 20.73),
('cmnesqyjx004xhijdjh641rkk', 1, NULL, 5, '', 'cmnespy4r004lhijdyyfh6d74', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmng4glkp0008efj7r5upsh2a', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- BATATA GRATINADA x1\n- CENOURA SAUTÉ x1\n- FAROFA x1\n- FEIJÃO x1\n- REPOLHO REFOGADO x1\n- FRANGO À PASSARINHO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1', 'cmng4fgq80001efj7g1rkxkoh', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmng4glkp0009efj7lvwguniw', 3, NULL, 63, '', 'cmng4fgq80001efj7g1rkxkoh', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmng4glkp000aefj7agn29m0v', 1, NULL, 25, '', 'cmng4fgq80001efj7g1rkxkoh', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmng4glkp000befj7yce17zjm', 1, NULL, 29, '', 'cmng4fgq80001efj7g1rkxkoh', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmng4lwzz000fefj7ob7ci5oh', 1, NULL, 29, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- BATATA GRATINADA x1\n- CENOURA SAUTÉ x1\n- REPOLHO REFOGADO x1\n- FRANGO À PASSARINHO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1', 'cmng4lwzy000defj7t0qnbe2y', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmng4ptdi000lefj7xstzlrtv', 1, NULL, 29, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- BATATA GRATINADA x1\n- CENOURA SAUTÉ x1\n- REPOLHO REFOGADO x1\n- FRANGO À PASSARINHO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1', 'cmng4nsbq000hefj7lvd414vg', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmng4ptdi000mefj727a5b87t', 1, NULL, 5, '', 'cmng4nsbq000hefj7lvd414vg', 'cmmxfyeyu000dbxlkey66ig42', 'UNIT', 5, NULL),
('cmng51nz8000wefj7ecqqadp4', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- BATATA GRATINADA x1\n- CENOURA SAUTÉ x1\n- FAROFA x1\n- FEIJÃO x1\n- REPOLHO REFOGADO x1\n- FRANGO À PASSARINHO x1\n- PEIXE FRITO x1\n- LASANHA À BOLONHESA x1', 'cmng51nz8000uefj7vrnzsxwz', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmng5279d0012efj7sg9ivvoz', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- BATATA GRATINADA x1\n- CENOURA SAUTÉ x1\n- FAROFA x1\n- FEIJÃO x1\n- FRANGO À PASSARINHO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1', 'cmng5279d0010efj7gc171z2r', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmng5425i0018efj7tlbxb2p5', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- CENOURA SAUTÉ x1\n- BATATA GRATINADA x1\n- REPOLHO REFOGADO x1\n- FRANGO À PASSARINHO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1', 'cmng5425i0016efj71od20dm9', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmng55mdq001cefj7tfv8fomh', 1, NULL, 29, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- CENOURA SAUTÉ x1\n- REPOLHO REFOGADO x1\n- PEIXE FRITO x1\n- LASANHA À BOLONHESA x1\n- FRANGO À PASSARINHO x1', 'cmng55mdq001aefj72wsxk6ro', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmng56hp7001gefj7xc384ovm', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- CENOURA SAUTÉ x1\n- BATATA GRATINADA x1\n- REPOLHO REFOGADO x1\n- FRANGO À PASSARINHO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1', 'cmng56hp7001eefj7lukm69nw', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmng5eh77001kefj7peshwslp', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- BATATA GRATINADA x1\n- CENOURA SAUTÉ x1\n- FAROFA x1\n- REPOLHO REFOGADO x1\n- FRANGO À PASSARINHO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1', 'cmng5eh77001iefj7opqiul6c', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmng5eh77001lefj70jpgza3j', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- BATATA GRATINADA x1\n- CENOURA SAUTÉ x1\n- FAROFA x1\n- REPOLHO REFOGADO x1\n- FRANGO À PASSARINHO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1', 'cmng5eh77001iefj7opqiul6c', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmng5u2f60028efj7igoc8i1d', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- BATATA GRATINADA x1\n- REPOLHO REFOGADO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1\n- FRANGO À PASSARINHO x1\n[EXTRA] SEM BACON | 0.00\n[EXTRA] SEM PRESUNTO | 0.00', 'cmng5jji2001xefj7cpqk5ffo', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmng5xcw7002gefj7unk3m18u', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FAROFA x1\n- BATATA GRATINADA x1\n- CENOURA SAUTÉ x1\n- FRANGO À PASSARINHO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1', 'cmng5v2n9002aefj7addf5n75', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmng60cxa002kefj7nekx252o', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- BATATA GRATINADA x1\n- LASANHA À BOLONHESA x1', 'cmng60cxa002iefj7kwlrg7lg', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmng6b8y2002qefj7dafz32lb', 1, NULL, 29, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- CENOURA SAUTÉ x1\n- BATATA GRATINADA x1\n- REPOLHO REFOGADO x1\n- PEIXE FRITO x1\n- LASANHA À BOLONHESA x1\n- FRANGO À PASSARINHO x1', 'cmng6b8y2002oefj7ere3b8gg', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmng6ehta002uefj7e5l72sxn', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- BATATA GRATINADA x1\n- CENOURA SAUTÉ x1\n- FAROFA x1\n- FRANGO À PASSARINHO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1', 'cmng6ehta002sefj73yx22vm3', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmng6w88f002yefj71ce580bf', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- CENOURA SAUTÉ x1\n- BATATA GRATINADA x1\n- REPOLHO REFOGADO x1\n- FRANGO À PASSARINHO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1', 'cmng6w88f002wefj7y4msoh0n', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmng705o20032efj7b6x5vxi3', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1\n- REPOLHO REFOGADO x1\n- BATATA GRATINADA x1\n- CENOURA SAUTÉ x1\n- FAROFA x1', 'cmng705o20030efj7fn2qnw3l', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmng728ul0036efj7wwtx6w33', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- PEIXE FRITO x1\n- REPOLHO REFOGADO x1', 'cmng728ul0034efj7ak6hi1lc', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmng776oh003aefj70ddhaega', 1, NULL, 0, '', 'cmng776oh0038efj7g5ouslro', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, NULL),
('cmng776oh003befj7gss4k9ig', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- BATATA GRATINADA x1\n- PEIXE FRITO x1\n- LASANHA À BOLONHESA x1', 'cmng776oh0038efj7g5ouslro', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmng79653003fefj7vosav4ma', 1, NULL, 29, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- CENOURA SAUTÉ x1\n- BATATA GRATINADA x1\n- REPOLHO REFOGADO x1\n- FRANGO À PASSARINHO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1', 'cmng79653003defj7s3zdx30l', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmng7f2p4003nefj7fgubiv2z', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- BATATA GRATINADA x1\n- CENOURA SAUTÉ x1\n- FAROFA x1\n- FEIJÃO x1\n- REPOLHO REFOGADO x1\n- FRANGO À PASSARINHO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1', 'cmng7f2p4003lefj7xnjcckgt', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmng7f2p4003oefj74vgpiw0o', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- BATATA GRATINADA x1\n- CENOURA SAUTÉ x1\n- FAROFA x1\n- FEIJÃO x1\n- REPOLHO REFOGADO x1\n- FRANGO À PASSARINHO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1', 'cmng7f2p4003lefj7xnjcckgt', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmng7ggrc003sefj7uxkokpv8', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- BATATA GRATINADA x1\n- PEIXE FRITO x1', 'cmng7ggrc003qefj76k3rtut3', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmng7ggrc003tefj7bu4g3oqp', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- BATATA GRATINADA x1\n- CENOURA SAUTÉ x1\n- PEIXE FRITO x1', 'cmng7ggrc003qefj76k3rtut3', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmng7l8b1003xefj7py2wpa23', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- CENOURA SAUTÉ x1\n- BATATA GRATINADA x1\n- REPOLHO REFOGADO x1\n- FRANGO À PASSARINHO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1', 'cmng7l8b1003vefj717vgepo9', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmng7osc20041efj7uleks5gq', 1, NULL, 16.85, '', 'cmng7osc2003zefj7g5elhlbl', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 16.85),
('cmng7osc20042efj7bo9hrg1b', 1, NULL, 29.16, '', 'cmng7osc2003zefj7g5elhlbl', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 29.16),
('cmng7osc20043efj7d6k52543', 1, NULL, 21.6, '', 'cmng7osc2003zefj7g5elhlbl', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 21.6),
('cmng7osc20044efj7mqb5f9ho', 1, NULL, 12.46, '', 'cmng7osc2003zefj7g5elhlbl', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 12.46),
('cmng7osc20045efj727hw055k', 1, NULL, 8, '', 'cmng7osc2003zefj7g5elhlbl', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmng7osc20046efj7b4m8aln7', 1, NULL, 1, '', 'cmng7osc2003zefj7g5elhlbl', 'cmn4ru0mi0046g2zqe5losqc4', 'UNIT', 1, NULL),
('cmng88mlx0048efj7xgklydi2', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- CENOURA SAUTÉ x1\n- BATATA GRATINADA x1\n- REPOLHO REFOGADO x1\n- FRANGO À PASSARINHO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1', 'cmng7cfg6003hefj7umpgi70r', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmng88mlx0049efj76kpkcoqa', 1, NULL, 8, '', 'cmng7cfg6003hefj7umpgi70r', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmng8jzl8004pefj790wfw02s', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- BATATA GRATINADA x1\n- CENOURA SAUTÉ x1\n- REPOLHO REFOGADO x1\n- FRANGO À PASSARINHO x1\n- LASANHA À BOLONHESA x1\n- PEIXE FRITO x1', 'cmng8hmp9004fefj7psdjb4wq', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmng8jzl8004qefj77xfky4pe', 1, NULL, 29, '', 'cmng8hmp9004fefj7psdjb4wq', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmng8jzl8004refj79ighf6va', 1, NULL, 8, '', 'cmng8hmp9004fefj7psdjb4wq', 'cmnes66ki003thijdyx8mg5ct', 'UNIT', 8, NULL),
('cmng8psk00055efj76oi5sd5f', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- CENOURA SAUTÉ x1\n- BATATA GRATINADA x1\n- REPOLHO REFOGADO x1\n- PEIXE FRITO x1\n- LASANHA À BOLONHESA x1', 'cmng8psk00053efj7g3tizsrf', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnhjcx5m000htr3b54gblvwq', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJOADA x1\n- COUVE x1\n- FAROFA x1\n- TORRESMO x1\n- LARANJA x1', 'cmnhjcx5m000ftr3b3icw5c6l', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnhjcx5m000itr3b082kti0y', 1, NULL, 25, 'Composição da marmita:\n- MACARRÃO AO SUGO x1\n- CHUCHU x1\n- COUVE x1\n- FRANGO GRELHADO x1', 'cmnhjcx5m000ftr3b3icw5c6l', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnhjmxi5000mtr3bns9hq8qo', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJOADA x1\n- COUVE x1\n- FAROFA x1\n- LARANJA x1\n- TORRESMO x1', 'cmnhjmxi5000ktr3bmy253onp', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnhjv80g000utr3btixfi1rq', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJOADA x1\n- COUVE x1\n- FAROFA x1\n- LARANJA x1\n- TORRESMO x1', 'cmnhjv80g000str3bnmh3cxze', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnhk1ge10010tr3ba1xpjejt', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- MACARRÃO AO SUGO x1\n- FRITAS x1\n- COUVE x1\n- FRANGO GRELHADO x1', 'cmnhk1ge0000ytr3bqycouk3d', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnhkdihc0014tr3boulxdas4', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- COUVE x1\n- CHUCHU x1\n- FAROFA x1\n- FRITAS x1\n- MACARRÃO AO SUGO x1\n- TORRESMO x1\n- FEIJOADA x1', 'cmnhkdihb0012tr3by8eixf19', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnhkqku2001ctr3b29dlktgq', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJOADA x1\n- FAROFA x1\n- LARANJA x1\n- TORRESMO x1\n- COUVE x1', 'cmnhkqku2001atr3bbioccqb4', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnhl6oo0001ptr3bdkjgmas7', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJOADA x1\n- COUVE x1\n- FAROFA x1\n- TORRESMO x1\n- LARANJA x1\n[EXTRA] 1 PEDAÇO DE FRANGO | 0.00', 'cmnhks20h001etr3bmr9ilkq9', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnhl6oo0001qtr3bzirj9zfn', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJOADA x1\n- FAROFA x1\n- COUVE x1\n- TORRESMO x1\n- LARANJA x1\n[EXTRA] 1 PEDAÇO DE FRANGO | 0.00', 'cmnhks20h001etr3bmr9ilkq9', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnhl6oo0001rtr3bhe2y0aqs', 1, NULL, 8, '', 'cmnhks20h001etr3bmr9ilkq9', 'cmnes66ki003thijdyx8mg5ct', 'UNIT', 8, NULL),
('cmnhm4wxt0020tr3br9y58cf8', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- COUVE x1\n- FRITAS x1\n- FEIJOADA x1\n- FRANGO GRELHADO x1', 'cmnhm4wxt001ytr3bhftth5hr', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnhmac8b0026tr3btivmzhqy', 1, NULL, 25, 'Composição da marmita:\n- FEIJOADA x1\n- TORRESMO x1', 'cmnhmac8b0024tr3bwx51o8fd', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnhmknq7002ctr3buhaz0dv7', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- CHUCHU x1\n- COUVE x1\n- FRITAS x1\n- MACARRÃO AO SUGO x1\n- FRANGO GRELHADO x1', 'cmnhmknq7002atr3bhs1xc6p3', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnhmmqpe002itr3bvm8s4q0s', 1, NULL, 10.78, '', 'cmnhmmlg9002etr3bhn4jky3d', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 10.78),
('cmnhmmqpe002jtr3buzpoli5l', 1, NULL, 4, '', 'cmnhmmlg9002etr3bhn4jky3d', 'cmmxgkvjg001ibxlkngw31sr1', 'UNIT', 4, NULL),
('cmnhmrbus002wtr3b6rixkall', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJOADA x1\n- COUVE x1\n- FAROFA x1\n- LARANJA x1\n- TORRESMO x1', 'cmnhmp5mv002qtr3b6gzotezd', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnhmrbus002xtr3bbnbotugg', 1, NULL, 5, '', 'cmnhmp5mv002qtr3b6gzotezd', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmnhmszji0032tr3bso5a4p4d', 1, NULL, 16.41, '', 'cmnhmoguc002ltr3bujjl5rr2', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 16.41),
('cmnhmszji0033tr3b3bymxfv7', 1, NULL, 16.17, '', 'cmnhmoguc002ltr3bujjl5rr2', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 16.17),
('cmnhmszji0034tr3btnftb77o', 1, NULL, 4, '', 'cmnhmoguc002ltr3bujjl5rr2', 'cmmxg6ogr000pbxlkbkmertzk', 'UNIT', 4, NULL),
('cmnhmszji0035tr3bsnkiw4n5', 2, NULL, 2, '', 'cmnhmoguc002ltr3bujjl5rr2', 'cmn4ru0mi0046g2zqe5losqc4', 'UNIT', 1, NULL),
('cmnhmu4po0039tr3blzzfaro4', 1, NULL, 25, '', 'cmnhmu4pn0037tr3bvjrpgtsr', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnhmu4po003atr3b4ufko2cm', 1, NULL, 4, '', 'cmnhmu4pn0037tr3bvjrpgtsr', 'cmmxg70pt000rbxlkrtk49bgt', 'UNIT', 4, NULL),
('cmnhn0dm2003etr3b4k9ieo1f', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJOADA x1\n- COUVE x1\n- FAROFA x1\n- LARANJA x1\n- TORRESMO x1', 'cmnhn0dm2003ctr3bxx7feo35', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnhno5r8003qtr3b1jbdu0b3', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FRITAS x1\n- FRANGO GRELHADO x1', 'cmnhnfk87003ktr3b385a82fj', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnhno5r8003rtr3bcryg4wtf', 1, NULL, 3, '', 'cmnhnfk87003ktr3b385a82fj', 'cmmxg69nt000nbxlk7omoe0uq', 'UNIT', 3, NULL),
('cmnhno5r8003str3b7i3axn9l', 1, NULL, 5, '', 'cmnhnfk87003ktr3b385a82fj', 'cmmxhuy950042bxlkwq2ti484', 'UNIT', 5, NULL),
('cmnhop8xf003wtr3b3exvf7pe', 1, NULL, 21, 'Composição da marmita:\n- FEIJOADA x1', 'cmnhop8xf003utr3bh7wsa0s4', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnhop8xf003xtr3bmzfqez35', 1, NULL, 25, 'Composição da marmita:\n- FEIJOADA x1', 'cmnhop8xf003utr3bh7wsa0s4', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnket1p600095c8b51202l2y', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- BATATA FRITA x1\n- BERINGELA x1\n- FEIJÃO x1\n- FAROFA x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnket1p600075c8bheqjmu3r', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnket1p6000a5c8bcf9ait0z', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- BATATA FRITA x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnket1p600075c8bheqjmu3r', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnketfcp000e5c8bz0r4z4yk', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- BATATA FRITA x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnketfcp000c5c8b51nqh0ge', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnkeuraz000i5c8b86obbgrc', 1, NULL, 29, 'Composição da marmita:\n- ARROZ x1\n- BATATA FRITA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkeuraz000g5c8beofe8qjm', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnkeuraz000j5c8bx0lw1zvi', 1, NULL, 29, 'Composição da marmita:\n- ARROZ x1\n- BATATA FRITA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkeuraz000g5c8beofe8qjm', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnkf077y000n5c8b8y49ktqs', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- BERINGELA x1\n- BATATA FRITA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkf077y000l5c8bv1920j7r', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkf077y000o5c8b18s9r5s8', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- BATATA FRITA x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkf077y000l5c8bv1920j7r', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkf077y000p5c8bb04a5vra', 1, NULL, 6.5, '', 'cmnkf077y000l5c8bv1920j7r', 'cmmxgwoyg001rbxlksrpbed26', 'UNIT', 6.5, NULL),
('cmnkf6fbb000z5c8bt0v0k194', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- BATATA FRITA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO BOLONHESA x1\n- MIX CHURRASCO x1\n- MANDIOCA x1', 'cmnkf2i5h000r5c8bpvtzdn32', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkf6fbb00105c8b33z4ypmf', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkf2i5h000r5c8bpvtzdn32', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkf6fbb00115c8byntssma1', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- BERINGELA x1\n- BATATA FRITA x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkf2i5h000r5c8bpvtzdn32', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkf6fbb00125c8budzf3az8', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- BERINGELA x1\n- BATATA FRITA x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkf2i5h000r5c8bpvtzdn32', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnkf6fbb00135c8boryllf9m', 1, NULL, 14, '', 'cmnkf2i5h000r5c8bpvtzdn32', 'cmmxghmnu001dbxlkdldqvqy3', 'UNIT', 14, NULL),
('cmnkf6fbb00145c8b0vnu3his', 1, NULL, 5, '', 'cmnkf2i5h000r5c8bpvtzdn32', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmnkf8pij00185c8b6e8vlyva', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- BERINGELA x1\n- MIX CHURRASCO x1', 'cmnkf8pij00165c8bkrixznoa', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkf8pij00195c8b3ba14jnf', 1, NULL, 5, '', 'cmnkf8pij00165c8bkrixznoa', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmnkfe3ak001f5c8b4l1odmu7', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- BATATA FRITA x1\n- MANDIOCA x1\n- MACARRÃO BOLONHESA x1\n- MIX CHURRASCO x1', 'cmnkfe3aj001d5c8bi3nfzgqn', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnkfe3ak001g5c8bomdg49k4', 1, NULL, 10, '', 'cmnkfe3aj001d5c8bi3nfzgqn', 'cmmxgcvsz000zbxlkckqo0vkx', 'UNIT', 10, NULL),
('cmnkfg8lu001k5c8bwkb1bnw3', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- BATATA FRITA x1\n- BERINGELA x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkfg8lu001i5c8b9dv6jebv', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnkfiewy001o5c8bd4xih8sa', 1, NULL, 29, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- BERINGELA x1\n- BATATA FRITA x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkfiewy001m5c8bwuztkkph', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnkfvc3500215c8bbt3a3ly1', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- BATATA FRITA x1\n- BERINGELA x1\n- MANDIOCA x1\n- MACARRÃO BOLONHESA x1\n- MIX CHURRASCO x1', 'cmnkfvc35001z5c8bx9kg6d3t', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkfvc3500225c8b2xxstewn', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- BERINGELA x1\n- BATATA FRITA x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkfvc35001z5c8bx9kg6d3t', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkgrtgb002a5c8bch6d8u4s', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- BATATA FRITA x1\n- BERINGELA x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkgrtgb00285c8b6cnwg5hj', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkgrtgb002b5c8b5wgdi0kd', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- BATATA FRITA x1\n- BERINGELA x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkgrtgb00285c8b6cnwg5hj', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnkgwcuc002f5c8b824anvzc', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- BERINGELA x1\n- BATATA FRITA x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkgwcuc002d5c8bvxdrmxyo', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkgwcuc002g5c8bb8ns7aoe', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- BERINGELA x1\n- BATATA FRITA x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkgwcuc002d5c8bvxdrmxyo', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkgwtyt002k5c8bad5ybmbh', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- BATATA FRITA x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkgwtyt002i5c8bq63jivan', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkh4b63002o5c8b41nj5q3s', 1, NULL, 29, 'Composição da marmita:\n- FEIJÃO x1', 'cmnkh4b63002m5c8bcqo4bd11', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnkh9xth002s5c8b6ojz4je4', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- BATATA FRITA x1\n- MANDIOCA x1\n- BERINGELA x1\n- MIX CHURRASCO x1', 'cmnkh9xtg002q5c8bwp0g2pai', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkh9xth002t5c8b4e3gmrqo', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- BATATA FRITA x1\n- BERINGELA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkh9xtg002q5c8bwp0g2pai', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkhc8vi002x5c8bkymonzpf', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FAROFA x1\n- BERINGELA x1\n- BATATA FRITA x1\n- FEIJÃO x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkhc8vi002v5c8by36pgd9b', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnkhqsvb00315c8be6yc0qph', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- BATATA FRITA x1\n- MANDIOCA x1\n- MACARRÃO BOLONHESA x1\n- FAROFA x1\n- BERINGELA x1\n- MIX CHURRASCO x1', 'cmnkhqsvb002z5c8b2d2objft', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkhqsvb00325c8bkr4ueu2e', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- BATATA FRITA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkhqsvb002z5c8b2d2objft', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnkhu5rl00365c8bhq9j6eat', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- BATATA FRITA x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1', 'cmnkhu5rl00345c8bdveiq0li', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnki24gk003a5c8b6enabbmz', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- BERINGELA x1\n- BATATA FRITA x1\n- MANDIOCA x1\n- MACARRÃO BOLONHESA x1\n- MIX CHURRASCO x1', 'cmnki24gk00385c8bxp3clay9', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnkilzpm003x5c8bivipnp5a', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- BERINGELA x1\n- BATATA FRITA x1', 'cmnkilloj003r5c8bnz2izcxf', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkilzpm003y5c8balxhpynl', 1, NULL, 21, 'Composição da marmita:\n- FEIJÃO x1\n- FAROFA x1\n- BERINGELA x1\n- BATATA FRITA x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1\n[EXTRA] JILO | 0.00', 'cmnkilloj003r5c8bnz2izcxf', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkilzpm003z5c8bplrrmiep', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- BERINGELA x1\n- BATATA FRITA x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1\n[EXTRA] JILO | 0.00', 'cmnkilloj003r5c8bnz2izcxf', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkis940004h5c8bfn1s0fsu', 5, NULL, 200, '', 'cmnkfo3q8001q5c8bspkb4gxh', 'cmmxgfsw40019bxlktpojbaog', 'UNIT', 40, NULL),
('cmnkis940004i5c8brr7tl0ez', 2, NULL, 16, '', 'cmnkfo3q8001q5c8bspkb4gxh', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmnkis940004j5c8b2o9zlavl', 1, NULL, 4, '', 'cmnkfo3q8001q5c8bspkb4gxh', 'cmmxg6ogr000pbxlkbkmertzk', 'UNIT', 4, NULL),
('cmnkis940004k5c8b3jdc5ghh', 1, NULL, 5, '', 'cmnkfo3q8001q5c8bspkb4gxh', 'cmmxgi7hz001fbxlkeozpyogx', 'UNIT', 5, NULL),
('cmnkivvq5004q5c8bizwpuvdd', 2, NULL, 50, '', 'cmnkivvq5004o5c8bjvrg6dut', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL);
INSERT INTO `orderitem` (`id`, `quantity`, `weight`, `price`, `notes`, `orderId`, `productId`, `saleType`, `unitPrice`, `manualPrice`) VALUES
('cmnkivvq5004r5c8balmg0yl8', 2, NULL, 10, '', 'cmnkivvq5004o5c8bjvrg6dut', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmnkiyxmz004x5c8b14vrteqs', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- BATATA FRITA x1\n- FAROFA x1\n- MACARRÃO BOLONHESA x1\n- MANDIOCA x1\n- MIX CHURRASCO x1\nObs: SOMENTE CARNE', 'cmnkiyxmz004v5c8bz9grcayn', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnkkoc3j000a6ptycrbl33cm', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1', 'cmnkkoc3j00086ptymmz68hrk', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnkkoc3j000b6ptyhjnrkamf', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1', 'cmnkkoc3j00086ptymmz68hrk', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnkkoyz7000f6pty6ao0glgu', 1, NULL, 25, '', 'cmnkkoyz7000d6ptyfnf33nov', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnkkoyz7000g6pty5kknodcq', 1, NULL, 12.46, '', 'cmnkkoyz7000d6ptyfnf33nov', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 12.46),
('cmnkkoyz7000h6ptypwnhi7oy', 2, NULL, 10, '', 'cmnkkoyz7000d6ptyfnf33nov', 'cmmxhuy950042bxlkwq2ti484', 'UNIT', 5, NULL),
('cmnnb2nb200099rpa7j4n8r6n', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- BERINGELA x1\n- ABOBRINHA x1\n- MACARRÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnnb2nb100079rpadjm7uf5f', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnnb65mw000d9rpatt063vep', 1, NULL, 25, 'Composição da marmita:\n- ABOBRINHA x1\n- ARROZ x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnnb65mw000b9rpao0rrv809', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnnb65mw000e9rpazunb8ade', 1, NULL, 25, 'Composição da marmita:\n- ABOBRINHA x1\n- ARROZ x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnnb65mw000b9rpao0rrv809', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnnb9mwv000n9rpaz7kji2rk', 1, NULL, 21, 'Composição da marmita:\n- ABOBRINHA x1\n- ARROZ x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnnb9mwv000l9rpacc2cp8fv', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnnbbyre000v9rpav98q7boq', 1, NULL, 21, 'Composição da marmita:\n- ABOBRINHA x1\n- ARROZ x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnnbbyrd000t9rpaz35zs98y', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnnbd8zp00119rpa4qbt7qvl', 1, NULL, 25, 'Composição da marmita:\n- ABOBRINHA x1\n- ARROZ x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnnbd8zo000z9rpadufm23hm', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnnc42lg00179rpau3b1qqb6', 1, NULL, 21, 'Composição da marmita:\n- ABOBRINHA x1\n- ARROZ x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnnc42lf00159rpaq8x5w3by', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnnc42lg00189rpa2831ym68', 1, NULL, 21, 'Composição da marmita:\n- ABOBRINHA x1\n- ARROZ x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnnc42lf00159rpaq8x5w3by', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnnc6bwa001c9rpalhdvekct', 1, NULL, 29, 'Composição da marmita:\n- ABOBRINHA x1\n- ARROZ x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnnc6bwa001a9rpaea14ih8z', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnnc7pt7001k9rpadb6lcfb8', 1, NULL, 25, 'Composição da marmita:\n- ABOBRINHA x1\n- ARROZ x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnnc7pt7001i9rpa0b3eo26r', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnnc7pt7001l9rpa4c02g784', 1, NULL, 25, 'Composição da marmita:\n- ABOBRINHA x1\n- ARROZ x1\n- BERINGELA x1\n- FEIJÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnnc7pt7001i9rpa0b3eo26r', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnnc90rp001r9rpac609xoks', 1, NULL, 25, 'Composição da marmita:\n- ABOBRINHA x1\n- ARROZ x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnnc90rp001p9rpa9dmyj0gt', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnncfbko001x9rpahj71l0eh', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- BERINGELA x1\n- FAROFA x1\n- MACARRÃO x1\n- ABOBRINHA x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnncfbkn001v9rpackvsanmb', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnncjgzl00219rpatkgfn2wo', 1, NULL, 21, 'Composição da marmita:\n- MACARRÃO x1\n- FRICASSÊ x1', 'cmnncjgzl001z9rpa2fb2ivol', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnnckide00279rpa6gnbbxpu', 1, NULL, 29, 'Composição da marmita:\n- ABOBRINHA x1\n- ARROZ x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnnckide00259rpabdd91d9h', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnncne6c002b9rpa8ul5l2dx', 1, NULL, 25, 'Composição da marmita:\n- ABOBRINHA x1\n- ARROZ x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnncne6c00299rpa6o57kpw9', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnncne6c002c9rpagetty6kx', 1, NULL, 25, 'Composição da marmita:\n- ABOBRINHA x1\n- ARROZ x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnncne6c00299rpa6o57kpw9', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnncpspk002i9rpae1om5wef', 1, NULL, 29, 'Composição da marmita:\n- ABOBRINHA x1\n- ARROZ x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnncpspk002g9rpamwe43sqb', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnncpspk002j9rparr8rwok6', 1, NULL, 29, 'Composição da marmita:\n- ABOBRINHA x1\n- ARROZ x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnncpspk002g9rpamwe43sqb', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnncpspk002k9rpa3ojtxun8', 1, NULL, 25, 'Composição da marmita:\n- ABOBRINHA x1\n- ARROZ x1\n- BERINGELA x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1', 'cmnncpspk002g9rpamwe43sqb', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnncuufu002q9rpavkgx56sw', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- ABOBRINHA x1\n- FAROFA x1\n- MACARRÃO x1\n- FRICASSÊ x1\n- LINGUIÇA x1\n- PICADINHO x1\n- BERINGELA x1', 'cmnncuufu002o9rparbl3ivfd', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnncvw3a002u9rpa6a3t0la1', 1, NULL, 25, '', 'cmnncvw3a002s9rpaydos0wl2', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnncvw3a002v9rpad3z4n9bg', 1, NULL, 3, '', 'cmnncvw3a002s9rpaydos0wl2', 'cmmxg69nt000nbxlk7omoe0uq', 'UNIT', 3, NULL),
('cmnncvw3a002w9rpac02306r0', 1, NULL, 1, '', 'cmnncvw3a002s9rpaydos0wl2', 'cmn4ru0mi0046g2zqe5losqc4', 'UNIT', 1, NULL),
('cmnnd0fjd00329rpaoe4vr6zk', 2, NULL, 80, '', 'cmnnd0fjd00309rpayccqiq8i', 'cmmxgfsw40019bxlktpojbaog', 'UNIT', 40, NULL),
('cmnnd0fjd00339rpamcq836kr', 1, NULL, 8, '', 'cmnnd0fjd00309rpayccqiq8i', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmnnd37n7003d9rpaxl5kwlqe', 1, NULL, 8, '', 'cmnnd37n7003b9rpad1wrriy1', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmnnd5763003l9rpa1zmilqyg', 1, NULL, 19.05, '', 'cmnnd4iqi003h9rpamrzkm5vy', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 19.05),
('cmnnd5763003m9rpab99sjj09', 1, NULL, 4, '', 'cmnnd4iqi003h9rpamrzkm5vy', 'cmmxg6ogr000pbxlkbkmertzk', 'UNIT', 4, NULL),
('cmnnd5763003n9rpa7li2w66f', 1, NULL, 1, '', 'cmnnd4iqi003h9rpamrzkm5vy', 'cmn4ru0mi0046g2zqe5losqc4', 'UNIT', 1, NULL),
('cmnnd6gw2003r9rpap844vzkd', 1, NULL, 4, '', 'cmnnd6gw2003p9rpaltzi13pu', 'cmmxg70pt000rbxlkrtk49bgt', 'UNIT', 4, NULL),
('cmnnd6gw2003s9rpanp8qw0u1', 1, NULL, 10.3, '', 'cmnnd6gw2003p9rpaltzi13pu', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 10.3),
('cmnnd6gw2003t9rpaxsqzsvb8', 1, NULL, 16.65, '', 'cmnnd6gw2003p9rpaltzi13pu', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 16.65),
('cmnnd87mh003z9rpatvq9pmf4', 1, NULL, 26.96, '', 'cmnnd87mh003x9rpacobgcheb', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 26.96),
('cmnnd87mh00409rpaot84eoz9', 1, NULL, 5, '', 'cmnnd87mh003x9rpacobgcheb', 'cmnes6hcw003vhijd8bbqxxog', 'UNIT', 5, NULL),
('cmnndhioo00469rpalu66vro9', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FRICASSÊ x1', 'cmnndhion00449rpah0h3o4vp', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnndiadf004a9rpawarno0b9', 2, NULL, 50, '', 'cmnndiadf00489rpallqmmlsb', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnndiadf004b9rpah9pgiwtw', 1, NULL, 8, '', 'cmnndiadf00489rpallqmmlsb', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmnndu8m8004l9rpadx8p6qyh', 1, NULL, 15.69, '', 'cmnndu8m8004j9rpay2zj7n48', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 15.69),
('cmnndu8m8004m9rpaq5ahrcj2', 1, NULL, 5, '', 'cmnndu8m8004j9rpay2zj7n48', 'cmmxh51en0029bxlk8niisc9p', 'UNIT', 5, NULL),
('cmnne9586004s9rpanag2b5gy', 1, NULL, 21, 'Composição da marmita:\n- ABOBRINHA x1\n- ARROZ x1\n- BERINGELA x1\n- FAROFA x1\n- FRICASSÊ x1', 'cmnne9586004q9rpajxxcyt02', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnnelb56004w9rpafr97vljv', 1, NULL, 21, 'Composição da marmita:\n- MACARRÃO x1', 'cmnnelb56004u9rpam4t5e74w', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnnelb8f00509rpancen8yq5', 1, NULL, 21, 'Composição da marmita:\n- MACARRÃO x1', 'cmnnelb8f004y9rpa1hav2wsv', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnoowzsr005c9rpafwrtbl43', 1, NULL, 29, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OVO FRITO x1\n- REPOLHO REFOGADO x1\n- VAGEM COM CENOURA x1\n- BIFE ACEBOLADO x1\n- BISTECA x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnoowzsr005a9rpafqk1vc6k', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnop026m005i9rpaca6ni85p', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OVO FRITO x1\n- REPOLHO REFOGADO x1\n- VAGEM COM CENOURA x1\n- BIFE ACEBOLADO x1\n- BISTECA x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnooxgad005e9rpas5ng2v73', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnop6qje005q9rpa9gctn2tv', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FAROFA x1\n- FEIJÃO x1\n- OVO FRITO x1\n- REPOLHO REFOGADO x1\n- VAGEM COM CENOURA x1\n- BIFE ACEBOLADO x1\n- BISTECA x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnop6qje005o9rpanxesvvnm', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnop6qje005r9rpalbrb4az6', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FAROFA x1\n- FEIJÃO x1\n- OVO FRITO x1\n- REPOLHO REFOGADO x1\n- VAGEM COM CENOURA x1\n- BIFE ACEBOLADO x1\n- BISTECA x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnop6qje005o9rpanxesvvnm', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnopliry00609rpadesl58ov', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OVO FRITO x1\n- REPOLHO REFOGADO x1\n- VAGEM COM CENOURA x1\n- BIFE ACEBOLADO x1\n- FILÉ DE FRANGO GRELHADO x1\n- BISTECA x1', 'cmnopliry005y9rpa4748c5ct', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnopsbiv00669rpaqnlmg1t0', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OVO FRITO x1\n- REPOLHO REFOGADO x1\n- VAGEM COM CENOURA x1\n- BIFE ACEBOLADO x1\n- BISTECA x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnopsbiv00649rpa7sqtlfir', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnopz33a006c9rpacj7wcalj', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OVO FRITO x1\n- BISTECA x1', 'cmnopz33a006a9rpa9qrgqpw6', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnoq6pw2006g9rpaftb4ws73', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OVO FRITO x1\n- REPOLHO REFOGADO x1\n- VAGEM COM CENOURA x1\n- BIFE ACEBOLADO x1\n- BISTECA x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnoq6pw2006e9rpaiy12akzv', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnoqb2yj006k9rpaw8h1n8hq', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FAROFA x1\n- OVO FRITO x1\n- BIFE ACEBOLADO x1', 'cmnoqb2yj006i9rparkzhv561', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnor2mjw006s9rpacpy08hwb', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OVO FRITO x1\n- BIFE ACEBOLADO x1\n- FILÉ DE FRANGO GRELHADO x1\n- BISTECA x1', 'cmnor2mjw006q9rpa8fw6uaj6', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnor36b7006x9rpazmkdz3yp', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OVO FRITO x1\n- REPOLHO REFOGADO x1\n- VAGEM COM CENOURA x1\n- BIFE ACEBOLADO x1\n- BISTECA x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnoqradi006m9rpaql0a64e2', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnor36b7006y9rpa54pp9eml', 1, NULL, 4, '', 'cmnoqradi006m9rpaql0a64e2', 'cmmxg6ogr000pbxlkbkmertzk', 'UNIT', 4, NULL),
('cmnor74pt00769rpaf7gi8yiq', 1, NULL, 35, '', 'cmnor5zam00729rpaxpkiyapq', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 35),
('cmnor8khl007a9rpak4umtep4', 1, NULL, 21, 'Composição da marmita:\n- BIFE ACEBOLADO x1\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1', 'cmnor8khl00789rpaww2qsjzf', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnor8khl007b9rpa0biiw1nc', 1, NULL, 21, 'Composição da marmita:\n- BISTECA x1\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OVO FRITO x1', 'cmnor8khl00789rpaww2qsjzf', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnora6rr007f9rpa0say9a8j', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OVO FRITO x1\n- REPOLHO REFOGADO x1\n- VAGEM COM CENOURA x1\n- BIFE ACEBOLADO x1\n- BISTECA x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnora6rr007d9rpadfjk0wr1', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnorn4ro007j9rpayxfba94p', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- VAGEM COM CENOURA x1\n- BIFE ACEBOLADO x1', 'cmnorn4ro007h9rpaf88u6i15', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnorpo48007n9rpaezksms18', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OVO FRITO x1\n- REPOLHO REFOGADO x1\n- VAGEM COM CENOURA x1\n- BIFE ACEBOLADO x1\n- BISTECA x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnorpo48007l9rpasouu0yeq', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnorpo48007o9rpae2mcdki1', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- OVO FRITO x1\n- BISTECA x1', 'cmnorpo48007l9rpasouu0yeq', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnorpo48007p9rpakt0pzhqw', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FILÉ DE FRANGO GRELHADO x1\n- VAGEM COM CENOURA x1', 'cmnorpo48007l9rpasouu0yeq', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnorr1ru007t9rpanks5hh7j', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OVO FRITO x1\n- REPOLHO REFOGADO x1\n- VAGEM COM CENOURA x1\n- BIFE ACEBOLADO x1\n- BISTECA x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnorr1ru007r9rpamndg9qb7', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnorz1oe007x9rpa46q6abic', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OVO FRITO x1\n- REPOLHO REFOGADO x1\n- VAGEM COM CENOURA x1\n- BIFE ACEBOLADO x1\n- BISTECA x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnorz1oe007v9rpapkzx3wbq', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnos63gm00819rpa0try3sv0', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- OVO FRITO x1\n- REPOLHO REFOGADO x1\n- VAGEM COM CENOURA x1\n- BIFE ACEBOLADO x1\n- BISTECA x1\n- FILÉ DE FRANGO GRELHADO x1', 'cmnos63gm007z9rpagangx9dh', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnq3dsdn0009xtolqtzut9sc', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FAROFA x1\n- FEIJÃO x1\n- FRITAS x1\n- PEIXE FRITO x1\n- PANQUECA DE CARNE x1\n- STROGONOFE  DE FRANGO x1', 'cmnq3dsdm0007xtolqs1mc06g', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnq3fskr000dxtol8lf2eu3d', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1', 'cmnq3fskr000bxtolwakpd9jo', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnq3ihz3000hxtol1023gl6q', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- PURE DE BATATA x1\n- FRITAS x1\n- PEIXE FRITO x1\n- STROGONOFE  DE FRANGO x1', 'cmnq3ihz3000fxtolva7iqog6', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnq4ncrm000lxtolc21jiy13', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FAROFA x1\n- FEIJÃO x1\n- FRITAS x1\n- PURE DE BATATA x1\n- PANQUECA DE CARNE x1\n- PEIXE FRITO x1\n- STROGONOFE  DE FRANGO x1', 'cmnq4ncrm000jxtol2rn7t2ib', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnq4zm8v0010xtol7hyp4s9a', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FAROFA x1\n- FEIJÃO x1\n- FRITAS x1\n- PURE DE BATATA x1\n- QUIABO REFOGADO x1\n- PANQUECA DE CARNE x1\n- PEIXE FRITO x1\n- STROGONOFE  DE FRANGO x1', 'cmnq4wvp8000txtolsqn99py1', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnq4zm8v0011xtolgf7hxcea', 3, NULL, 75, '', 'cmnq4wvp8000txtolsqn99py1', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnq4zm8v0012xtol10nx74yw', 2, NULL, 28, '', 'cmnq4wvp8000txtolsqn99py1', 'cmmxgdc0n0011bxlknea7e0hh', 'UNIT', 14, NULL),
('cmnq51oil0016xtolrda8rk9y', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FAROFA x1\n- FEIJÃO x1\n- FRITAS x1\n- PURE DE BATATA x1\n- PEIXE FRITO x1\n- PANQUECA DE CARNE x1', 'cmnq51oil0014xtoly226wir0', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnq5ifh3001extoly3i9c2in', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- FRITAS x1\n- PURE DE BATATA x1\n- QUIABO REFOGADO x1\n- PANQUECA DE CARNE x1\n- PEIXE FRITO x1\n- STROGONOFE  DE FRANGO x1', 'cmnq5ifh3001cxtolmk7b0fgy', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnq5lp5d001kxtolcpdopuhk', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- FRITAS x1\n- PURE DE BATATA x1\n- PANQUECA DE CARNE x1\n- STROGONOFE  DE FRANGO x1\n- PEIXE FRITO x1', 'cmnq5ju9f001gxtolazfig3v9', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnq5qyxo001oxtolrp97krsl', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- FRITAS x1\n- PURE DE BATATA x1\n- QUIABO REFOGADO x1\n- PANQUECA DE CARNE x1\n- PEIXE FRITO x1\n- STROGONOFE  DE FRANGO x1', 'cmnq5qyxo001mxtolenlosw6q', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnq5xdfb001sxtol1u3geef8', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- PURE DE BATATA x1\n- QUIABO REFOGADO x1\n- STROGONOFE  DE FRANGO x1\n- PEIXE FRITO x1', 'cmnq5xdfb001qxtolbapdkjbj', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnq61ma4001wxtol0keiq2rq', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FAROFA x1\n- FEIJÃO x1\n- PURE DE BATATA x1\n- QUIABO REFOGADO x1\n- PANQUECA DE CARNE x1', 'cmnq61ma4001uxtolw4dxgbjg', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnq62wc30020xtol43gcdffe', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FRITAS x1\n- PURE DE BATATA x1\n- QUIABO REFOGADO x1\n- PANQUECA DE CARNE x1\n- PEIXE FRITO x1\n- STROGONOFE  DE FRANGO x1', 'cmnq62wc3001yxtolabugp23s', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnq68em40024xtol7yesaso5', 1, NULL, 21, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- FRITAS x1\n- PURE DE BATATA x1\n- QUIABO REFOGADO x1\n- PANQUECA DE CARNE x1\n- PEIXE FRITO x1\n- STROGONOFE  DE FRANGO x1', 'cmnq68em40022xtolccpxjcqd', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnq70oxh0028xtolvpe9uaqs', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- FRITAS x1\n- PURE DE BATATA x1\n- STROGONOFE  DE FRANGO x1', 'cmnq70oxh0026xtolkbaj6kps', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnq73s5q002cxtolfhwkil9a', 1, NULL, 29, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FRITAS x1\n- PURE DE BATATA x1\n- QUIABO REFOGADO x1\n- PANQUECA DE CARNE x2\n- PEIXE FRITO x1\n- STROGONOFE  DE FRANGO x1\n- FAROFA x1', 'cmnq73s5p002axtol6tymgooc', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnq73s5q002dxtolexskty0q', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- FRITAS x1\n- PURE DE BATATA x1\n- QUIABO REFOGADO x1\n- PANQUECA DE CARNE x1\n- PEIXE FRITO x1\n- STROGONOFE  DE FRANGO x1', 'cmnq73s5p002axtol6tymgooc', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnq7pkar002txtolbqczjubu', 1, NULL, 26.6, '', 'cmnq7pkar002rxtolk2t6u24i', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 26.6),
('cmnq7pkar002uxtolyggnuxa3', 1, NULL, 26.12, '', 'cmnq7pkar002rxtolk2t6u24i', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 26.12),
('cmnq7pkar002vxtolo13hyl9q', 1, NULL, 6.5, '', 'cmnq7pkar002rxtolk2t6u24i', 'cmmxgf67a0017bxlk6xa8qpbi', 'UNIT', 6.5, NULL),
('cmnq7x1my0037xtolpj82qrwv', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- PURE DE BATATA x1\n- PEIXE FRITO x1\n- STROGONOFE  DE FRANGO x1', 'cmnq7x1my0035xtol37i5pvrw', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnq85j3d000fq8w65pw3wgpq', 1, NULL, 30, '', 'cmnq83xod0001q8w6iwhwwca9', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, 30),
('cmnq85j3d000gq8w64vng0enw', 6, NULL, 180, '', 'cmnq83xod0001q8w6iwhwwca9', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, 180),
('cmnq85j3d000hq8w6nrqzdg4h', 2, NULL, 28, '', 'cmnq83xod0001q8w6iwhwwca9', 'cmmxgdc0n0011bxlknea7e0hh', 'UNIT', 14, NULL),
('cmnq85j3d000iq8w6uicncsq0', 1, NULL, 25, '', 'cmnq83xod0001q8w6iwhwwca9', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnq8em5r000uq8w6h4v3djnb', 1, NULL, 25, 'Composição da marmita:\n- ARROZ BRANCO x1\n- FEIJÃO x1\n- FAROFA x1\n- FRITAS x1\n- PANQUECA DE CARNE x2', 'cmnq8em5q000sq8w6p9bthx8u', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnq8jmje0010q8w6pt8qejva', 1, NULL, 20.97, '', 'cmnq8jmje000yq8w65xhl27nl', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 20.97),
('cmnq8jmje0011q8w6h1ep2746', 1, NULL, 4, '', 'cmnq8jmje000yq8w65xhl27nl', 'cmmxgkvjg001ibxlkngw31sr1', 'UNIT', 4, NULL),
('cmnq8jmje0012q8w6e0heiu2b', 1, NULL, 1, '', 'cmnq8jmje000yq8w65xhl27nl', 'cmn4ru0mi0046g2zqe5losqc4', 'UNIT', 1, NULL),
('cmnq8jmje0013q8w6f0p3toa0', 1, NULL, 4.67, '', 'cmnq8jmje000yq8w65xhl27nl', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 4.67),
('cmnq8jmje0014q8w6wulxuikv', 1, NULL, 27.43, '', 'cmnq8jmje000yq8w65xhl27nl', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 27.43),
('cmnq8k6tj0018q8w6b0p3vtom', 1, NULL, 25, 'Composição da marmita:\n- STROGONOFE  DE FRANGO x1', 'cmnq8k6tj0016q8w6zam9izud', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnq9aihx001eq8w6k1h9ucmf', 1, NULL, 25, '', 'cmnq9aihx001cq8w62nvglyj2', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnrix0f0001qq8w6e50qf3zk', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- COUVE x1\n- CENOURA REFOGAGADA x1\n- TORRESMO x1\n- FEIJOADA x1', 'cmnrix0f0001oq8w6qskwfrc7', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnrjmhr30024q8w6z5iwc01u', 3, NULL, 75, '', 'cmnrj1m7p001sq8w6kq8z2nak', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnrjoht4002cq8w6gts1fgr4', 1, NULL, 25, 'Composição da marmita:\n- FEIJOADA x1\nObs: COMPLETA', 'cmnrjo8530028q8w6smqm4vqs', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnrjoht4002dq8w68pg5x0qg', 2, NULL, 50, '', 'cmnrjo8530028q8w6smqm4vqs', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnrjr95d002hq8w6nkoha8j8', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- CENOURA REFOGAGADA x1\n- COUVE x1\n- FAROFA x1\n- FEIJÃO x1\n- MACARRÃOPRIMAVERA x1\n- TORRESMO x1\n- FRANGO GRELHADO x1', 'cmnrjr95d002fq8w6nceod92k', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnrjr95d002iq8w6z8m9190y', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- CENOURA REFOGAGADA x1\n- COUVE x1\n- FAROFA x1\n- FEIJÃO x1\n- LARANJA x1\n- MACARRÃOPRIMAVERA x1\n- FRANGO GRELHADO x1\n- TORRESMO x1', 'cmnrjr95d002fq8w6nceod92k', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnrjtk8x002mq8w6zg19q7mn', 1, NULL, 29, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- COUVE x1\n- MACARRÃOPRIMAVERA x1\n- TORRESMO x1\n- FRANGO GRELHADO x1', 'cmnrjtk8x002kq8w63f1xeyia', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnrk4drp002vq8w6jwld039c', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJOADA x1\n- COUVE x1\n- FAROFA x1\n- LARANJA x1\n- TORRESMO x1', 'cmnrk4drp002tq8w6dxuvwr8y', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnrknx4e0035q8w65hemaxze', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJOADA x1\n- COUVE x1\n- FAROFA x1\n- LARANJA x1\n- TORRESMO x1', 'cmnrknx4e0033q8w6fnz8kb2a', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnrljmdn003dq8w6ahtkd719', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- TORRESMO x1\n- FEIJOADA x1', 'cmnrljmdn003bq8w6hrbatxr7', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnrlka8d003hq8w6xxxe25wa', 1, NULL, 25, 'Composição da marmita:\n- FEIJOADA x1\n- ARROZ x1', 'cmnrlchky0037q8w6h0n75ox4', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnrlka8d003iq8w6qb9q2f1z', 1, NULL, 25, '', 'cmnrlchky0037q8w6h0n75ox4', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnrllh0l003oq8w6squ1fias', 1, NULL, 25, 'Composição da marmita:\n- FEIJOADA x1\n- ARROZ x1\n- COUVE x1\n- FAROFA x1\n- TORRESMO x1', 'cmnrllh0l003mq8w6v7ldx7jx', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnrlo9yk003sq8w6h4zlqh5o', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJOADA x1\n- COUVE x1\n- FAROFA x1\n- LARANJA x1\n- TORRESMO x1', 'cmnrlo9yk003qq8w6ow3uq71s', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnrmaq1x003wq8w6ymre2t7o', 2, NULL, 50, '', 'cmnrmaq1x003uq8w6u33iwbbd', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnrmaq1x003xq8w6p292k1c6', 2, NULL, 2, '', 'cmnrmaq1x003uq8w6u33iwbbd', 'cmn4ru0mi0046g2zqe5losqc4', 'UNIT', 1, NULL),
('cmnrmaq1x003yq8w6w192hv9a', 1, NULL, 8, '', 'cmnrmaq1x003uq8w6u33iwbbd', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmnrmbsl20044q8w6oxwvpz94', 1, NULL, 25, '', 'cmnrmbsl20042q8w6ketgxp6d', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnrmbsl20045q8w6agouoqns', 1, NULL, 5, '', 'cmnrmbsl20042q8w6ketgxp6d', 'cmmxgynqo001vbxlk6siyrb91', 'UNIT', 5, NULL),
('cmnrmljud004mq8w6bn0yk54d', 1, NULL, 25, '', 'cmnrmljud004kq8w6y8l45pn1', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnrmljud004nq8w68197oqvg', 1, NULL, 3, '', 'cmnrmljud004kq8w6y8l45pn1', 'cmmxg69nt000nbxlk7omoe0uq', 'UNIT', 3, NULL),
('cmnrmzu2b0050q8w68jmk0uhy', 1, NULL, 16.51, 'MAI H2O $ 6', 'cmnrmx8a0004pq8w6l1xdyi1x', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, 16.51),
('cmnrmzu2b0051q8w6dp3crijh', 1, NULL, 0, '', 'cmnrmx8a0004pq8w6l1xdyi1x', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, NULL),
('cmnrn2o1c005eq8w6q2afm1b9', 1, NULL, 0, '', 'cmnrn1g5v0055q8w6i93skdwb', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, NULL),
('cmnrn2o1c005fq8w66p48kpx4', 1, NULL, 25, '', 'cmnrn1g5v0055q8w6i93skdwb', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnrn2o1c005gq8w6sftw7pf5', 1, NULL, 8, '', 'cmnrn1g5v0055q8w6i93skdwb', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmnrn66wj005kq8w6p6ok4icq', 1, NULL, 8, '', 'cmnrn66wj005iq8w6b4sv1a7i', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmnrn66wj005lq8w62gyf5hf9', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- TORRESMO x1\n- FEIJOADA x1', 'cmnrn66wj005iq8w6b4sv1a7i', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnrndk7f005pq8w6adsxkkrh', 6, NULL, 150, '', 'cmnrme8f1004fq8w6g8cam97b', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnrndk7f005qq8w6y0e14v29', 2, NULL, 28, '', 'cmnrme8f1004fq8w6g8cam97b', 'cmmxgdc0n0011bxlknea7e0hh', 'UNIT', 14, NULL),
('cmnrndk7f005rq8w6g6a9h130', 2, NULL, 8, '', 'cmnrme8f1004fq8w6g8cam97b', 'cmmxg6ogr000pbxlkbkmertzk', 'UNIT', 4, NULL),
('cmnroelm9006hq8w6vnifnkln', 1, NULL, 32.5, 'Composição da marmita:\n- ARROZ x1\n- FEIJOADA x1\n[EXTRA] GUARANA | 7.50', 'cmnroe3m4006dq8w68ty0swsq', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 32.5, NULL),
('cmnrp0eay006pq8w6u0w81nt0', 1, NULL, 25, 'Composição da marmita:\n- FEIJOADA x1', 'cmnrp0eay006nq8w6cs5pew1e', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnt2a2rh0077q8w6b50s9ta7', 1, NULL, 15, '', 'cmnt2a2rh0075q8w66bit6442', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 15),
('cmnt2gjay007dq8w65aveu6og', 1, NULL, 20.97, '', 'cmnt2gjay007bq8w63u43z4m4', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 20.97),
('cmnt2gjaz007eq8w6a9fq3rew', 1, NULL, 6.47, '', 'cmnt2gjay007bq8w63u43z4m4', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 6.47),
('cmnt2gjaz007fq8w68yx6ormo', 1, NULL, 10.9, '', 'cmnt2gjay007bq8w63u43z4m4', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 10.9),
('cmnt2he6g007lq8w6lewg7ku7', 1, NULL, 21, '', 'cmnt2h4dk007hq8w60bwx5lmc', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 21),
('cmnt2he6g007mq8w6hvkhcue5', 1, NULL, 5, '', 'cmnt2h4dk007hq8w60bwx5lmc', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmnt2i0hi007sq8w67rdkn4bh', 2, NULL, 50, '', 'cmnt2i0hi007qq8w6qx5gtez3', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnt2i0hi007tq8w6zs86chmz', 1, NULL, 8, '', 'cmnt2i0hi007qq8w6qx5gtez3', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmnt32377007zq8w6clrqy7ad', 1, NULL, 29, 'Composição da marmita:\n- ARROZ x1\n- MIX CHURRASCO x1', 'cmnt32377007xq8w6ott0bd3n', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnt323770080q8w6rvwcxfei', 1, NULL, 29, 'Composição da marmita:\n- ARROZ x1\n- MIX CHURRASCO x1', 'cmnt32377007xq8w6ott0bd3n', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnt362ax008bq8w6mn92mzcy', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- MIX CHURRASCO x1', 'cmnt33p270087q8w63cuaaoj3', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnt362ax008cq8w6m2zdw14n', 1, NULL, 25, '', 'cmnt33p270087q8w63cuaaoj3', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnt362ax008dq8w6wjeb3xxh', 1, NULL, 14, '', 'cmnt33p270087q8w63cuaaoj3', 'cmmxghmnu001dbxlkdldqvqy3', 'UNIT', 14, NULL),
('cmnt362ax008eq8w6ggqbpmo6', 1, NULL, 25, '', 'cmnt33p270087q8w63cuaaoj3', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnt362ax008fq8w64wjihrtk', 1, NULL, 5, '', 'cmnt33p270087q8w63cuaaoj3', 'cmmxfz2nh000fbxlkk0utzon1', 'UNIT', 5, NULL),
('cmnuf49sl000cba6veam19vv0', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FAROFA x1\n- FEIJÃO x1\n- MAIONESE x1\n- MANDIOCA FRITA x1\n- PURÊ DE ABÓBORA x1\n- QUIABO x1\n- MIX CHURRASCO x1', 'cmnuf40860008ba6vr8myneeb', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnuf49sl000dba6vh1k4egkb', 3, NULL, 63, '', 'cmnuf40860008ba6vr8myneeb', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnuf6dme000hba6v8raqkxk3', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MAIONESE x1\n- MANDIOCA FRITA x1\n- PURÊ DE ABÓBORA x1\n- QUIABO x1\n- MIX CHURRASCO x1', 'cmnuf6dme000fba6v8so88sqg', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnuf727s000pba6vu413ac3l', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MAIONESE x1\n- MANDIOCA FRITA x1\n- PURÊ DE ABÓBORA x1\n- QUIABO x1\n- MIX CHURRASCO x1', 'cmnuf6xq0000lba6vlq4sj9kr', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnuf727s000qba6vp4g29f22', 2, NULL, 50, '', 'cmnuf6xq0000lba6vlq4sj9kr', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnuf7n83000uba6vm89sljy9', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MAIONESE x1\n- PURÊ DE ABÓBORA x1\n- MANDIOCA FRITA x1\n- QUIABO x1\n- MIX CHURRASCO x1', 'cmnuf7n83000sba6vdbvk3xuv', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnuffnyi0015ba6v5fozkds1', 1, NULL, 29, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MANDIOCA FRITA x1\n- PURÊ DE ABÓBORA x1\n- QUIABO x1\n- MAIONESE x1\n- MIX CHURRASCO x1', 'cmnuffnyi0013ba6v3wv06m9r', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnuffnyi0016ba6v9q3fzqlu', 1, NULL, 29, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MAIONESE x1\n- MANDIOCA FRITA x1\n- PURÊ DE ABÓBORA x1\n- QUIABO x1\n- MIX CHURRASCO x1', 'cmnuffnyi0013ba6v3wv06m9r', 'cmmxfwln3000bbxlk7fh4qdbs', 'UNIT', 29, NULL),
('cmnufhrnj001aba6vqtwasweo', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MAIONESE x1\n- MANDIOCA FRITA x1\n- PURÊ DE ABÓBORA x1\n- QUIABO x1\n- MIX CHURRASCO x1', 'cmnufhrnj0018ba6vmnf9ij7j', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnufjegn001gba6vupxt432p', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FAROFA x1\n- FEIJÃO x1\n- MAIONESE x1\n- MANDIOCA FRITA x1\n- PURÊ DE ABÓBORA x1\n- QUIABO x1\n- MIX CHURRASCO x1', 'cmnufj7xl001cba6vyobc1ttr', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnufjegn001hba6vyq89ig0p', 2, NULL, 50, '', 'cmnufj7xl001cba6vyobc1ttr', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnuft2ni001nba6v54a1unzq', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MANDIOCA FRITA x1\n- MIX CHURRASCO x1', 'cmnuft2ni001lba6vfa3qsokx', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnug0bg7001vba6vfk3j79d2', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MAIONESE x1\n- MANDIOCA FRITA x1\n- MIX CHURRASCO x1', 'cmnug0bg7001tba6v51cvbfnt', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnugtpss0023ba6vbu7b8udi', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- MAIONESE x1\n- MIX CHURRASCO x1', 'cmnugtpsr0021ba6vckxb3s5j', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnugvot20025ba6vbo1lh33m', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MANDIOCA FRITA x1\n- MIX CHURRASCO x1', 'cmnugasgf001xba6vy7tneybz', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnugvot20026ba6vuvw5qgkh', 1, NULL, 5, '', 'cmnugasgf001xba6vy7tneybz', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmnuh6tn1002hba6vmxx34ozd', 1, NULL, 11.98, '', 'cmnuh6tn1002fba6v78h25j6r', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 11.98),
('cmnuh6tn1002iba6viqs3jqjb', 1, NULL, 17.5, '', 'cmnuh6tn1002fba6v78h25j6r', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 17.5),
('cmnuh6tn1002jba6vdwitfk3m', 1, NULL, 4, '', 'cmnuh6tn1002fba6v78h25j6r', 'cmmxg6ogr000pbxlkbkmertzk', 'UNIT', 4, NULL),
('cmnuh6tn1002kba6vshb20iqa', 2, NULL, 2, '', 'cmnuh6tn1002fba6v78h25j6r', 'cmn4ru0mi0046g2zqe5losqc4', 'UNIT', 1, NULL),
('cmnuhbax9002vba6vje6rczi8', 1, NULL, 40, '', 'cmnuhbax9002tba6vimmzb7nf', 'cmmxgfsw40019bxlktpojbaog', 'UNIT', 40, NULL),
('cmnuhbax9002wba6vcdwz7yt2', 1, NULL, 5, '', 'cmnuhbax9002tba6vimmzb7nf', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmnuhbax9002xba6vaerk0rsu', 1, NULL, 1, '', 'cmnuhbax9002tba6vimmzb7nf', 'cmn4ru0mi0046g2zqe5losqc4', 'UNIT', 1, NULL),
('cmnuhbxv30033ba6vjsv9qdc8', 1, NULL, 22, '', 'cmnuhbxv30031ba6v5nw1w1nh', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 22),
('cmnuhbxv30034ba6v74zikja5', 1, NULL, 5, '', 'cmnuhbxv30031ba6v5nw1w1nh', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmnuhh3go003dba6vzq9e7wrh', 1, NULL, 25, '', 'cmnuh2isb0028ba6v46j2g42p', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, 25),
('cmnuhh3go003eba6vku994owc', 1, NULL, 19, '', 'cmnuh2isb0028ba6v46j2g42p', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 19),
('cmnuhh3go003fba6vcq0hotvc', 1, NULL, 6.5, '', 'cmnuh2isb0028ba6v46j2g42p', 'cmmxgf67a0017bxlk6xa8qpbi', 'UNIT', 6.5, NULL),
('cmnuhh3go003gba6v57qt2ef3', 2, NULL, 2, '', 'cmnuh2isb0028ba6v46j2g42p', 'cmn4ru0mi0046g2zqe5losqc4', 'UNIT', 1, NULL),
('cmnuhh3go003hba6va8yu6lff', 1, NULL, 25, '', 'cmnuh2isb0028ba6v46j2g42p', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnuhi38z003jba6vsyatslod', 1, NULL, 25, '', 'cmnuh7q4n002mba6v329z1fzo', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnuhi38z003kba6vi2yo1sis', 1, NULL, 40, '', 'cmnuh7q4n002mba6v329z1fzo', 'cmmxgfsw40019bxlktpojbaog', 'UNIT', 40, NULL),
('cmnuhi38z003lba6vqqgpsfpg', 1, NULL, 8, '', 'cmnuh7q4n002mba6v329z1fzo', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmnuhi38z003mba6v36n7rtr1', 1, NULL, 1, '', 'cmnuh7q4n002mba6v329z1fzo', 'cmn4ru0mi0046g2zqe5losqc4', 'UNIT', 1, NULL),
('cmnuhv8y1003sba6vouif2dak', 1, NULL, 21.32, '', 'cmnuhgcwb0036ba6vca6qp6ya', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 21.32),
('cmnuhv8y1003tba6vt47jaxer', 1, NULL, 15.21, '', 'cmnuhgcwb0036ba6vca6qp6ya', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 15.21),
('cmnuhv8y1003uba6vvv2liead', 1, NULL, 17, '', 'cmnuhgcwb0036ba6vca6qp6ya', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 17),
('cmnuhv8y1003vba6vmsz3ky2o', 2, NULL, 16, '', 'cmnuhgcwb0036ba6vca6qp6ya', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmnuhzgq10041ba6vk00xhymb', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FAROFA x1\n- FEIJÃO x1\n- MAIONESE x1\n- MANDIOCA FRITA x1\n- PURÊ DE ABÓBORA x1\n- QUIABO x1\n- MIX CHURRASCO x1', 'cmnuhzgq1003zba6vkek2c9fx', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnui2nhi004fba6vbqzim1t2', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- PURÊ DE ABÓBORA x1\n- MIX CHURRASCO x1', 'cmnui2nhi004dba6vxouu4a3c', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnui3w36004jba6vjs9a0eal', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FAROFA x1\n- FEIJÃO x1\n- MAIONESE x1\n- MANDIOCA FRITA x1\n- PURÊ DE ABÓBORA x1\n- QUIABO x1\n- MIX CHURRASCO x1', 'cmnui3w36004hba6vzcvpxy4n', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnuifjx3004tba6vgiuob9mf', 1, NULL, 25, '', 'cmnui0r4r0048ba6v21qo034f', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnuifjx3004uba6v2tcziup4', 1, NULL, 5, '', 'cmnui0r4r0048ba6v21qo034f', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmnuj1edv0055ba6vz7r1y7fa', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MANDIOCA FRITA x1\n- MAIONESE x1\n- MIX CHURRASCO x1', 'cmnuiq9gl0051ba6v9a48cjnr', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnuj7ot0005nba6vvgg7i0ii', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FEIJÃO x1\n- FAROFA x1\n- MAIONESE x1\n- MANDIOCA FRITA x1\n- MIX CHURRASCO x1', 'cmnuj7osz005lba6vmnaqingj', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnuj8xgr005rba6vwhw3fuse', 1, NULL, 25, '', 'cmnuj8xgr005pba6vs24p5ce2', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnuj8xgr005sba6vpj7ycb4h', 1, NULL, 4, '', 'cmnuj8xgr005pba6vs24p5ce2', 'cmmxg6ogr000pbxlkbkmertzk', 'UNIT', 4, NULL),
('cmnuj9u5b005yba6vq0q9l5qf', 1, NULL, 25, '', 'cmnuj9u5b005wba6vec67h4al', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnuj9u5b005zba6vxepan3i7', 1, NULL, 23, '', 'cmnuj9u5b005wba6vec67h4al', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 23),
('cmnuj9u5b0060ba6vcuoi7f0f', 1, NULL, 5, '', 'cmnuj9u5b005wba6vec67h4al', 'cmmxg1kjo000hbxlkyb5mz3ek', 'UNIT', 5, NULL),
('cmnuj9u5b0061ba6v1gtqugo7', 1, NULL, 5, '', 'cmnuj9u5b005wba6vec67h4al', 'cmmxhuy950042bxlkwq2ti484', 'UNIT', 5, NULL),
('cmnujamjp0067ba6vaf1oc9t8', 1, NULL, 40, '', 'cmnujamjp0065ba6vsxrhbmy9', 'cmmxgfsw40019bxlktpojbaog', 'UNIT', 40, NULL),
('cmnujamjp0068ba6v3as9v5yx', 1, NULL, 4, '', 'cmnujamjp0065ba6vsxrhbmy9', 'cmmxg6ogr000pbxlkbkmertzk', 'UNIT', 4, NULL),
('cmnujamjp0069ba6v6bisyt02', 1, NULL, 1, '', 'cmnujamjp0065ba6vsxrhbmy9', 'cmn4ru0mi0046g2zqe5losqc4', 'UNIT', 1, NULL),
('cmnujc2wm006dba6v1rrdki2x', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FAROFA x1\n- MAIONESE x1\n- FEIJÃO x1\n- MANDIOCA FRITA x1\n- PURÊ DE ABÓBORA x1\n- QUIABO x1\n- MIX CHURRASCO x1', 'cmnujc2wm006bba6vyye7t7vs', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnujc2wm006eba6vu85u0qr4', 1, NULL, 25, 'Composição da marmita:\n- ARROZ x1\n- FAROFA x1\n- FEIJÃO x1\n- MAIONESE x1\n- MANDIOCA FRITA x1\n- QUIABO x1\n- PURÊ DE ABÓBORA x1\n- MIX CHURRASCO x1', 'cmnujc2wm006bba6vyye7t7vs', 'cmmxfwai50009bxlk6tk05rbp', 'UNIT', 25, NULL),
('cmnujc2wm006fba6vyvvjtoem', 1, NULL, 8, '', 'cmnujc2wm006bba6vyye7t7vs', 'cmmxgetfu0015bxlk8fonx8da', 'UNIT', 8, NULL),
('cmnuje5xh006lba6ve6i73s9z', 1, NULL, 21, 'Composição da marmita:\n- ARROZ x1\n- FAROFA x1\n- FEIJÃO x1\n- MAIONESE x1\n- MANDIOCA FRITA x1\n- PURÊ DE ABÓBORA x1\n- QUIABO x1\n- MIX CHURRASCO x1', 'cmnuje5xg006jba6vdb9eat5f', 'cmmx5cald00052dxqe0ue6fz7', 'UNIT', 21, NULL),
('cmnuk3awx000c7qmjt48axjmc', 1, NULL, 10.93, '', 'cmnujqboo00057qmjv8q7znk1', 'cmmxggnh0001bbxlk43commjz', 'WEIGHT', 59.9, 10.93),
('cmnuk3awx000d7qmjrst01u4d', 1, NULL, 25, '', 'cmnujqboo00057qmjv8q7znk1', 'cmn64murm006yg2zqugmgzaq0', 'UNIT', 25, NULL),
('cmnuk3awx000e7qmjq2drazw2', 3, NULL, 120, '', 'cmnujqboo00057qmjv8q7znk1', 'cmmxgfsw40019bxlktpojbaog', 'UNIT', 40, NULL),
('cmnuk3awx000f7qmjo9swha8d', 1, NULL, 14, '', 'cmnujqboo00057qmjv8q7znk1', 'cmmxgdc0n0011bxlknea7e0hh', 'UNIT', 14, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `payableaccount`
--

CREATE TABLE `payableaccount` (
  `id` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `dueDate` datetime(3) NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `paidAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `supplierId` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `payment`
--

CREATE TABLE `payment` (
  `id` varchar(191) NOT NULL,
  `method` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'PENDING',
  `transactionId` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `orderId` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `payment`
--

INSERT INTO `payment` (`id`, `method`, `amount`, `status`, `transactionId`, `createdAt`, `orderId`) VALUES
('cmmxhtgsj0040bxlkoff8sn7m', 'PIX', 21, 'PAID', NULL, '2026-03-19 13:15:33.571', 'cmmxhrovh003wbxlkj0234ahw'),
('cmmxim734004cbxlkewuokq63', 'CASH', 21, 'PAID', NULL, '2026-03-19 13:37:54.016', 'cmmxi8wwz0044bxlkqv0m9gt6'),
('cmmxitx9b004ibxlkxlgagjl4', 'CASH', 25, 'PAID', NULL, '2026-03-19 13:43:54.527', 'cmmxit6ek004ebxlkftxriygc'),
('cmmxj101y004obxlkvzgd07zl', 'CASH', 21, 'PAID', NULL, '2026-03-19 13:49:24.742', 'cmmxiyvr8004kbxlkvjpzplu8'),
('cmmxj8jxo0052bxlkvxsrttr7', 'CASH', 25, 'PAID', NULL, '2026-03-19 13:55:17.101', 'cmmxj6kpw004qbxlkrtu2p8mr'),
('cmmxj8lia0054bxlkine3l05s', 'CASH', 5, 'PAID', NULL, '2026-03-19 13:55:19.139', 'cmmxj861t004ybxlky08sh6s2'),
('cmmxjl7ii005abxlkypnifx45', 'PIX', 25, 'PAID', NULL, '2026-03-19 14:05:07.530', 'cmmxjl3ix0056bxlkv9nox52v'),
('cmmxk5cr1005gbxlkm5jishrf', 'CASH', 21, 'PAID', NULL, '2026-03-19 14:20:47.438', 'cmmxk47kf005cbxlke600uys9'),
('cmmxk5ymp005ibxlk95b2q2ql', 'DEBIT_CARD', 22, 'PAID', NULL, '2026-03-19 14:21:15.793', 'cmmxij42p0048bxlk8m9gxti2'),
('cmmxkf2v7005obxlk14y68mek', 'CASH', 21, 'PAID', NULL, '2026-03-19 14:28:21.188', 'cmmxkdl0o005kbxlkbunclt9i'),
('cmmxknlg7005ubxlku76uc0eb', 'CASH', 21, 'PAID', NULL, '2026-03-19 14:34:58.520', 'cmmxkmwte005qbxlk62ludm4l'),
('cmmxlgvsh0069bxlkvh390j9r', 'CASH', 21, 'PAID', NULL, '2026-03-19 14:57:44.946', 'cmmxlgrty0065bxlk49jxeo6e'),
('cmmxln91q006fbxlkcdh75aw4', 'CREDIT_CARD', 25, 'PAID', NULL, '2026-03-19 15:02:42.063', 'cmmxllxtv006bbxlk0d2gb7w4'),
('cmmxlxq1z006mbxlkwsq5gn2y', 'CREDIT_CARD', 30, 'PAID', NULL, '2026-03-19 15:10:50.664', 'cmmxlxk5j006hbxlkmu07nd34'),
('cmmxm64tz006wbxlkwb9uiadv', 'PIX', 21, 'PAID', NULL, '2026-03-19 15:17:23.064', 'cmmxm3k98006sbxlkstwygt5m'),
('cmmxm6bup006ybxlkx69rlzwv', 'PIX', 25, 'PAID', NULL, '2026-03-19 15:17:32.162', 'cmmxm12ba006obxlkg4ltal44'),
('cmmxmez880078bxlke9op487t', 'PIX', 25, 'PAID', NULL, '2026-03-19 15:24:15.704', 'cmmxm9pdw0070bxlkdrrvvdms'),
('cmmxmlx4p007abxlkp0i2lsve', 'PIX', 50, 'PAID', NULL, '2026-03-19 15:29:39.577', 'cmmxkw3dk005wbxlkl21twhab'),
('cmmxmm2bs007cbxlki6g4aioh', 'PIX', 8, 'PAID', NULL, '2026-03-19 15:29:46.312', 'cmmxlb7kp0061bxlkq8msg42a'),
('cmmxndzw3007ibxlk94g8scan', 'CASH', 25, 'PAID', NULL, '2026-03-19 15:51:29.523', 'cmmxndvl3007ebxlkcmrtnv4v'),
('cmmxne8kc007kbxlkpfppd1y3', 'CASH', 30, 'PAID', NULL, '2026-03-19 15:51:40.764', 'cmmxmci4y0074bxlkrxjok2j3'),
('cmmxnif2z007rbxlkyp7ndu3w', 'CASH', 26, 'PAID', NULL, '2026-03-19 15:54:55.836', 'cmmxnhgna007mbxlk2xn7mppz'),
('cmmyyhpjy000h3r61zpj8jx8o', 'DEBIT_CARD', 42, 'PAID', NULL, '2026-03-20 13:50:04.702', 'cmmyyhkya000c3r61e1b999en'),
('cmmyyjez4000r3r61e6172dgi', 'PIX', 89, 'PAID', NULL, '2026-03-20 13:51:24.304', 'cmmyyjamy000j3r61c9frj5u3'),
('cmmyyktg6000x3r61asmzy81o', 'CASH', 21, 'PAID', NULL, '2026-03-20 13:52:29.718', 'cmmyyk6j2000t3r61thnsbn38'),
('cmmyz3eqi00183r612qfnkkhl', 'PIX', 42, 'PAID', NULL, '2026-03-20 14:06:57.115', 'cmmyyoc88000z3r618ngcjh9o'),
('cmmyzepu9001i3r614d8sx0nl', 'PIX', 8, 'PAID', NULL, '2026-03-20 14:15:44.721', 'cmmyze1wc001e3r61czgdasqx'),
('cmmyzjed7001p3r6142mgaku0', 'PIX', 25, 'PAID', NULL, '2026-03-20 14:19:23.131', 'cmmyyu67w00143r6173ff5cug'),
('cmmyzjh4k001r3r61kf5wdb19', 'CASH', 58, 'PAID', NULL, '2026-03-20 14:19:26.709', 'cmmyziack001k3r61px6zrnk5'),
('cmmyzyqo400233r617ewx6uss', 'CASH', 55, 'PAID', NULL, '2026-03-20 14:31:18.916', 'cmmyzylyc001x3r615lpj66dv'),
('cmmyzyttb00253r61zjuya4x5', 'PIX', 29, 'PAID', NULL, '2026-03-20 14:31:22.992', 'cmmyzwkx0001t3r611ytk0ylv'),
('cmmz02lth002b3r61vzvn5wju', 'DEBIT_CARD', 21, 'PAID', NULL, '2026-03-20 14:34:19.253', 'cmmz0245h00273r61il0x74v4'),
('cmmz0adva002h3r61fmo99eeg', 'DEBIT_CARD', 25, 'PAID', NULL, '2026-03-20 14:40:22.198', 'cmmz09e6m002d3r61pqe55b5a'),
('cmmz0fvqo002n3r616y86vyup', 'DEBIT_CARD', 29, 'PAID', NULL, '2026-03-20 14:44:38.641', 'cmmz0bnhq002j3r614n1nyxfy'),
('cmmz15fw700373r615tqubnag', 'CREDIT_CARD', 51, 'PAID', NULL, '2026-03-20 15:04:31.160', 'cmmz14tcf00313r61kx0vqflc'),
('cmmz15ufj00393r61q03cempg', 'CREDIT_CARD', 21, 'PAID', NULL, '2026-03-20 15:04:49.999', 'cmmz0mgl2002t3r61dnt0kcxj'),
('cmmz163la003b3r61k0vupq1a', 'PIX', 21, 'PAID', NULL, '2026-03-20 15:05:01.870', 'cmmz133lp002x3r61zpzyhwj6'),
('cmmz188tp003h3r61rwvhoutj', 'DEBIT_CARD', 21, 'PAID', NULL, '2026-03-20 15:06:41.965', 'cmmz17qzw003d3r61vwru19z6'),
('cmmz1dha9003t3r61sin5vbhf', 'CASH', 21, 'PAID', NULL, '2026-03-20 15:10:46.209', 'cmmz1clyd003p3r61xhuuioou'),
('cmmz1jcy800433r61wul5q4jh', 'CASH', 25, 'PAID', NULL, '2026-03-20 15:15:20.529', 'cmmz1hup3003v3r611x799luu'),
('cmmz1jfrb00453r61mgj72o7y', 'CASH', 25, 'PAID', NULL, '2026-03-20 15:15:24.167', 'cmmz1j2xx003z3r61m73vk9q7'),
('cmmz2awy8004d3r61mso8n7uz', 'DEBIT_CARD', 21, 'PAID', NULL, '2026-03-20 15:36:46.160', 'cmmz2a2ot00493r61bt4e16il'),
('cmmz5zg1w004n3r61smk6s97j', 'DEBIT_CARD', 21, 'PAID', NULL, '2026-03-20 17:19:49.508', 'cmmz0iopo002p3r611r1hls4x'),
('cmn39eh560016tga3yojyh8lz', 'PIX', 25, 'PAID', NULL, '2026-03-23 14:06:34.314', 'cmn395vk2000utga382ntmt1q'),
('cmn39fmrq0018tga3tn8i2vqz', 'CASH', 21, 'PAID', NULL, '2026-03-23 14:07:28.263', 'cmn3987nz000ytga38tglnlfo'),
('cmn39h2my001atga3q6muxlw2', 'DEBIT_CARD', 25, 'PAID', NULL, '2026-03-23 14:08:35.483', 'cmn39auov0012tga3wa6dy6ae'),
('cmn39harc001ctga3kiage677', 'PIX', 29, 'PAID', NULL, '2026-03-23 14:08:46.009', 'cmn387jqm000gtga3w8glcfbk'),
('cmn39i488001etga3liypz07k', 'PIX', 22, 'PAID', NULL, '2026-03-23 14:09:24.201', 'cmn38slm0000qtga3jqfbr694'),
('cmn3ass1h001wtga3y557uu0h', 'PIX', 25, 'PAID', NULL, '2026-03-23 14:45:41.237', 'cmn39lcx3001gtga3e8cndn3r'),
('cmn3b96qh0022tga3vkqktvqw', 'PIX', 26, 'PAID', NULL, '2026-03-23 14:58:26.777', 'cmn3ai47q001otga3nt2kgrsm'),
('cmn3bagk20024tga3o2xq6g9o', 'CREDIT_CARD', 25, 'PAID', NULL, '2026-03-23 14:59:26.162', 'cmn3aufi1001ytga31ariqwnx'),
('cmn3bi37t002gtga3mk3kg0rg', 'PIX', 21, 'PAID', NULL, '2026-03-23 15:05:22.121', 'cmn3a5bip001ktga3paqbasef'),
('cmn3bi8wx002itga3w2cyqmsh', 'CASH', 48.5, 'PAID', NULL, '2026-03-23 15:05:29.505', 'cmn3bdtsi0026tga308shdpik'),
('cmn3bohr8002ktga3iup6s204', 'PIX', 21, 'PAID', NULL, '2026-03-23 15:10:20.900', 'cmn3as76z001stga3ijk5nhjr'),
('cmn3bx6e2002rtga3wihrh0tz', 'CASH', 50, 'PAID', NULL, '2026-03-23 15:17:06.075', 'cmn3bur75002mtga3dcbokkdy'),
('cmn3bzxr7002ttga3nwcliyzg', 'CASH', 21, 'PAID', NULL, '2026-03-23 15:19:14.852', 'cmn3bhg3q002ctga356ydf62w'),
('cmn3ce68t002ztga3xlmrmssp', 'DEBIT_CARD', 29, 'PAID', NULL, '2026-03-23 15:30:19.037', 'cmn3cdlxc002vtga3qly3zmhl'),
('cmn3d20zn0039tga3ujsf53xd', 'PIX', 21, 'PAID', NULL, '2026-03-23 15:48:51.972', 'cmn3cpj460031tga3hpxunvcd'),
('cmn3d234f003btga3vsptxnqj', 'PIX', 25, 'PAID', NULL, '2026-03-23 15:48:54.735', 'cmn3d1rn20035tga36luq2sy3'),
('cmn3ds7li003ltga362p7800i', 'CASH', 22, 'PAID', NULL, '2026-03-23 16:09:13.590', 'cmn3ddpa3003dtga31cu1rb6k'),
('cmn3dwr97003rtga3on57st8v', 'CASH', 25, 'PAID', NULL, '2026-03-23 16:12:45.691', 'cmn3dvyu7003ntga3sf225b4g'),
('cmn3dyqtv003ttga3uruv3g1d', 'PIX', 21, 'PAID', NULL, '2026-03-23 16:14:18.451', 'cmn3dnewy003htga3lxxf6zn7'),
('cmn3dzpwg0041tga3hvok9zeq', 'CASH', 26, 'PAID', NULL, '2026-03-23 16:15:03.904', 'cmn3dzizv003vtga3fociisd5'),
('cmn3fw2yr0047tga3o48bkb33', 'CREDIT_CARD', 21, 'PAID', NULL, '2026-03-23 17:08:13.444', 'cmn3e5q930043tga3hxzqvmyb'),
('cmn3fw86a0049tga3yfoblu4b', 'CASH', 53, 'PAID', NULL, '2026-03-23 17:08:20.195', 'cmn38l77g000ktga3b3hm95cw'),
('cmn4pacbj001lg2zq5dkzfoau', 'PIX', 50, 'PAID', NULL, '2026-03-24 14:19:01.471', 'cmn4ocdyk000ug2zq4nspij0k'),
('cmn4pfv3x001vg2zqu8j4uw7o', 'PIX', 29, 'PAID', NULL, '2026-03-24 14:23:19.102', 'cmn4pfoe6001rg2zqzoufowd9'),
('cmn4q037g002ag2zq035gmutq', 'PIX', 21, 'PAID', NULL, '2026-03-24 14:39:02.716', 'cmn4po0ih0026g2zqee38qnn6'),
('cmn4q0e9x002dg2zqsv62g6mk', 'CREDIT', 21, 'PAID', NULL, '2026-03-24 14:39:17.062', 'cmn4ply7r0022g2zqzkzq777q'),
('cmn4raj2d0039g2zqd6ef9s96', 'CASH', 58, 'PAID', NULL, '2026-03-24 15:15:09.445', 'cmn4qvhxe002wg2zqjouiukas'),
('cmn4rb8r0003bg2zqc287u57k', 'PIX', 25, 'PAID', NULL, '2026-03-24 15:15:42.733', 'cmn4q8fij002kg2zqg6gjcjkk'),
('cmn4rbycl003dg2zqgyplt5y1', 'PIX', 21, 'PAID', NULL, '2026-03-24 15:16:15.909', 'cmn4qoivw002og2zqlkt51dgs'),
('cmn4rc31b003fg2zqc5ajqfhx', 'PIX', 13, 'PAID', NULL, '2026-03-24 15:16:21.983', 'cmn4qporw002sg2zqgt5sbyu7'),
('cmn4rcg2t003hg2zqlv0e5fxp', 'CREDIT_CARD', 25, 'PAID', NULL, '2026-03-24 15:16:38.886', 'cmn4qzlzt0031g2zql81rtijb'),
('cmn4rl4jc003sg2zq9yva4xsv', 'PIX', 42, 'PAID', NULL, '2026-03-24 15:23:23.832', 'cmn4ri5x2003jg2zq5r8r0slb'),
('cmn4rl8ka003ug2zqdoebv41o', 'CASH', 21, 'PAID', NULL, '2026-03-24 15:23:29.050', 'cmn4r9c720035g2zqz0k65e3b'),
('cmn4ruyrp004cg2zq94uy0dun', 'CASH', 25, 'PAID', NULL, '2026-03-24 15:31:02.917', 'cmn4riq61003og2zqov4vi75q'),
('cmn4u3o10004ig2zqh49vy0db', 'DEBIT_CARD', 21, 'PAID', NULL, '2026-03-24 16:33:48.132', 'cmn4u37ad004eg2zq1ilxce0f'),
('cmn4u3ql3004kg2zqkstqsul3', 'DEBIT_CARD', 23.94, 'PAID', NULL, '2026-03-24 16:33:51.447', 'cmn4rrsmc0041g2zq47oeqb7i'),
('cmn4u3w0q004mg2zq517akt69', 'DEBIT_CARD', 22.91, 'PAID', NULL, '2026-03-24 16:33:58.491', 'cmn4rpwur003wg2zq3oxcbm05'),
('cmn4uwpsb004sg2zqk3g5uwak', 'CASH', 21, 'PAID', NULL, '2026-03-24 16:56:23.436', 'cmn4uwioz004og2zqd8pc8ej6'),
('cmn4uxz8k004yg2zqso7dagnw', 'CASH', 21, 'PAID', NULL, '2026-03-24 16:57:22.341', 'cmn4uxl2n004ug2zqooqzjav3'),
('cmn63g10l0064g2zqpsr2tk1t', 'DEBIT_CARD', 29, 'PAID', NULL, '2026-03-25 13:43:07.558', 'cmn639lon0060g2zq28gnj5i7'),
('cmn64013m006cg2zq0vjj65bi', 'CREDIT', 35, 'PAID', NULL, '2026-03-25 13:58:40.786', 'cmn63r16e0066g2zqk23hjxqn'),
('cmn64q4oe0074g2zqpsgo1x47', 'CASH', 25, 'PAID', NULL, '2026-03-25 14:18:58.478', 'cmn64lfwt006tg2zq6rw1c0kq'),
('cmn64qt5a0076g2zqda7m33vi', 'CREDIT_CARD', 25, 'PAID', NULL, '2026-03-25 14:19:30.190', 'cmn64nlie0070g2zqj5onba89'),
('cmn64wcyn0078g2zqlj28lfyo', 'PIX', 29, 'PAID', NULL, '2026-03-25 14:23:49.152', 'cmn62vdf7005gg2zqjozuxy3q'),
('cmn65ca8l007gg2zqbl90irp2', 'CASH', 25, 'PAID', NULL, '2026-03-25 14:36:12.117', 'cmn64yk6l007ag2zq0symm44r'),
('cmn65e7l8007mg2zqypv2f15b', 'PIX', 23, 'PAID', NULL, '2026-03-25 14:37:41.996', 'cmn65cugv007ig2zqn8drek4l'),
('cmn66lnv4008sg2zq9tt8pr0m', 'CASH', 21, 'PAID', NULL, '2026-03-25 15:11:29.296', 'cmn66epev008hg2zqvzlm64hm'),
('cmn66xb6f009bg2zq5un5jdst', 'PIX', 21, 'PAID', NULL, '2026-03-25 15:20:32.728', 'cmn66jbni008og2zq7hhrsgey'),
('cmn6737tz009dg2zqv973ihjk', 'PIX', 60, 'PAID', NULL, '2026-03-25 15:25:08.328', 'cmn664ayt0086g2zqmu0pl3eh'),
('cmn673ndp009fg2zqjsv32yi9', 'DEBIT_CARD', 26, 'PAID', NULL, '2026-03-25 15:25:28.477', 'cmn6617w4007xg2zqd49fe9r4'),
('cmn679upg009qg2zq573swxqa', 'CASH', 15.9, 'PAID', NULL, '2026-03-25 15:30:17.908', 'cmn679psw009mg2zqbte9jm7w'),
('cmn67a8vw009sg2zq65tsax5y', 'PIX', 54, 'PAID', NULL, '2026-03-25 15:30:36.284', 'cmn66tu2j0092g2zqfnm34gc8'),
('cmn67iyie00a5g2zqg8lcgyvy', 'PIX', 21, 'PAID', NULL, '2026-03-25 15:37:22.742', 'cmn65pty3007og2zqmmevbw9k'),
('cmn67jc4h00a7g2zqdqtf2ygc', 'PIX', 35.4, 'PAID', NULL, '2026-03-25 15:37:40.386', 'cmn6606a2007sg2zqwvm95gqc'),
('cmn67l0f500a9g2zqmn68kzw6', 'PIX', 25, 'PAID', NULL, '2026-03-25 15:38:58.530', 'cmn66qsmt008yg2zq0024lhwd'),
('cmn67lz5o00abg2zqrb385ttk', 'CASH', 21, 'PAID', NULL, '2026-03-25 15:39:43.548', 'cmn66oj8n008ug2zqndx4xoxp'),
('cmn67o2fr00ahg2zqol6j0rn5', 'PIX', 59, 'PAID', NULL, '2026-03-25 15:41:21.111', 'cmn66a2x3008cg2zqcsskvr8c'),
('cmn67odwe00ajg2zqu6x5mkyr', 'PIX', 83, 'PAID', NULL, '2026-03-25 15:41:35.966', 'cmn6781z8009hg2zqturyy16s'),
('cmn67s2d000aqg2zqcz5hg45u', 'PIX', 35, 'PAID', NULL, '2026-03-25 15:44:27.636', 'cmn67hh3r00a0g2zqp7ibq25u'),
('cmn682x0n00awg2zqltg117m7', 'DEBIT_CARD', 5, 'PAID', NULL, '2026-03-25 15:52:53.927', 'cmn682qcc00asg2zqmtcpqg91'),
('cmn68b4o800ayg2zqn853560q', 'DEBIT_CARD', 23.57, 'PAID', NULL, '2026-03-25 15:59:17.097', 'cmn67qwsk00alg2zqrfizpeob'),
('cmn6979jw00b4g2zqef4v993y', 'DEBIT_CARD', 21, 'PAID', NULL, '2026-03-25 16:24:16.412', 'cmn68cdrt00b0g2zq6z2fi7bh'),
('cmn7ivq81000bhsrvjqyrioln', 'CASH', 43, 'PAID', NULL, '2026-03-26 13:43:00.481', 'cmn7iqb010001hsrvge2qvclc'),
('cmn7ix01t000hhsrv2x42i7pp', 'CASH', 20, 'PAID', NULL, '2026-03-26 13:43:59.874', 'cmn7iwqjt000dhsrv2hszpvsa'),
('cmn7jjyu1000thsrvmctklc1r', 'CASH', 25, 'PAID', NULL, '2026-03-26 14:01:51.385', 'cmn7jcpuz000phsrvckfqdg2t'),
('cmn7k0ewn001ahsrv15irlzps', 'CASH', 56.5, 'PAID', NULL, '2026-03-26 14:14:38.711', 'cmn7jxxwf0010hsrvtkfhggz3'),
('cmn7k2wa8001chsrvqkrvs89h', 'CREDIT_CARD', 42, 'PAID', NULL, '2026-03-26 14:16:34.544', 'cmn7jsvbg000vhsrv7c1bcaqg'),
('cmn7konk7001uhsrvjulkkouz', 'CREDIT', 21, 'PAID', NULL, '2026-03-26 14:33:29.671', 'cmn7itiab0007hsrvou6zvozu'),
('cmn7kz7ii002chsrv8kvw7hcq', 'PIX', 48.5, 'PAID', NULL, '2026-03-26 14:41:42.091', 'cmn7kkuz8001nhsrvpd09nqbp'),
('cmn7l2nlz002ehsrvgwnklni9', 'CASH', 42, 'PAID', NULL, '2026-03-26 14:44:22.919', 'cmn7k67ri001ehsrv5y8ls36n'),
('cmn7la06k002vhsrvww5pxne3', 'CASH', 63, 'PAID', NULL, '2026-03-26 14:50:05.804', 'cmn7l8q86002ghsrvkvouc8fk'),
('cmn7lrjs20031hsrvv743rpt8', 'CASH', 25, 'PAID', NULL, '2026-03-26 15:03:44.355', 'cmn7lb3ra002xhsrvtom6sbqk'),
('cmn7ly5lj0038hsrvo54crlxm', 'CREDIT_CARD', 58, 'PAID', NULL, '2026-03-26 15:08:52.567', 'cmn7lxz5v0033hsrvqaqmy0xq'),
('cmn7mfofw003khsrvlamvugui', 'DEBIT_CARD', 59, 'PAID', NULL, '2026-03-26 15:22:30.141', 'cmn7mebaw003ahsrv4ypdjtya'),
('cmn7mnoho003xhsrv1dwk4cs3', 'PIX', 16.53, 'PAID', NULL, '2026-03-26 15:28:43.452', 'cmn7mks8t003thsrvwhtiawf8'),
('cmn7mp9ek0045hsrvr49gnc5a', 'PIX', 33.39, 'PAID', NULL, '2026-03-26 15:29:57.212', 'cmn7monsd003zhsrv1omw56rm'),
('cmn7mttfo004ehsrvdbgondrf', 'DEBIT_CARD', 28.08, 'PAID', NULL, '2026-03-26 15:33:29.796', 'cmn7mqglm0047hsrvjxchbczy'),
('cmn7nived004zhsrvegqutfog', 'DEBIT_CARD', 29, 'PAID', NULL, '2026-03-26 15:52:58.742', 'cmn7nij0a004uhsrvk3n0cvdn'),
('cmn7nlmys0056hsrv8c43rkcx', 'CREDIT_CARD', 30, 'PAID', NULL, '2026-03-26 15:55:07.780', 'cmn7nl2080051hsrvk8tfbwu2'),
('cmn7ps0qc005jhsrvomxlo30i', 'PIX', 26, 'PAID', NULL, '2026-03-26 16:56:04.789', 'cmn7nqiz8005chsrvfh2nh97e'),
('cmn7ps7kk005lhsrvmg53z98o', 'CREDIT_CARD', 25, 'PAID', NULL, '2026-03-26 16:56:13.653', 'cmn7npgjc0058hsrvcbg6nuym'),
('cmn91ouky0005h6f0ey2n8up5', 'CREDIT_CARD', 25, 'PAID', NULL, '2026-03-27 15:17:18.419', 'cmn91olmw0001h6f029wd70mk'),
('cmnacdcuq0018h6f06g8o6ej9', 'CREDIT_CARD', 1330.5, 'PAID', NULL, '2026-03-28 13:04:04.178', 'cmnac27iq0007h6f02c51l5jw'),
('cmnae9e8l0020h6f0n0vhv4rr', 'CASH', 25, 'PAID', NULL, '2026-03-28 13:56:58.581', 'cmnach5l7001oh6f0axifu74k'),
('cmnaer43s002fh6f0rduldeqj', 'PIX', 50, 'PAID', NULL, '2026-03-28 14:10:45.256', 'cmnaeqpgr0028h6f0w17190rz'),
('cmnaerko8002hh6f0of4ch1lv', 'DEBIT_CARD', 21, 'PAID', NULL, '2026-03-28 14:11:06.729', 'cmnado1ha001wh6f0oupr1t4k'),
('cmnaf63o3002rh6f0v1yh573u', 'PIX', 21, 'PAID', NULL, '2026-03-28 14:22:24.531', 'cmnaexzug002jh6f09oxi7mvd'),
('cmnag1azb003fh6f0qoik3d75', 'DEBIT_CARD', 29, 'PAID', NULL, '2026-03-28 14:46:40.344', 'cmnaf3xrw002nh6f0svmi79zb'),
('cmnag2cni003mh6f058p5oahp', 'CASH', 58, 'PAID', NULL, '2026-03-28 14:47:29.167', 'cmnafk85z002yh6f03cwfl2od'),
('cmnagu2nq0045h6f0hwgjv3ia', 'PIX', 21, 'PAID', NULL, '2026-03-28 15:09:02.583', 'cmnagh5u4003xh6f0t2sb7byu'),
('cmnah3quq004kh6f0uhyd4gxr', 'DEBIT_CARD', 26, 'PAID', NULL, '2026-03-28 15:16:33.842', 'cmnagw7cu0047h6f08gxk52ty'),
('cmnahumlr0053h6f0rt0k67wv', 'PIX', 21, 'PAID', NULL, '2026-03-28 15:37:28.047', 'cmnahghk3004zh6f0mdt0q834'),
('cmnahus5a0055h6f0zehsle75', 'CREDIT_CARD', 84, 'PAID', NULL, '2026-03-28 15:37:35.231', 'cmnah0wl2004eh6f0hqgl0qkz'),
('cmnahvh330057h6f0na4zq8nf', 'PIX', 25, 'PAID', NULL, '2026-03-28 15:38:07.551', 'cmnagss4q0041h6f08e9fszp1'),
('cmnahx6sx0059h6f0eba3wy9k', 'CREDIT_CARD', 50, 'PAID', NULL, '2026-03-28 15:39:27.537', 'cmnagfbr4003sh6f0mz9cwq6p'),
('cmnahxz5i005bh6f0oovy8bj4', 'PIX', 51, 'PAID', NULL, '2026-03-28 15:40:04.279', 'cmnafyqrt0037h6f0n8gp9lkd'),
('cmnaiejyd005ih6f0oe8t2699', 'CASH', 46, 'PAID', NULL, '2026-03-28 15:52:57.734', 'cmnai9iv0005dh6f0duvu186a'),
('cmnaiex9m005kh6f0k9t6geww', 'PIX', 21, 'PAID', NULL, '2026-03-28 15:53:14.987', 'cmnagb4o5003oh6f0qluclkzx'),
('cmnaijbfr005mh6f0p7ft3p4k', 'CREDIT_CARD', 58, 'PAID', NULL, '2026-03-28 15:56:39.975', 'cmnag23a5003hh6f0upsx7mfm'),
('cmnaijkgq005oh6f0l9qa80fz', 'CASH', 21, 'PAID', NULL, '2026-03-28 15:56:51.675', 'cmnafoq6a0033h6f08yc8laum'),
('cmnailvsg005yh6f0xzrdv8vy', 'DEBIT_CARD', 69.39, 'PAID', NULL, '2026-03-28 15:58:39.664', 'cmnailnyw005qh6f0vc9rj4ra'),
('cmnait724006ch6f0mjot6hzp', 'CREDIT_CARD', 143.75, 'PAID', NULL, '2026-03-28 16:04:20.860', 'cmnaip0i10060h6f0ky0hi2e4'),
('cmnaiv26o006ih6f05c3yid5z', 'PIX', 36, 'PAID', NULL, '2026-03-28 16:05:47.856', 'cmnaiup6q006eh6f0hhpi8mse'),
('cmnaj0phd006oh6f0934od1zd', 'DEBIT_CARD', 21, 'PAID', NULL, '2026-03-28 16:10:11.329', 'cmnaixyzs006kh6f0lu4rj4j7'),
('cmnaj4j7s006vh6f0xeahrzpr', 'DEBIT_CARD', 29, 'PAID', NULL, '2026-03-28 16:13:09.832', 'cmnaj464y006qh6f0sv126hy3'),
('cmnaklxjp007dh6f06ntd6t4b', 'CASH', 116, 'PAID', NULL, '2026-03-28 16:54:41.173', 'cmnak5yml006xh6f0des2qfqa'),
('cmnakn9hy007hh6f0yiejal43', 'CASH', 5, 'PAID', NULL, '2026-03-28 16:55:43.318', 'cmnaklfa30075h6f0od0ctxqn'),
('cmnakp199007oh6f0vzch0kf0', 'DEBIT_CARD', 60, 'PAID', NULL, '2026-03-28 16:57:05.950', 'cmnakonxv007jh6f0fd60zwtv'),
('cmnakybxg007zh6f0y7ick472', 'PIX', 160.14, 'PAID', NULL, '2026-03-28 17:04:19.684', 'cmnacjc0j001sh6f02w9qy4ow'),
('cmnalzdi1008eh6f0dfiwvyhg', 'DEBIT_CARD', 50, 'PAID', NULL, '2026-03-28 17:33:07.993', 'cmnalz3wy0089h6f0kho49ltx'),
('cmnam29si008gh6f0b56ga0kh', 'DEBIT_CARD', 30, 'PAID', NULL, '2026-03-28 17:35:23.154', 'cmnal6p660084h6f0xuhgga95'),
('cmnd8efa3000rgdg2h47hxeel', 'PIX', 21, 'PAID', NULL, '2026-03-30 13:36:14.043', 'cmnd8az9m000jgdg2gbdf2vlw'),
('cmnd8ev8f000tgdg2z0c3izf8', 'DEBIT_CARD', 25, 'PAID', NULL, '2026-03-30 13:36:34.719', 'cmnd8dekm000ngdg2d6yfl7lr'),
('cmnd8hpwd000zgdg2m1rcvjcu', 'PIX', 21, 'PAID', NULL, '2026-03-30 13:38:47.773', 'cmnd8hh5p000vgdg20axj0hvi'),
('cmnd9f7ee0015gdg21u3v0b1l', 'CREDIT_CARD', 21, 'PAID', NULL, '2026-03-30 14:04:50.102', 'cmnd870dt000fgdg2t8p4k905'),
('cmnd9u9r5001egdg2r4wkyu6p', 'CASH', 25, 'PAID', NULL, '2026-03-30 14:16:32.993', 'cmnd9sg64001agdg2bkris40o'),
('cmndaoayi001sgdg2yvnu2pb8', 'DEBIT_CARD', 29, 'PAID', NULL, '2026-03-30 14:39:54.235', 'cmndahnwr001ogdg2v2ioqvsp'),
('cmndaodvo001ugdg2miespekm', 'PIX', 21, 'PAID', NULL, '2026-03-30 14:39:58.021', 'cmndaa6ir001kgdg2bx1jraeu'),
('cmndb4oey0025gdg2n8sdppq2', 'PIX', 46.5, 'PAID', NULL, '2026-03-30 14:52:38.170', 'cmndb3vo50020gdg2adtq76zx'),
('cmndbc52f0027gdg23j04bw38', 'CASH', 21, 'PAID', NULL, '2026-03-30 14:58:26.343', 'cmndaqtiv001wgdg28av4edfs'),
('cmndbjhop002jgdg2ndtqgrx7', 'PIX', 28, 'PAID', NULL, '2026-03-30 15:04:09.289', 'cmndbdkoa0029gdg2lsp27tae'),
('cmndbjo5c002lgdg2p5ep1w39', 'PIX', 21, 'PAID', NULL, '2026-03-30 15:04:17.665', 'cmnda99hv001ggdg2n42lb0e6'),
('cmndbtexq0033gdg2ockqypqf', 'DEBIT_CARD', 25, 'PAID', NULL, '2026-03-30 15:11:52.286', 'cmndbtblh002zgdg2idi6udha'),
('cmndda25w003ogdg22p5n2u3a', 'CASH', 120, 'PAID', NULL, '2026-03-30 15:52:48.501', 'cmndd9t3s003kgdg2fmyncrgc'),
('cmnddcg25003qgdg2h9vo1er3', 'CASH', 25, 'PAID', NULL, '2026-03-30 15:54:39.821', 'cmndcigu4003cgdg2f56c5sua'),
('cmnep33r0003vgdg2hjcxdnmr', 'CREDIT_CARD', 26, 'PAID', NULL, '2026-03-31 14:11:05.533', 'cmndd44lh003ggdg2etvdxhvd'),
('cmnepsznq000nhijdcx2aezdx', 'PIX', 25, 'PAID', NULL, '2026-03-31 14:31:13.287', 'cmnepstpl000jhijdjvfi9enq'),
('cmnepxmbo0011hijdb6yqbtjw', 'CREDIT', 42, 'PAID', NULL, '2026-03-31 14:34:49.284', 'cmnepxg0p000vhijde8zjbnn4'),
('cmneq03xh0019hijda4mfydmk', 'CREDIT_CARD', 6, 'PAID', NULL, '2026-03-31 14:36:45.414', 'cmneq00dy0015hijd4tv39u3z'),
('cmneq08ve001bhijdd3lhplzq', 'DEBIT_CARD', 25, 'PAID', NULL, '2026-03-31 14:36:51.819', 'cmnepv9c8000phijdmufikfba'),
('cmneq7cvs001ihijdn9v4irga', 'CREDIT_CARD', 46, 'PAID', NULL, '2026-03-31 14:42:23.609', 'cmneq77vv001dhijdrtby1b7f'),
('cmneq7ya7001ohijdhzvke0pb', 'CASH', 21, 'PAID', NULL, '2026-03-31 14:42:51.343', 'cmneq7vsy001khijds5371mto'),
('cmnergi5f002mhijdk8519piw', 'CREDIT', 21, 'PAID', NULL, '2026-03-31 15:17:29.955', 'cmner702u001vhijdv2fzbrum'),
('cmnersi7b0033hijda4qk5kdm', 'DEBIT_CARD', 79, 'PAID', NULL, '2026-03-31 15:26:49.896', 'cmnerc8pc0024hijd5vez7sz6'),
('cmnerzbw4003jhijdhus1ib14', 'DEBIT_CARD', 19, 'PAID', NULL, '2026-03-31 15:32:08.309', 'cmnerddgd002ahijdnzp2bjtj'),
('cmnes7anj003zhijdhbomw6aa', 'DEBIT_CARD', 54, 'PAID', NULL, '2026-03-31 15:38:19.951', 'cmnervx59003ahijdhsnef0bl'),
('cmnesj9nx004chijdqi30xo7x', 'PIX', 42.48999999999999, 'PAID', NULL, '2026-03-31 15:47:38.541', 'cmnertc1q0035hijd0qa62tqr'),
('cmnesjhfr004ehijdaggy0tk8', 'CREDIT_CARD', 30, 'PAID', NULL, '2026-03-31 15:47:48.615', 'cmneriqay002thijdez40yd1g'),
('cmnet01af0053hijdyveup0fi', 'DEBIT_CARD', 34.95, 'PAID', NULL, '2026-03-31 16:00:40.839', 'cmneres2n002hhijd27sp783g'),
('cmnet0u490055hijd8pyx7uv6', 'PIX', 50, 'PAID', NULL, '2026-03-31 16:01:18.202', 'cmnesmemj004ghijd30x9h09z'),
('cmnetc26e0057hijdp8ev625w', 'DEBIT_CARD', 54.12, 'PAID', NULL, '2026-03-31 16:10:01.863', 'cmnespy4r004lhijdyyfh6d74'),
('cmng4qqbq000oefj7uddtzlrg', 'DEBIT_CARD', 34, 'PAID', NULL, '2026-04-01 14:17:08.295', 'cmng4nsbq000hefj7lvd414vg'),
('cmng4qt06000qefj7ax6hnq6q', 'DEBIT_CARD', 29, 'PAID', NULL, '2026-04-01 14:17:11.767', 'cmng4lwzy000defj7t0qnbe2y'),
('cmng4qvlz000sefj709c6idpc', 'PIX', 138, 'PAID', NULL, '2026-04-01 14:17:15.143', 'cmng4fgq80001efj7g1rkxkoh'),
('cmng51qyw000yefj7bt5616ry', 'CASH', 21, 'PAID', NULL, '2026-04-01 14:25:42.344', 'cmng51nz8000uefj7vrnzsxwz'),
('cmng53big0014efj7z44a3940', 'PIX', 25, 'PAID', NULL, '2026-04-01 14:26:55.624', 'cmng5279d0010efj7gc171z2r'),
('cmng5eznf001nefj7j91m8fl1', 'DEBIT_CARD', 25, 'PAID', NULL, '2026-04-01 14:36:00.124', 'cmng56hp7001eefj7lukm69nw'),
('cmng5fczg001qefj73gd27i9d', 'CREDIT', 29, 'PAID', NULL, '2026-04-01 14:36:17.404', 'cmng55mdq001aefj72wsxk6ro'),
('cmng5p2120024efj7ji9e5uo9', 'CREDIT', 42, 'PAID', NULL, '2026-04-01 14:43:49.766', 'cmng5eh77001iefj7opqiul6c'),
('cmng67iy3002mefj7dywd0dsh', 'DEBIT_CARD', 21, 'PAID', NULL, '2026-04-01 14:58:11.499', 'cmng5v2n9002aefj7addf5n75'),
('cmng890iw004befj7fsfu7wyn', 'CASH', 25, 'PAID', NULL, '2026-04-01 15:55:20.168', 'cmng7l8b1003vefj717vgepo9'),
('cmng8e62b004defj71jy3cu7y', 'DEBIT_CARD', 89.07000000000002, 'PAID', NULL, '2026-04-01 15:59:20.628', 'cmng7osc2003zefj7g5elhlbl'),
('cmng8ojpi004uefj70hd8jqzp', 'CREDIT', 62, 'PAID', NULL, '2026-04-01 16:07:24.871', 'cmng8hmp9004fefj7psdjb4wq'),
('cmng8osos004zefj79p5al8gp', 'CREDIT', 33, 'PAID', NULL, '2026-04-01 16:07:36.509', 'cmng7cfg6003hefj7umpgi70r'),
('cmnhisfoc0057efj7mr0354io', 'CREDIT_CARD', 21, 'PAID', NULL, '2026-04-02 13:38:08.604', 'cmng5425i0016efj71od20dm9'),
('cmnhisl760059efj7w99jy3a8', 'PIX', 25, 'PAID', NULL, '2026-04-02 13:38:15.762', 'cmng5jji2001xefj7cpqk5ffo'),
('cmnhisr8a005befj7bl2ujf8b', 'CASH', 21, 'PAID', NULL, '2026-04-02 13:38:23.579', 'cmng728ul0034efj7ak6hi1lc'),
('cmnhisuxc005defj7540aivzd', 'PIX', 25, 'PAID', NULL, '2026-04-02 13:38:28.368', 'cmng705o20030efj7fn2qnw3l'),
('cmnhiszse005fefj7v8y1ixih', 'DEBIT_CARD', 25, 'PAID', NULL, '2026-04-02 13:38:34.670', 'cmng6w88f002wefj7y4msoh0n'),
('cmnhit4g0005hefj711u0wxma', 'CASH', 25, 'PAID', NULL, '2026-04-02 13:38:40.705', 'cmng776oh0038efj7g5ouslro'),
('cmnhit6cx005jefj7wsf6p3mf', 'CASH', 29, 'PAID', NULL, '2026-04-02 13:38:43.186', 'cmng79653003defj7s3zdx30l'),
('cmnhitb7y005lefj7yqsf74bq', 'PIX', 46, 'PAID', NULL, '2026-04-02 13:38:49.487', 'cmng7ggrc003qefj76k3rtut3'),
('cmnhitghk005nefj7zwc4ts5y', 'PIX', 42, 'PAID', NULL, '2026-04-02 13:38:56.313', 'cmng7f2p4003lefj7xnjcckgt'),
('cmnhitjns005pefj79of6pstm', 'PIX', 25, 'PAID', NULL, '2026-04-02 13:39:00.425', 'cmng8psk00053efj7g3tizsrf'),
('cmnhjskqg000otr3bxsefrs1u', 'CASH', 21, 'PAID', NULL, '2026-04-02 14:06:14.776', 'cmnhjmxi5000ktr3bmy253onp'),
('cmnhjsmg8000qtr3bzfk105jo', 'PIX', 50, 'PAID', NULL, '2026-04-02 14:06:17.001', 'cmnhjcx5m000ftr3b3icw5c6l'),
('cmnhjznk0000wtr3bv76vj7fq', 'CASH', 25, 'PAID', NULL, '2026-04-02 14:11:45.024', 'cmnhjv80g000str3bnmh3cxze'),
('cmnhkoqyv0016tr3b3lr79c75', 'PIX', 25, 'PAID', NULL, '2026-04-02 14:31:15.848', 'cmnhkdihb0012tr3by8eixf19'),
('cmnhkott00018tr3b7p5hlai5', 'PIX', 25, 'PAID', NULL, '2026-04-02 14:31:19.524', 'cmnhk1ge0000ytr3bqycouk3d'),
('cmnhl76gg001utr3bqtjm4j9y', 'CREDIT', 58, 'PAID', NULL, '2026-04-02 14:45:35.729', 'cmnhks20h001etr3bmr9ilkq9'),
('cmnhm9p1q0022tr3bxf0qup1n', 'PIX', 25, 'PAID', NULL, '2026-04-02 15:15:32.750', 'cmnhkqku2001atr3bbioccqb4'),
('cmnhmid3p0028tr3bk3ir2sw9', 'PIX', 21, 'PAID', NULL, '2026-04-02 15:22:17.173', 'cmnhm4wxt001ytr3bhftth5hr'),
('cmnhmr5kz002utr3b809fv5to', 'CASH', 14.78, 'PAID', NULL, '2026-04-02 15:29:07.331', 'cmnhmmlg9002etr3bhn4jky3d'),
('cmnhnbyzv003gtr3bgbpoywqm', 'CREDIT_CARD', 38.58, 'PAID', NULL, '2026-04-02 15:45:18.572', 'cmnhmoguc002ltr3bujjl5rr2'),
('cmnhndzss003itr3bk8wnrvgo', 'PIX', 21, 'PAID', NULL, '2026-04-02 15:46:52.924', 'cmnhn0dm2003ctr3bxx7feo35'),
('cmnhngvsl003otr3bsvk7mmgp', 'CASH', 29, 'PAID', NULL, '2026-04-02 15:49:07.701', 'cmnhmu4pn0037tr3bvjrpgtsr'),
('cmnkf8y8z001b5c8by0u1xgbl', 'PIX', 26, 'PAID', NULL, '2026-04-04 14:22:19.235', 'cmnkf8pij00165c8bkrixznoa'),
('cmnkiqf4l00415c8buw0xh98s', 'CREDIT_CARD', 63, 'PAID', NULL, '2026-04-04 15:59:53.110', 'cmnkilloj003r5c8bnz2izcxf'),
('cmnkiqyb200435c8b2f1mkp58', 'CASH', 25, 'PAID', NULL, '2026-04-04 16:00:17.966', 'cmnki24gk00385c8bxp3clay9'),
('cmnkir1er00455c8bi0pvrh2a', 'PIX', 21, 'PAID', NULL, '2026-04-04 16:00:21.987', 'cmnkhu5rl00345c8bdveiq0li'),
('cmnkir6k600475c8b906x6mw2', 'CREDIT_CARD', 46, 'PAID', NULL, '2026-04-04 16:00:28.662', 'cmnkhqsvb002z5c8b2d2objft'),
('cmnkird8j00495c8bctsi3cnc', 'CASH', 25, 'PAID', NULL, '2026-04-04 16:00:37.316', 'cmnkhc8vi002v5c8by36pgd9b'),
('cmnkiri4e004b5c8bm8qwcsxd', 'CASH', 42, 'PAID', NULL, '2026-04-04 16:00:43.647', 'cmnkh9xtg002q5c8bwp0g2pai'),
('cmnkirlns004d5c8bvtu19g39', 'PIX', 46, 'PAID', NULL, '2026-04-04 16:00:48.233', 'cmnkgrtgb00285c8b6cnwg5hj'),
('cmnkirp2d004f5c8bm8xajoua', 'DEBIT_CARD', 42, 'PAID', NULL, '2026-04-04 16:00:52.646', 'cmnkfvc35001z5c8bx9kg6d3t'),
('cmnkiscv8004m5c8bdbclxzac', 'CREDIT_CARD', 225, 'PAID', NULL, '2026-04-04 16:01:23.492', 'cmnkfo3q8001q5c8bspkb4gxh'),
('cmnkivz90004t5c8bbdjg4tde', 'CREDIT_CARD', 60, 'PAID', NULL, '2026-04-04 16:04:12.469', 'cmnkivvq5004o5c8bjvrg6dut'),
('cmnkj2857004z5c8bq91g5tro', 'CREDIT_CARD', 29, 'PAID', NULL, '2026-04-04 16:09:03.932', 'cmnkh4b63002m5c8bcqo4bd11'),
('cmnkj2dvd00515c8bmane57o7', 'CASH', 21, 'PAID', NULL, '2026-04-04 16:09:11.353', 'cmnkgwtyt002i5c8bq63jivan'),
('cmnkj2inl00535c8bdz5po8dv', 'CREDIT_CARD', 42, 'PAID', NULL, '2026-04-04 16:09:17.553', 'cmnkgwcuc002d5c8bvxdrmxyo'),
('cmnkj2nmk00555c8bmoi87awk', 'DEBIT_CARD', 29, 'PAID', NULL, '2026-04-04 16:09:23.996', 'cmnkfiewy001m5c8bwuztkkph'),
('cmnkj2uyr00575c8bter64tz7', 'CASH', 25, 'PAID', NULL, '2026-04-04 16:09:33.508', 'cmnkfg8lu001i5c8b9dv6jebv'),
('cmnkj2yjl00595c8bvb3xyo7x', 'CASH', 35, 'PAID', NULL, '2026-04-04 16:09:38.145', 'cmnkfe3aj001d5c8bi3nfzgqn'),
('cmnkj332p005b5c8bhqsnbib3', 'CREDIT_CARD', 58, 'PAID', NULL, '2026-04-04 16:09:44.017', 'cmnkeuraz000g5c8beofe8qjm'),
('cmnkj39qg005d5c8bw0i1deio', 'CASH', 48.5, 'PAID', NULL, '2026-04-04 16:09:52.649', 'cmnkf077y000l5c8bv1920j7r'),
('cmnkj3d4u005f5c8b6hse2c5n', 'CASH', 107, 'PAID', NULL, '2026-04-04 16:09:57.055', 'cmnkf2i5h000r5c8bpvtzdn32'),
('cmnkkp2r9000j6ptyxfsnudgy', 'PIX', 46, 'PAID', NULL, '2026-04-04 16:54:49.653', 'cmnkkoc3j00086ptymmz68hrk'),
('cmnkkp7us000l6ptytbe24hvm', 'CASH', 25, 'PAID', NULL, '2026-04-04 16:54:56.261', 'cmnkiyxmz004v5c8bz9grcayn'),
('cmnkm82il000n6pty2jgjborw', 'PIX', 47.46, 'PAID', NULL, '2026-04-04 17:37:35.422', 'cmnkkoyz7000d6ptyfnf33nov'),
('cmnnb6l2u000h9rpa1xiwnehe', 'CREDIT', 50, 'PAID', NULL, '2026-04-06 14:51:48.918', 'cmnnb65mw000b9rpao0rrv809'),
('cmnnb9yro000p9rpanc8r8l34', 'PIX', 21, 'PAID', NULL, '2026-04-06 14:54:26.628', 'cmnnb9mwv000l9rpacc2cp8fv'),
('cmnnbavfu000r9rpam5t2uq5s', 'PIX', 25, 'PAID', NULL, '2026-04-06 14:55:08.970', 'cmnnb2nb100079rpadjm7uf5f'),
('cmnnbc2le000x9rpaytwpnm9e', 'PIX', 21, 'PAID', NULL, '2026-04-06 14:56:04.899', 'cmnnbbyrd000t9rpaz35zs98y'),
('cmnnbddxu00139rpan1brocaw', 'PIX', 25, 'PAID', NULL, '2026-04-06 14:57:06.258', 'cmnnbd8zo000z9rpadufm23hm'),
('cmnnc6h92001e9rpa5tf75lqj', 'CASH', 29, 'PAID', NULL, '2026-04-06 15:19:43.574', 'cmnnc6bwa001a9rpaea14ih8z'),
('cmnnc6lid001g9rpajjzgx6j3', 'PIX', 42, 'PAID', NULL, '2026-04-06 15:19:49.093', 'cmnnc42lf00159rpaq8x5w3by'),
('cmnnc7t98001n9rpassoxg901', 'PIX', 50, 'PAID', NULL, '2026-04-06 15:20:45.789', 'cmnnc7pt7001i9rpa0b3eo26r'),
('cmnnc94nf001t9rpai7btglg9', 'PIX', 25, 'PAID', NULL, '2026-04-06 15:21:47.212', 'cmnnc90rp001p9rpa9dmyj0gt'),
('cmnncjkox00239rpaom0mo2fa', 'CASH', 21, 'PAID', NULL, '2026-04-06 15:29:54.561', 'cmnncjgzl001z9rpa2fb2ivol'),
('cmnncnpnp002e9rpa72svx574', 'PIX', 50, 'PAID', NULL, '2026-04-06 15:33:07.621', 'cmnncne6c00299rpa6o57kpw9'),
('cmnncq2hu002m9rpagrit3d84', 'PIX', 83, 'PAID', NULL, '2026-04-06 15:34:57.571', 'cmnncpspk002g9rpamwe43sqb'),
('cmnncweb8002y9rpafqzp23xc', 'CREDIT_CARD', 29, 'PAID', NULL, '2026-04-06 15:39:52.820', 'cmnncvw3a002s9rpaydos0wl2'),
('cmnnd1zii00359rpa7mok9jpi', 'DEBIT_CARD', 29, 'PAID', NULL, '2026-04-06 15:44:13.579', 'cmnnckide00259rpabdd91d9h'),
('cmnnd265d00379rpaah7niqrb', 'CREDIT_CARD', 21, 'PAID', NULL, '2026-04-06 15:44:22.177', 'cmnncfbkn001v9rpackvsanmb'),
('cmnnd2rjj00399rpa8hkg11a1', 'PIX', 88, 'PAID', NULL, '2026-04-06 15:44:49.904', 'cmnnd0fjd00309rpayccqiq8i'),
('cmnnd3bcc003f9rpasdpn0886', 'PIX', 8, 'PAID', NULL, '2026-04-06 15:45:15.565', 'cmnnd37n7003b9rpad1wrriy1'),
('cmnnd6y6m003v9rpa3qu4hrp5', 'PIX', 30.95, 'PAID', NULL, '2026-04-06 15:48:05.135', 'cmnnd6gw2003p9rpaltzi13pu'),
('cmnndaogo00429rparec0jkev', 'PIX', 31.96, 'PAID', NULL, '2026-04-06 15:50:59.161', 'cmnnd87mh003x9rpacobgcheb'),
('cmnndigvr004d9rpalhee9ea4', 'CREDIT_CARD', 58, 'PAID', NULL, '2026-04-06 15:57:02.583', 'cmnndiadf00489rpallqmmlsb'),
('cmnndinfu004f9rpatipe9biq', 'PIX', 21, 'PAID', NULL, '2026-04-06 15:57:11.082', 'cmnndhion00449rpah0h3o4vp'),
('cmnndpabd004h9rpa8xke8741', 'DEBIT_CARD', 24.05, 'PAID', NULL, '2026-04-06 16:02:20.665', 'cmnnd4iqi003h9rpamrzkm5vy'),
('cmnne4tl0004o9rpal09x12jg', 'PIX', 20.69, 'PAID', NULL, '2026-04-06 16:14:25.476', 'cmnndu8m8004j9rpay2zj7n48'),
('cmnnelhqo00529rpajpiiicpk', 'DEBIT_CARD', 21, 'PAID', NULL, '2026-04-06 16:27:23.280', 'cmnnelb8f004y9rpa1hav2wsv'),
('cmnop5ric005k9rpafyrze868', 'CREDIT_CARD', 21, 'PAID', NULL, '2026-04-07 14:10:51.396', 'cmnooxgad005e9rpas5ng2v73'),
('cmnop5uey005m9rpahz9up1g1', 'CREDIT_CARD', 29, 'PAID', NULL, '2026-04-07 14:10:55.162', 'cmnoowzsr005a9rpafqk1vc6k'),
('cmnop6xp1005u9rpa5zeindbp', 'CREDIT', 50, 'PAID', NULL, '2026-04-07 14:11:46.069', 'cmnop6qje005o9rpanxesvvnm'),
('cmnopln5500629rparrz0x7mj', 'CASH', 21, 'PAID', NULL, '2026-04-07 14:23:12.233', 'cmnopliry005y9rpa4748c5ct'),
('cmnopsflj00689rpaq6ygkdv3', 'CASH', 25, 'PAID', NULL, '2026-04-07 14:28:29.047', 'cmnopsbiv00649rpa7sqtlfir'),
('cmnor4mqd00709rpajinvu9ky', 'DEBIT_CARD', 25, 'PAID', NULL, '2026-04-07 15:05:57.782', 'cmnor2mjw006q9rpa8fw6uaj6'),
('cmnq4qp6z000nxtol4o01e3d8', 'DEBIT_CARD', 21, 'PAID', NULL, '2026-04-08 14:14:48.588', 'cmnq3ihz3000fxtolva7iqog6'),
('cmnq4qrqn000pxtolg3d5mqfc', 'PIX', 21, 'PAID', NULL, '2026-04-08 14:14:51.888', 'cmnq3fskr000bxtolwakpd9jo'),
('cmnq4qz28000rxtolg9q5fg6j', 'PIX', 21, 'PAID', NULL, '2026-04-08 14:15:01.376', 'cmnq3dsdm0007xtolqs1mc06g'),
('cmnq51sqt0018xtoltsss2iln', 'CASH', 25, 'PAID', NULL, '2026-04-08 14:23:26.405', 'cmnq51oil0014xtoly226wir0'),
('cmnq525ew001axtol5jtw87nc', 'PIX', 25, 'PAID', NULL, '2026-04-08 14:23:42.824', 'cmnq4ncrm000jxtol2rn7t2ib'),
('cmnq7pvtl002yxtol63scac1v', 'CREDIT', 59.22, 'PAID', NULL, '2026-04-08 15:38:09.370', 'cmnq7pkar002rxtolk2t6u24i'),
('cmnq7yrvb003axtold5wdgk9g', 'CREDIT', 25, 'PAID', NULL, '2026-04-08 15:45:04.151', 'cmnq5ifh3001cxtolmk7b0fgy'),
('cmnq7z7zz003extolfey7dsd5', 'PIX', 25, 'PAID', NULL, '2026-04-08 15:45:25.056', 'cmnq5ju9f001gxtolazfig3v9'),
('cmnq7zicz003gxtolnir5j9yr', 'PIX', 25, 'PAID', NULL, '2026-04-08 15:45:38.483', 'cmnq5qyxo001mxtolenlosw6q'),
('cmnq7zkfi003ixtolb9925eix', 'PIX', 21, 'PAID', NULL, '2026-04-08 15:45:41.167', 'cmnq5xdfb001qxtolbapdkjbj'),
('cmnq7zn5v003kxtoldbeet2gq', 'PIX', 21, 'PAID', NULL, '2026-04-08 15:45:44.708', 'cmnq61ma4001uxtolw4dxgbjg'),
('cmnq7zqlb003mxtolhf04dy2h', 'PIX', 25, 'PAID', NULL, '2026-04-08 15:45:49.152', 'cmnq62wc3001yxtolabugp23s'),
('cmnq7zsby003oxtol8jicwz05', 'PIX', 21, 'PAID', NULL, '2026-04-08 15:45:51.407', 'cmnq68em40022xtolccpxjcqd'),
('cmnq7zusp003qxtol48ttr1k6', 'PIX', 25, 'PAID', NULL, '2026-04-08 15:45:54.602', 'cmnq70oxh0026xtolkbaj6kps'),
('cmnq7zxmm003sxtolr8ejdi1e', 'CASH', 25, 'PAID', NULL, '2026-04-08 15:45:58.270', 'cmnq7x1my0035xtol37i5pvrw'),
('cmnq86vrq000mq8w65ndqiav8', 'CREDIT', 263, 'PAID', NULL, '2026-04-08 15:51:22.454', 'cmnq83xod0001q8w6iwhwwca9'),
('cmnq8bvxh000qq8w6x89uyyse', 'PIX', 129, 'PAID', NULL, '2026-04-08 15:55:15.941', 'cmnq4wvp8000txtolsqn99py1'),
('cmnq8hhmg000wq8w6m7r511vn', 'CASH', 25, 'PAID', NULL, '2026-04-08 15:59:37.336', 'cmnq8em5q000sq8w6p9bthx8u'),
('cmnq8ka2f001aq8w6goqoyg40', 'CREDIT_CARD', 25, 'PAID', NULL, '2026-04-08 16:01:47.512', 'cmnq8k6tj0016q8w6zam9izud'),
('cmnq9aric001gq8w61mfcby1h', 'CASH', 25, 'PAID', NULL, '2026-04-08 16:22:23.173', 'cmnq9aihx001cq8w62nvglyj2'),
('cmnrjn3nd0026q8w6lt1z1ckf', 'PIX', 25, 'PAID', NULL, '2026-04-09 13:59:41.113', 'cmnrix0f0001oq8w6qskwfrc7'),
('cmnrjzhj1002pq8w6erdrzk1e', 'CREDIT', 76, 'PAID', NULL, '2026-04-09 14:09:18.973', 'cmnrj1m7p001sq8w6kq8z2nak'),
('cmnrk8vkq002xq8w6ajfzr7ms', 'CASH', 21, 'PAID', NULL, '2026-04-09 14:16:37.082', 'cmnrk4drp002tq8w6dxuvwr8y'),
('cmnrka0v8002zq8w6zgt8j0j2', 'DEBIT_CARD', 29, 'PAID', NULL, '2026-04-09 14:17:30.596', 'cmnrjtk8x002kq8w63f1xeyia'),
('cmnrka4340031q8w6uy6hmsay', 'CREDIT_CARD', 50, 'PAID', NULL, '2026-04-09 14:17:34.769', 'cmnrjr95d002fq8w6nceod92k'),
('cmnrljrpe003fq8w6ae568nnz', 'CASH', 21, 'PAID', NULL, '2026-04-09 14:53:04.898', 'cmnrljmdn003bq8w6hrbatxr7'),
('cmnrlkgkn003kq8w6wqlmmx6c', 'DEBIT_CARD', 50, 'PAID', NULL, '2026-04-09 14:53:37.128', 'cmnrlchky0037q8w6h0n75ox4'),
('cmnrmba0h0040q8w6a73na4rg', 'CREDIT_CARD', 60, 'PAID', NULL, '2026-04-09 15:14:28.338', 'cmnrmaq1x003uq8w6u33iwbbd'),
('cmnrmbxc70047q8w6lgollw40', 'CASH', 25, 'PAID', NULL, '2026-04-09 15:14:58.568', 'cmnrlo9yk003qq8w6ow3uq71s'),
('cmnrmccq60049q8w6sillcc8w', 'PIX', 25, 'PAID', NULL, '2026-04-09 15:15:18.511', 'cmnrllh0l003mq8w6v7ldx7jx'),
('cmnrmchv2004bq8w6vjcliuqh', 'DEBIT_CARD', 21, 'PAID', NULL, '2026-04-09 15:15:25.166', 'cmnrknx4e0033q8w6fnz8kb2a'),
('cmnrmd7ry004dq8w6xq23gmei', 'PIX', 75, 'PAID', NULL, '2026-04-09 15:15:58.750', 'cmnrjo8530028q8w6smqm4vqs'),
('cmnrn0dw40053q8w6992lwsyl', 'CREDIT_CARD', 28, 'PAID', NULL, '2026-04-09 15:33:59.764', 'cmnrmljud004kq8w6y8l45pn1'),
('cmnrn7k8l005nq8w6e72pymu4', 'CREDIT_CARD', 16.51, 'PAID', NULL, '2026-04-09 15:39:34.581', 'cmnrmx8a0004pq8w6l1xdyi1x'),
('cmnrne9ny005tq8w6wfze9wqm', 'DEBIT_CARD', 33, 'PAID', NULL, '2026-04-09 15:44:47.470', 'cmnrn66wj005iq8w6b4sv1a7i'),
('cmnrnfer5005wq8w6q88iv506', 'CREDIT', 186, 'PAID', NULL, '2026-04-09 15:45:40.722', 'cmnrme8f1004fq8w6g8cam97b'),
('cmnroevp0006jq8w6wplo77zj', 'CASH', 32.5, 'PAID', NULL, '2026-04-09 16:13:15.636', 'cmnroe3m4006dq8w68ty0swsq'),
('cmnrof61r006lq8w6k6ulccpm', 'CASH', 33, 'PAID', NULL, '2026-04-09 16:13:29.056', 'cmnrn1g5v0055q8w6i93skdwb'),
('cmnt2e7z90079q8w6w2e3zfnn', 'CASH', 15, 'PAID', NULL, '2026-04-10 15:32:25.702', 'cmnt2a2rh0075q8w66bit6442'),
('cmnt2hhbl007oq8w6b4zwm2zy', 'DEBIT_CARD', 26, 'PAID', NULL, '2026-04-10 15:34:57.778', 'cmnt2h4dk007hq8w60bwx5lmc'),
('cmnt2i5n1007vq8w6g51od8fh', 'DEBIT_CARD', 58, 'PAID', NULL, '2026-04-10 15:35:29.293', 'cmnt2i0hi007qq8w6qx5gtez3'),
('cmnt32go00083q8w6f2hspbpt', 'CREDIT', 58, 'PAID', NULL, '2026-04-10 15:51:16.704', 'cmnt32377007xq8w6ott0bd3n'),
('cmnt36gd3008iq8w6ojtngafs', 'CREDIT', 94, 'PAID', NULL, '2026-04-10 15:54:22.935', 'cmnt33p270087q8w63cuaaoj3'),
('cmnuf6g4z000jba6ve39new5u', 'CASH', 25, 'PAID', NULL, '2026-04-11 14:18:04.212', 'cmnuf6dme000fba6v8so88sqg'),
('cmnuf7qtg000wba6vnwn3q0oi', 'PIX', 21, 'PAID', NULL, '2026-04-11 14:19:04.708', 'cmnuf7n83000sba6vdbvk3xuv'),
('cmnuf7y7d000zba6vti63wveo', 'CREDIT', 75, 'PAID', NULL, '2026-04-11 14:19:14.282', 'cmnuf6xq0000lba6vlq4sj9kr'),
('cmnufjo3j001jba6vbqhysgw0', 'PIX', 75, 'PAID', NULL, '2026-04-11 14:28:21.056', 'cmnufj7xl001cba6vyobc1ttr'),
('cmnufwrpj001pba6vae6bvtoy', 'PIX', 21, 'PAID', NULL, '2026-04-11 14:38:32.264', 'cmnufhrnj0018ba6vmnf9ij7j'),
('cmnufzavu001rba6vsmmddgy0', 'DEBIT_CARD', 21, 'PAID', NULL, '2026-04-11 14:40:30.426', 'cmnuft2ni001lba6vfa3qsokx'),
('cmnuhbeet002zba6vio1es3hk', 'CREDIT_CARD', 46, 'PAID', NULL, '2026-04-11 15:17:54.485', 'cmnuhbax9002tba6vimmzb7nf'),
('cmnuhlwj5003oba6vj88rlmfk', 'CREDIT_CARD', 74, 'PAID', NULL, '2026-04-11 15:26:04.529', 'cmnuh7q4n002mba6v329z1fzo'),
('cmnuhnwsu003qba6v3dd5s91u', 'CREDIT_CARD', 27, 'PAID', NULL, '2026-04-11 15:27:38.190', 'cmnuhbxv30031ba6v5nw1w1nh'),
('cmnuhvgxx003xba6vil9dax49', 'PIX', 69.53, 'PAID', NULL, '2026-04-11 15:33:30.886', 'cmnuhgcwb0036ba6vca6qp6ya'),
('cmnuhzprl0044ba6v2epk780f', 'CREDIT', 21, 'PAID', NULL, '2026-04-11 15:36:48.945', 'cmnuhzgq1003zba6vkek2c9fx'),
('cmnuiequd004lba6vukqu7gxn', 'PIX', 21, 'PAID', NULL, '2026-04-11 15:48:30.182', 'cmnui2nhi004dba6vxouu4a3c'),
('cmnuieyk2004nba6va8gvn5at', 'PIX', 26, 'PAID', NULL, '2026-04-11 15:48:40.179', 'cmnugasgf001xba6vy7tneybz'),
('cmnuif30h004pba6vqkf9r5xh', 'CASH', 25, 'PAID', NULL, '2026-04-11 15:48:45.953', 'cmnugtpsr0021ba6vckxb3s5j'),
('cmnuif7jc004rba6vy13ydvcz', 'PIX', 25, 'PAID', NULL, '2026-04-11 15:48:51.817', 'cmnug0bg7001tba6v51cvbfnt'),
('cmnuigfb2004xba6vthrj47j4', 'CREDIT', 30, 'PAID', NULL, '2026-04-11 15:49:48.542', 'cmnui0r4r0048ba6v21qo034f'),
('cmnuj5pxr0057ba6vnqs32rjt', 'CASH', 25, 'PAID', NULL, '2026-04-11 16:09:28.720', 'cmnuiq9gl0051ba6v9a48cjnr'),
('cmnuj5ssj0059ba6vjfj4cnxa', 'CASH', 25, 'PAID', NULL, '2026-04-11 16:09:32.420', 'cmnui3w36004hba6vzcvpxy4n'),
('cmnuj5znd005bba6vc9nv9zeo', 'PIX', 35.48, 'PAID', NULL, '2026-04-11 16:09:41.305', 'cmnuh6tn1002fba6v78h25j6r'),
('cmnuj635x005dba6v5t5riap7', 'DEBIT_CARD', 77.5, 'PAID', NULL, '2026-04-11 16:09:45.862', 'cmnuh2isb0028ba6v46j2g42p'),
('cmnuj6892005hba6vj2r0niqo', 'CREDIT_CARD', 58, 'PAID', NULL, '2026-04-11 16:09:52.455', 'cmnuffnyi0013ba6v3wv06m9r'),
('cmnuj6eeu005jba6vonbv11db', 'CREDIT_CARD', 84, 'PAID', NULL, '2026-04-11 16:10:00.439', 'cmnuf40860008ba6vr8myneeb'),
('cmnuj90on005uba6vol9cvpz3', 'PIX', 29, 'PAID', NULL, '2026-04-11 16:12:02.615', 'cmnuj8xgr005pba6vs24p5ce2'),
('cmnuj9zx40063ba6vcn6rzem5', 'CASH', 58, 'PAID', NULL, '2026-04-11 16:12:48.280', 'cmnuj9u5b005wba6vec67h4al'),
('cmnujc7ij006hba6vaqkw73h6', 'PIX', 54, 'PAID', NULL, '2026-04-11 16:14:31.435', 'cmnujc2wm006bba6vyye7t7vs'),
('cmnujojge00017qmj0gjvejmy', 'CASH', 45, 'PAID', NULL, '2026-04-11 16:24:06.783', 'cmnujamjp0065ba6vsxrhbmy9'),
('cmnujoxih00037qmjdnhm0sue', 'CREDIT_CARD', 21, 'PAID', NULL, '2026-04-11 16:24:25.001', 'cmnuje5xg006jba6vdb9eat5f'),
('cmnuk5731000h7qmjk7onigkm', 'CREDIT_CARD', 169.93, 'PAID', NULL, '2026-04-11 16:37:03.901', 'cmnujqboo00057qmjv8q7znk1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `product`
--

CREATE TABLE `product` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `price` double NOT NULL,
  `isByWeight` tinyint(1) NOT NULL DEFAULT 0,
  `imageUrl` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `categoryId` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `isByWeight`, `imageUrl`, `createdAt`, `updatedAt`, `categoryId`) VALUES
('cmmx5cald00052dxqe0ue6fz7', 'Marmita P', '', 21, 0, '', '2026-03-19 07:26:16.994', '2026-03-19 12:23:38.423', 'cmms3eqqs00024mok9fslu3cr'),
('cmmxfwai50009bxlk6tk05rbp', 'Marmita M', '', 25, 0, '', '2026-03-19 12:21:46.157', '2026-03-19 12:23:34.724', 'cmms3eqqs00024mok9fslu3cr'),
('cmmxfwln3000bbxlk7fh4qdbs', 'Marmita G', '', 29, 0, '', '2026-03-19 12:22:00.592', '2026-03-19 12:23:30.086', 'cmms3eqqs00024mok9fslu3cr'),
('cmmxfyeyu000dbxlkey66ig42', 'Fanta Uva Lata', '', 5, 0, '', '2026-03-19 12:23:25.254', '2026-03-19 12:26:03.005', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxfz2nh000fbxlkk0utzon1', 'Fanta Laranja Lata', '', 5, 0, '', '2026-03-19 12:23:55.949', '2026-03-19 12:25:57.989', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxg1kjo000hbxlkyb5mz3ek', 'Coca Cola Lata', '', 5, 0, '', '2026-03-19 12:25:52.451', '2026-03-19 12:25:52.451', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxg372k000jbxlkds2q6i5y', 'Guaraná Romarinho', '', 4, 0, '', '2026-03-19 12:27:08.301', '2026-03-19 12:27:08.301', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxg5opb000lbxlk2t9ce0u5', 'Monster Original', '', 12, 0, '', '2026-03-19 12:29:04.463', '2026-03-31 15:37:03.320', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxg69nt000nbxlk7omoe0uq', 'Água s/Gás', '', 3, 0, '', '2026-03-19 12:29:31.625', '2026-03-24 15:29:08.604', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxg6ogr000pbxlkbkmertzk', 'Água c/Gás', '', 4, 0, '', '2026-03-19 12:29:50.811', '2026-03-24 15:29:01.808', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxg70pt000rbxlkrtk49bgt', 'Coca Ks', '', 4, 0, '', '2026-03-19 12:30:06.689', '2026-03-19 12:30:06.689', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxg921e000tbxlkrxt2xiqa', 'Amstel ultra', '', 6.5, 0, '', '2026-03-19 12:31:41.712', '2026-03-19 12:49:43.875', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxgb2bv000vbxlkqz593ghb', 'Suco Pomar Laranja 1L', '', 15, 0, '', '2026-03-19 12:33:15.403', '2026-03-19 12:33:15.403', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxgc1px000xbxlkivkx1j4g', 'Suco Life 300ml', '', 7, 0, '', '2026-03-19 12:34:01.269', '2026-03-19 12:34:01.269', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxgcvsz000zbxlkckqo0vkx', 'Coca Retornável 2L', '', 10, 0, '', '2026-03-19 12:34:40.258', '2026-03-19 13:02:42.229', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxgdc0n0011bxlknea7e0hh', 'Coca Cola 2L', '', 14, 0, '', '2026-03-19 12:35:01.271', '2026-03-19 12:35:01.271', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxge9040013bxlkqqw00zxb', 'Kuat 2L ', '', 11, 0, '', '2026-03-19 12:35:44.020', '2026-03-19 12:35:44.020', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxgetfu0015bxlk8fonx8da', 'Coca Cola 1L', '', 8, 0, '', '2026-03-19 12:36:10.506', '2026-03-19 12:36:10.506', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxgf67a0017bxlk6xa8qpbi', 'Coca 600 ML', '', 6.5, 0, '', '2026-03-19 12:36:27.046', '2026-03-19 12:36:27.046', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxgfsw40019bxlktpojbaog', 'Self-Service', 'Comida a vontade ', 40, 0, '', '2026-03-19 12:36:56.452', '2026-03-19 12:37:54.948', 'cmms3em1a00014mokh4zcodnf'),
('cmmxggnh0001bbxlk43commjz', 'Comida P/kg', 'Comida Por Peso', 60, 1, '', '2026-03-19 12:37:36.084', '2026-03-19 12:37:36.084', 'cmms3em1a00014mokh4zcodnf'),
('cmmxghmnu001dbxlkdldqvqy3', 'Coca Zero 2L', '', 14, 0, '', '2026-03-19 12:38:21.690', '2026-03-19 12:38:21.690', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxgi7hz001fbxlkeozpyogx', 'Kuat Lata', '', 5, 0, '', '2026-03-19 12:38:48.695', '2026-03-19 12:38:48.695', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxgkvjg001ibxlkngw31sr1', 'Coca Ks Zero', '', 4, 0, '', '2026-03-19 12:40:53.164', '2026-03-19 12:40:53.164', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxgwoyg001rbxlksrpbed26', 'Imperio Ultra', '', 6.5, 0, '', '2026-03-19 12:50:04.504', '2026-03-19 12:50:04.504', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxgynqo001vbxlk6siyrb91', 'Coca Lata Zero', '', 5, 0, '', '2026-03-19 12:51:36.240', '2026-03-19 12:51:36.240', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxh2k2o0023bxlkl7kim6kh', 'Monster Zero', '', 12, 0, '', '2026-03-19 12:54:38.111', '2026-03-19 12:54:38.111', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxh51en0029bxlk8niisc9p', 'Schweppes', '', 5, 0, '', '2026-03-19 12:56:33.888', '2026-03-19 12:56:33.888', 'cmms3ed7d00004mokxg8cy98y'),
('cmmxhuy950042bxlkwq2ti484', 'Copo de Suco 300 ML', '', 5, 0, '', '2026-03-19 13:16:42.857', '2026-03-19 13:16:42.857', 'cmms3ed7d00004mokxg8cy98y'),
('cmn4ru0mi0046g2zqe5losqc4', 'COPO LIMÃO E GELO', '', 1, 0, '', '2026-03-24 15:30:18.666', '2026-03-24 15:30:18.666', 'cmms3ed7d00004mokxg8cy98y'),
('cmn64murm006yg2zqugmgzaq0', 'PRATO FEITO', '', 25, 0, '', '2026-03-25 14:16:25.666', '2026-03-26 13:18:19.103', 'cmn64mji8006wg2zqqpo2blm9'),
('cmn6545j9007eg2zqqj1sszr7', 'PIRÃO', 'MARMITA (M) SÓ COM PIRÃO', 23, 0, '', '2026-03-25 14:29:52.773', '2026-03-25 14:29:52.773', 'cmn64mji8006wg2zqqpo2blm9'),
('cmnes66ki003thijdyx8mg5ct', 'Guaraná Estrela 2L', '', 8, 0, '', '2026-03-31 15:37:28.001', '2026-03-31 15:37:28.001', 'cmms3ed7d00004mokxg8cy98y'),
('cmnes6hcw003vhijd8bbqxxog', 'Tubaína 600ml', '', 5, 0, '', '2026-03-31 15:37:41.985', '2026-03-31 15:37:41.985', 'cmms3ed7d00004mokxg8cy98y'),
('cmnes6wcz003xhijdfc9m2que', 'Kapo', '', 3.5, 0, '', '2026-03-31 15:38:01.427', '2026-03-31 15:38:01.427', 'cmms3ed7d00004mokxg8cy98y'),
('cmnullpb9000j7qmj9akwxyrd', 'PÃO ESPECIAL', '', 25, 0, '', '2026-04-11 17:17:53.638', '2026-04-11 17:17:53.638', 'cmn64mji8006wg2zqqpo2blm9');

-- --------------------------------------------------------

--
-- Estrutura para tabela `productstockitem`
--

CREATE TABLE `productstockitem` (
  `id` varchar(191) NOT NULL,
  `quantity` double NOT NULL,
  `productId` varchar(191) NOT NULL,
  `stockItemId` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `productstockitem`
--

INSERT INTO `productstockitem` (`id`, `quantity`, `productId`, `stockItemId`) VALUES
('cmmxh6l8m002dbxlkydjoaxyd', 1, 'cmmxg6ogr000pbxlkbkmertzk', 'cmmxgzr02001xbxlk5oa4fkrg'),
('cmmxh6owy002fbxlk3thcg7wq', 1, 'cmmxg69nt000nbxlk7omoe0uq', 'cmmxh3a4o0025bxlket2uuuli'),
('cmmxh7717002hbxlk2hvjnch8', 1, 'cmmxg921e000tbxlkrxt2xiqa', 'cmmxgvxei001pbxlkl3up84rp'),
('cmmxhaegv002kbxlklf93ls8g', 1, 'cmmxgf67a0017bxlk6xa8qpbi', 'cmmxha2h2002ibxlkt9oj9hc2'),
('cmmxhaj3n002mbxlkejyhorhx', 1, 'cmmxgetfu0015bxlk8fonx8da', 'cmmxgrb3x001lbxlk3h16rybr'),
('cmmxhameo002obxlk0yc24ty1', 1, 'cmmxgdc0n0011bxlknea7e0hh', 'cmmxgpf7t001kbxlkmapjvgfn'),
('cmmxhb0ji002qbxlkbumzfskl', 1, 'cmmxg1kjo000hbxlkyb5mz3ek', 'cmmxgxx84001tbxlkr9pym9x5'),
('cmmxhcd03002tbxlk54gno07k', 1, 'cmmxg70pt000rbxlkrtk49bgt', 'cmmxhbxza002rbxlkvf1a9q1o'),
('cmmxhcifs002vbxlk2b8aqwrg', 1, 'cmmxgkvjg001ibxlkngw31sr1', 'cmmxglrk1001jbxlkcpuhgfoj'),
('cmmxhcqa0002xbxlk7kg26684', 1, 'cmmxgynqo001vbxlk6siyrb91', 'cmmxgz9bc001wbxlkqbftp95r'),
('cmmxhd3n4002zbxlk3wq1oe2t', 1, 'cmmxgcvsz000zbxlkckqo0vkx', 'cmmxh0v7a001zbxlkh2mrph5c'),
('cmmxhen100031bxlk3mfj55w9', 1, 'cmmxghmnu001dbxlkdldqvqy3', 'cmmxgjicn001gbxlk1fhcrmrc'),
('cmmxhewnh0033bxlkefb0970i', 1, 'cmmxfz2nh000fbxlkk0utzon1', 'cmmxh03c8001ybxlk5au1x4wo'),
('cmmxhf1oa0035bxlkddrvbn3f', 1, 'cmmxfyeyu000dbxlkey66ig42', 'cmmxh413c0026bxlkjxey44dv'),
('cmmxhfkab0037bxlkpfvbpv0n', 1, 'cmmxg372k000jbxlkds2q6i5y', 'cmmxh67i2002bbxlkoeb0mjt1'),
('cmmxhfv180039bxlk0hj3ppy9', 1, 'cmmxgwoyg001rbxlksrpbed26', 'cmmxgx1q2001sbxlk2shjaivr'),
('cmmxhg3ib003bbxlkun0gehv8', 1, 'cmmxge9040013bxlkqqw00zxb', 'cmmxh141l0020bxlkq5hq3nrv'),
('cmmxhgcsw003dbxlkrcb9t7yt', 1, 'cmmxgi7hz001fbxlkeozpyogx', 'cmmxh5k35002abxlkrkbnn9y4'),
('cmmxhgsqr003fbxlkd5jo7q60', 1, 'cmmxg5opb000lbxlk2t9ce0u5', 'cmmxh1rwq0021bxlk5pm4h7jg'),
('cmmxhgxkp003hbxlkj5m3969j', 1, 'cmmxh2k2o0023bxlkl7kim6kh', 'cmmxh2sw80024bxlkfo5s0qfa'),
('cmmxhh29g003jbxlkaf7x17bg', 1, 'cmmxh51en0029bxlk8niisc9p', 'cmmxh4uf80027bxlk9uiwj13l'),
('cmmxhh9wu003lbxlknbfm3gpb', 1, 'cmmxgc1px000xbxlkivkx1j4g', 'cmmxgufka001nbxlkb4b409lr'),
('cmmxhhi81003nbxlkz4asqycx', 1, 'cmmxgb2bv000vbxlkqz593ghb', 'cmmxgv508001obxlkl367rewh');

-- --------------------------------------------------------

--
-- Estrutura para tabela `restaurantconfig`
--

CREATE TABLE `restaurantconfig` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `logoUrl` varchar(191) DEFAULT NULL,
  `bannerUrl` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `openingHours` varchar(191) DEFAULT NULL,
  `openingDays` varchar(191) DEFAULT NULL,
  `deliveryFee` double DEFAULT NULL,
  `enabledPayments` varchar(191) DEFAULT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `ruralDeliveryFee` double DEFAULT 3,
  `urbanDeliveryFee` double DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `restaurantconfig`
--

INSERT INTO `restaurantconfig` (`id`, `name`, `logoUrl`, `bannerUrl`, `address`, `phone`, `openingHours`, `openingDays`, `deliveryFee`, `enabledPayments`, `updatedAt`, `ruralDeliveryFee`, `urbanDeliveryFee`) VALUES
('1', 'Casarão Restaurante', '', '', 'Av. Carlos Gome N° 1087 - Centro - Planalto/SP', '(18) 99787-5272', '11h às 14hr', 'Segunda-Feira a Sabádo', 1, '[\"CASH\",\"CREDIT_CARD\",\"DEBIT_CARD\",\"PIX\"]', '2026-03-19 17:20:39.830', 3, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `stockitem`
--

CREATE TABLE `stockitem` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `quantity` double NOT NULL,
  `unit` varchar(191) NOT NULL,
  `minQuantity` double NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `stockitem`
--

INSERT INTO `stockitem` (`id`, `name`, `quantity`, `unit`, `minQuantity`, `createdAt`, `updatedAt`) VALUES
('cmmxgjicn001gbxlk1fhcrmrc', 'Coca Zero 2 L', 10, 'un', 10, '2026-03-19 12:39:49.411', '2026-04-10 15:54:04.618'),
('cmmxglrk1001jbxlkcpuhgfoj', 'Coca Ks Zero', 18, 'un', 10, '2026-03-19 12:41:34.657', '2026-04-08 16:01:17.352'),
('cmmxgpf7t001kbxlkmapjvgfn', 'Coca Cola 2L', 13, 'un', 10, '2026-03-19 12:44:25.288', '2026-04-11 16:35:35.386'),
('cmmxgrb3x001lbxlk3h16rybr', 'Coca Cola 1L', -18, 'un', 10, '2026-03-19 12:45:53.264', '2026-04-11 16:14:25.908'),
('cmmxgtdfl001mbxlkik938qyg', 'Coca Cola Zero 600 ML', 12, 'un', 10, '2026-03-19 12:47:29.601', '2026-03-19 13:00:35.248'),
('cmmxgufka001nbxlkb4b409lr', 'Suco Life 300 ML', 3, 'un', 10, '2026-03-19 12:48:19.018', '2026-03-30 15:01:45.150'),
('cmmxgv508001obxlkl367rewh', 'Suco Laranja Pomar 1 L', 8, 'un', 10, '2026-03-19 12:48:51.992', '2026-03-19 12:48:51.992'),
('cmmxgvxei001pbxlkl3up84rp', 'Amstel Ultra', 24, 'un', 10, '2026-03-19 12:49:28.793', '2026-03-19 12:49:28.793'),
('cmmxgx1q2001sbxlk2shjaivr', 'Imperio Ultra', 23, 'un', 10, '2026-03-19 12:50:21.051', '2026-04-04 14:15:31.372'),
('cmmxgxx84001tbxlkr9pym9x5', 'Coca Lata ', 34, 'un', 10, '2026-03-19 12:51:01.876', '2026-04-11 16:12:41.158'),
('cmmxgz9bc001wbxlkqbftp95r', 'Coca Lata Zero', 20, 'un', 10, '2026-03-19 12:52:04.201', '2026-04-09 15:14:52.468'),
('cmmxgzr02001xbxlk5oa4fkrg', 'Água c/Gás', -6, 'un', 10, '2026-03-19 12:52:27.122', '2026-04-11 16:13:17.695'),
('cmmxh03c8001ybxlk5au1x4wo', 'Fanta Laranja Lata', 6, 'un', 10, '2026-03-19 12:52:43.113', '2026-04-10 15:54:04.671'),
('cmmxh0v7a001zbxlkh2mrph5c', 'Coca Retornavel 2L', 13, 'un', 10, '2026-03-19 12:53:19.222', '2026-04-04 14:26:19.361'),
('cmmxh141l0020bxlkq5hq3nrv', 'Kuat 2L', 11, 'un', 10, '2026-03-19 12:53:30.682', '2026-03-19 12:53:30.682'),
('cmmxh1rwq0021bxlk5pm4h7jg', 'Monster Original', 6, 'un', 10, '2026-03-19 12:54:01.610', '2026-03-19 12:54:01.610'),
('cmmxh2sw80024bxlkfo5s0qfa', 'Monster Zero', 6, 'un', 10, '2026-03-19 12:54:49.544', '2026-03-31 15:06:25.675'),
('cmmxh3a4o0025bxlket2uuuli', 'Água s/Gás', 18, 'un', 10, '2026-03-19 12:55:11.881', '2026-04-09 15:22:27.972'),
('cmmxh413c0026bxlkjxey44dv', 'Fanta Lata Uva', 1, 'un', 10, '2026-03-19 12:55:46.825', '2026-04-01 14:16:25.526'),
('cmmxh4uf80027bxlk9uiwj13l', 'Schweppes Lata', 1, 'un', 10, '2026-03-19 12:56:24.837', '2026-04-06 16:06:12.289'),
('cmmxh5k35002abxlkrkbnn9y4', 'Kuat Lata', 8, 'un', 10, '2026-03-19 12:56:58.097', '2026-04-04 16:01:18.582'),
('cmmxh67i2002bbxlkoeb0mjt1', 'Guaraná Romarinho', 13, 'un', 10, '2026-03-19 12:57:28.442', '2026-03-30 15:22:29.173'),
('cmmxha2h2002ibxlkt9oj9hc2', 'Coca Cola 600  ML', 3, 'un', 10, '2026-03-19 13:00:28.550', '2026-04-11 15:22:20.020'),
('cmmxhbxza002rbxlkvf1a9q1o', 'Coca Cola Ks', -3, 'un', 10, '2026-03-19 13:01:56.038', '2026-04-06 15:47:43.048');

-- --------------------------------------------------------

--
-- Estrutura para tabela `supplier`
--

CREATE TABLE `supplier` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `contact` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `supplierstockitem`
--

CREATE TABLE `supplierstockitem` (
  `id` varchar(191) NOT NULL,
  `price` double NOT NULL,
  `lastUpdated` datetime(3) NOT NULL,
  `supplierId` varchar(191) NOT NULL,
  `stockItemId` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `table`
--

CREATE TABLE `table` (
  `id` varchar(191) NOT NULL,
  `number` int(11) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'AVAILABLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `table`
--

INSERT INTO `table` (`id`, `number`, `status`) VALUES
('cmms2mx3h0001a4ls4ikdwhhd', 1, 'AVAILABLE'),
('cmms2mx3l0002a4lsihfjel0w', 2, 'AVAILABLE'),
('cmms2mx3p0003a4lsiss1l4vl', 3, 'AVAILABLE'),
('cmms2mx3s0004a4lsnswxuujf', 4, 'AVAILABLE'),
('cmms2mx3v0005a4lsyea0z57j', 5, 'AVAILABLE'),
('cmms2mx3y0006a4lsgu1ossc6', 6, 'AVAILABLE'),
('cmms2mx400007a4lsui0hzu3i', 7, 'AVAILABLE'),
('cmms2mx420008a4lso3zdmj87', 8, 'AVAILABLE'),
('cmms2mx440009a4lsu751ofny', 9, 'AVAILABLE'),
('cmms2mx47000aa4ls95w8s0b5', 10, 'AVAILABLE');

-- --------------------------------------------------------

--
-- Estrutura para tabela `user`
--

CREATE TABLE `user` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `role` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
('cmms2mx360000a4lsi76gdcwf', 'Admin', 'admin@admin.com', '$2b$10$GQMh.u8RD1XsyoQLfW7M2OJW8xr8.jz2z1XDMv8ybxLkXGUFXydxu', 'ADMIN', '2026-03-15 18:11:42.978', '2026-03-15 18:11:42.978');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `auditlog`
--
ALTER TABLE `auditlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AuditLog_userId_fkey` (`userId`);

--
-- Índices de tabela `cashregistersession`
--
ALTER TABLE `cashregistersession`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CashRegisterSession_openedById_fkey` (`openedById`),
  ADD KEY `CashRegisterSession_closedById_fkey` (`closedById`);

--
-- Índices de tabela `cashwithdrawal`
--
ALTER TABLE `cashwithdrawal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CashWithdrawal_sessionId_fkey` (`sessionId`),
  ADD KEY `CashWithdrawal_createdById_fkey` (`createdById`);

--
-- Índices de tabela `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Category_name_key` (`name`);

--
-- Índices de tabela `credittransaction`
--
ALTER TABLE `credittransaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CreditTransaction_customerId_fkey` (`customerId`);

--
-- Índices de tabela `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Customer_phone_key` (`phone`),
  ADD UNIQUE KEY `Customer_email_key` (`email`);

--
-- Índices de tabela `marmitamenuitem`
--
ALTER TABLE `marmitamenuitem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Order_tableId_fkey` (`tableId`),
  ADD KEY `Order_userId_fkey` (`userId`),
  ADD KEY `Order_waiterId_fkey` (`waiterId`),
  ADD KEY `Order_customerId_fkey` (`customerId`),
  ADD KEY `Order_cashRegisterSessionId_fkey` (`cashRegisterSessionId`);

--
-- Índices de tabela `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `OrderItem_orderId_fkey` (`orderId`),
  ADD KEY `OrderItem_productId_fkey` (`productId`);

--
-- Índices de tabela `payableaccount`
--
ALTER TABLE `payableaccount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PayableAccount_supplierId_fkey` (`supplierId`);

--
-- Índices de tabela `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Payment_orderId_key` (`orderId`);

--
-- Índices de tabela `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Product_categoryId_fkey` (`categoryId`);

--
-- Índices de tabela `productstockitem`
--
ALTER TABLE `productstockitem`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ProductStockItem_productId_stockItemId_key` (`productId`,`stockItemId`),
  ADD KEY `ProductStockItem_stockItemId_fkey` (`stockItemId`);

--
-- Índices de tabela `restaurantconfig`
--
ALTER TABLE `restaurantconfig`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `stockitem`
--
ALTER TABLE `stockitem`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `StockItem_name_key` (`name`);

--
-- Índices de tabela `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Supplier_email_key` (`email`);

--
-- Índices de tabela `supplierstockitem`
--
ALTER TABLE `supplierstockitem`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SupplierStockItem_supplierId_stockItemId_key` (`supplierId`,`stockItemId`),
  ADD KEY `SupplierStockItem_stockItemId_fkey` (`stockItemId`);

--
-- Índices de tabela `table`
--
ALTER TABLE `table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Table_number_key` (`number`);

--
-- Índices de tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `User_email_key` (`email`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `auditlog`
--
ALTER TABLE `auditlog`
  ADD CONSTRAINT `AuditLog_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `cashregistersession`
--
ALTER TABLE `cashregistersession`
  ADD CONSTRAINT `CashRegisterSession_closedById_fkey` FOREIGN KEY (`closedById`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `CashRegisterSession_openedById_fkey` FOREIGN KEY (`openedById`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `cashwithdrawal`
--
ALTER TABLE `cashwithdrawal`
  ADD CONSTRAINT `CashWithdrawal_createdById_fkey` FOREIGN KEY (`createdById`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CashWithdrawal_sessionId_fkey` FOREIGN KEY (`sessionId`) REFERENCES `cashregistersession` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `credittransaction`
--
ALTER TABLE `credittransaction`
  ADD CONSTRAINT `CreditTransaction_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `Order_cashRegisterSessionId_fkey` FOREIGN KEY (`cashRegisterSessionId`) REFERENCES `cashregistersession` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Order_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Order_tableId_fkey` FOREIGN KEY (`tableId`) REFERENCES `table` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Order_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Order_waiterId_fkey` FOREIGN KEY (`waiterId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Restrições para tabelas `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `OrderItem_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `OrderItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `payableaccount`
--
ALTER TABLE `payableaccount`
  ADD CONSTRAINT `PayableAccount_supplierId_fkey` FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Restrições para tabelas `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `Payment_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `Product_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `productstockitem`
--
ALTER TABLE `productstockitem`
  ADD CONSTRAINT `ProductStockItem_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ProductStockItem_stockItemId_fkey` FOREIGN KEY (`stockItemId`) REFERENCES `stockitem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `supplierstockitem`
--
ALTER TABLE `supplierstockitem`
  ADD CONSTRAINT `SupplierStockItem_stockItemId_fkey` FOREIGN KEY (`stockItemId`) REFERENCES `stockitem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SupplierStockItem_supplierId_fkey` FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
