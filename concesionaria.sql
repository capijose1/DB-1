-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-07-2020 a las 07:25:34
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `concesionaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autos_por_vender`
--

CREATE TABLE `autos_por_vender` (
  `apv_id` int(5) NOT NULL,
  `car_id` int(7) NOT NULL,
  `precio` int(6) NOT NULL,
  `vendido` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autos_por_vender`
--

INSERT INTO `autos_por_vender` (`apv_id`, `car_id`, `precio`, `vendido`) VALUES
(10101, 20101, 50000, b'0'),
(10201, 20102, 75000, b'1'),
(10211, 20112, 89062, b'0'),
(10212, 20212, 122255, b'1'),
(10301, 20103, 76433, b'1'),
(10401, 20104, 65000, b'1'),
(10501, 20105, 60000, b'1'),
(10502, 20205, 93686, b'1'),
(10601, 20106, 30000, b'1'),
(10602, 20206, 181688, b'0'),
(10701, 20107, 209605, b'0'),
(10702, 20207, 25821, b'0'),
(10801, 20108, 178344, b'0'),
(10802, 20208, 113494, b'1'),
(11102, 20201, 92315, b'1'),
(11112, 20211, 407032, b'1'),
(12202, 20202, 173342, b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autos_vendidos`
--

CREATE TABLE `autos_vendidos` (
  `autov_id` int(7) NOT NULL,
  `apv_id` int(7) NOT NULL,
  `cli_id` int(5) NOT NULL,
  `fecha_venta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autos_vendidos`
--

INSERT INTO `autos_vendidos` (`autov_id`, `apv_id`, `cli_id`, `fecha_venta`) VALUES
(190112, 11112, 1902, '2020-07-21 18:26:19'),
(190201, 10201, 1907, '2020-07-21 18:26:53'),
(190212, 10212, 1903, '2020-07-21 18:26:32'),
(190301, 10301, 1901, '2020-04-18 21:28:00'),
(190401, 10401, 1903, '2019-12-10 21:28:00'),
(190501, 10501, 1904, '2020-07-21 18:15:21'),
(190502, 10502, 1906, '2020-07-21 18:26:48'),
(190601, 10601, 1906, '2020-07-21 18:15:17'),
(190802, 10802, 1904, '2020-07-21 18:26:42'),
(191102, 11102, 1907, '2020-07-21 18:27:02'),
(191103, 10101, 1903, '2020-07-22 01:32:07'),
(191104, 10201, 1901, '2020-07-22 01:32:42'),
(191105, 10211, 1907, '2020-07-22 01:32:51'),
(191106, 10501, 1904, '2020-07-22 01:33:02'),
(191107, 10702, 1905, '2020-07-22 01:33:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas_de_autos`
--

CREATE TABLE `caracteristicas_de_autos` (
  `car_id` int(4) NOT NULL,
  `fab_id` int(5) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `año_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `caracteristicas_de_autos`
--

INSERT INTO `caracteristicas_de_autos` (`car_id`, `fab_id`, `nombre`, `año_registro`) VALUES
(20101, 1004, 'Civic', '2020-07-05 21:04:11'),
(20102, 1001, 'Carens', '2020-07-20 21:04:54'),
(20103, 1003, 'Almera Tino', '2017-10-16 21:04:55'),
(20104, 1002, 'Corolla', '2017-11-13 10:04:55'),
(20105, 1005, 'Tipo', '2018-10-17 21:15:57'),
(20106, 1006, 'Lancer', '2020-07-25 21:15:57'),
(20107, 1007, 'Camaro', '2019-11-23 00:19:13'),
(20108, 1008, 'I3', '2020-02-11 11:19:13'),
(20111, 1011, 'Roadster', '2020-03-20 17:56:55'),
(20112, 1012, 'Beetle', '2019-08-13 17:56:55'),
(20201, 1004, 'Jazz', '2020-05-14 12:46:21'),
(20202, 1001, 'Optima', '2019-08-05 17:46:21'),
(20205, 1005, 'Freemont', '2019-10-16 17:47:16'),
(20206, 1006, 'Montero', '2019-09-09 17:50:06'),
(20207, 1007, 'Spark', '2019-06-10 17:47:16'),
(20208, 1008, 'Serie 1', '2020-07-21 20:50:06'),
(20211, 1011, 'Model S', '2020-07-21 17:59:52'),
(20212, 1012, 'Amarok', '2020-07-21 17:59:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cli_id` int(4) NOT NULL,
  `dni` int(8) DEFAULT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `telefono` int(9) NOT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cli_id`, `dni`, `nombre`, `apellidos`, `telefono`, `email`) VALUES
(1901, 54875846, 'Rolando', 'Rolas', 978458458, 'rola.rola@gmail.com'),
(1902, 6584579, 'Hernan', 'Rosas', 948758462, 'hernan23ro@hotmail.com'),
(1903, 48758462, 'Amanda', 'Lopez', 936542849, 'amlo99@gmail.com'),
(1904, 58475862, 'Maria', 'Torres', 961452846, 'ma19to@hotmail.com'),
(1905, 48759254, 'Luis', 'Chullo', 978425148, 'luisq97@hotmail.com'),
(1906, 58762485, 'Ariana', 'Meza', 978125462, 'ameza_v@gmail.com'),
(1907, 62548751, 'Renato', 'Valdivia', 902545625, 'renato32@gmail.com'),
(1908, 49528465, 'Anselmo', 'Quispe', 995462054, 'anquis_aqp20@hotmail.com'),
(1909, 65478254, 'Esteban', 'Quito', 947581625, 'banquito@hotmail.com'),
(1910, 58475868, 'Henry', 'Perez', 961452811, 'dinosaurio212@hotmail.com'),
(1911, 64189861, 'Enzo', 'Silva', 995462154, 'enzo22@hotmail.com'),
(1912, 63121665, 'Adrian', 'Villanueva', 970773290, 'adrian123@hotmail.com'),
(1913, 78006947, 'Moises', 'Hurtado', 976320306, 'moi@hotmail.com'),
(1914, 44351986, 'Maria', 'Ramos', 944351986, 'ramos1234@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compañias_de_financiacion`
--

CREATE TABLE `compañias_de_financiacion` (
  `fin_com_id` int(5) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `telefono` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compañias_de_financiacion`
--

INSERT INTO `compañias_de_financiacion` (`fin_com_id`, `nombre`, `telefono`) VALUES
(12405, 'Kredito', 978458475),
(13401, 'Fincomer', 947562485),
(15401, 'Independencia', 978458125),
(15402, 'Financrédito Perú', 964758215),
(15403, 'Factoring bancolombia', 710034884),
(15404, 'Cit. capital Colombia', 612656563),
(15405, 'Inversora pichincha', 343007171),
(15406, 'Financiera internacional S.A', 733363552),
(15407, 'Financiera América S.A', 334259739),
(15410, 'COFIDE', 927273236),
(15411, 'Credinka', 981196755),
(15412, 'Proempresa', 914564238),
(15413, 'Qapaq', 960101801),
(15414, 'Amérika', 826295047),
(15415, 'BBVA Consumer Finance', 905682420);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compañias_de_seguros`
--

CREATE TABLE `compañias_de_seguros` (
  `seg_com_id` int(5) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `telefono` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compañias_de_seguros`
--

INSERT INTO `compañias_de_seguros` (`seg_com_id`, `nombre`, `telefono`) VALUES
(18402, 'HDI', 978436251),
(18403, 'La Positiva', 964582635),
(19401, 'Rimac', 978458362),
(19402, 'Mapfre', 947581352),
(21307, 'Lagun Aro', 948057346),
(40365, 'Fénix Directo', 923921986),
(61123, 'Direct Seguros', 937303183),
(63355, 'SeguroMovil', 968236451),
(74366, 'Génesis Seguros', 985918673),
(75866, 'Verti Seguros', 942729014),
(86251, 'AXA Seguros', 954762138);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `dep_id` int(3) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`dep_id`, `nombre`) VALUES
(101, 'Servicio'),
(102, 'Finanzas'),
(103, 'Auditoria'),
(104, 'Ventas'),
(105, 'Marketing'),
(106, 'CEO'),
(107, 'Responsable operativo'),
(108, 'Customer Success'),
(109, 'Recursos Humanos'),
(110, 'Director Financiero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_de_facturas`
--

CREATE TABLE `detalles_de_facturas` (
  `fac_id` int(6) NOT NULL,
  `autov_id` int(7) DEFAULT NULL,
  `rep_id` int(5) DEFAULT NULL,
  `emp_id` int(5) DEFAULT NULL,
  `cantidad` int(100) NOT NULL,
  `descripcion` varchar(450) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalles_de_facturas`
--

INSERT INTO `detalles_de_facturas` (`fac_id`, `autov_id`, `rep_id`, `emp_id`, `cantidad`, `descripcion`, `precio`) VALUES
(200001, 190301, NULL, 13104, 1, '', 76433),
(190002, 190401, NULL, 13104, 1, '', 65000),
(190003, 190212, NULL, 13104, 1, '', 190502),
(190005, 190502, NULL, 19104, 1, '', 300000),
(190006, 190802, NULL, 19104, 1, '', 122225),
(190017, 190201, NULL, 19104, 1, '', 93686),
(190018, 191102, NULL, 19104, 1, '', 122255),
(190019, 190601, NULL, 20104, 1, '', 76433),
(200002, 190501, NULL, 20104, 1, '', 407032),
(200003, 190112, NULL, 20104, 1, '', 113494);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `dir_id` int(4) NOT NULL,
  `fab_id` int(4) DEFAULT NULL,
  `suc_id` int(4) DEFAULT NULL,
  `cli_id` int(4) DEFAULT NULL,
  `ciudad` varchar(30) NOT NULL,
  `distrito` varchar(30) NOT NULL,
  `calle` varchar(30) NOT NULL,
  `cdgo_pstal` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `direcciones`
--

INSERT INTO `direcciones` (`dir_id`, `fab_id`, `suc_id`, `cli_id`, `ciudad`, `distrito`, `calle`, `cdgo_pstal`) VALUES
(1903, 1009, NULL, NULL, 'Arequipa', 'Cayma', 'Binaria', 4001),
(1904, NULL, 1601, NULL, 'Lima', 'San Miguel', 'Ornales', 5014);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `emp_id` int(5) NOT NULL,
  `dep_id` int(3) NOT NULL,
  `suc_id` int(4) NOT NULL,
  `dni` int(8) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `telefono` int(9) NOT NULL,
  `sueldo` float NOT NULL,
  `n_ventas` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`emp_id`, `dep_id`, `suc_id`, `dni`, `nombre`, `apellidos`, `telefono`, `sueldo`, `n_ventas`) VALUES
(12101, 101, 1601, 40325486, 'Milagros', 'Vargas', 903250452, 1500, NULL),
(12102, 102, 1401, 47365849, 'Lucia', 'Flores', 978452549, 2500, NULL),
(13104, 104, 1501, 48759325, 'Anderson', 'Jimenez', 963481630, 1500, 3),
(17103, 103, 1502, 48579562, 'Pepe', 'Lanza', 978215463, 2500, NULL),
(17105, 109, 1501, 11579562, 'Joaquin', 'Amat', 978215463, 2500, NULL),
(17106, 101, 1502, 78579572, 'Diana', 'Chavez', 988215463, 3500, NULL),
(17107, 107, 1501, 73682591, 'Esteban', 'Farban', 998215463, 5500, NULL),
(17108, 104, 1401, 28579102, 'Lucero', 'Mamani', 911215463, 9000, 0),
(17109, 101, 1601, 38579592, 'Guiuliana', 'Guillermo', 910215463, 1100, NULL),
(17110, 106, 1502, 18579112, 'Valeria', 'Cuba', 912215463, 2501, NULL),
(17119, 104, 1501, 73692590, 'Juanito', 'Perez', 994503257, 1400, 0),
(17120, 104, 1501, 73692598, 'José', 'Tito', 994503251, 1800, 0),
(19104, 104, 1501, 48751854, 'Helena', 'Morales', 978025045, 1500, 4),
(20104, 104, 1601, 70510568, 'Mauricio', 'Dogo', 905452162, 1500, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabricantes`
--

CREATE TABLE `fabricantes` (
  `fab_id` int(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `teléfono` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fabricantes`
--

INSERT INTO `fabricantes` (`fab_id`, `nombre`, `teléfono`) VALUES
(1001, 'Kia', 945875645),
(1002, 'Toyota', 984576584),
(1003, 'Nissan', 978546512),
(1004, 'Honda', 968457845),
(1005, 'Fiat', 987564854),
(1006, 'Mitsubishi', 978548756),
(1007, 'Chevrolet', 945875846),
(1008, 'BMW', 963548564),
(1009, 'Dávalos Import SA', 978263456),
(1010, 'Germsa', 936212504),
(1011, 'Tesla Motors', 936485875),
(1012, 'Volkswagen', 970540514);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `fac_id` int(6) NOT NULL,
  `cli_id` int(4) NOT NULL,
  `fecha_venta` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`fac_id`, `cli_id`, `fecha_venta`) VALUES
(190002, 1903, '2019-12-10 21:28:00'),
(190003, 1903, '2019-12-10 21:28:00'),
(190005, 1906, '2020-07-21 18:15:17'),
(190006, 1904, '2019-10-07 18:16:00'),
(190017, 1907, '2019-12-12 18:15:54'),
(190018, 1907, '2019-07-13 18:16:00'),
(190019, 1906, '2019-06-05 18:16:06'),
(200001, 1901, '2020-04-18 21:28:00'),
(200002, 1904, '2020-07-21 18:15:21'),
(200003, 1902, '2020-01-18 18:15:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `financiaciones`
--

CREATE TABLE `financiaciones` (
  `fin_id` int(7) NOT NULL,
  `autov_id` int(7) NOT NULL,
  `fin_com_id` int(5) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `n_cuotas` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `financiaciones`
--

INSERT INTO `financiaciones` (`fin_id`, `autov_id`, `fin_com_id`, `fecha_inicio`, `fecha_final`, `n_cuotas`) VALUES
(1900112, 190112, 13401, '2019-08-17', '2021-01-08', 20),
(1900201, 190201, 15401, '2019-08-08', '2021-04-16', 18),
(1900212, 190212, 15402, '2019-07-25', '2021-05-13', 24),
(1900301, 190301, 12405, '2017-05-18', '2020-07-10', 36),
(1900401, 190401, 13401, '2018-10-11', '2020-10-14', 24),
(1900501, 190501, 13401, '2019-07-25', '2021-04-08', 32),
(1900502, 190502, 12405, '2019-09-13', '2021-01-06', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparaciones`
--

CREATE TABLE `reparaciones` (
  `rep_id` int(5) NOT NULL,
  `cli_id` int(4) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reparaciones`
--

INSERT INTO `reparaciones` (`rep_id`, `cli_id`, `fecha_inicio`, `fecha_final`) VALUES
(3, 1902, '2020-07-09', '2020-07-20'),
(4, 1904, '2020-01-01', '2020-01-08'),
(5, 1904, '2020-04-16', '2020-05-01'),
(13, 1901, '2019-10-02', '2019-10-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguros`
--

CREATE TABLE `seguros` (
  `seg_id` int(7) NOT NULL,
  `autov_id` int(7) NOT NULL,
  `seg_com_id` int(5) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `seguros`
--

INSERT INTO `seguros` (`seg_id`, `autov_id`, `seg_com_id`, `fecha_inicio`, `fecha_final`) VALUES
(1900401, 190401, 19402, '2019-06-12', '2020-06-10'),
(1900402, 190301, 18402, '2018-07-18', '2021-05-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `suc_id` int(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `telefono` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`suc_id`, `nombre`, `telefono`) VALUES
(1401, 'Automax', 947852684),
(1501, 'Rokar', 978452689),
(1502, 'Automotriz Andina', 956821625),
(1601, 'Sur Motors', 978458624);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autos_por_vender`
--
ALTER TABLE `autos_por_vender`
  ADD PRIMARY KEY (`apv_id`),
  ADD KEY `apv_car_fk` (`car_id`);

--
-- Indices de la tabla `autos_vendidos`
--
ALTER TABLE `autos_vendidos`
  ADD PRIMARY KEY (`autov_id`),
  ADD KEY `av_apv_fk` (`apv_id`),
  ADD KEY `av_cli_fk` (`cli_id`);

--
-- Indices de la tabla `caracteristicas_de_autos`
--
ALTER TABLE `caracteristicas_de_autos`
  ADD PRIMARY KEY (`car_id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD KEY `car_fab_fk` (`fab_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cli_id`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `compañias_de_financiacion`
--
ALTER TABLE `compañias_de_financiacion`
  ADD PRIMARY KEY (`fin_com_id`);

--
-- Indices de la tabla `compañias_de_seguros`
--
ALTER TABLE `compañias_de_seguros`
  ADD PRIMARY KEY (`seg_com_id`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`dep_id`);

--
-- Indices de la tabla `detalles_de_facturas`
--
ALTER TABLE `detalles_de_facturas`
  ADD KEY `det_fac_fk` (`fac_id`),
  ADD KEY `det_aut_fk` (`autov_id`),
  ADD KEY `det_rep_fk` (`rep_id`),
  ADD KEY `det_emp_fk` (`emp_id`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`dir_id`),
  ADD KEY `dir_fab_fk` (`fab_id`),
  ADD KEY `dir_suc_fk` (`suc_id`),
  ADD KEY `dir_cli_fk` (`cli_id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`emp_id`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `emp_dep_fk` (`dep_id`),
  ADD KEY `emp_suc_fk` (`suc_id`);

--
-- Indices de la tabla `fabricantes`
--
ALTER TABLE `fabricantes`
  ADD PRIMARY KEY (`fab_id`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`fac_id`),
  ADD KEY `fac_cli_fk` (`cli_id`);

--
-- Indices de la tabla `financiaciones`
--
ALTER TABLE `financiaciones`
  ADD PRIMARY KEY (`fin_id`),
  ADD KEY `fin_aut_fk` (`autov_id`),
  ADD KEY `fin_com_id` (`fin_com_id`);

--
-- Indices de la tabla `reparaciones`
--
ALTER TABLE `reparaciones`
  ADD PRIMARY KEY (`rep_id`),
  ADD KEY `rep_cli_fk` (`cli_id`);

--
-- Indices de la tabla `seguros`
--
ALTER TABLE `seguros`
  ADD PRIMARY KEY (`seg_id`),
  ADD KEY `seg_aut_fk` (`autov_id`),
  ADD KEY `seg_com_fk` (`seg_com_id`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`suc_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autos_por_vender`
--
ALTER TABLE `autos_por_vender`
  ADD CONSTRAINT `apv_car_fk` FOREIGN KEY (`car_id`) REFERENCES `caracteristicas_de_autos` (`car_id`);

--
-- Filtros para la tabla `autos_vendidos`
--
ALTER TABLE `autos_vendidos`
  ADD CONSTRAINT `av_apv_fk` FOREIGN KEY (`apv_id`) REFERENCES `autos_por_vender` (`apv_id`),
  ADD CONSTRAINT `av_cli_fk` FOREIGN KEY (`cli_id`) REFERENCES `clientes` (`cli_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `caracteristicas_de_autos`
--
ALTER TABLE `caracteristicas_de_autos`
  ADD CONSTRAINT `car_fab_fk` FOREIGN KEY (`fab_id`) REFERENCES `fabricantes` (`fab_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalles_de_facturas`
--
ALTER TABLE `detalles_de_facturas`
  ADD CONSTRAINT `det_aut_fk` FOREIGN KEY (`autov_id`) REFERENCES `autos_vendidos` (`autov_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `det_fac_fk` FOREIGN KEY (`fac_id`) REFERENCES `facturas` (`fac_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `det_rep_fk` FOREIGN KEY (`rep_id`) REFERENCES `reparaciones` (`rep_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalles_de_facturas_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `empleados` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `dir_cli_fk` FOREIGN KEY (`cli_id`) REFERENCES `clientes` (`cli_id`),
  ADD CONSTRAINT `dir_fab_fk` FOREIGN KEY (`fab_id`) REFERENCES `fabricantes` (`fab_id`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `emp_dep_fk` FOREIGN KEY (`dep_id`) REFERENCES `departamentos` (`dep_id`),
  ADD CONSTRAINT `emp_suc_fk` FOREIGN KEY (`suc_id`) REFERENCES `sucursales` (`suc_id`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `fac_cli_fk` FOREIGN KEY (`cli_id`) REFERENCES `clientes` (`cli_id`);

--
-- Filtros para la tabla `financiaciones`
--
ALTER TABLE `financiaciones`
  ADD CONSTRAINT `fin_aut_fk` FOREIGN KEY (`autov_id`) REFERENCES `autos_vendidos` (`autov_id`),
  ADD CONSTRAINT `fin_com_id` FOREIGN KEY (`fin_com_id`) REFERENCES `compañias_de_financiacion` (`fin_com_id`);

--
-- Filtros para la tabla `reparaciones`
--
ALTER TABLE `reparaciones`
  ADD CONSTRAINT `rep_cli_fk` FOREIGN KEY (`cli_id`) REFERENCES `clientes` (`cli_id`);

--
-- Filtros para la tabla `seguros`
--
ALTER TABLE `seguros`
  ADD CONSTRAINT `seg_aut_fk` FOREIGN KEY (`autov_id`) REFERENCES `autos_vendidos` (`autov_id`),
  ADD CONSTRAINT `seg_com_fk` FOREIGN KEY (`seg_com_id`) REFERENCES `compañias_de_seguros` (`seg_com_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
