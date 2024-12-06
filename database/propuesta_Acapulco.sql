-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 12-11-2024 a las 22:50:45
-- Versión del servidor: 11.5.2-MariaDB
-- Versión de PHP: 8.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `propuesta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellidos`, `telefono`) VALUES
(20, 'Juana', 'Vazquez', '7451022761'),
(30, 'César', 'Cruz Chavez', '5516181029'),
(31, 'Paola', 'Shakira', '7451043812'),
(32, 'Benito', 'Jaarez', '7441027151'),
(34, 'Sandra', 'Vazquez', '1231231231'),
(35, 'Juana', 'Vazquez', '1231231232'),
(36, 'Berna', 'Villazana', '5527351235'),
(37, 'Oscar Cruz', 'Chavez', '7412931928'),
(44, 'Camila', 'Sanchez', '7451043813'),
(45, 'Camila', 'Sanchez', '7451043813'),
(46, 'Rigoberto', 'Villazana', '7441201827'),
(47, 'Anahi', 'Zamora', '7441092837'),
(48, 'Elsa', 'Sanchez', '7451043813'),
(49, 'Benito', 'Zamora', '7441092837'),
(50, 'Camila', 'Sanchez', '7441092837'),
(51, 'Hector', 'Apolonio', '7441021527'),
(52, 'Apolinar ', 'Sanchez', '4543543536'),
(53, 'Camila', 'Diaz', '7441201827'),
(54, 'Benito', 'Sanchez', '7441021527'),
(55, 'Oscar', 'Cruz Chavez', '4543543536'),
(56, 'Mati', 'Gutierrez', '5561518726'),
(57, 'Camila', 'Juarez', '7441092837'),
(58, 'Camila', 'Vazquez', '7441092837'),
(59, 'SADSDA', 'SADSDA', '2353453453'),
(60, 'Camila', 'Juarez', '2321312312'),
(61, 'Camila', 'Diaz', '7441092837'),
(62, 'Camila', 'Juarez', '7451043813'),
(63, 'Rigoberto', 'Martinez Villazana', '7441201827'),
(64, 'Camila', 'Navarrete Cortes', '5345345454'),
(65, 'Yaritza', 'Aparicio', '7441021527'),
(66, 'Jesus', 'Bibiano Ramirez', '5543534543'),
(67, 'Ximena', 'Sanchez Perez', '5543534543'),
(68, 'Graciela', 'Garcia Martinez', '7413123231'),
(69, 'Benito', 'Juarez', '7564324234'),
(70, 'Patricia', 'Galvez Diaz', '7411212123'),
(71, 'Elsa', 'Silva Diaz', '7532353453'),
(72, 'Juan', 'Herrera Vazquez', '7443423423'),
(73, 'Maria', 'Hernandez', '7433231231'),
(74, 'Dylan', 'Carmona', '2223232131'),
(75, 'Camila', 'Villazana', '2223123123'),
(76, 'Apolinar', 'Tornez Diaz', '7412931928'),
(78, 'Katia', 'Nava', '7231231231'),
(79, 'Victor', 'Castro', '7442432432'),
(81, 'q', 'Juarez', '7451043813'),
(82, 'Benito', 'Juarez', '4543543536'),
(83, 'Hector', 'Polo', '7771627381'),
(85, 'Andres', 'Manuel', '4534353456'),
(86, 'Camila', 'Navarrete Cortes', '7451043813'),
(88, 'Camila', 'Villazana', '5543534543'),
(89, 'Antonio', 'Rodrigez', '7441231231'),
(90, 'Apolinar ', 'Tornez Diaz', '4543543536'),
(91, 'Rigoberto', 'Navarrete Cortes', '7771627381'),
(92, 'Camila', 'Sanchez', '7451043813'),
(93, 'Eduardo', 'Diaz', '4543543536'),
(94, 'Elsa', 'Zamora', '4543543536'),
(95, 'Oscar ', 'Cruz Chavez', '1122322321'),
(97, 'Ramora', 'Alvarado', '3254234524'),
(98, 'Ricardo', 'Nava', '4543543536'),
(99, 'Nanci', 'Cisnero', '6345345345'),
(100, 'Hector', 'Villazana', '7771627381'),
(102, 'Marco', 'Carrillo', '4543543536'),
(103, 'Hector', 'Sanchez', '4543543536'),
(106, 'WEREWR', 'EWRWER', '4543543536');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id` int(11) NOT NULL,
  `fecha_evento` date DEFAULT NULL,
  `num_personas` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id`, `fecha_evento`, `num_personas`, `id_cliente`) VALUES
(20, '2024-11-01', 100, 93),
(21, '2024-11-09', 444, 94),
(22, '2024-10-10', 100, 95),
(23, '2024-11-05', 111, 103);

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`) VALUES
(1, 'Recepcionista'),
(2, 'Administrador');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `contrasena`, `id_rol`) VALUES
(3, 'Oscar', 'oscar@gmail.com', '$2y$10$Mdu0NzU/7uXnYsrnKSpty.EG1KD9ilNvIVK3cFjChTBw3wZDIUxCO', 2),
(5, 'Oscar', 'oscarch2002@gmail.com', '$2y$10$oz9YgE936gHb9G0f0dPRb.6L/59tVFXE155hAgArX.a5VHya2XjLa', 1),
(6, 'recepcionista', 'recepcionista@gmail.com', '$2y$10$cI22NphJBJIZFP66uTPg4uUvVcgEdMbeX8MC0jQWqYmT3hUjh70YO', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evento_ibfk_1` (`id_cliente`);
--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);
--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
