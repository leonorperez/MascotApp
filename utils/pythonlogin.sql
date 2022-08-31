-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2022 at 08:55 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pythonlogin`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `localidad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuario` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `nombre`, `apellido`, `localidad`, `usuario`, `password`) VALUES
(1, 'Martin', 'Galvan', 'Cañuelas', 'm.galva', '1234'),
(5, 'Caro', 'lopez', 'caba', 'clopez', '12345'),
(8, 'lorena', 'lopez', 'caba', 'lolopez', '12345'),
(11, 'Nico J.', 'Petrecca', 'Saenz Peña', 'NicoP', '12345'),
(12, 'leonor', 'perez', 'saenz peña', 'leonorP', '12345'),
(13, 'Juana', 'Lopez', 'Caba', 'Radich', '12345'),
(14, 'leon', 'sarasa', 'caba', 'leon', 'lalala'),
(15, 'julian', 'perez', 'Saavedra', 'julianP', '12345'),
(16, 'oliverio', 'petrecca', 'caba', 'oliveralbo', 'micaela03');

-- --------------------------------------------------------

--
-- Table structure for table `avisos`
--

CREATE TABLE `avisos` (
  `id` int(11) NOT NULL,
  `idAdministrador` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foto` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publicacion`
--

CREATE TABLE `publicacion` (
  `idPublicacion` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `tipoPublicacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipoMascota` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombreMascota` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `edad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sexo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ubicacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foto` longblob NOT NULL,
  `fecha` date DEFAULT NULL,
  `mensaje` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `publicacion`
--

INSERT INTO `publicacion` (`idPublicacion`, `idUsuario`, `tipoPublicacion`, `tipoMascota`, `nombreMascota`, `color`, `edad`, `sexo`, `ubicacion`, `calle`, `foto`, `fecha`, `mensaje`) VALUES
(1, NULL, 'perdida', 'perro', 'Albo', 'negro', '17', 'macho', 'monte castro', '', 0x6e6f, '2022-05-22', 'collar azul'),
(2, 16, 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', '', 0x616161, '0000-00-00', 'aa'),
(3, 15, 'aaa', 'aaaaaaaaa', 'aaaaaaaaa', 'aaaaaaaaaa', 'aaaaaaaaaaa', 'aaaaaaaaaaaaa', 'aaaaaaaaaaa', '', 0x61616161, '0000-00-00', 'aaaaaaaa'),
(4, 12, 'perdida', 'perro', 'albo', 'negro', '17', 'macho', 'devoto', '', 0x6e6f207469656e65, '0000-00-00', 'collar azul'),
(5, 12, 'encontrada', 'gato', 'radi', 'negro', '10', 'hembra', 'caba', '', 0x6e6f, '2022-05-27', 'no'),
(6, 12, 'perdida', 'mono', 'donki', 'marron', '3', 'macho', 'lomas', '', 0x6e6f, '2022-05-27', 'no hay'),
(7, 12, 'perdida', 'perro ', 'juan', 'marron', '3', 'macho', 'floresta', '', 0x666f6e646f332e6a706567, '2022-06-22', 'estaba en la plaza'),
(8, 12, 'encontrada', 'loro', 'pepe', 'verde', '2', 'macho', 'villa del parque', '', 0x69636f6e6f312e6a7067, '2022-06-23', 'no'),
(9, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(10, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(11, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(12, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(13, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(14, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(15, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(16, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(17, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(18, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(19, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(20, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(21, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(22, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(23, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(24, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(25, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(26, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(27, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(28, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(29, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(30, 12, 'perdida', 'loro', 'pepito', 'verde', '3', 'hembra', 'caba', 'liniers', 0x63616c63756c61646f722e6a7067, '2022-06-26', 'nada'),
(31, 12, 'perdida', 'aaa', 'aaa', 'aaa', 'aaa', 'macho', 'caba', 'aaa', 0x64657363617267612e706e67, '2022-06-26', 'aaa'),
(32, 12, 'perdida', 'perro', 'lolo', 'verde', '2', 'macho', 'zonaNoroeste', 'springolo y ameghino', 0x63616c63756c61646f722e6a7067, '2022-07-08', 'se perdio con collar verde'),
(33, 12, 'perdida', 'perro', 'lolo', 'naranja', '3', 'macho', 'zonaOeste', 'san y san luis', 0x63616c63756c61646f722e6a7067, '2022-07-08', 'collar verde');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `avisos`
--
ALTER TABLE `avisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idAdministrador` (`idAdministrador`);

--
-- Indexes for table `publicacion`
--
ALTER TABLE `publicacion`
  ADD PRIMARY KEY (`idPublicacion`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `avisos`
--
ALTER TABLE `avisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publicacion`
--
ALTER TABLE `publicacion`
  MODIFY `idPublicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `avisos`
--
ALTER TABLE `avisos`
  ADD CONSTRAINT `avisos_ibfk_1` FOREIGN KEY (`idAdministrador`) REFERENCES `accounts` (`id`);

--
-- Constraints for table `publicacion`
--
ALTER TABLE `publicacion`
  ADD CONSTRAINT `publicacion_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
