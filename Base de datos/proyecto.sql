-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-11-2018 a las 23:32:14
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `CEDULA` varchar(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `DIRECCION` varchar(50) NOT NULL,
  `TELEFONOF` varchar(7) NOT NULL,
  `TELEFONOC` varchar(10) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  `CREADO` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `NUMERO` decimal(12,0) NOT NULL,
  `ZONA` decimal(3,0) NOT NULL,
  `FECHA` date NOT NULL,
  `TERCERO` varchar(11) NOT NULL,
  `VALOR` decimal(12,0) NOT NULL,
  `OBSERVACION` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apartamentos`
--

CREATE TABLE `apartamentos` (
  `CODIGO` varchar(4) NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL,
  `PROPIETARIO` varchar(11) NOT NULL,
  `AREA` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `CODIGO` varchar(6) NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL,
  `DEPARTAMENTO` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conceptos`
--

CREATE TABLE `conceptos` (
  `CODIGO` decimal(3,0) NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `CODIGO` varchar(2) NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepago`
--

CREATE TABLE `detallepago` (
  `NUMERO` decimal(12,0) NOT NULL,
  `FECHA` date NOT NULL,
  `CONCEPTO` decimal(3,0) NOT NULL,
  `VALOR` decimal(12,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formadepago`
--

CREATE TABLE `formadepago` (
  `CODIGO` varchar(3) NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inquilinos`
--

CREATE TABLE `inquilinos` (
  `CEDULA` varchar(11) NOT NULL,
  `NOMBRE1` varchar(15) NOT NULL,
  `NOMBRE2` varchar(15) DEFAULT NULL,
  `APELLIDO1` varchar(15) NOT NULL,
  `APELLIDO2` varchar(15) DEFAULT NULL,
  `DIRECCION` varchar(50) NOT NULL,
  `TELEFONOC` varchar(10) NOT NULL,
  `TELEFONOF` varchar(7) DEFAULT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `CIUDAD` varchar(6) NOT NULL,
  `APARTAMENTO` varchar(4) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  `CREADO` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `CODIGO` varchar(4) NOT NULL,
  `DESCRIPCION` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientovehiculos`
--

CREATE TABLE `movimientovehiculos` (
  `NUMERO` decimal(12,0) NOT NULL,
  `VEHICULO` varchar(6) NOT NULL,
  `TERCERO` varchar(11) NOT NULL,
  `INGRESO` date NOT NULL,
  `SALIO` date NOT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  `OBSERVACION` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `NUMERO` decimal(12,0) NOT NULL,
  `FECHA` date NOT NULL,
  `APARTAMENTOS` varchar(4) NOT NULL,
  `FORMADEPAGO` varchar(3) NOT NULL,
  `TERCERO` varchar(11) NOT NULL,
  `TOTAL` decimal(12,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `CEDULA` varchar(11) NOT NULL,
  `NOMBRE1` varchar(15) NOT NULL,
  `NOMBRE2` varchar(2) DEFAULT NULL,
  `APELLIDO1` varchar(15) NOT NULL,
  `APELLIDO2` varchar(15) DEFAULT NULL,
  `DIRECCION` varchar(50) NOT NULL,
  `ROL` varchar(10) DEFAULT NULL,
  `TELEFONOF` varchar(7) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `CIUDAD` varchar(6) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  `CREADO` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `CODIGO` varchar(4) NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `CODIGO` varchar(4) NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL,
  `DIRECCION` varchar(50) NOT NULL,
  `TELEFONO` varchar(7) NOT NULL,
  `ADMINISTRADOR` varchar(11) NOT NULL,
  `CIUDAD` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `CODIGO` varchar(4) NOT NULL,
  `CEDULA` varchar(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `ESTADO` tinyint(1) DEFAULT NULL,
  `CREADO` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosmodulos`
--

CREATE TABLE `usuariosmodulos` (
  `CODIGO` varchar(4) NOT NULL,
  `USUARIO` varchar(4) NOT NULL,
  `MODULO` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosroles`
--

CREATE TABLE `usuariosroles` (
  `CODIGO` varchar(4) NOT NULL,
  `USUARIO` varchar(4) NOT NULL,
  `ROL` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `PLACA` varchar(6) NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL,
  `TERCERO` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonas`
--

CREATE TABLE `zonas` (
  `CODIGO` decimal(3,0) NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`CEDULA`);

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`NUMERO`),
  ADD KEY `ZONA` (`ZONA`),
  ADD KEY `TERCERO` (`TERCERO`),
  ADD KEY `TERCERO_2` (`TERCERO`);

--
-- Indices de la tabla `apartamentos`
--
ALTER TABLE `apartamentos`
  ADD PRIMARY KEY (`CODIGO`),
  ADD KEY `PROPIETARIO` (`PROPIETARIO`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`CODIGO`),
  ADD KEY `DEPARTAMENTO` (`DEPARTAMENTO`);

--
-- Indices de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  ADD PRIMARY KEY (`CODIGO`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`CODIGO`);

--
-- Indices de la tabla `detallepago`
--
ALTER TABLE `detallepago`
  ADD KEY `NUMERO` (`NUMERO`),
  ADD KEY `CONCEPTO` (`CONCEPTO`);

--
-- Indices de la tabla `formadepago`
--
ALTER TABLE `formadepago`
  ADD PRIMARY KEY (`CODIGO`);

--
-- Indices de la tabla `inquilinos`
--
ALTER TABLE `inquilinos`
  ADD PRIMARY KEY (`CEDULA`),
  ADD KEY `CIUDAD` (`CIUDAD`),
  ADD KEY `APARTAMENTO` (`APARTAMENTO`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`CODIGO`);

--
-- Indices de la tabla `movimientovehiculos`
--
ALTER TABLE `movimientovehiculos`
  ADD PRIMARY KEY (`NUMERO`),
  ADD KEY `VEHICULO` (`VEHICULO`),
  ADD KEY `TERCERO` (`TERCERO`),
  ADD KEY `TERCERO_2` (`TERCERO`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`NUMERO`),
  ADD KEY `APARTAMENTOS` (`APARTAMENTOS`),
  ADD KEY `FORMADEPAGO` (`FORMADEPAGO`),
  ADD KEY `TERCERO` (`TERCERO`),
  ADD KEY `TERCERO_2` (`TERCERO`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`CEDULA`),
  ADD KEY `CIUDAD` (`CIUDAD`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`CODIGO`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`CODIGO`),
  ADD KEY `ADMINISTRADOR` (`ADMINISTRADOR`),
  ADD KEY `CIUDAD` (`CIUDAD`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`CODIGO`);

--
-- Indices de la tabla `usuariosmodulos`
--
ALTER TABLE `usuariosmodulos`
  ADD PRIMARY KEY (`CODIGO`),
  ADD KEY `MODULOS` (`MODULO`),
  ADD KEY `USUARIOS1` (`USUARIO`);

--
-- Indices de la tabla `usuariosroles`
--
ALTER TABLE `usuariosroles`
  ADD PRIMARY KEY (`CODIGO`),
  ADD KEY `USUARIO` (`USUARIO`),
  ADD KEY `ROL` (`ROL`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`PLACA`),
  ADD KEY `TERCERO` (`TERCERO`),
  ADD KEY `TERCERO_2` (`TERCERO`);

--
-- Indices de la tabla `zonas`
--
ALTER TABLE `zonas`
  ADD PRIMARY KEY (`CODIGO`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `alquiler_ibfk_1` FOREIGN KEY (`ZONA`) REFERENCES `zonas` (`CODIGO`),
  ADD CONSTRAINT `alquiler_ibfk_2` FOREIGN KEY (`TERCERO`) REFERENCES `inquilinos` (`CEDULA`),
  ADD CONSTRAINT `alquiler_ibfk_3` FOREIGN KEY (`TERCERO`) REFERENCES `propietario` (`CEDULA`);

--
-- Filtros para la tabla `apartamentos`
--
ALTER TABLE `apartamentos`
  ADD CONSTRAINT `apartamentos_ibfk_1` FOREIGN KEY (`PROPIETARIO`) REFERENCES `propietario` (`CEDULA`);

--
-- Filtros para la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD CONSTRAINT `DEPARTAMENTO` FOREIGN KEY (`DEPARTAMENTO`) REFERENCES `departamento` (`CODIGO`);

--
-- Filtros para la tabla `detallepago`
--
ALTER TABLE `detallepago`
  ADD CONSTRAINT `detallepago_ibfk_1` FOREIGN KEY (`NUMERO`) REFERENCES `pagos` (`NUMERO`),
  ADD CONSTRAINT `detallepago_ibfk_2` FOREIGN KEY (`CONCEPTO`) REFERENCES `conceptos` (`CODIGO`);

--
-- Filtros para la tabla `inquilinos`
--
ALTER TABLE `inquilinos`
  ADD CONSTRAINT `inquilinos_ibfk_1` FOREIGN KEY (`CIUDAD`) REFERENCES `ciudades` (`CODIGO`),
  ADD CONSTRAINT `inquilinos_ibfk_2` FOREIGN KEY (`APARTAMENTO`) REFERENCES `apartamentos` (`CODIGO`);

--
-- Filtros para la tabla `movimientovehiculos`
--
ALTER TABLE `movimientovehiculos`
  ADD CONSTRAINT `movimientovehiculos_ibfk_1` FOREIGN KEY (`VEHICULO`) REFERENCES `vehiculos` (`PLACA`),
  ADD CONSTRAINT `movimientovehiculos_ibfk_2` FOREIGN KEY (`TERCERO`) REFERENCES `inquilinos` (`CEDULA`),
  ADD CONSTRAINT `movimientovehiculos_ibfk_3` FOREIGN KEY (`TERCERO`) REFERENCES `propietario` (`CEDULA`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`APARTAMENTOS`) REFERENCES `apartamentos` (`CODIGO`),
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`FORMADEPAGO`) REFERENCES `formadepago` (`CODIGO`),
  ADD CONSTRAINT `pagos_ibfk_3` FOREIGN KEY (`TERCERO`) REFERENCES `inquilinos` (`CEDULA`),
  ADD CONSTRAINT `pagos_ibfk_4` FOREIGN KEY (`TERCERO`) REFERENCES `propietario` (`CEDULA`);

--
-- Filtros para la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD CONSTRAINT `propietario_ibfk_1` FOREIGN KEY (`CIUDAD`) REFERENCES `ciudades` (`CODIGO`);

--
-- Filtros para la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD CONSTRAINT `CIUDAD` FOREIGN KEY (`CIUDAD`) REFERENCES `ciudades` (`CODIGO`),
  ADD CONSTRAINT `unidades_ibfk_1` FOREIGN KEY (`ADMINISTRADOR`) REFERENCES `administradores` (`CEDULA`);

--
-- Filtros para la tabla `usuariosmodulos`
--
ALTER TABLE `usuariosmodulos`
  ADD CONSTRAINT `MODULOS` FOREIGN KEY (`MODULO`) REFERENCES `modulos` (`CODIGO`),
  ADD CONSTRAINT `USUARIOS1` FOREIGN KEY (`USUARIO`) REFERENCES `usuario` (`CODIGO`);

--
-- Filtros para la tabla `usuariosroles`
--
ALTER TABLE `usuariosroles`
  ADD CONSTRAINT `usuariosroles_ibfk_1` FOREIGN KEY (`USUARIO`) REFERENCES `usuario` (`CODIGO`),
  ADD CONSTRAINT `usuariosroles_ibfk_2` FOREIGN KEY (`ROL`) REFERENCES `roles` (`CODIGO`);

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `vehiculos_ibfk_1` FOREIGN KEY (`TERCERO`) REFERENCES `inquilinos` (`CEDULA`),
  ADD CONSTRAINT `vehiculos_ibfk_2` FOREIGN KEY (`TERCERO`) REFERENCES `propietario` (`CEDULA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
