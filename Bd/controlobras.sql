-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-08-2026 a las 21:33:30
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
-- Base de datos: `controlobras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activos`
--

CREATE TABLE `activos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `qr_token` char(36) NOT NULL,
  `qr_path` varchar(255) DEFAULT NULL,
  `codigo_qr` varchar(100) NOT NULL,
  `tipo_activo_id` smallint(5) UNSIGNED NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `marca_id` smallint(5) UNSIGNED DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `numero_serie` varchar(100) DEFAULT NULL,
  `proveedor_id` int(10) UNSIGNED DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL,
  `costo_compra` decimal(12,2) DEFAULT NULL,
  `estado_operativo_id` tinyint(3) UNSIGNED NOT NULL,
  `estado_fisico_id` tinyint(3) UNSIGNED NOT NULL,
  `ubicacion_id` int(10) UNSIGNED DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL,
  `motivo_baja` varchar(255) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaciones`
--

CREATE TABLE `asignaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `obra_id` int(10) UNSIGNED NOT NULL,
  `responsable_id` int(10) UNSIGNED NOT NULL,
  `estado_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `fecha_salida` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_programada_regreso` datetime DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `usuario_entrega_id` int(10) UNSIGNED NOT NULL,
  `usuario_cierre_id` int(10) UNSIGNED DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_herramienta`
--

CREATE TABLE `asignacion_herramienta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `asignacion_id` bigint(20) UNSIGNED NOT NULL,
  `activo_id` bigint(20) UNSIGNED NOT NULL,
  `trabajador_id` int(10) UNSIGNED DEFAULT NULL,
  `fecha_entrega` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_devolucion` datetime DEFAULT NULL,
  `estado_fisico_entrega_id` tinyint(3) UNSIGNED NOT NULL,
  `estado_fisico_devolucion_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `observaciones_entrega` text DEFAULT NULL,
  `observaciones_devolucion` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_herramienta`
--

CREATE TABLE `categorias_herramienta` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias_herramienta`
--

INSERT INTO `categorias_herramienta` (`id`, `nombre`, `descripcion`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'Taladros', NULL, 1, '2026-08-05 06:55:28', '2026-08-05 06:55:28'),
(2, 'Rotomartillos', NULL, 1, '2026-08-05 06:55:28', '2026-08-05 06:55:28'),
(3, 'Esmeriles', NULL, 1, '2026-08-05 06:55:28', '2026-08-05 06:55:28'),
(4, 'Pulidoras', NULL, 1, '2026-08-05 06:55:28', '2026-08-05 06:55:28'),
(5, 'Soldadoras', NULL, 1, '2026-08-05 06:55:28', '2026-08-05 06:55:28'),
(6, 'Escaleras', NULL, 1, '2026-08-05 06:55:28', '2026-08-05 06:55:28'),
(7, 'Martillos', NULL, 1, '2026-08-05 06:55:28', '2026-08-05 06:55:28'),
(8, 'Desarmadores', NULL, 1, '2026-08-05 06:55:28', '2026-08-05 06:55:28'),
(9, 'Llaves', NULL, 1, '2026-08-05 06:55:28', '2026-08-05 06:55:28'),
(10, 'Pinzas', NULL, 1, '2026-08-05 06:55:28', '2026-08-05 06:55:28'),
(11, 'Flexómetros', NULL, 1, '2026-08-05 06:55:28', '2026-08-05 06:55:28'),
(12, 'Niveles', NULL, 1, '2026-08-05 06:55:28', '2026-08-05 06:55:28'),
(13, 'Generadores', NULL, 1, '2026-08-05 06:55:28', '2026-08-05 06:55:28'),
(14, 'Compresores', NULL, 1, '2026-08-05 06:55:28', '2026-08-05 06:55:28'),
(15, 'Bombas', NULL, 1, '2026-08-05 06:55:28', '2026-08-05 06:55:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_asignacion`
--

CREATE TABLE `estados_asignacion` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estados_asignacion`
--

INSERT INTO `estados_asignacion` (`id`, `nombre`, `descripcion`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'ABIERTA', 'Asignación actualmente activa', 1, '2026-08-10 19:16:12', '2026-08-10 19:16:12'),
(2, 'CERRADA', 'Asignación finalizada y revisada', 1, '2026-08-10 19:16:12', '2026-08-10 19:16:12'),
(3, 'CANCELADA', 'Asignación cancelada', 1, '2026-08-10 19:16:12', '2026-08-10 19:16:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_fisico_activo`
--

CREATE TABLE `estado_fisico_activo` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estado_fisico_activo`
--

INSERT INTO `estado_fisico_activo` (`id`, `nombre`, `descripcion`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'NUEVO', 'Activo nuevo', 1, '2026-08-10 05:59:03', '2026-08-10 05:59:03'),
(2, 'EXCELENTE', 'Sin daños y en excelentes condiciones', 1, '2026-08-10 05:59:03', '2026-08-10 05:59:03'),
(3, 'BUENO', 'Presenta desgaste normal', 1, '2026-08-10 05:59:03', '2026-08-10 05:59:03'),
(4, 'REGULAR', 'Presenta desgaste considerable', 1, '2026-08-10 05:59:03', '2026-08-10 05:59:03'),
(5, 'DAÑADO', 'Presenta daños', 1, '2026-08-10 05:59:03', '2026-08-10 05:59:03'),
(6, 'IRREPARABLE', 'No puede ser reparado', 1, '2026-08-10 05:59:03', '2026-08-10 05:59:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_operativo_activo`
--

CREATE TABLE `estado_operativo_activo` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estado_operativo_activo`
--

INSERT INTO `estado_operativo_activo` (`id`, `nombre`, `descripcion`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'DISPONIBLE', 'Disponible para asignación', 1, '2026-08-10 05:57:53', '2026-08-10 05:57:53'),
(2, 'ASIGNADO', 'Asignado a una obra', 1, '2026-08-10 05:57:53', '2026-08-10 05:57:53'),
(3, 'PRESTADO', 'Prestado a un trabajador', 1, '2026-08-10 05:57:53', '2026-08-10 05:57:53'),
(4, 'MANTENIMIENTO', 'En mantenimiento', 1, '2026-08-10 05:57:53', '2026-08-10 05:57:53'),
(5, 'EXTRAVIADO', 'No localizado', 1, '2026-08-10 05:57:53', '2026-08-10 05:57:53'),
(6, 'BAJA', 'Activo dado de baja', 1, '2026-08-10 05:57:53', '2026-08-10 05:57:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus_obra`
--

CREATE TABLE `estatus_obra` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estatus_obra`
--

INSERT INTO `estatus_obra` (`id`, `nombre`, `descripcion`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'ACTIVA', 'Obra en ejecución', 1, '2026-08-05 01:58:49', '2026-08-05 01:58:49'),
(2, 'SUSPENDIDA', 'Obra suspendida temporalmente', 1, '2026-08-05 01:58:49', '2026-08-05 01:58:49'),
(3, 'FINALIZADA', 'Obra concluida', 1, '2026-08-05 01:58:49', '2026-08-05 01:58:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramientas`
--

CREATE TABLE `herramientas` (
  `activo_id` bigint(20) UNSIGNED NOT NULL,
  `categoria_id` smallint(5) UNSIGNED NOT NULL,
  `requiere_mantenimiento` tinyint(1) NOT NULL DEFAULT 0,
  `frecuencia_mantenimiento_dias` int(10) UNSIGNED DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencias_activo`
--

CREATE TABLE `incidencias_activo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `activo_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_incidencia_id` tinyint(3) UNSIGNED NOT NULL,
  `obra_id` int(10) UNSIGNED DEFAULT NULL,
  `trabajador_id` int(10) UNSIGNED DEFAULT NULL,
  `asignacion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `fecha_incidencia` datetime NOT NULL DEFAULT current_timestamp(),
  `descripcion` text NOT NULL,
  `costo_estimado` decimal(12,2) DEFAULT NULL,
  `resuelta` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_resolucion` datetime DEFAULT NULL,
  `usuario_registro_id` int(10) UNSIGNED NOT NULL,
  `usuario_resolucion_id` int(10) UNSIGNED DEFAULT NULL,
  `observaciones_resolucion` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`, `descripcion`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'Bosch', NULL, 1, '2026-08-05 06:56:50', '2026-08-05 06:56:50'),
(2, 'Makita', NULL, 1, '2026-08-05 06:56:50', '2026-08-05 06:56:50'),
(3, 'DeWalt', NULL, 1, '2026-08-05 06:56:50', '2026-08-05 06:56:50'),
(4, 'Milwaukee', NULL, 1, '2026-08-05 06:56:50', '2026-08-05 06:56:50'),
(5, 'Truper', NULL, 1, '2026-08-05 06:56:50', '2026-08-05 06:56:50'),
(6, 'Urrea', NULL, 1, '2026-08-05 06:56:50', '2026-08-05 06:56:50'),
(7, 'Stanley', NULL, 1, '2026-08-05 06:56:50', '2026-08-05 06:56:50'),
(8, 'Black & Decker', NULL, 1, '2026-08-05 06:56:50', '2026-08-05 06:56:50'),
(9, 'Hilti', NULL, 1, '2026-08-05 06:56:50', '2026-08-05 06:56:50'),
(10, 'RIDGID', NULL, 1, '2026-08-05 06:56:50', '2026-08-05 06:56:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_activo`
--

CREATE TABLE `movimientos_activo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `activo_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_movimiento_id` tinyint(3) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `obra_id` int(10) UNSIGNED DEFAULT NULL,
  `trabajador_id` int(10) UNSIGNED DEFAULT NULL,
  `ubicacion_origen_id` int(10) UNSIGNED DEFAULT NULL,
  `ubicacion_destino_id` int(10) UNSIGNED DEFAULT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `asignacion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obras`
--

CREATE TABLE `obras` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `cliente` varchar(150) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estatus_id` tinyint(3) UNSIGNED NOT NULL,
  `responsable_id` int(10) UNSIGNED DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos_activo`
--

CREATE TABLE `prestamos_activo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `activo_id` bigint(20) UNSIGNED NOT NULL,
  `trabajador_id` int(10) UNSIGNED NOT NULL,
  `fecha_prestamo` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_limite` datetime DEFAULT NULL,
  `fecha_devolucion` datetime DEFAULT NULL,
  `usuario_prestamo_id` int(10) UNSIGNED NOT NULL,
  `usuario_devolucion_id` int(10) UNSIGNED DEFAULT NULL,
  `estado_fisico_entrega_id` tinyint(3) UNSIGNED NOT NULL,
  `estado_fisico_devolucion_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `observaciones_prestamo` text DEFAULT NULL,
  `observaciones_devolucion` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `contacto` varchar(150) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `correo` varchar(120) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'Acceso total', '2026-08-05 01:29:16', '2026-08-05 01:29:16'),
(2, 'Almacenista', 'Control de inventario', '2026-08-05 01:29:16', '2026-08-05 01:29:16'),
(3, 'Supervisor', 'Control de obras', '2026-08-05 01:29:16', '2026-08-05 01:29:16'),
(4, 'Consulta', 'Solo lectura', '2026-08-05 01:29:16', '2026-08-05 01:29:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_activo`
--

CREATE TABLE `tipos_activo` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_activo`
--

INSERT INTO `tipos_activo` (`id`, `nombre`, `descripcion`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'Herramienta', 'Herramientas utilizadas en las obras', 1, '2026-08-10 05:56:05', '2026-08-10 05:56:05'),
(2, 'Equipo', 'Equipos utilizados en las obras', 1, '2026-08-10 05:56:05', '2026-08-10 05:56:05'),
(3, 'Maquinaria', 'Maquinaria de construcción', 1, '2026-08-10 05:56:05', '2026-08-10 05:56:05'),
(4, 'Vehículo', 'Vehículos de la empresa', 1, '2026-08-10 05:56:05', '2026-08-10 05:56:05'),
(5, 'Equipo de cómputo', 'Computadoras, laptops y periféricos', 1, '2026-08-10 05:56:05', '2026-08-10 05:56:05'),
(6, 'Mobiliario', 'Mobiliario propiedad de la empresa', 1, '2026-08-10 05:56:05', '2026-08-10 05:56:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_incidencia`
--

CREATE TABLE `tipos_incidencia` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_incidencia`
--

INSERT INTO `tipos_incidencia` (`id`, `nombre`, `descripcion`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'FALTANTE', 'Activo que no fue localizado', 1, '2026-08-10 19:19:29', '2026-08-10 19:19:29'),
(2, 'DAÑO', 'Activo que regresó dañado', 1, '2026-08-10 19:19:29', '2026-08-10 19:19:29'),
(3, 'EXTRAVIO', 'Activo reportado como extraviado', 1, '2026-08-10 19:19:29', '2026-08-10 19:19:29'),
(4, 'ROBO', 'Activo reportado como robado', 1, '2026-08-10 19:19:29', '2026-08-10 19:19:29'),
(5, 'PERDIDA', 'Activo perdido', 1, '2026-08-10 19:19:29', '2026-08-10 19:19:29'),
(6, 'OTRO', 'Otro tipo de incidencia', 1, '2026-08-10 19:19:29', '2026-08-10 19:19:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_movimiento_activo`
--

CREATE TABLE `tipos_movimiento_activo` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `afecta_ubicacion` tinyint(1) NOT NULL DEFAULT 0,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_movimiento_activo`
--

INSERT INTO `tipos_movimiento_activo` (`id`, `nombre`, `descripcion`, `afecta_ubicacion`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'ENTRADA', 'Ingreso del activo al inventario', 1, 1, '2026-08-10 19:07:46', '2026-08-10 19:07:46'),
(2, 'SALIDA_OBRA', 'Salida del activo hacia una obra', 1, 1, '2026-08-10 19:07:46', '2026-08-10 19:07:46'),
(3, 'ASIGNACION', 'Asignación del activo a un trabajador', 0, 1, '2026-08-10 19:07:46', '2026-08-10 19:07:46'),
(4, 'DEVOLUCION_OBRA', 'Regreso del activo desde una obra', 1, 1, '2026-08-10 19:07:46', '2026-08-10 19:07:46'),
(5, 'PRESTAMO', 'Préstamo del activo a un trabajador', 0, 1, '2026-08-10 19:07:46', '2026-08-10 19:07:46'),
(6, 'DEVOLUCION_PRESTAMO', 'Devolución de un préstamo personal', 0, 1, '2026-08-10 19:07:46', '2026-08-10 19:07:46'),
(7, 'TRASLADO', 'Traslado del activo a otra ubicación', 1, 1, '2026-08-10 19:07:46', '2026-08-10 19:07:46'),
(8, 'MANTENIMIENTO', 'Ingreso del activo a mantenimiento', 1, 1, '2026-08-10 19:07:46', '2026-08-10 19:07:46'),
(9, 'EXTRAVIO', 'Activo reportado como extraviado', 0, 1, '2026-08-10 19:07:46', '2026-08-10 19:07:46'),
(10, 'RECUPERACION', 'Activo extraviado que fue recuperado', 1, 1, '2026-08-10 19:07:46', '2026-08-10 19:07:46'),
(11, 'BAJA', 'Activo retirado definitivamente', 0, 1, '2026-08-10 19:07:46', '2026-08-10 19:07:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `id` int(10) UNSIGNED NOT NULL,
  `numero_empleado` varchar(20) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido_paterno` varchar(80) DEFAULT NULL,
  `apellido_materno` varchar(80) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `observaciones` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicaciones`
--

CREATE TABLE `ubicaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ubicaciones`
--

INSERT INTO `ubicaciones` (`id`, `nombre`, `descripcion`, `tipo`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'Almacén Central', 'Almacén principal de herramientas', 'ALMACEN', 1, '2026-08-10 06:07:11', '2026-08-10 06:07:11'),
(2, 'Bodega Norte', 'Bodega secundaria', 'BODEGA', 1, '2026-08-10 06:07:11', '2026-08-10 06:07:11'),
(3, 'Taller', 'Área de mantenimiento', 'TALLER', 1, '2026-08-10 06:07:11', '2026-08-10 06:07:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `rol_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido_paterno` varchar(80) DEFAULT NULL,
  `apellido_materno` varchar(80) DEFAULT NULL,
  `usuario` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `correo` varchar(120) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `ultimo_acceso` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `activo_id` bigint(20) UNSIGNED NOT NULL,
  `placas` varchar(20) NOT NULL,
  `numero_economico` varchar(30) DEFAULT NULL,
  `tipo_vehiculo` varchar(50) DEFAULT NULL,
  `marca` varchar(80) DEFAULT NULL,
  `modelo` varchar(80) DEFAULT NULL,
  `anio` smallint(5) UNSIGNED DEFAULT NULL,
  `kilometraje` int(10) UNSIGNED DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activos`
--
ALTER TABLE `activos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_activo_codigo` (`codigo`),
  ADD UNIQUE KEY `uq_activo_codigo_qr` (`codigo_qr`),
  ADD UNIQUE KEY `uq_activo_qr_token` (`qr_token`),
  ADD UNIQUE KEY `uq_activo_numero_serie` (`numero_serie`),
  ADD KEY `fk_activo_tipo` (`tipo_activo_id`),
  ADD KEY `fk_activo_marca` (`marca_id`),
  ADD KEY `fk_activo_proveedor` (`proveedor_id`),
  ADD KEY `fk_activo_estado_operativo` (`estado_operativo_id`),
  ADD KEY `fk_activo_estado_fisico` (`estado_fisico_id`),
  ADD KEY `fk_activo_ubicacion` (`ubicacion_id`);

--
-- Indices de la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_asignacion_obra` (`obra_id`),
  ADD KEY `fk_asignacion_responsable` (`responsable_id`),
  ADD KEY `fk_asignacion_usuario_entrega` (`usuario_entrega_id`),
  ADD KEY `fk_asignacion_usuario_cierre` (`usuario_cierre_id`),
  ADD KEY `fk_asignacion_estado` (`estado_id`);

--
-- Indices de la tabla `asignacion_herramienta`
--
ALTER TABLE `asignacion_herramienta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_asig_herr_asignacion` (`asignacion_id`),
  ADD KEY `fk_asig_herr_activo` (`activo_id`),
  ADD KEY `fk_asig_herr_trabajador` (`trabajador_id`),
  ADD KEY `fk_asig_herr_estado_entrega` (`estado_fisico_entrega_id`),
  ADD KEY `fk_asig_herr_estado_devolucion` (`estado_fisico_devolucion_id`);

--
-- Indices de la tabla `categorias_herramienta`
--
ALTER TABLE `categorias_herramienta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_categoria_herramienta` (`nombre`);

--
-- Indices de la tabla `estados_asignacion`
--
ALTER TABLE `estados_asignacion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_estado_asignacion` (`nombre`);

--
-- Indices de la tabla `estado_fisico_activo`
--
ALTER TABLE `estado_fisico_activo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_estado_fisico_activo` (`nombre`);

--
-- Indices de la tabla `estado_operativo_activo`
--
ALTER TABLE `estado_operativo_activo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_estado_operativo_activo` (`nombre`);

--
-- Indices de la tabla `estatus_obra`
--
ALTER TABLE `estatus_obra`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_estatus_obra` (`nombre`);

--
-- Indices de la tabla `herramientas`
--
ALTER TABLE `herramientas`
  ADD PRIMARY KEY (`activo_id`),
  ADD KEY `fk_herramienta_categoria` (`categoria_id`);

--
-- Indices de la tabla `incidencias_activo`
--
ALTER TABLE `incidencias_activo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_incidencia_activo` (`activo_id`),
  ADD KEY `fk_incidencia_tipo` (`tipo_incidencia_id`),
  ADD KEY `fk_incidencia_obra` (`obra_id`),
  ADD KEY `fk_incidencia_trabajador` (`trabajador_id`),
  ADD KEY `fk_incidencia_asignacion` (`asignacion_id`),
  ADD KEY `fk_incidencia_usuario_registro` (`usuario_registro_id`),
  ADD KEY `fk_incidencia_usuario_resolucion` (`usuario_resolucion_id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_marca` (`nombre`);

--
-- Indices de la tabla `movimientos_activo`
--
ALTER TABLE `movimientos_activo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mov_ubicacion_origen` (`ubicacion_origen_id`),
  ADD KEY `fk_mov_ubicacion_destino` (`ubicacion_destino_id`),
  ADD KEY `fk_mov_usuario` (`usuario_id`),
  ADD KEY `idx_mov_activo_fecha` (`activo_id`,`fecha`),
  ADD KEY `idx_mov_obra` (`obra_id`),
  ADD KEY `idx_mov_trabajador` (`trabajador_id`),
  ADD KEY `idx_mov_tipo` (`tipo_movimiento_id`),
  ADD KEY `idx_mov_asignacion` (`asignacion_id`);

--
-- Indices de la tabla `obras`
--
ALTER TABLE `obras`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_codigo_obra` (`codigo`),
  ADD KEY `fk_obra_estatus` (`estatus_id`),
  ADD KEY `fk_obra_responsable` (`responsable_id`);

--
-- Indices de la tabla `prestamos_activo`
--
ALTER TABLE `prestamos_activo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_prestamo_activo` (`activo_id`),
  ADD KEY `fk_prestamo_trabajador` (`trabajador_id`),
  ADD KEY `fk_prestamo_usuario` (`usuario_prestamo_id`),
  ADD KEY `fk_prestamo_usuario_devolucion` (`usuario_devolucion_id`),
  ADD KEY `fk_prestamo_estado_entrega` (`estado_fisico_entrega_id`),
  ADD KEY `fk_prestamo_estado_devolucion` (`estado_fisico_devolucion_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_proveedor` (`nombre`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_roles_nombre` (`nombre`);

--
-- Indices de la tabla `tipos_activo`
--
ALTER TABLE `tipos_activo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_tipo_activo_nombre` (`nombre`);

--
-- Indices de la tabla `tipos_incidencia`
--
ALTER TABLE `tipos_incidencia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_tipo_incidencia` (`nombre`);

--
-- Indices de la tabla `tipos_movimiento_activo`
--
ALTER TABLE `tipos_movimiento_activo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_tipo_movimiento_activo` (`nombre`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_numero_empleado` (`numero_empleado`);

--
-- Indices de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_ubicacion_nombre` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_usuario` (`usuario`),
  ADD UNIQUE KEY `uq_correo` (`correo`),
  ADD KEY `idx_usuario_nombre` (`nombre`),
  ADD KEY `idx_usuario_rol` (`rol_id`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`activo_id`),
  ADD UNIQUE KEY `uq_vehiculo_placas` (`placas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activos`
--
ALTER TABLE `activos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asignacion_herramienta`
--
ALTER TABLE `asignacion_herramienta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias_herramienta`
--
ALTER TABLE `categorias_herramienta`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `estados_asignacion`
--
ALTER TABLE `estados_asignacion`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado_fisico_activo`
--
ALTER TABLE `estado_fisico_activo`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `estado_operativo_activo`
--
ALTER TABLE `estado_operativo_activo`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `estatus_obra`
--
ALTER TABLE `estatus_obra`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `incidencias_activo`
--
ALTER TABLE `incidencias_activo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `movimientos_activo`
--
ALTER TABLE `movimientos_activo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `obras`
--
ALTER TABLE `obras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prestamos_activo`
--
ALTER TABLE `prestamos_activo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipos_activo`
--
ALTER TABLE `tipos_activo`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipos_incidencia`
--
ALTER TABLE `tipos_incidencia`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipos_movimiento_activo`
--
ALTER TABLE `tipos_movimiento_activo`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `activos`
--
ALTER TABLE `activos`
  ADD CONSTRAINT `fk_activo_estado_fisico` FOREIGN KEY (`estado_fisico_id`) REFERENCES `estado_fisico_activo` (`id`),
  ADD CONSTRAINT `fk_activo_estado_operativo` FOREIGN KEY (`estado_operativo_id`) REFERENCES `estado_operativo_activo` (`id`),
  ADD CONSTRAINT `fk_activo_marca` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_activo_proveedor` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_activo_tipo` FOREIGN KEY (`tipo_activo_id`) REFERENCES `tipos_activo` (`id`),
  ADD CONSTRAINT `fk_activo_ubicacion` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicaciones` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  ADD CONSTRAINT `fk_asignacion_estado` FOREIGN KEY (`estado_id`) REFERENCES `estados_asignacion` (`id`),
  ADD CONSTRAINT `fk_asignacion_obra` FOREIGN KEY (`obra_id`) REFERENCES `obras` (`id`),
  ADD CONSTRAINT `fk_asignacion_responsable` FOREIGN KEY (`responsable_id`) REFERENCES `trabajadores` (`id`),
  ADD CONSTRAINT `fk_asignacion_usuario_cierre` FOREIGN KEY (`usuario_cierre_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `fk_asignacion_usuario_entrega` FOREIGN KEY (`usuario_entrega_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `asignacion_herramienta`
--
ALTER TABLE `asignacion_herramienta`
  ADD CONSTRAINT `fk_asig_herr_activo` FOREIGN KEY (`activo_id`) REFERENCES `activos` (`id`),
  ADD CONSTRAINT `fk_asig_herr_asignacion` FOREIGN KEY (`asignacion_id`) REFERENCES `asignaciones` (`id`),
  ADD CONSTRAINT `fk_asig_herr_estado_devolucion` FOREIGN KEY (`estado_fisico_devolucion_id`) REFERENCES `estado_fisico_activo` (`id`),
  ADD CONSTRAINT `fk_asig_herr_estado_entrega` FOREIGN KEY (`estado_fisico_entrega_id`) REFERENCES `estado_fisico_activo` (`id`),
  ADD CONSTRAINT `fk_asig_herr_trabajador` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`);

--
-- Filtros para la tabla `herramientas`
--
ALTER TABLE `herramientas`
  ADD CONSTRAINT `fk_herramienta_activo` FOREIGN KEY (`activo_id`) REFERENCES `activos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_herramienta_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias_herramienta` (`id`);

--
-- Filtros para la tabla `incidencias_activo`
--
ALTER TABLE `incidencias_activo`
  ADD CONSTRAINT `fk_incidencia_activo` FOREIGN KEY (`activo_id`) REFERENCES `activos` (`id`),
  ADD CONSTRAINT `fk_incidencia_asignacion` FOREIGN KEY (`asignacion_id`) REFERENCES `asignaciones` (`id`),
  ADD CONSTRAINT `fk_incidencia_obra` FOREIGN KEY (`obra_id`) REFERENCES `obras` (`id`),
  ADD CONSTRAINT `fk_incidencia_tipo` FOREIGN KEY (`tipo_incidencia_id`) REFERENCES `tipos_incidencia` (`id`),
  ADD CONSTRAINT `fk_incidencia_trabajador` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`),
  ADD CONSTRAINT `fk_incidencia_usuario_registro` FOREIGN KEY (`usuario_registro_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `fk_incidencia_usuario_resolucion` FOREIGN KEY (`usuario_resolucion_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `movimientos_activo`
--
ALTER TABLE `movimientos_activo`
  ADD CONSTRAINT `fk_mov_activo` FOREIGN KEY (`activo_id`) REFERENCES `activos` (`id`),
  ADD CONSTRAINT `fk_mov_asignacion` FOREIGN KEY (`asignacion_id`) REFERENCES `asignaciones` (`id`),
  ADD CONSTRAINT `fk_mov_obra` FOREIGN KEY (`obra_id`) REFERENCES `obras` (`id`),
  ADD CONSTRAINT `fk_mov_tipo` FOREIGN KEY (`tipo_movimiento_id`) REFERENCES `tipos_movimiento_activo` (`id`),
  ADD CONSTRAINT `fk_mov_trabajador` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`),
  ADD CONSTRAINT `fk_mov_ubicacion_destino` FOREIGN KEY (`ubicacion_destino_id`) REFERENCES `ubicaciones` (`id`),
  ADD CONSTRAINT `fk_mov_ubicacion_origen` FOREIGN KEY (`ubicacion_origen_id`) REFERENCES `ubicaciones` (`id`),
  ADD CONSTRAINT `fk_mov_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `obras`
--
ALTER TABLE `obras`
  ADD CONSTRAINT `fk_obra_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `estatus_obra` (`id`),
  ADD CONSTRAINT `fk_obra_responsable` FOREIGN KEY (`responsable_id`) REFERENCES `trabajadores` (`id`);

--
-- Filtros para la tabla `prestamos_activo`
--
ALTER TABLE `prestamos_activo`
  ADD CONSTRAINT `fk_prestamo_activo` FOREIGN KEY (`activo_id`) REFERENCES `activos` (`id`),
  ADD CONSTRAINT `fk_prestamo_estado_devolucion` FOREIGN KEY (`estado_fisico_devolucion_id`) REFERENCES `estado_fisico_activo` (`id`),
  ADD CONSTRAINT `fk_prestamo_estado_entrega` FOREIGN KEY (`estado_fisico_entrega_id`) REFERENCES `estado_fisico_activo` (`id`),
  ADD CONSTRAINT `fk_prestamo_trabajador` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajadores` (`id`),
  ADD CONSTRAINT `fk_prestamo_usuario` FOREIGN KEY (`usuario_prestamo_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `fk_prestamo_usuario_devolucion` FOREIGN KEY (`usuario_devolucion_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `fk_vehiculo_activo` FOREIGN KEY (`activo_id`) REFERENCES `activos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
