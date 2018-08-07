-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-08-2018 a las 04:36:25
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trabajofinal`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarEmpleado` (`_idEmpleado` INT(11), `_apeEmpleado` VARCHAR(20), `_nomEmpleado` VARCHAR(50), `_sexo` VARCHAR(1), `_Direccion` VARCHAR(50), `_Telefono` VARCHAR(9))  INSERT INTO EMPLEADO (idEmpleado,apeEmpleado,nomEmpleado,
                  sexo,Direccion,telefono) 
        VALUES (_idEmpleado,_apeEmpleado,_nomEmpleado,_sexo,_Direccion,_Direccion,_Telefono)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarprodcuto` (`idProd` INT(11))  delete from PRODUCTO 
		where idProducto= idProd$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ingresoEmpleado` (`_id_Empleado` INT(11))  SELECT * FROM EMPLEADO WHERE idEmpleado=_id_Empleado$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarCliente` ()  SELECT * FROM cliente$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarEmpleado` ()  SELECT * FROM empleado$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarProducto` ()  SELECT * FROM PRODUCTO$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarProveedor` ()  SELECT * FROM proveedor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validarEmpleado` (`_usuario` VARCHAR(30), `_clave` VARCHAR(100))  SELECT idEmpleado FROM TIPO_EMPLEADO WHERE usuario = _usuario AND clave = _clave$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validarIngresoEmpleado` (`_usuario` VARCHAR(30), `_clave` VARCHAR(100))  SELECT idEmpleado FROM TIPO_EMPLEADO WHERE usuario = _usuario AND clave = _clave$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nomCategoria` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nomCategoria`) VALUES
(1, 'CALZADO DE BEBES'),
(2, 'ROPA DE BEBES'),
(3, 'JUGUETES DE BEBES'),
(4, 'DORMITORIO Y SEGURID'),
(5, 'ACCESORIOS DE BEBES'),
(6, 'LACTANCIA Y ALIMENTA'),
(7, 'BAÑO Y CAMBIO'),
(8, 'SALUD Y DENTICION'),
(9, 'COCHES Y PASEO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `idCategoria` int(11) NOT NULL,
  `nomCategoria` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`idCategoria`, `nomCategoria`) VALUES
(1, 'ZAPATOS'),
(2, 'POLOS'),
(3, 'CUNAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `nomCliente` varchar(60) NOT NULL,
  `Direccion` varchar(60) NOT NULL,
  `DNI` int(11) NOT NULL,
  `Telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `idEmpleado`, `nomCliente`, `Direccion`, `DNI`, `Telefono`) VALUES
(1, 1, 'CORONEL CASTILLO ERIC GUSTAVO', 'AV lAS PALEMERAS 234 LOS OLIVOS', 85461515, 965435),
(2, 2, 'VALENCIA MORALES PEDRO HUGO', 'AV LA PAZ 567 MAGDALENA', 2147483647, 987),
(3, 3, 'MARCELO VILLALOBOS RICARDO', 'CALLE RISO PATRON 456 LINCE', 2147483647, 987),
(4, 4, 'ROMERO CASTILLO CARLOS ALBERTO', 'AV TACNA 234 LIMA', 2147483647, 987),
(5, 1, 'JORGE ALIGA DIAZ', 'LOS OLIVOS', 654515, 9851156),
(6, 1, 'FELIZ RAMIREZ CABRERA', 'INDEPENDENCIA', 5454545, 784519151),
(7, 1, 'VALENCIA MORALES PEDRO HUGO', 'AV LA PAZ 567 MAGDALENA', 1056892456, 98766789),
(8, 2, 'MARCELO VILLALOBOS RICARDO', 'CALLE RISO PATRON 456 LINCE', 1056789245, 98767589),
(9, 2, 'ROMERO CASTILLO CARLOS ALBERTO', 'AV TACNA 234 LIMA', 2147483647, 98767389),
(10, 1, 'ARANDA LUNA ALAN ALBERTO', 'AV AREQUIPA 678 SAN ISIDRO', 2147483647, 9876789),
(11, 1, 'AYALA PAZ JORGE LUIS', 'JR LAS ARTES 890 SAN BORJA', 2147483647, 9876789),
(12, 3, 'CHAVEZ CANALES EDGAR RAFAEL', 'AV PARADO 342 MIRAFLORES', 2147483647, 9876789),
(13, 3, 'FLORES CHAFLOQUE ROSA LIZET', 'AV JAVIER PRADO 456 LA MOLINA', 2147483647, 9876789);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idCompra` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `TipoDoc` varchar(10) NOT NULL,
  `nroDoc` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Total` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control`
--

CREATE TABLE `control` (
  `Parametro` int(11) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompra`
--

CREATE TABLE `detallecompra` (
  `idCompra` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `PrecioCompra` double(8,2) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Importe` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `idVenta` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `Precio` double(8,2) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Importe` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `nomEmpleado` varchar(50) NOT NULL,
  `apeEmpleado` varchar(50) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Telefono` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `nomEmpleado`, `apeEmpleado`, `sexo`, `Direccion`, `Telefono`) VALUES
(1, 'Edgar', 'Sandoval', 'M', 'Alcazar 100', '987654321'),
(2, 'Adriana', 'Silva', 'F', 'Alameda 198', '981234567'),
(3, 'Xiomara', 'Sandoval', 'F', 'Micaela 689', '96587421');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `precioCompra` decimal(8,2) NOT NULL,
  `precioVenta` decimal(8,2) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `Descripcion`, `precioCompra`, `precioVenta`, `stock`) VALUES
(1, 'Baby Class Calzado para bebe tallas 4 a 8', '35.00', '45.00', 4),
(2, 'Baby Line Calzado para bebe', '40.00', '50.00', 3),
(3, 'Baby Magoo Calzado para bebe', '50.00', '60.00', 2),
(4, 'Baby sandalia Sandalia', '35.00', '45.00', 6),
(5, 'Baby mordedores', '15.00', '25.00', 5),
(6, 'baby Cuna 1 plaza', '200.00', '220.00', 85),
(7, 'Baby sonaja', '17.00', '30.00', 20),
(8, 'Baby chompa', '25.00', '37.00', 25),
(9, 'Baby botas', '65.00', '85.00', 90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedor` int(11) NOT NULL,
  `razonSocial` varchar(60) NOT NULL,
  `Direccion` varchar(60) NOT NULL,
  `RUC` int(11) NOT NULL,
  `Telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idProveedor`, `razonSocial`, `Direccion`, `RUC`, `Telefono`) VALUES
(1, 'DISTRIBUIDORA IMPERIAL', 'AV lAS PALEMERAS 234 LOS OLIVOS ', 2147483647, 9876789),
(2, 'IMPORTACIONES NEPTUNO SAC', 'AV PERU 123 SMP ', 2147483647, 9996789),
(3, 'TIENDAS GAMARRA', 'AV GRAU 234 LIMA', 2147483647, 234),
(4, 'JOSE LUIS GALAN', 'AV PARDO 456 MIRAFLORES ', 2147483647, 4536789),
(5, 'DISTRIBUIDORA EL 9CITO', 'AV TUPAC AMARU 110 ', 2147483647, 2346789);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleado`
--

CREATE TABLE `tipo_empleado` (
  `idTipoEmpleado` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `clave` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_empleado`
--

INSERT INTO `tipo_empleado` (`idTipoEmpleado`, `idEmpleado`, `usuario`, `clave`) VALUES
(1, 1, 'Edgar', 'E123'),
(2, 2, 'Xiomara', 'X123'),
(3, 3, 'Azul', 'A123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idVenta` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `TipoDoc` varchar(10) NOT NULL,
  `NroDoc` int(11) NOT NULL,
  `Fecha` varchar(25) NOT NULL,
  `Total` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idVenta`, `idCliente`, `idEmpleado`, `TipoDoc`, `NroDoc`, `Fecha`, `Total`) VALUES
(0, 5, 1, 'Factura', 1, '08/04/2018', 120.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`idCategoria`),
  ADD UNIQUE KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idCompra`),
  ADD KEY `idProveedor` (`idProveedor`),
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- Indices de la tabla `control`
--
ALTER TABLE `control`
  ADD PRIMARY KEY (`Parametro`);

--
-- Indices de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD KEY `fk_detallecompras_compras` (`idCompra`),
  ADD KEY `fk_detallecompras_productos` (`idProducto`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD KEY `fk_detalleventas_ventas` (`idVenta`),
  ADD KEY `fk_detalleventas_productos` (`idProducto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `tipo_empleado`
--
ALTER TABLE `tipo_empleado`
  ADD PRIMARY KEY (`idTipoEmpleado`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idCompra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `control`
--
ALTER TABLE `control`
  MODIFY `Parametro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
