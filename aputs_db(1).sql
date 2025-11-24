-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2025 a las 03:39:49
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aputs_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aputs`
--

CREATE TABLE `aputs` (
  `id_aput` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `evento` varchar(150) NOT NULL,
  `apuesta` varchar(150) NOT NULL,
  `cuota` decimal(5,2) NOT NULL,
  `apostado` decimal(10,2) NOT NULL,
  `ganancia` decimal(10,2) DEFAULT 0.00,
  `estado` enum('Pendiente','Ganada','Perdida') DEFAULT 'Pendiente',
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aputs`
--

INSERT INTO `aputs` (`id_aput`, `titulo`, `evento`, `apuesta`, `cuota`, `apostado`, `ganancia`, `estado`, `id_usuario`) VALUES
(1, 'Nota Cálculo', 'Examen Final de Cálculo Diferencial', 'Obtener nota mayor a 4.0', 2.50, 5000.00, 12500.00, 'Ganada', 1),
(2, 'Proyecto Software', 'Presentación Proyecto Integrador', 'Entregar antes de la fecha límite', 1.80, 3000.00, 5400.00, 'Pendiente', 1),
(3, 'Promedio Semestral', 'Finalización Semestre 2024-1', 'Promedio superior a 4.2', 3.20, 7000.00, 22400.00, 'Perdida', 2),
(4, 'Concurso Innovación', 'Concurso UTS Innova 2024', 'Quedar entre los 3 primeros', 4.50, 2000.00, 9000.00, 'Pendiente', 2),
(5, 'Laboratorio Electrónica', 'Práctica de Circuitos', 'Aprobar con nota perfecta', 2.80, 4000.00, 11200.00, 'Ganada', 3),
(6, 'Beca Excelencia', 'Convocatoria Becas 2024', 'Obtener beca por promedio', 5.00, 1000.00, 5000.00, 'Pendiente', 3),
(7, 'Taller Mecánica', 'Competencia de Diseño', 'Ganar competencia intergrupal', 2.20, 6000.00, 13200.00, 'Perdida', 4),
(8, 'Prueba Técnica', 'Examen de Máquinas Herramientas', 'Completar antes del tiempo', 1.90, 3500.00, 6650.00, 'Pendiente', 4),
(9, 'Simulación Empresarial', 'Juego de Negocios UTS', 'Superar ROI del 15%', 3.50, 2500.00, 8750.00, 'Ganada', 5),
(10, 'Presentación Oral', 'Seminario de Gestión', 'Obtener feedback positivo del jurado', 2.10, 4500.00, 9450.00, 'Pendiente', 5),
(12, 'Investigación Aplicada', 'Publicación Paper Académico', 'Ser aceptado en revista indexada', 8.00, 800.00, 6400.00, 'Pendiente', 2),
(13, 'Prácticas Profesionales', 'Selección Empresa', 'Ser elegido en primera opción', 2.50, 5000.00, 12500.00, 'Ganada', 3),
(14, 'test', 'test', 'test', 12.00, 12.00, 12.00, 'Ganada', 1),
(15, '1', '1', '1', 1.00, 1.00, 1.00, 'Pendiente', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id_calificacion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_aputs` int(11) NOT NULL,
  `calificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`id_calificacion`, `id_usuario`, `id_aputs`, `calificacion`) VALUES
(1, 1, 1, 5),
(2, 1, 2, 4),
(4, 2, 3, 3),
(5, 2, 4, 4),
(6, 2, 12, 5),
(7, 3, 5, 5),
(8, 3, 6, 4),
(9, 3, 13, 5),
(10, 4, 7, 2),
(11, 4, 8, 4),
(12, 5, 9, 5),
(13, 5, 10, 4),
(14, 1, 1, 2),
(15, 1, 1, 4),
(16, 11, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `carrera` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `correo`, `carrera`, `contrasena`) VALUES
(1, 'María González', 'mgon', 'maria.gonzalez@correo.uts.edu.co', 'Tecnología en Desarrollo de Software', '1234'),
(2, 'Carlos Rodríguez', 'crodriguez', 'carlos.rodriguez@correo.uts.edu.co', 'Tecnología en Gestión Industrial', 'hashed_password_456'),
(3, 'Ana Martínez', 'amartinez', 'ana.martinez@correo.uts.edu.co', 'Tecnología en Electrónica', 'hashed_password_789'),
(4, 'Javier López', 'jlopez', 'javier.lopez@correo.uts.edu.co', 'Tecnología en Mecánica', 'hashed_password_101'),
(5, 'Laura Ramírez', 'lramirez', 'laura.ramirez@correo.uts.edu.co', 'Tecnología en Gestión Empresarial', 'hashed_password_112'),
(6, 'test', 'test', 'test', 'test', '123'),
(9, 'test', 'tlest', 'tesllt', 'tjest', '123'),
(11, 'testsubject', 'user123', 'abcde', '123', '123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aputs`
--
ALTER TABLE `aputs`
  ADD PRIMARY KEY (`id_aput`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id_calificacion`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_aputs` (`id_aputs`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aputs`
--
ALTER TABLE `aputs`
  MODIFY `id_aput` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id_calificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aputs`
--
ALTER TABLE `aputs`
  ADD CONSTRAINT `aputs_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`id_aputs`) REFERENCES `aputs` (`id_aput`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
