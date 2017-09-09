-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 18-08-2017 a las 16:58:40
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libues`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_user`
--

CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL,
  `sso_id` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `app_user`
--

INSERT INTO `app_user` (`id`, `sso_id`, `password`, `first_name`, `last_name`, `email`) VALUES
(1, 'sam', '$2a$10$4eqIF5s/ewJwHK1p8lqlFOEm2QIA0S8g6./Lok.pQxqcxaBZYChRm', 'Sam', 'Smith', 'samy@xyz.com'),
(3, 'stanleyvladimir2005', '$2a$10$enRKat5fR2CDSCrK1/XXjuyoVUkocH2xCTPbekaK1K3jG5C5dtYr.', 'Vladimir', 'Alvarez', 'stanleyvladimir2005@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_user_user_profile`
--

CREATE TABLE `app_user_user_profile` (
  `user_id` bigint(20) NOT NULL,
  `user_profile_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `app_user_user_profile`
--

INSERT INTO `app_user_user_profile` (`user_id`, `user_profile_id`) VALUES
(1, 2),
(3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `CODIGOAREA` int(11) NOT NULL,
  `NOMBREAREA` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`CODIGOAREA`, `NOMBREAREA`) VALUES
(101, 'CUADERNOS,LIBRETAS Y FOLDERS'),
(102, 'LAPICES, BOLIGRAFOS, PORTAMINAS, PLUMONES'),
(103, 'BORRADOR,LIQUID PAPER,CINTA ADHESIVA, SILICON'),
(104, 'REGLAS, PLANTILLAS, LLAVEROS'),
(105, 'FICHA,CARTULINA,PLASTICO,TARJ'),
(106, 'ESTUCHE DE GEOME, COMPAS , SACAPUNTAS, CALCULADORA'),
(107, 'ENGRAPADORAS,GRAPA,CARTAPACIOS, TIJERAS'),
(108, 'PAPEL BOND, FASTENERS'),
(109, 'PINES'),
(110, 'CAMISA,AROS,PASTAS,MALETIN,ATA'),
(111, 'MEDICINA GENERAL'),
(112, 'GINECOLOGIA'),
(113, 'ENFERMERIA'),
(114, 'PSIQUIATRIA'),
(115, 'LABORATORIO CLINICO'),
(116, 'COCINA / NUTRICION /DIETAS'),
(117, 'EDUCACION PARA LA SALUD'),
(118, 'DEPORTES/MEDICINA DEPORTIVA/TRAB/MUSC'),
(119, 'ASTRONOMIA'),
(120, 'ESTUDIO DEL DERECHO'),
(121, 'CODIGOS'),
(122, 'NATURISMO/MEDICINA NATURAL'),
(123, 'ECOLOGIA Y MEDIO AMBIENTE'),
(124, 'SEXOLOGIA Y EDUCACION SEXUAL'),
(125, 'MUSICA'),
(126, 'JARDINERIA/DECORACION CON PLAN'),
(127, 'GEOLOGIA'),
(128, 'MANUALIDADES Y PASATIEMPOS'),
(129, 'SUPER. PERSONAL/DESARR. MENTAL'),
(130, 'FITOTECNIA'),
(131, 'ZOOTECNIA'),
(132, 'AGRICULTURA'),
(133, 'AGRONOMIA'),
(134, 'GENERO'),
(135, 'HISTORIA,ARQUEOL,ANTROPOLOGIA'),
(136, 'AGENDAS, TAZAS Y ART. PROMOCIONALES'),
(137, 'DICCIONARIOS'),
(138, 'DECORACION'),
(139, 'INVESTIGACION'),
(140, 'BIOLOGIA Y BOTANICA'),
(141, 'FILOSOFIA/TEOLOGIA Y ETICA'),
(142, 'CIENCIAS SOCIALES Y POLITICAS'),
(143, 'PSICOLOGIA'),
(144, 'LITERATURA'),
(145, 'PERIODISMO PUBLICIDAD Y COMUNI'),
(146, 'IDIOMAS'),
(147, 'CIENCIAS DE LA EDUCACION'),
(148, 'GEOGRAFIA'),
(149, 'ARTES'),
(150, 'INGENIERIA INDUSTRIAL'),
(151, 'INGENIERIA ELECTRICA/ELECTRONICA/MECATRONICA'),
(152, 'INGENIERIA CIVIL/CONSTRUCCION'),
(153, 'INGENIERIA EN SISTEMAS/COMPUTACION'),
(154, 'INGENIERIA MECANICA'),
(155, 'INGENIERIA QUIMICA'),
(156, 'ARQUITECTURA'),
(157, 'FISICA'),
(158, 'MATEMATICA Y ESTADISTICA'),
(159, 'TECNOLOGIA DE ALIMENTOS'),
(160, 'QUIMICA Y FARMACIA'),
(161, 'VETERINARIA'),
(162, 'TECNOL. REFRIG. Y AIRE ACONDIC'),
(163, 'MOBILIARIO'),
(164, 'No hay area'),
(165, 'No hay area'),
(166, 'No hay area'),
(167, 'No hay area'),
(168, 'No hay area'),
(169, 'No hay area'),
(170, 'ODONTOLOGIA'),
(171, 'TELECOMUNI/TECNOLOGIA/COMUNICA'),
(172, 'OFTALMOLOGIA'),
(173, 'LOGICA'),
(174, 'No hay area'),
(175, 'No hay area'),
(176, 'No hay area'),
(177, 'No hay area'),
(178, 'No hay area'),
(179, 'TURISMO'),
(180, 'ADMINISTRACION DE EMPRESAS'),
(181, 'ECONOMIA'),
(182, 'CONTABILIDAD'),
(183, 'AUDITORIA'),
(184, 'BIBLIOTECOLOGIA'),
(185, 'ARTICULOS VARIOS'),
(186, 'TRABAJO SOCIAL'),
(187, 'AUTOMOTRIZ'),
(188, 'GENETICA'),
(189, 'BALISTICA Y TECNICAS FORENSES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `CODIGOAUTOR` int(11) NOT NULL,
  `NOMBREAUTOR` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`CODIGOAUTOR`, `NOMBREAUTOR`) VALUES
(101, 'Alberto Masferrer'),
(102, 'Salvador Salazar Arrué'),
(103, 'Manlio Argueta'),
(104, 'Roque Dalton'),
(105, 'Horacio Castellanos'),
(106, 'Rafael Menjivar'),
(107, 'Arturo Araujo'),
(108, 'Consuelo Saint-Exupéry'),
(109, 'Rafael Zaldivar'),
(110, 'Oscar Arnulfo Romero'),
(111, 'Juan Díaz'),
(112, 'Alfonso Espino'),
(113, 'C. Gerardo Perla'),
(114, 'Albert Einstein'),
(115, 'Isaac Newton'),
(116, 'Stephen Hawking'),
(117, 'Galileo Galilei'),
(118, 'Max Planck'),
(119, 'Niels Bohr'),
(120, 'Arquimides'),
(121, 'Michael Faraday'),
(122, 'Richard Feynman'),
(123, 'Marie Curie'),
(124, 'Resnick'),
(125, 'Sears Zemansky');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor_libro`
--

CREATE TABLE `autor_libro` (
  `CODIGOPRODUCTO` int(11) NOT NULL,
  `CODIGOAUTOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `autor_libro`
--

INSERT INTO `autor_libro` (`CODIGOPRODUCTO`, `CODIGOAUTOR`) VALUES
(1000, 114);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `CODIGOBITACORA` int(11) NOT NULL,
  `FECHABITACORA` date DEFAULT NULL,
  `DESCRIPCIONBITACORA` varchar(200) DEFAULT NULL,
  `ACCION` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigoproducto`
--

CREATE TABLE `codigoproducto` (
  `Id` int(11) NOT NULL,
  `CodigoArea` int(11) NOT NULL,
  `CodigoProveedor` int(11) NOT NULL,
  `Correlativo` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleretaceo`
--

CREATE TABLE `detalleretaceo` (
  `CODIGODETALLERETACEO` int(11) NOT NULL,
  `CODIGOPRODUCTO` int(11) NOT NULL,
  `CODIGOPROVEEDOR` int(11) NOT NULL,
  `CODIGORETACEO` int(11) NOT NULL,
  `COSTOPRODUCTO` decimal(10,2) DEFAULT NULL,
  `PRECIOPRODUCTO` decimal(5,2) DEFAULT NULL,
  `CANTIDADPRODUCTO` int(11) DEFAULT NULL,
  `EXISTENCIAANTERIOR` int(11) NOT NULL,
  `SUBTOTAL` double(10,2) DEFAULT NULL,
  `FECHAFACTURAPROVEEDOR` date DEFAULT NULL,
  `CODIGOFACTURAPROVEEDOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalleretaceo`
--

INSERT INTO `detalleretaceo` (`CODIGODETALLERETACEO`, `CODIGOPRODUCTO`, `CODIGOPROVEEDOR`, `CODIGORETACEO`, `COSTOPRODUCTO`, `PRECIOPRODUCTO`, `CANTIDADPRODUCTO`, `EXISTENCIAANTERIOR`, `SUBTOTAL`, `FECHAFACTURAPROVEEDOR`, `CODIGOFACTURAPROVEEDOR`) VALUES
(2, 1000, 101, 5, '10.00', '12.00', 10, 0, 100.00, '2017-08-10', 1),
(3, 1000, 100, 5, '12.00', '14.40', 12, 0, 144.00, '2017-08-02', 2),
(5, 1001, 101, 5, '2.00', '2.40', 2, 0, 4.00, '2017-08-02', 2),
(6, 1000, 101, 5, '2.00', '2.40', 2, 0, 4.00, '2017-08-16', 2),
(8, 1000, 101, 5, '2.00', '2.40', 2, 0, 4.00, '2017-08-15', 4),
(9, 1001, 101, 6, '4.50', '5.40', 4, 0, 18.00, '2017-08-08', 4),
(10, 1000, 101, 7, '5.00', '2.79', 5, 0, 25.00, '2017-08-02', 2),
(11, 1001, 101, 7, '5.00', '6.00', 5, 0, 25.00, '2017-08-17', 2),
(12, 1001, 101, 7, '5.50', '6.60', 5, 0, 27.50, '2017-08-02', 5),
(13, 1001, 100, 8, '5.50', '6.60', 5, 0, 27.50, '2017-08-09', 8),
(16, 1000, 102, 10, '125.00', '22.46', 2, 0, 250.00, '2017-08-03', 4),
(17, 1000, 101, 10, '1000.00', '300.90', 4, 12, 4000.00, '2017-09-06', 4),
(23, 1000, 101, 10, '2.50', '1.46', 2, 12, 5.00, '2017-09-06', 10),
(24, 1000, 101, 10, '2.50', '1.46', 2, 12, 5.00, '2017-09-06', 4),
(25, 1000, 102, 10, '4.50', '2.25', 4, 12, 18.00, '2017-09-06', 12),
(26, 1000, 101, 10, '2.50', '1.65', 4, 12, 10.00, '2017-09-06', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_requisicion_producto`
--

CREATE TABLE `detalle_requisicion_producto` (
  `CODIGOREQUISICION` int(11) NOT NULL,
  `CODIGOPRODUCTO` int(11) NOT NULL,
  `CODIGOUBICACION` int(11) NOT NULL,
  `CANTIDAD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `CODIGOEDITORIAL` int(11) NOT NULL,
  `NOMBREEDITORIAL` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`CODIGOEDITORIAL`, `NOMBREEDITORIAL`) VALUES
(101, 'Libreria La Ceiba'),
(102, 'Editorial Santillana'),
(103, 'Ese Ediciones'),
(104, 'Editorial Jurídica Salvadoreña'),
(105, 'Colección Monte Sinaí');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localizacion`
--

CREATE TABLE `localizacion` (
  `IDLOCALIZACION` int(11) NOT NULL,
  `CODIGOPROD` int(11) NOT NULL,
  `NOMBREPROD` varchar(50) NOT NULL,
  `LUGAR` varchar(10) NOT NULL DEFAULT 'Bodega',
  `ESTANTE` int(11) NOT NULL DEFAULT '0',
  `NIVEL` int(11) NOT NULL DEFAULT '0',
  `CANTIDAD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persistent_logins`
--

CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `CODIGOPRODUCTO` int(11) NOT NULL,
  `CODIGOAREA` int(11) NOT NULL,
  `CODIGOPROVEEDOR` int(11) NOT NULL,
  `CODIGOEDITORIAL` int(11) NOT NULL,
  `CODTIPOPRODUCTO` int(11) NOT NULL,
  `NOMBREPRODUCTO` varchar(50) DEFAULT NULL,
  `EXISTENCIA` int(11) DEFAULT NULL,
  `UNIDADMINIMA` int(11) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `FECHACREACION` date DEFAULT NULL,
  `PRECIO` decimal(10,2) DEFAULT NULL,
  `ESPECIFICOGASTOS` varchar(20) DEFAULT NULL,
  `CONSIGNACION` varchar(10) DEFAULT NULL,
  `PROVEEDORANTERIOR` int(11) DEFAULT NULL,
  `UNIDADMEDIDA` varchar(100) NOT NULL,
  `COSTOUNITARIO` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`CODIGOPRODUCTO`, `CODIGOAREA`, `CODIGOPROVEEDOR`, `CODIGOEDITORIAL`, `CODTIPOPRODUCTO`, `NOMBREPRODUCTO`, `EXISTENCIA`, `UNIDADMINIMA`, `ISBN`, `FECHACREACION`, `PRECIO`, `ESPECIFICOGASTOS`, `CONSIGNACION`, `PROVEEDORANTERIOR`, `UNIDADMEDIDA`, `COSTOUNITARIO`) VALUES
(1000, 180, 101, 105, 101, 'lenguas', 12, 0, '12456', '2017-08-02', '1.00', '1', 'si', 101, '1', '1.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `CODIGOPROVEEDOR` int(11) NOT NULL,
  `NOMBREPROVEEDOR` varchar(100) DEFAULT NULL,
  `CONTACTOPROVEEDOR1` varchar(20) DEFAULT NULL,
  `CONTACTOPROVEEDOR2` varchar(20) DEFAULT NULL,
  `TELEFONOPROVEEDOR` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`CODIGOPROVEEDOR`, `NOMBREPROVEEDOR`, `CONTACTOPROVEEDOR1`, `CONTACTOPROVEEDOR2`, `TELEFONOPROVEEDOR`) VALUES
(101, 'Libreria La Ceiba', 'Mike', 'Michael', '79797979'),
(102, 'Santillana', 'Mike', 'Michael', '66666655');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requisicion`
--

CREATE TABLE `requisicion` (
  `CODIGOREQUISICION` int(11) NOT NULL,
  `DESTINOREQUISICION` varchar(100) DEFAULT NULL,
  `FECHAREQUISICION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retaceo`
--

CREATE TABLE `retaceo` (
  `CODIGORETACEO` int(11) NOT NULL,
  `FECHARETACEO` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `retaceo`
--

INSERT INTO `retaceo` (`CODIGORETACEO`, `FECHARETACEO`) VALUES
(1, '2017-08-10 18:00:00'),
(2, '2017-08-10 18:00:00'),
(3, '2017-08-10 18:00:00'),
(4, '2017-08-10 18:00:00'),
(5, '2017-08-10 18:00:00'),
(6, '2017-08-10 18:00:00'),
(7, '2017-08-10 08:30:23'),
(8, '2017-08-11 10:06:24'),
(9, '2017-08-11 10:07:16'),
(10, '2017-08-11 19:42:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoproducto`
--

CREATE TABLE `tipoproducto` (
  `CODTIPOPRODUCTO` int(11) NOT NULL,
  `TIPOPRODUCTO` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoproducto`
--

INSERT INTO `tipoproducto` (`CODTIPOPRODUCTO`, `TIPOPRODUCTO`) VALUES
(101, 'LIBRO'),
(102, 'MISCELANEO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `CODIGOUBICACION` int(11) NOT NULL,
  `NOMBREUBICACION` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_profile`
--

CREATE TABLE `user_profile` (
  `id` bigint(20) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_profile`
--

INSERT INTO `user_profile` (`id`, `type`) VALUES
(2, 'ADMINISTRADOR'),
(4, 'BODEGUERO'),
(3, 'DBA'),
(6, 'DIRECTOR'),
(1, 'USUARIO'),
(5, 'VENDEDOR');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sso_id` (`sso_id`);

--
-- Indices de la tabla `app_user_user_profile`
--
ALTER TABLE `app_user_user_profile`
  ADD PRIMARY KEY (`user_id`,`user_profile_id`),
  ADD KEY `FK_USER_PROFILE` (`user_profile_id`);

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`CODIGOAREA`);

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`CODIGOAUTOR`);

--
-- Indices de la tabla `autor_libro`
--
ALTER TABLE `autor_libro`
  ADD PRIMARY KEY (`CODIGOPRODUCTO`,`CODIGOAUTOR`),
  ADD KEY `FK_TIENE_LIBRO` (`CODIGOAUTOR`);

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`CODIGOBITACORA`);

--
-- Indices de la tabla `codigoproducto`
--
ALTER TABLE `codigoproducto`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `PK_AREA` (`CodigoArea`),
  ADD KEY `PK_PROVEEDOR` (`CodigoProveedor`);

--
-- Indices de la tabla `detalleretaceo`
--
ALTER TABLE `detalleretaceo`
  ADD PRIMARY KEY (`CODIGODETALLERETACEO`),
  ADD KEY `FK_APARECE` (`CODIGOPRODUCTO`),
  ADD KEY `FK_EXISTE` (`CODIGOPROVEEDOR`),
  ADD KEY `FK_PRESENTA` (`CODIGORETACEO`);

--
-- Indices de la tabla `detalle_requisicion_producto`
--
ALTER TABLE `detalle_requisicion_producto`
  ADD KEY `FK_CONTIENE` (`CODIGOPRODUCTO`),
  ADD KEY `FK_CONTIENE1` (`CODIGOREQUISICION`),
  ADD KEY `FK_RELATIONSHIP_14` (`CODIGOUBICACION`);

--
-- Indices de la tabla `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`CODIGOEDITORIAL`);

--
-- Indices de la tabla `localizacion`
--
ALTER TABLE `localizacion`
  ADD PRIMARY KEY (`IDLOCALIZACION`),
  ADD KEY `CODIGOPROD` (`CODIGOPROD`);

--
-- Indices de la tabla `persistent_logins`
--
ALTER TABLE `persistent_logins`
  ADD PRIMARY KEY (`series`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`CODIGOPRODUCTO`),
  ADD KEY `FK_ADQUIRIDO` (`CODIGOPROVEEDOR`),
  ADD KEY `FK_PERTENECE` (`CODIGOAREA`),
  ADD KEY `FK_PERTENECE_A` (`CODTIPOPRODUCTO`),
  ADD KEY `FK_TIENE` (`CODIGOEDITORIAL`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`CODIGOPROVEEDOR`);

--
-- Indices de la tabla `requisicion`
--
ALTER TABLE `requisicion`
  ADD PRIMARY KEY (`CODIGOREQUISICION`);

--
-- Indices de la tabla `retaceo`
--
ALTER TABLE `retaceo`
  ADD PRIMARY KEY (`CODIGORETACEO`);

--
-- Indices de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  ADD PRIMARY KEY (`CODTIPOPRODUCTO`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`CODIGOUBICACION`);

--
-- Indices de la tabla `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `app_user`
--
ALTER TABLE `app_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `CODIGOAREA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;
--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `CODIGOAUTOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `CODIGOBITACORA` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `codigoproducto`
--
ALTER TABLE `codigoproducto`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detalleretaceo`
--
ALTER TABLE `detalleretaceo`
  MODIFY `CODIGODETALLERETACEO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `editorial`
--
ALTER TABLE `editorial`
  MODIFY `CODIGOEDITORIAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT de la tabla `localizacion`
--
ALTER TABLE `localizacion`
  MODIFY `IDLOCALIZACION` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `CODIGOPRODUCTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;
--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `CODIGOPROVEEDOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT de la tabla `requisicion`
--
ALTER TABLE `requisicion`
  MODIFY `CODIGOREQUISICION` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  MODIFY `CODTIPOPRODUCTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT de la tabla `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `app_user_user_profile`
--
ALTER TABLE `app_user_user_profile`
  ADD CONSTRAINT `FK_APP_USER` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`),
  ADD CONSTRAINT `FK_USER_PROFILE` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`id`);

--
-- Filtros para la tabla `autor_libro`
--
ALTER TABLE `autor_libro`
  ADD CONSTRAINT `FK_PERTENECE_LIBRO` FOREIGN KEY (`CODIGOPRODUCTO`) REFERENCES `producto` (`CODIGOPRODUCTO`),
  ADD CONSTRAINT `FK_TIENE_LIBRO` FOREIGN KEY (`CODIGOAUTOR`) REFERENCES `autor` (`CODIGOAUTOR`);

--
-- Filtros para la tabla `codigoproducto`
--
ALTER TABLE `codigoproducto`
  ADD CONSTRAINT `PK_AREA` FOREIGN KEY (`CodigoArea`) REFERENCES `area` (`CODIGOAREA`),
  ADD CONSTRAINT `PK_PROVEEDOR` FOREIGN KEY (`CodigoProveedor`) REFERENCES `proveedor` (`CODIGOPROVEEDOR`);

--
-- Filtros para la tabla `detalle_requisicion_producto`
--
ALTER TABLE `detalle_requisicion_producto`
  ADD CONSTRAINT `FK_CONTIENE` FOREIGN KEY (`CODIGOPRODUCTO`) REFERENCES `producto` (`CODIGOPRODUCTO`),
  ADD CONSTRAINT `FK_CONTIENE1` FOREIGN KEY (`CODIGOREQUISICION`) REFERENCES `requisicion` (`CODIGOREQUISICION`),
  ADD CONSTRAINT `FK_RELATIONSHIP_14` FOREIGN KEY (`CODIGOUBICACION`) REFERENCES `ubicacion` (`CODIGOUBICACION`);

--
-- Filtros para la tabla `localizacion`
--
ALTER TABLE `localizacion`
  ADD CONSTRAINT `fk_localizacion` FOREIGN KEY (`CODIGOPROD`) REFERENCES `producto` (`CODIGOPRODUCTO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FK_ADQUIRIDO` FOREIGN KEY (`CODIGOPROVEEDOR`) REFERENCES `proveedor` (`CODIGOPROVEEDOR`),
  ADD CONSTRAINT `FK_PERTENECE` FOREIGN KEY (`CODIGOAREA`) REFERENCES `area` (`CODIGOAREA`),
  ADD CONSTRAINT `FK_PERTENECE_A` FOREIGN KEY (`CODTIPOPRODUCTO`) REFERENCES `tipoproducto` (`CODTIPOPRODUCTO`),
  ADD CONSTRAINT `FK_TIENE` FOREIGN KEY (`CODIGOEDITORIAL`) REFERENCES `editorial` (`CODIGOEDITORIAL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
