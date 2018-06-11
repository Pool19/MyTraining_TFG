-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2018 a las 20:09:27
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rutina_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio`
--

CREATE TABLE `ejercicio` (
  `ej_id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Subtitulo` varchar(200) NOT NULL,
  `Descripcion` varchar(1000) NOT NULL,
  `Estado_forma` varchar(10) NOT NULL,
  `Repeticiones` int(11) NOT NULL,
  `Pub_priv` tinyint(1) NOT NULL,
  `RUTINA_USUARIOS_Email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de Ejercicios';

--
-- Volcado de datos para la tabla `ejercicio`
--

INSERT INTO `ejercicio` (`ej_id`, `Nombre`, `Subtitulo`, `Descripcion`, `Estado_forma`, `Repeticiones`, `Pub_priv`, `RUTINA_USUARIOS_Email`) VALUES
(11, 'VOLTERETAS', 'GEMA', 'Partiendo de la posición inicial de cuclillas, con los brazos extendidos al frente impulsarse hacia delante mediante la extensión de las piernas; apoyar las manos sobre la colchoneta llevando la barbilla al pecho y las caderas en alto, apoyar la espalda , rodar sobre ella mediante una posición encorvada, al tiempo que se llevan las rodillas extendidas, seguidamente se flexionan las rodillas, continuando el impulso con el tronco hasta llegar a la posición inicial.', 'Bajo', 10, 1, 'gema@gmail.com'),
(12, 'BICEPS', 'PAUL', 'hhhh', 'Medio', 9, 1, 'paul@gmail.com'),
(13, 'LEVANTAMIENTO DE PESO', 'GEMA', 'Con una posición de pie, mirando al frente y con las rodillas levemente flexionadas, se procederá a acercar la mancuerna a los hombros doblando los codos desde un ángulo de 90 grados. Cuando la mancuerna llegue a la altura de los hombros se volverá a la posición inicial con cuidado. Es recomendable hacer 3 series de 15 repeticiones.', 'Medio', 15, 1, 'gema@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio_has_rutina`
--

CREATE TABLE `ejercicio_has_rutina` (
  `EJERCICIO_ej_id` int(11) NOT NULL,
  `RUTINA_rut_id` int(11) NOT NULL,
  `USUARIOS_Email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que relacion Rutinas con Ejercicios.\nUna rutina puede contener muchos ejercicios.\nUn ejercicio puede estar en muchas rutinas.';

--
-- Volcado de datos para la tabla `ejercicio_has_rutina`
--

INSERT INTO `ejercicio_has_rutina` (`EJERCICIO_ej_id`, `RUTINA_rut_id`, `USUARIOS_Email`) VALUES
(12, 15, 'gema@gmail.com'),
(13, 17, 'gema@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutina`
--

CREATE TABLE `rutina` (
  `rut_id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` varchar(1000) NOT NULL,
  `Info_Rutina` varchar(500) NOT NULL,
  `Pub_priv` tinyint(1) DEFAULT NULL,
  `USUARIOS_Email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de Rutinas';

--
-- Volcado de datos para la tabla `rutina`
--

INSERT INTO `rutina` (`rut_id`, `Nombre`, `Descripcion`, `Info_Rutina`, `Pub_priv`, `USUARIOS_Email`) VALUES
(15, 'PECHO', 'Recuéstate de espalda sobre un banco y sujeta 2 mancuernas al nivel del pecho, a los lados del cuerpo, con las palmas apuntando hacia tus pies.\n\nEleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa.\n\nExhala al levantar las mancuernas e inhala al bajarlas.', 'GEMA', 1, 'gema@gmail.com'),
(17, 'ESPALDA', 'Colócate de pie frente a la barra con los pies separados con el ancho de los hombros. Contrae los abdominales, saca pecho manteniendo la espalda recta y dobla las rodillas hasta que pueda llegar a la barra.\nAgarra la barra con un agarre prono (los pulgares uno frente al otro), siendo ligeramente más ancho que la anchura de los hombro – usa los anillos de la barra como punto de referencia, para asegurar que está equilibrado.\nSujeta la barra con fuerza, manteniendo los abdominales y la parte inferior de la espalda contraídos, la espalda recta y el pecho hacia adelante. Fija la mirada en un punto de enfrente, inhala y contén la respiración.', 'GEMA', 1, 'gema@gmail.com'),
(18, 'GEMELOS', 'Movimiento simple, comenzar de pie y realizar elevaciones de talón concentrando el gemelo. Para aumentar el esfuerzo, situar la parte delantera del píe en el borde de un escalón o bordillo y cuando realicéis el movimiento descendente, bajar los talones todo lo que podáis. Aguantar un par de segundos la posición tanto en la parte más elevada como en la inferior para evitar usar el rebote.', 'PAUL', 1, 'paul@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Enabled` tinyint(4) NOT NULL,
  `Telefono` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Email`, `Password`, `Enabled`, `Telefono`) VALUES
('gema@gmail.com', '11111111', 1, '666555444'),
('paco@gmail.com', '12345678', 1, '666777888'),
('paul@gmail.com', '12345', 1, '697550247'),
('pep@us.es', 'qwerty', 1, '654654654'),
('pop@us.es', '12345', 1, '654321123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_info`
--

CREATE TABLE `usuarios_info` (
  `USUARIOS_Email` varchar(45) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios_info`
--

INSERT INTO `usuarios_info` (`USUARIOS_Email`, `Nombre`, `Telefono`, `Fecha_Nacimiento`) VALUES
('gema@gmail.com', 'Gema Perez Sal', '666555444', '1982-01-07'),
('paco@gmail.com', 'Paco Gin Ton', '666777888', '1980-02-28'),
('paul@gmail.com', 'Pablo Car', '697550247', '1993-02-03'),
('pep@us.es', 'PEPE', '654654654', '1999-12-23'),
('pop@us.es', 'pepe perez nuñez', '654321123', '1998-03-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_roles`
--

CREATE TABLE `usuarios_roles` (
  `USUARIOS_Email` varchar(45) NOT NULL,
  `Role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios_roles`
--

INSERT INTO `usuarios_roles` (`USUARIOS_Email`, `Role`) VALUES
('gema@gmail.com', 'ROLE_ESPECIALISTA'),
('paco@gmail.com', 'ROLE_USER'),
('paul@gmail.com', 'ROLE_ESPECIALISTA'),
('pep@us.es', 'ROLE_USER'),
('pop@us.es', 'ROLE_USER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_has_ejercicio`
--

CREATE TABLE `usuario_has_ejercicio` (
  `usuario_email` varchar(100) NOT NULL,
  `ejercicio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario_has_ejercicio`
--

INSERT INTO `usuario_has_ejercicio` (`usuario_email`, `ejercicio_id`) VALUES
('paco@gmail.com', 11),
('paco@gmail.com', 12),
('paco@gmail.com', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_has_rutina`
--

CREATE TABLE `usuario_has_rutina` (
  `usuario_email` varchar(100) NOT NULL,
  `rutina_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario_has_rutina`
--

INSERT INTO `usuario_has_rutina` (`usuario_email`, `rutina_id`) VALUES
('paco@gmail.com', 15),
('paco@gmail.com', 17),
('paco@gmail.com', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videos`
--

CREATE TABLE `videos` (
  `Nombre` varchar(100) NOT NULL,
  `URL` varchar(200) NOT NULL,
  `VIDEOS_EJERCICIOS_ej_id` int(11) NOT NULL,
  `USUARIOS_Email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD PRIMARY KEY (`ej_id`),
  ADD KEY `fk_RUTINA_USUARIOS_Email` (`RUTINA_USUARIOS_Email`);

--
-- Indices de la tabla `ejercicio_has_rutina`
--
ALTER TABLE `ejercicio_has_rutina`
  ADD PRIMARY KEY (`EJERCICIO_ej_id`,`RUTINA_rut_id`),
  ADD KEY `fk_EJERCICIO_has_RUTINA_RUTINA1` (`RUTINA_rut_id`);

--
-- Indices de la tabla `rutina`
--
ALTER TABLE `rutina`
  ADD PRIMARY KEY (`rut_id`,`USUARIOS_Email`),
  ADD KEY `fk_RUTINA_USUARIOS1` (`USUARIOS_Email`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Email`),
  ADD UNIQUE KEY `Telefono` (`Telefono`);

--
-- Indices de la tabla `usuarios_info`
--
ALTER TABLE `usuarios_info`
  ADD PRIMARY KEY (`USUARIOS_Email`),
  ADD UNIQUE KEY `Telefono` (`Telefono`);

--
-- Indices de la tabla `usuarios_roles`
--
ALTER TABLE `usuarios_roles`
  ADD PRIMARY KEY (`USUARIOS_Email`);

--
-- Indices de la tabla `usuario_has_ejercicio`
--
ALTER TABLE `usuario_has_ejercicio`
  ADD KEY `ejercicio_id` (`ejercicio_id`),
  ADD KEY `usuario_has_ejercicio_ibfk_2` (`usuario_email`);

--
-- Indices de la tabla `usuario_has_rutina`
--
ALTER TABLE `usuario_has_rutina`
  ADD KEY `usuario_has_rutina_ibfk_1` (`rutina_id`),
  ADD KEY `usuario_email` (`usuario_email`);

--
-- Indices de la tabla `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`VIDEOS_EJERCICIOS_ej_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  MODIFY `ej_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `rutina`
--
ALTER TABLE `rutina`
  MODIFY `rut_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD CONSTRAINT `fk_RUTINA_USUARIOS_Email` FOREIGN KEY (`RUTINA_USUARIOS_Email`) REFERENCES `usuarios` (`Email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ejercicio_has_rutina`
--
ALTER TABLE `ejercicio_has_rutina`
  ADD CONSTRAINT `fk_EJERCICIO_has_RUTINA_EJERCICIO` FOREIGN KEY (`EJERCICIO_ej_id`) REFERENCES `ejercicio` (`ej_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EJERCICIO_has_RUTINA_RUTINA1` FOREIGN KEY (`RUTINA_rut_id`) REFERENCES `rutina` (`rut_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `rutina`
--
ALTER TABLE `rutina`
  ADD CONSTRAINT `fk_RUTINA_USUARIOS1` FOREIGN KEY (`USUARIOS_Email`) REFERENCES `usuarios` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios_info`
--
ALTER TABLE `usuarios_info`
  ADD CONSTRAINT `fk_USUARIOS_INFO_USUARIOS1` FOREIGN KEY (`USUARIOS_Email`) REFERENCES `usuarios` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_info_ibfk_1` FOREIGN KEY (`Telefono`) REFERENCES `usuarios` (`Telefono`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios_roles`
--
ALTER TABLE `usuarios_roles`
  ADD CONSTRAINT `fk_USUARIOS_ROLES_USUARIOS1` FOREIGN KEY (`USUARIOS_Email`) REFERENCES `usuarios` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_has_ejercicio`
--
ALTER TABLE `usuario_has_ejercicio`
  ADD CONSTRAINT `usuario_has_ejercicio_ibfk_1` FOREIGN KEY (`ejercicio_id`) REFERENCES `ejercicio` (`ej_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_has_ejercicio_ibfk_2` FOREIGN KEY (`usuario_email`) REFERENCES `usuarios` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_has_rutina`
--
ALTER TABLE `usuario_has_rutina`
  ADD CONSTRAINT `usuario_has_rutina_ibfk_1` FOREIGN KEY (`rutina_id`) REFERENCES `rutina` (`rut_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_has_rutina_ibfk_2` FOREIGN KEY (`usuario_email`) REFERENCES `usuarios` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `fk_VIDEOS_EJERCICIO1` FOREIGN KEY (`VIDEOS_EJERCICIOS_ej_id`) REFERENCES `ejercicio` (`ej_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
