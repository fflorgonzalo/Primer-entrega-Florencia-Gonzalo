hola flor

CREATE TABLE `centros` (
  `id_centro` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(45) NOT NULL DEFAULT '50',
  `nombre` varchar(45) NOT NULL DEFAULT '30',
  `apellido` varchar(45) NOT NULL DEFAULT '30',
  `telefono` int NOT NULL DEFAULT '10',
  `id_cuenta` int DEFAULT NULL,
  PRIMARY KEY (`id_centro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `contactos_de_confianza` (
  `id_contacto_confianza` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(45) NOT NULL DEFAULT '50',
  `nombre` varchar(45) NOT NULL DEFAULT '30',
  `apellido` varchar(45) NOT NULL DEFAULT '30',
  `telefono` int NOT NULL DEFAULT '10',
  `relacion_centro` varchar(45) NOT NULL DEFAULT '30',
  `id_centro` int NOT NULL,
  PRIMARY KEY (`id_contacto_confianza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cuentas_bancarias` (
  `id_cuenta` int NOT NULL AUTO_INCREMENT,
  `id_tipo_cuenta` varchar(45) NOT NULL DEFAULT '50',
  PRIMARY KEY (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `instituciones_bancarias` (
  `id_institucion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL DEFAULT '60',
  PRIMARY KEY (`id_institucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `managers` (
  `id_manager` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(45) NOT NULL DEFAULT '50',
  `nombre` varchar(45) NOT NULL DEFAULT '30',
  `apellido` varchar(45) NOT NULL DEFAULT '30',
  `telefono` int NOT NULL DEFAULT '10',
  `id_centro` int NOT NULL,
  PRIMARY KEY (`id_manager`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `MIEMBROS` (
  `id_miembro` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(45) NOT NULL DEFAULT '50',
  `nombre` varchar(45) NOT NULL DEFAULT '30',
  `apellido` varchar(45) NOT NULL DEFAULT '30',
  `telefono` int NOT NULL DEFAULT '10',
  `relacion_centro` varchar(45) NOT NULL DEFAULT '30',
  `items_compartidos` int NOT NULL,
  `id_centro` int NOT NULL,
  PRIMARY KEY (`id_miembro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `tipos_cuenta_bancaria` (
  `id_tipo_cuenta` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL DEFAULT '50',
  PRIMARY KEY (`id_tipo_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `transacciones` (
  `id_centro` int NOT NULL,
  `id_vendedor` int NOT NULL,
  `id_transaccion` int NOT NULL AUTO_INCREMENT,
  `monto` decimal(10,2) NOT NULL,
  `id_cuenta` int NOT NULL,
  PRIMARY KEY (`id_transaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `vendedores` (
  `id_vendedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL DEFAULT '50',
  PRIMARY KEY (`id_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
