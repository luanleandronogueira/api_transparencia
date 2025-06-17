-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Jun-2025 às 17:03
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_api_transparencia`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('e833b025e182');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contratos`
--

CREATE TABLE `contratos` (
  `id` int(11) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `ano` int(11) NOT NULL,
  `cpf_cnpj` varchar(20) NOT NULL,
  `razao_social` varchar(100) NOT NULL,
  `objeto` text NOT NULL,
  `vigencia_inicio` date NOT NULL,
  `vigencia_fim` date NOT NULL,
  `processo` varchar(100) NOT NULL,
  `valor_contratual` varchar(20) NOT NULL,
  `tipo_instrumento` varchar(50) NOT NULL,
  `unidade_gestora` varchar(100) NOT NULL,
  `id_entidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `contratos`
--

INSERT INTO `contratos` (`id`, `numero`, `ano`, `cpf_cnpj`, `razao_social`, `objeto`, `vigencia_inicio`, `vigencia_fim`, `processo`, `valor_contratual`, `tipo_instrumento`, `unidade_gestora`, `id_entidade`) VALUES
(1, 'CT-001/2023', 2023, '12.345.678/0001-90', 'CONSTRUTORA NOVO HORIZONTE LTDA', 'Construção de 10 unidades habitacionais populares', '2023-01-15', '2024-01-14', '2023.1.001.0001', 'R$ 5.250.000,00', 'Contrato', 'Secretaria Municipal de Habitação', 1),
(2, 'CT-002/2023', 2023, '98.765.432/0001-21', 'SAÚDE INTEGRAL SA', 'Prestação de serviços médicos para atenção básica', '2023-03-01', '2024-02-28', '2023.1.002.0001', 'R$ 3.780.000,00', 'Termo de Fomento', 'Secretaria Municipal de Saúde', 1),
(3, 'CT-003/2023', 2023, '23.456.789/0001-34', 'ALIMENTAÇÃO ESCOLAR ME', 'Fornecimento de merenda escolar para rede municipal', '2023-02-10', '2023-12-31', '2023.1.003.0001', 'R$ 2.950.000,00', 'Contrato', 'Secretaria Municipal de Educação', 1),
(4, 'CT-004/2023', 2023, '34.567.890/0001-45', 'TECNOLOGIA E INOVAÇÃO LTDA', 'Desenvolvimento de sistema de gestão escolar', '2023-04-05', '2024-04-04', '2023.1.004.0001', 'R$ 1.200.000,00', 'Termo de Colaboração', 'Secretaria Municipal de Educação', 1),
(5, 'CT-005/2023', 2023, '45.678.901/0001-56', 'TRANSPORTE URBANO EIRELI', 'Serviço de transporte escolar rural', '2023-05-20', '2025-05-19', '2023.1.005.0001', 'R$ 4.100.000,00', 'Contrato', 'Secretaria Municipal de Transportes', 1),
(6, 'CT-006/2023', 2023, '56.789.012/0001-67', 'LIMPEZA URBANA SA', 'Coleta e destinação de resíduos sólidos urbanos', '2023-06-01', '2024-05-31', '2023.1.006.0001', 'R$ 6.750.000,00', 'Contrato', 'Secretaria Municipal de Serviços Urbanos', 1),
(7, 'CT-007/2023', 2023, '67.890.123/0001-78', 'ENGENHARIA E CONSULTORIA LTDA', 'Elaboração de projetos de drenagem urbana', '2023-07-15', '2023-12-14', '2023.1.007.0001', 'R$ 890.000,00', 'Termo de Cooperação', 'Secretaria Municipal de Obras', 1),
(8, 'CT-008/2023', 2023, '78.901.234/0001-89', 'SEGURANÇA PATRIMONIAL ME', 'Vigilância de prédios públicos municipais', '2023-08-01', '2024-07-31', '2023.1.008.0001', 'R$ 1.950.000,00', 'Contrato', 'Secretaria Municipal de Administração', 1),
(9, 'CT-009/2023', 2023, '89.012.345/0001-90', 'CULTURA E ARTE ASSOCIAÇÃO', 'Realização de eventos culturais no município', '2023-09-10', '2023-12-09', '2023.1.009.0001', 'R$ 750.000,00', 'Termo de Fomento', 'Secretaria Municipal de Cultura', 1),
(10, 'CT-010/2023', 2023, '90.123.456/0001-01', 'ASSISTÊNCIA SOCIAL E CIDADANIA', 'Execução de programas sociais para população vulnerável', '2023-10-05', '2024-10-04', '2023.1.010.0001', 'R$ 3.250.000,00', 'Termo de Colaboração', 'Secretaria Municipal de Assistência Social', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `despesas`
--

CREATE TABLE `despesas` (
  `id` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `data` date NOT NULL,
  `fase_despesa` varchar(50) NOT NULL,
  `empenho` varchar(20) NOT NULL,
  `documento` varchar(100) NOT NULL,
  `fornecedor` varchar(100) NOT NULL,
  `data_empenho` date NOT NULL,
  `tipo_empenho` varchar(50) NOT NULL,
  `valor_empenhado` varchar(20) NOT NULL,
  `valor_liquidado` varchar(20) NOT NULL,
  `valor_pago` varchar(20) NOT NULL,
  `elemento` varchar(20) NOT NULL,
  `unidade_orcamentaria` varchar(100) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `programa` varchar(50) NOT NULL,
  `funcao` varchar(50) NOT NULL,
  `subfuncao` varchar(50) NOT NULL,
  `natureza_despesa` varchar(50) NOT NULL,
  `fonte_recurso` varchar(20) NOT NULL,
  `acao` varchar(20) NOT NULL,
  `grupo` varchar(50) NOT NULL,
  `natureza` varchar(50) NOT NULL,
  `despesa` varchar(20) NOT NULL,
  `num_proc_licitacao` varchar(100) DEFAULT NULL,
  `id_entidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `despesas`
--

INSERT INTO `despesas` (`id`, `ano`, `data`, `fase_despesa`, `empenho`, `documento`, `fornecedor`, `data_empenho`, `tipo_empenho`, `valor_empenhado`, `valor_liquidado`, `valor_pago`, `elemento`, `unidade_orcamentaria`, `categoria`, `programa`, `funcao`, `subfuncao`, `natureza_despesa`, `fonte_recurso`, `acao`, `grupo`, `natureza`, `despesa`, `num_proc_licitacao`, `id_entidade`) VALUES
(1, 2025, '2025-01-15', 'Liquidada', '2023EMP00001', '4917296000322', 'CONSTRUTORA NOVO HORIZONTE LTDA', '2023-01-10', 'Normal', 'R$ 250.000,00', 'R$ 250.000,00', 'R$ 250.000,00', '4.4.90.52', 'Secretaria de Obras', 'Capital', 'Urbanização', 'Urbanismo', 'Habitação', 'Obras Públicas', '1000', '20A1', 'Material Permanente', 'Aquisição', '339033', 'LIC-2022-001', 1),
(2, 2025, '2025-02-20', 'Paga', '2023EMP00002', 'Nota Fiscal 23456', 'SAÚDE INTEGRAL SA', '2023-02-15', 'Estimativa', 'R$ 180.000,00', 'R$ 180.000,00', 'R$ 180.000,00', '3.3.90.30', 'Secretaria de Saúde', 'Custeio', 'Atenção Básica', 'Saúde', 'Assistência Hospitalar', 'Serviços de Terceiros', '1000', '10B2', 'Serviços', 'Contratação', '339039', 'LIC-2022-002', 1),
(3, 2025, '2023-03-10', 'Empenhada', '2023EMP00003', 'Nota Fiscal 34567', 'ALIMENTAÇÃO ESCOLAR ME', '2023-03-05', 'Global', 'R$ 320.000,00', 'R$ 300.000,00', 'R$ 280.000,00', '4.4.90.39', 'Secretaria de Educação', 'Capital', 'Merenda Escolar', 'Educação', 'Educação Infantil', 'Material de Consumo', '1000', '30C3', 'Alimentação', 'Aquisição', '339045', 'LIC-2022-003', 1),
(4, 2023, '2023-04-05', 'Liquidada', '2023EMP00004', 'Nota Fiscal 45678', 'TECNOLOGIA E INOVAÇÃO LTDA', '2023-04-01', 'Normal', 'R$ 150.000,00', 'R$ 150.000,00', 'R$ 150.000,00', '4.4.90.52', 'Secretaria de Administração', 'Capital', 'Modernização', 'Administração', 'Tecnologia da Informação', 'Equipamentos', '1000', '40D4', 'Material Permanente', 'Aquisição', '339051', 'LIC-2022-004', 1),
(5, 2023, '2023-05-12', 'Paga', '2023EMP00005', 'Nota Fiscal 56789', 'TRANSPORTE URBANO EIRELI', '2023-05-10', 'Estimativa', 'R$ 95.000,00', 'R$ 95.000,00', 'R$ 95.000,00', '3.3.90.30', 'Secretaria de Transportes', 'Custeio', 'Transporte Escolar', 'Transporte', 'Transporte Coletivo', 'Serviços de Terceiros', '1000', '50E5', 'Serviços', 'Contratação', '339057', NULL, 1),
(6, 2023, '2023-06-18', 'Empenhada', '2023EMP00006', 'Nota Fiscal 67890', 'LIMPEZA URBANA SA', '2023-06-15', 'Global', 'R$ 420.000,00', 'R$ 400.000,00', 'R$ 380.000,00', '4.4.90.52', 'Secretaria de Serviços Urbanos', 'Capital', 'Limpeza Pública', 'Saneamento', 'Limpeza Urbana', 'Material de Consumo', '1000', '60F6', 'Material Permanente', 'Aquisição', '339063', 'LIC-2022-006', 1),
(7, 2023, '2023-07-22', 'Liquidada', '2023EMP00007', 'Nota Fiscal 78901', 'ENGENHARIA E CONSULTORIA LTDA', '2023-07-20', 'Normal', 'R$ 175.000,00', 'R$ 175.000,00', 'R$ 175.000,00', '4.4.90.52', 'Secretaria de Planejamento', 'Capital', 'Estudos Técnicos', 'Urbanismo', 'Planejamento Urbano', 'Serviços de Terceiros', '1000', '70G7', 'Serviços', 'Contratação', '339069', 'LIC-2022-007', 1),
(8, 2023, '2023-08-30', 'Paga', '2023EMP00008', 'Nota Fiscal 89012', 'SEGURANÇA PATRIMONIAL ME', '2023-08-28', 'Estimativa', 'R$ 80.000,00', 'R$ 80.000,00', 'R$ 80.000,00', '3.3.90.30', 'Secretaria de Segurança', 'Custeio', 'Vigilância', 'Segurança', 'Vigilância Patrimonial', 'Serviços de Terceiros', '1000', '80H8', 'Serviços', 'Contratação', '339075', NULL, 1),
(9, 2023, '2023-09-14', 'Empenhada', '2023EMP00009', 'Nota Fiscal 90123', 'CULTURA E ARTE ASSOCIAÇÃO', '2023-09-10', 'Global', 'R$ 65.000,00', 'R$ 60.000,00', 'R$ 55.000,00', '3.3.90.30', 'Secretaria de Cultura', 'Custeio', 'Eventos Culturais', 'Cultura', 'Difusão Cultural', 'Serviços de Terceiros', '1000', '90I9', 'Serviços', 'Contratação', '339081', 'LIC-2022-009', 1),
(10, 2023, '2023-10-05', 'Liquidada', '2023EMP00010', 'Nota Fiscal 01234', 'ASSISTÊNCIA SOCIAL E CIDADANIA', '2023-10-01', 'Normal', 'R$ 120.000,00', 'R$ 120.000,00', 'R$ 120.000,00', '3.3.90.30', 'Secretaria de Assistência Social', 'Custeio', 'Programas Sociais', 'Assistência Social', 'Proteção Social', 'Serviços de Terceiros', '1000', '00J0', 'Serviços', 'Contratação', '339087', 'LIC-2022-010', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `entidades`
--

CREATE TABLE `entidades` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `entidades`
--

INSERT INTO `entidades` (`id`, `nome`) VALUES
(1, 'Prefeitura Municipal de Garanhuns'),
(2, 'Prefeitura Municipal de Brejão');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ldo`
--

CREATE TABLE `ldo` (
  `id` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `documento` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `arquivo` varchar(500) NOT NULL,
  `id_entidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `ldo`
--

INSERT INTO `ldo` (`id`, `ano`, `documento`, `numero`, `titulo`, `arquivo`, `id_entidade`) VALUES
(1, 2025, 'LDO', '349', 'LEI DE DIRETRIZES ORÇAMENTÁRIAS', 'https://exemplo.gov.br/ldo/2025/ldo_349.pdf', 1),
(2, 2024, 'LDO', '337', 'LEI DE DIRETRIZES ORÇAMENTÁRIA', 'https://exemplo.gov.br/ldo/2024/ldo_337.pdf', 1),
(3, 2023, 'LDO', '325', 'LEI DE DIRETRIZES ORÇAMENTÁRIA', 'https://exemplo.gov.br/ldo/2023/ldo_325.pdf', 1),
(4, 2022, 'LDO', '315', 'LEI DE DIRETRIZES ORÇAMENTÁRIA', 'https://exemplo.gov.br/ldo/2022/ldo_315.pdf', 1),
(5, 2021, 'LDO', '306', 'LEI DE DIRETRIZES ORÇAMENTÁRIA', 'https://exemplo.gov.br/ldo/2021/ldo_306.pdf', 1),
(6, 2020, 'LDO', '300', 'LEI DE DIRETRIZES ORÇAMENTÁRIAS', 'https://exemplo.gov.br/ldo/2020/ldo_300.pdf', 1),
(7, 2019, 'LDO', '287', 'LEI DE DIRETRIZES ORÇAMENTÁRIAS', 'https://exemplo.gov.br/ldo/2019/ldo_287.pdf', 1),
(8, 2018, 'LDO', '274', 'LEI DE DIRETRIZES ORÇAMENTÁRIAS', 'https://exemplo.gov.br/ldo/2018/ldo_274.pdf', 1),
(9, 2017, 'LDO', '263', 'LEI DE DIRETRIZES ORÇAMENTÁRIAS', 'https://exemplo.gov.br/ldo/2017/ldo_263.pdf', 1),
(10, 2016, 'LDO', '254', 'LEI DE DIRETRIZES ORÇAMENTÁRIAS', 'https://exemplo.gov.br/ldo/2016/ldo_254.pdf', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `licitacoes`
--

CREATE TABLE `licitacoes` (
  `id` int(11) NOT NULL,
  `sequecial` varchar(20) NOT NULL,
  `processo` varchar(100) NOT NULL,
  `modalidade` varchar(50) NOT NULL,
  `data` date NOT NULL,
  `processo_srp` varchar(1) DEFAULT NULL,
  `objeto` text NOT NULL,
  `fase` varchar(50) NOT NULL,
  `valor_estimado` varchar(20) DEFAULT NULL,
  `homologado` varchar(30) DEFAULT NULL,
  `anexos` varchar(500) DEFAULT NULL,
  `id_entidade` int(11) NOT NULL,
  `situacao` varchar(50) NOT NULL,
  `entidade` varchar(100) NOT NULL,
  `ano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `licitacoes`
--

INSERT INTO `licitacoes` (`id`, `sequecial`, `processo`, `modalidade`, `data`, `processo_srp`, `objeto`, `fase`, `valor_estimado`, `homologado`, `anexos`, `id_entidade`, `situacao`, `entidade`, `ano`) VALUES
(1, '2023/001', '2023.1.001.0001', 'Pregão Eletrônico', '2023-01-15', 'S', 'Contratação de serviços de manutenção predial para escolas municipais', 'Homologada', 'R$ 1.250.000,00', 'Empresa ABC Ltda', 'https://exemplo.gov.br/licitacoes/2023/lic-001.pdf', 1, 'Em Andamento', '1', 2024),
(2, '2023/002', '2023.1.002.0001', 'Concorrência Pública', '2023-02-20', 'N', 'Aquisição de equipamentos médicos para unidades de saúde', 'Em andamento', 'R$ 3.780.000,00', NULL, 'https://exemplo.gov.br/licitacoes/2023/lic-002.pdf', 1, 'Em Andamento', '1', 2024),
(3, '2023/003', '2023.1.003.0001', 'Dispensa de Licitação', '2023-03-10', 'N', 'Contratação emergencial de serviços de limpeza urbana', 'Concluída', 'R$ 450.000,00', 'Limpex Serviços SA', NULL, 1, 'Em Andamento', '1', 2024),
(4, '2023/004', '2023.1.004.0001', 'Tomada de Preços', '2023-04-05', 'S', 'Serviços de TI e desenvolvimento de sistemas', 'Revogada', 'R$ 890.000,00', NULL, 'https://exemplo.gov.br/licitacoes/2023/lic-004.zip', 1, 'Em Andamento', '1', 2024),
(5, '2023/005', '2023.1.005.0001', 'Pregão Presencial', '2023-05-12', 'N', 'Compra de uniformes escolares', 'Homologada', 'R$ 2.100.000,00', 'Confecções Estrela ME', 'https://exemplo.gov.br/licitacoes/2023/lic-005.pdf', 1, 'Em Andamento', '2', 2025),
(6, '2023/006', '2023.1.006.0001', 'Concurso', '2023-06-18', 'N', 'Seleção de projeto arquitetônico para novo centro cultural', 'Em análise', 'R$ 150.000,00', NULL, 'https://exemplo.gov.br/licitacoes/2023/lic-006.rar', 1, 'Em Andamento', '2', 2025),
(7, '2023/007', '2023.1.007.0001', 'Leilão', '2023-07-22', 'S', 'Venda de veículos sucateados da frota municipal', 'Concluída', NULL, 'Auto Peças Nacional Ltda', 'https://exemplo.gov.br/licitacoes/2023/lic-007.pdf', 1, 'Em Andamento', '2', 2025),
(8, '2023/008', '2023.1.008.0001', 'Pregão Presencial', '2023-08-30', 'N', 'Cadastro de empresas para serviços eventuais de engenharia', 'Em andamento', NULL, NULL, NULL, 1, 'Em Andamento', '1', 2024),
(9, '2023/009', '2023.1.009.0001', 'Chamada Pública', '2023-09-14', 'S', 'Seleção de entidades para programas sociais', 'Homologada', 'R$ 750.000,00', 'Associação Comunitária Vida No', 'https://exemplo.gov.br/licitacoes/2023/lic-009.pdf', 1, 'Em Andamento', '1', 2024),
(10, '2023/010', '2023.1.010.0001', 'Pregão Eletrônico', '2023-10-05', 'S', 'Contratação de serviços de alimentação escolar', 'Em análise', 'R$ 5.300.000,00', NULL, 'https://exemplo.gov.br/licitacoes/2023/lic-010.pdf', 1, 'Em Andamento', '2', 2025);

-- --------------------------------------------------------

--
-- Estrutura da tabela `loa`
--

CREATE TABLE `loa` (
  `id` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `documento` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `arquivo` varchar(500) NOT NULL,
  `id_entidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `loa`
--

INSERT INTO `loa` (`id`, `ano`, `documento`, `numero`, `titulo`, `arquivo`, `id_entidade`) VALUES
(1, 2025, 'LOA', '353', 'LEI ORÇAMENTÁRIA ANUAL.', 'http://cloud.it-solucoes.inf.br/transparenciaMunicipal/download/1-20250529130320.pdf', 1),
(2, 2024, 'LOA', '341', 'LEI ORÇAMENTÁRIA ANUAL.', 'http://cloud.it-solucoes.inf.br/transparenciaMunicipal/download/1-20250529130320.pdf', 1),
(3, 2023, 'LOA', '327', 'LEI ORÇAMENTÁRIA ANUAL.', 'http://cloud.it-solucoes.inf.br/transparenciaMunicipal/download/1-20250529130320.pdf', 1),
(4, 2022, 'LOA', '316', 'LEI ORÇAMENTÁRIA ANUAL', 'http://cloud.it-solucoes.inf.br/transparenciaMunicipal/download/1-20220225130143.pdf', 1),
(5, 2021, 'LOA', '307', 'LEI ORÇAMENTÁRIA ANUAL', 'http://cloud.it-solucoes.inf.br/transparenciaMunicipal/download/1-20220225130143.pdf', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ppa`
--

CREATE TABLE `ppa` (
  `id` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `documento` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `arquivo` varchar(500) NOT NULL,
  `id_entidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `ppa`
--

INSERT INTO `ppa` (`id`, `ano`, `documento`, `numero`, `titulo`, `arquivo`, `id_entidade`) VALUES
(1, 2025, 'PPA', '352', 'PLANO PLURIANUAL', 'https://dominio.gov.br/arquivos/ppa/2025/ppa_352_plano_plurianual.pdf', 1),
(2, 2024, 'PPA', '340', 'PLANO PLURIANUAL', 'https://dominio.gov.br/arquivos/ppa/2024/ppa_340_plano_plurianual.pdf', 1),
(3, 2022, 'PPA', '326', 'PLANO PLURIANUAL', 'https://dominio.gov.br/arquivos/ppa/2022/ppa_326_plano_plurianual.pdf', 1),
(4, 2022, 'PPA', '317', 'PLANO PLURIANUAL REVISÃO PERÍODO 2022 A 2025', 'https://dominio.gov.br/arquivos/ppa/2022/rev/ppa_317_revisao_2022_2025.pdf', 1),
(5, 2021, 'PPA', '308', 'PLANO PLURIANUAL REVISÃO PERÍODO 2018 A 2021', 'https://dominio.gov.br/arquivos/ppa/2021/rev/ppa_308_revisao_2018_2021.pdf', 1),
(6, 2020, 'PPA', '302', 'PLANO PLURIANUAL REVISÃO PERÍODO 2018 A 2021', 'https://dominio.gov.br/arquivos/ppa/2020/rev/ppa_302_revisao_2018_2021.pdf', 1),
(7, 2019, 'PPA', '289', 'PLANO PLURIANUAL REVISÃO PERÍODO 2018 A 2021', 'https://dominio.gov.br/arquivos/ppa/2019/rev/ppa_289_revisao_2018_2021.pdf', 1),
(8, 2018, 'PPA', '275', 'PLANO PLURIANUAL PERÍODO 2018 A 2021', 'https://dominio.gov.br/arquivos/ppa/2018/ppa_275_2018_2021.pdf', 1),
(9, 2017, 'PPA', '265', 'PLANO PLURIANUAL REVISÃO PERÍODO 2014 A 2017', 'https://dominio.gov.br/arquivos/ppa/2017/rev/ppa_265_revisao_2014_2017.pdf', 1),
(10, 2016, 'PPA', '256', 'PLANO PLURIANUAL REVISÃO PERÍODO 2014 A 2017', 'https://dominio.gov.br/arquivos/ppa/2016/rev/ppa_256_revisao_2014_2017.pdf', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `prestacao_contas`
--

CREATE TABLE `prestacao_contas` (
  `id` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `arquivo` varchar(500) NOT NULL,
  `demais_atos` varchar(500) DEFAULT NULL,
  `id_entidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `prestacao_contas`
--

INSERT INTO `prestacao_contas` (`id`, `ano`, `arquivo`, `demais_atos`, `id_entidade`) VALUES
(1, 2023, 'https://portal.gov.br/atos/2023/portaria_123.pdf', 'Portaria nº 123/2023 - Aprova regulamento interno', 1),
(2, 2022, 'https://portal.gov.br/atos/2022/decreto_456.pdf', 'Decreto Municipal nº 456/2022 - Dispõe sobre licitações', 1),
(3, 2023, 'https://portal.gov.br/atos/2023/resolucao_789.pdf', 'Resolução CONSEM nº 789/2023 - Critérios de avaliação', 1),
(4, 2024, 'https://portal.gov.br/atos/2024/lei_321.pdf', 'Lei Complementar nº 321/2024 - Altera código tributário', 1),
(5, 2021, 'https://portal.gov.br/atos/2021/edital_654.pdf', 'Edital de Convocação nº 654/2021 - Processo seletivo', 1),
(6, 2023, 'https://portal.gov.br/atos/2023/portaria_987.pdf', 'Portaria nº 987/2023 - Designa comissão especial', 1),
(7, 2022, 'https://portal.gov.br/atos/2022/aviso_135.pdf', 'Aviso nº 135/2022 - Convoca assembleia geral', 1),
(8, 2024, 'https://portal.gov.br/atos/2024/decreto_246.pdf', 'Decreto nº 246/2024 - Declara utilidade pública', 1),
(9, 2021, 'https://portal.gov.br/atos/2021/resolucao_802.pdf', 'Resolução nº 802/2021 - Normas técnicas', 1),
(10, 2023, 'https://portal.gov.br/atos/2023/portaria_404.pdf', 'Portaria nº 404/2023 - Estabelece diretrizes', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `receitas`
--

CREATE TABLE `receitas` (
  `id` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `origem` varchar(100) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `data` date NOT NULL,
  `previsao` varchar(20) NOT NULL,
  `arrecadacao` varchar(20) NOT NULL,
  `arrecadado` varchar(20) NOT NULL,
  `lancado` varchar(20) DEFAULT NULL,
  `periodo` varchar(20) DEFAULT NULL,
  `competencia` varchar(20) DEFAULT NULL,
  `id_entidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatorio_gestao_fiscal`
--

CREATE TABLE `relatorio_gestao_fiscal` (
  `id` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `documento` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `anexo` varchar(500) NOT NULL,
  `id_entidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `relatorio_gestao_fiscal`
--

INSERT INTO `relatorio_gestao_fiscal` (`id`, `ano`, `documento`, `numero`, `titulo`, `anexo`, `id_entidade`) VALUES
(1, 2024, 'RGF', '02', 'RELATÓRIO DE GESTÃO FISCAL 02 SEMESTRE 2024', 'https://venabrasa.gov.br/rgf/2024/semestre2.pdf', 1),
(2, 2024, 'RGF', '01', 'RELATÓRIO DE GESTÃO FISCAL 01 SEMESTRE 2024', 'https://venabrasa.gov.br/rgf/2024/semestre1.pdf', 1),
(3, 2023, 'RGF', '02', 'RELATÓRIO DE GESTÃO FISCAL 02 SEMESTRE 2023', 'https://venabrasa.gov.br/rgf/2023/semestre2.pdf', 1),
(4, 2023, 'RGF', '01', 'RELATÓRIO DE GESTÃO FISCAL 01 SEMESTRE 2023', 'https://venabrasa.gov.br/rgf/2023/semestre1.pdf', 1),
(5, 2022, 'RGF', '02', 'RELATÓRIO DE GESTÃO FISCAL 02 SEMESTRE 2022', 'https://venabrasa.gov.br/rgf/2022/semestre2.pdf', 1),
(6, 2022, 'RGF', '01', 'RELATÓRIO DE GESTÃO FISCAL 1º SEMESTRE 2022', 'https://venabrasa.gov.br/rgf/2022/semestre1.pdf', 1),
(7, 2021, 'RGF', '03', 'RELATÓRIO DE GESTÃO FISCAL 3º QUADRIMESTRE 2021', 'https://venabrasa.gov.br/rgf/2021/quadrimestre3.pdf', 1),
(8, 2021, 'RGF', '02', 'RELATÓRIO DE GESTÃO FISCAL 2º QUADRIMESTRE 2021', 'https://venabrasa.gov.br/rgf/2021/quadrimestre2.pdf', 1),
(9, 2021, 'RGF', '01', 'RELATÓRIO DE GESTÃO FISCAL 01 QUADRIMESTRE 2021', 'https://venabrasa.gov.br/rgf/2021/quadrimestre1.pdf', 1),
(10, 2020, 'RGF', '02', 'RELATÓRIO DE GESTÃO FISCAL 02 SEMESTRE 2020', 'https://venabrasa.gov.br/rgf/2020/semestre2.pdf', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servidores`
--

CREATE TABLE `servidores` (
  `id` int(11) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `venc_base` varchar(20) DEFAULT NULL,
  `jornada` varchar(20) DEFAULT NULL,
  `funcao` varchar(100) DEFAULT NULL,
  `admissao` date DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `investidura` varchar(100) DEFAULT NULL,
  `lotacao` varchar(100) DEFAULT NULL,
  `id_entidade` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `ano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `servidores`
--

INSERT INTO `servidores` (`id`, `cpf`, `matricula`, `nome`, `venc_base`, `jornada`, `funcao`, `admissao`, `cargo`, `investidura`, `lotacao`, `id_entidade`, `mes`, `ano`) VALUES
(13, '098606***', '0011448', 'RENATO MENDONCA DO NASCIMENTO', '1518.00', '40h', 'AUXILIAR ADMINISTRATIVO', '2025-01-02', 'AUXILIAR ADMINISTRATIVO', 'CONTRATAÇÃO POR EXCEPCIONAL INTERESSE PÚBLICO', '45', 1, 1, 2025),
(14, '147045***', '0011431', 'LIRIEL DE SOUZA PONTES', '1518.00', '40h', 'AUX DE SERVICOS GERAIS', '2025-01-02', 'AUX DE SERVICOS GERAIS', 'CONTRATAÇÃO POR EXCEPCIONAL INTERESSE PÚBLICO', '20000023', 1, 1, 2024),
(15, '021651***', '0000959', 'LUCIANA VERUSKA LUNA DO NASCIMENTO', '1977.00', '30h', 'NUTRICIONISTA', '2008-04-14', 'NUTRICIONISTA', 'ADMISSÃO P/ CARGO EFETIVO/VITALÍCIO', '22', 1, 4, 2025),
(16, '115286***', '0011494', 'ANDRESSA RODRIGUES DE MELO', '1977.00', '30h', 'NUTRICIONISTA', '2025-01-02', 'NUTRICIONISTA', 'CONTRATAÇÃO POR EXCEPCIONAL INTERESSE PÚBLICO', '30000053', 1, 1, 2024),
(17, '115013***', '0011510', 'GISLENE MARQUES DA SILVA', '1518.00', '40h', 'TECNICO EM ENFERMAGEM', '2025-01-31', 'TECNICO EM ENFERMAGEM', 'CONTRATAÇÃO POR EXCEPCIONAL INTERESSE PÚBLICO', '49', 1, 1, 2025),
(18, '096053***', '0011470', 'JOSEFA MARIANNE MOREIRA TAVARES', '1977.00', '30h', 'FISIOTERAPEUTA', '2025-01-02', 'FISIOTERAPEUTA', 'CONTRATAÇÃO POR EXCEPCIONAL INTERESSE PÚBLICO', '30000064', 1, 1, 2024),
(19, '123456***', '0011525', 'CARLOS ALBERTO MENDES', '1977.00', '30h', 'ENFERMEIRO', '2024-03-15', 'ENFERMEIRO', 'CONTRATAÇÃO POR EXCEPCIONAL INTERESSE PÚBLICO', '30000050', 1, 3, 2024),
(20, '234567***', '0011530', 'MARIA EDUARDA SANTOS', '1518.00', '40h', 'ASSISTENTE SOCIAL', '2025-02-10', 'ASSISTENTE SOCIAL', 'CONTRATAÇÃO POR EXCEPCIONAL INTERESSE PÚBLICO', '20000022', 1, 2, 2025),
(21, '345678***', '0011540', 'PEDRO HENRIQUE OLIVEIRA', '2500.00', '30h', 'PSICÓLOGO', '2023-11-05', 'PSICÓLOGO', 'ADMISSÃO P/ CARGO EFETIVO/VITALÍCIO', '22', 1, 11, 2024),
(22, '456789***', '0011550', 'ANA CAROLINA FERREIRA', '1518.00', '40h', 'RECEPCIONISTA', '2025-01-20', 'RECEPCIONISTA', 'CONTRATAÇÃO POR EXCEPCIONAL INTERESSE PÚBLICO', '43', 1, 1, 2025),
(23, '567890***', '0011560', 'JOSÉ CARLOS PEREIRA', '1977.00', '30h', 'FARMACÊUTICO', '2024-07-01', 'FARMACÊUTICO', 'CONTRATAÇÃO POR EXCEPCIONAL INTERESSE PÚBLICO', '30000063', 1, 7, 2024),
(24, '678901***', '0011570', 'FERNANDA LIMA COSTA', '1977.00', '30h', 'FONOAUDIÓLOGO', '2025-01-15', 'FONOAUDIÓLOGO', 'CONTRATAÇÃO POR EXCEPCIONAL INTERESSE PÚBLICO', '30000054', 1, 1, 2025);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Índices para tabela `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_contratos_id` (`id`);

--
-- Índices para tabela `despesas`
--
ALTER TABLE `despesas`
  ADD PRIMARY KEY (`id`,`empenho`,`elemento`,`fonte_recurso`,`acao`,`despesa`,`id_entidade`),
  ADD KEY `ix_despesas_id` (`id`);

--
-- Índices para tabela `entidades`
--
ALTER TABLE `entidades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_entidades_id` (`id`);

--
-- Índices para tabela `ldo`
--
ALTER TABLE `ldo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_ldo_id` (`id`);

--
-- Índices para tabela `licitacoes`
--
ALTER TABLE `licitacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_licitacoes_id` (`id`);

--
-- Índices para tabela `loa`
--
ALTER TABLE `loa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_loa_id` (`id`);

--
-- Índices para tabela `ppa`
--
ALTER TABLE `ppa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_ppa_id` (`id`);

--
-- Índices para tabela `prestacao_contas`
--
ALTER TABLE `prestacao_contas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_prestacao_contas_id` (`id`);

--
-- Índices para tabela `receitas`
--
ALTER TABLE `receitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_receitas_id` (`id`);

--
-- Índices para tabela `relatorio_gestao_fiscal`
--
ALTER TABLE `relatorio_gestao_fiscal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_relatorio_gestao_fiscal_id` (`id`);

--
-- Índices para tabela `servidores`
--
ALTER TABLE `servidores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD KEY `ix_servidores_id` (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `contratos`
--
ALTER TABLE `contratos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `despesas`
--
ALTER TABLE `despesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `entidades`
--
ALTER TABLE `entidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `ldo`
--
ALTER TABLE `ldo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `licitacoes`
--
ALTER TABLE `licitacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `loa`
--
ALTER TABLE `loa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `ppa`
--
ALTER TABLE `ppa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `prestacao_contas`
--
ALTER TABLE `prestacao_contas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `receitas`
--
ALTER TABLE `receitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `relatorio_gestao_fiscal`
--
ALTER TABLE `relatorio_gestao_fiscal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `servidores`
--
ALTER TABLE `servidores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
