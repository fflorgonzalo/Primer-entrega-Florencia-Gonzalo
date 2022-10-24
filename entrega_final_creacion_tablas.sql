CREATE TABLE `auditoria` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `tabla` varchar(45) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `usuario` varchar(60) NOT NULL,
  `fecha` datetime NOT NULL,
  `accion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `centros` (
  `id_centro` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `telefono` bigint NOT NULL,
  PRIMARY KEY (`id_centro`)
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE `contactos_de_confianza` (
  `id_contacto_confianza` int NOT NULL AUTO_INCREMENT,
  `id_centro` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `telefono` bigint NOT NULL,
  `relacion_centro` varchar(30) NOT NULL,
  PRIMARY KEY (`id_contacto_confianza`),
  KEY `id_centro` (`id_centro`),
  CONSTRAINT `contactos_de_confianza_ibfk_1` FOREIGN KEY (`id_centro`) REFERENCES `centros` (`id_centro`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `cuentas_bancarias` (
  `id_cuenta` int NOT NULL AUTO_INCREMENT,
  `id_centro` int NOT NULL,
  `id_institucion` int NOT NULL,
  `id_tipo_cuenta` int NOT NULL,
  PRIMARY KEY (`id_cuenta`),
  KEY `id_centro` (`id_centro`),
  KEY `id_institucion` (`id_institucion`),
  KEY `id_tipo_cuenta` (`id_tipo_cuenta`),
  CONSTRAINT `cuentas_bancarias_ibfk_1` FOREIGN KEY (`id_centro`) REFERENCES `centros` (`id_centro`),
  CONSTRAINT `cuentas_bancarias_ibfk_2` FOREIGN KEY (`id_institucion`) REFERENCES `instituciones_bancarias` (`id_institucion`),
  CONSTRAINT `cuentas_bancarias_ibfk_3` FOREIGN KEY (`id_tipo_cuenta`) REFERENCES `tipos_cuentas_bancarias` (`id_tipo_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=4001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `instituciones_bancarias` (
  `id_institucion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_institucion`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `managers` (
  `id_manager` int NOT NULL AUTO_INCREMENT,
  `id_centro` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `telefono` bigint NOT NULL,
  PRIMARY KEY (`id_manager`),
  KEY `id_centro` (`id_centro`),
  CONSTRAINT `managers_ibfk_1` FOREIGN KEY (`id_centro`) REFERENCES `centros` (`id_centro`)
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


    
CREATE TABLE `miembros` (
  `id_miembro` int NOT NULL AUTO_INCREMENT,
  `id_centro` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `telefono` bigint NOT NULL,
  `relacion_centro` varchar(30) NOT NULL,
  `items_compartidos` int NOT NULL,
  PRIMARY KEY (`id_miembro`),
  KEY `id_centro` (`id_centro`),
  CONSTRAINT `miembros_ibfk_1` FOREIGN KEY (`id_centro`) REFERENCES `centros` (`id_centro`)
) ENGINE=InnoDB AUTO_INCREMENT=4001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
    
    

CREATE TABLE `tipos_cuentas_bancarias` (
  `id_tipo_cuenta` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `transacciones` (
  `id_transaccion` int NOT NULL AUTO_INCREMENT,
  `id_centro` int NOT NULL,
  `id_vendedor` int NOT NULL,
  `id_cuenta` int NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `nombre` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_transaccion`),
  KEY `id_centro` (`id_centro`),
  KEY `id_vendedor` (`id_vendedor`),
  KEY `id_cuenta` (`id_cuenta`),
  CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`id_centro`) REFERENCES `centros` (`id_centro`),
  CONSTRAINT `transacciones_ibfk_2` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`),
  CONSTRAINT `transacciones_ibfk_3` FOREIGN KEY (`id_cuenta`) REFERENCES `cuentas_bancarias` (`id_cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=956 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `vendedores` (
  `id_vendedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
