delimiter $$

CREATE TABLE `citas` (
  `citas_id` int(11) NOT NULL AUTO_INCREMENT,
  `paciente_id` int(11) NOT NULL,
  `nota_venta_id` int(11) NOT NULL,
  `enfermera_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `consulta` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `observaciones` blob,
  PRIMARY KEY (`citas_id`),
  KEY `fk_historial_citas_enfermeras_idx` (`enfermera_id`),
  KEY `fk_historial_citas_paciente1_idx` (`paciente_id`),
  KEY `fk_Citas_nota_venta1_idx` (`nota_venta_id`),
  CONSTRAINT `fk_Citas_nota_venta1` FOREIGN KEY (`nota_venta_id`) REFERENCES `nota_venta` (`nota_venta_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_historial_citas_enfermeras` FOREIGN KEY (`enfermera_id`) REFERENCES `enfermera` (`enfermera_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_historial_citas_paciente1` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`paciente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `citas_has_tratamiento` (
  `citas_id` int(11) NOT NULL,
  `tratamiento_id` int(11) NOT NULL,
  PRIMARY KEY (`citas_id`,`tratamiento_id`),
  KEY `fk_Citas_has_tratamiento_tratamiento1_idx` (`tratamiento_id`),
  KEY `fk_Citas_has_tratamiento_Citas1_idx` (`citas_id`),
  CONSTRAINT `fk_Citas_has_tratamiento_Citas1` FOREIGN KEY (`citas_id`) REFERENCES `citas` (`citas_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_has_tratamiento_tratamiento1` FOREIGN KEY (`tratamiento_id`) REFERENCES `tratamiento` (`tratamiento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `consulta` (
  `consulta_id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_doctor_id` int(11) NOT NULL,
  `consulta_nombre` varchar(45) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`consulta_id`),
  KEY `fk_consulta_doctor1_idx` (`doctor_doctor_id`),
  CONSTRAINT `fk_consulta_doctor1` FOREIGN KEY (`doctor_doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_nombre` varchar(45) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `enfermera` (
  `enfermera_id` int(11) NOT NULL AUTO_INCREMENT,
  `enfermera_nombre` varchar(45) DEFAULT NULL,
  `activa` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`enfermera_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `exclusiones` (
  `exclusion_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `pantalla_id` int(11) NOT NULL,
  PRIMARY KEY (`exclusion_id`),
  KEY `fk_excusiones_role1_idx` (`role_id`),
  KEY `fk_exclusiones_Pantallas1_idx` (`pantalla_id`),
  CONSTRAINT `fk_exclusiones_Pantallas1` FOREIGN KEY (`pantalla_id`) REFERENCES `pantallas` (`pantalla_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_excusiones_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `gasto` (
  `gasto_id` int(11) NOT NULL AUTO_INCREMENT,
  `concepto_gasto` varchar(45) DEFAULT NULL,
  `total_gasto` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`gasto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `gasto_diario` (
  `gasto_diario_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `gasto_id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`gasto_diario_id`),
  KEY `fk_gasto_diario_gasto1_idx` (`gasto_id`),
  KEY `fk_gasto_diario_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_gasto_diario_gasto1` FOREIGN KEY (`gasto_id`) REFERENCES `gasto` (`gasto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_gasto_diario_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `ingreso` (
  `ingreso_id` int(11) NOT NULL AUTO_INCREMENT,
  `ingreso_nombre` varchar(45) DEFAULT NULL,
  `total_ingreso` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ingreso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `ingreso_diario` (
  `ingreso_diario_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `ingreso_id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`ingreso_diario_id`),
  KEY `fk_ingreso_diario_ingreso1_idx` (`ingreso_id`),
  KEY `fk_ingreso_diario_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_ingreso_diario_ingreso1` FOREIGN KEY (`ingreso_id`) REFERENCES `ingreso` (`ingreso_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingreso_diario_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `medicamento` (
  `medicamento_id` int(11) NOT NULL AUTO_INCREMENT,
  `medicamento_nombre` varchar(45) DEFAULT NULL,
  `laboratorio` varchar(45) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`medicamento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `nota_evolucion` (
  `nota_evolucion_id` int(11) NOT NULL AUTO_INCREMENT,
  `reporte_medico_id` int(11) NOT NULL,
  `nota_evolucion` blob,
  PRIMARY KEY (`nota_evolucion_id`),
  KEY `fk_nota_evolucion_reporte_medico1_idx` (`reporte_medico_id`),
  CONSTRAINT `fk_nota_evolucion_reporte_medico1` FOREIGN KEY (`reporte_medico_id`) REFERENCES `reporte_medico` (`reporte_medico_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `nota_venta` (
  `nota_venta_id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `pagada` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`nota_venta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `paciente` (
  `paciente_id` int(11) NOT NULL AUTO_INCREMENT,
  `curp` varchar(45) DEFAULT NULL,
  `rfc` varchar(45) DEFAULT NULL,
  `paciente_nombre` varchar(45) DEFAULT NULL,
  `paciente_apellido_pat` varchar(45) DEFAULT NULL,
  `paciente_apellido_mat` varchar(45) DEFAULT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `colonia` varchar(45) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `telefono_casa` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `ocupacion` varchar(45) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `reporte_medico_id` int(11) NOT NULL,
  PRIMARY KEY (`paciente_id`),
  KEY `fk_paciente_reporte_medico1_idx` (`reporte_medico_id`),
  CONSTRAINT `fk_paciente_reporte_medico1` FOREIGN KEY (`reporte_medico_id`) REFERENCES `reporte_medico` (`reporte_medico_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `pantallas` (
  `pantalla_id` int(11) NOT NULL AUTO_INCREMENT,
  `pantalla_nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pantalla_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `reporte_medico` (
  `reporte_medico_id` int(11) NOT NULL AUTO_INCREMENT,
  `padecimiento_actual` blob,
  `exploracion_fisica` blob,
  `laboratorio_gabinete` blob,
  `tratamientos_previos` blob,
  `diagnostico` blob,
  `cicatrices` varchar(45) DEFAULT NULL,
  `TA` varchar(3) DEFAULT NULL,
  `RESP` varchar(3) DEFAULT NULL,
  `pulso` varchar(3) DEFAULT NULL,
  `TEM` varchar(3) DEFAULT NULL,
  `SAO2` varchar(3) DEFAULT NULL,
  `peso` varchar(3) DEFAULT NULL,
  `grupo_sanguineo` varchar(3) DEFAULT NULL,
  `vacunacion` varchar(3) DEFAULT NULL,
  `tabaquismo` tinyint(1) DEFAULT NULL,
  `alcoholismo` tinyint(1) DEFAULT NULL,
  `act_desc` varchar(3) DEFAULT NULL,
  `act_dep` varchar(3) DEFAULT NULL,
  `ant_fam_cancer` tinyint(1) DEFAULT NULL,
  `ant_fam_cardio` tinyint(1) DEFAULT NULL,
  `ant_fam_diabetes` tinyint(1) DEFAULT NULL,
  `ant_fam_obesidad` tinyint(1) DEFAULT NULL,
  `ant_fam_epilepsia` tinyint(1) DEFAULT NULL,
  `ant_fam_inmunologicas` tinyint(1) DEFAULT NULL,
  `ant_fam_crisis_convulsivas` tinyint(1) DEFAULT NULL,
  `ant_fam_hipertension_arterial` tinyint(1) DEFAULT NULL,
  `ant_fam_endocripatias` tinyint(1) DEFAULT NULL,
  `ant_fam_hemopatias` tinyint(1) DEFAULT NULL,
  `ant_fam_neuropatia` tinyint(1) DEFAULT NULL,
  `ant_fam_nefropatias` tinyint(1) DEFAULT NULL,
  `ant_fam_fracturas` tinyint(1) DEFAULT NULL,
  `ant_fam_enferm_mentales` tinyint(1) DEFAULT NULL,
  `ant_fam_psiquiatricas` tinyint(1) DEFAULT NULL,
  `ant_fam_enferm_exantemat` tinyint(1) DEFAULT NULL,
  `ant_fam_neumopatias` tinyint(1) DEFAULT NULL,
  `ant_fam_transfusionales` tinyint(1) DEFAULT NULL,
  `ant_fam_hospitalizaciones` tinyint(1) DEFAULT NULL,
  `ant_fam_cirugias` tinyint(1) DEFAULT NULL,
  `ant_fam_otros` varchar(45) DEFAULT NULL,
  `ant_pers_cancer` tinyint(1) DEFAULT NULL,
  `ant_pers_cardio` tinyint(1) DEFAULT NULL,
  `ant_pers_diabetes` tinyint(1) DEFAULT NULL,
  `ant_pers_obesidad` tinyint(1) DEFAULT NULL,
  `ant_pers_quirurgicos` tinyint(1) DEFAULT NULL,
  `ant_pers_inmunologicas` tinyint(1) DEFAULT NULL,
  `ant_pers_alergias` tinyint(1) DEFAULT NULL,
  `ant_pers_crisis_convulsivas` tinyint(1) DEFAULT NULL,
  `ant_pers_hipertension_arterial` tinyint(1) DEFAULT NULL,
  `ant_pers_endocripatias` tinyint(1) DEFAULT NULL,
  `ant_pers_hemopatias` tinyint(1) DEFAULT NULL,
  `ant_pers_neuropatias` tinyint(1) DEFAULT NULL,
  `ant_pers_nefropatias` tinyint(1) DEFAULT NULL,
  `ant_pers_fracturas` tinyint(1) DEFAULT NULL,
  `ant_pers_enferm_mentales` tinyint(1) DEFAULT NULL,
  `ant_pers_psiquiatricas` tinyint(1) DEFAULT NULL,
  `ant_pers_enferm_exantemat` tinyint(1) DEFAULT NULL,
  `ant_pers_neumopatias` tinyint(1) DEFAULT NULL,
  `ant_pers_transfusionales` tinyint(1) DEFAULT NULL,
  `ant_pers_hospitalizaciones` tinyint(1) DEFAULT NULL,
  `ant_pers_cirugias` tinyint(1) DEFAULT NULL,
  `ant_pers_otros` varchar(45) DEFAULT NULL,
  `inter_apar_sist_linfatico` tinyint(1) DEFAULT NULL,
  `inter_apar_sist_cardio` tinyint(1) DEFAULT NULL,
  `inter_apar_sist_musc_esquel` tinyint(1) DEFAULT NULL,
  `inter_apar_sist_digestivo` tinyint(1) DEFAULT NULL,
  `inter_apar_sist_urinario` tinyint(1) DEFAULT NULL,
  `inter_apar_sist_nervioso` tinyint(1) DEFAULT NULL,
  `inter_apar_sist_dermatologico` tinyint(1) DEFAULT NULL,
  `inter_apar_sist_inmunologico` tinyint(1) DEFAULT NULL,
  `inter_apar_sist_respiratorio` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`reporte_medico_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `tratamiento` (
  `tratamiento_id` int(11) NOT NULL AUTO_INCREMENT,
  `tratamiento_nombre` varchar(45) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL COMMENT 'tatam',
  PRIMARY KEY (`tratamiento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_nombre` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`usuario_id`),
  KEY `fk_usuario_role1_idx` (`role_id`),
  CONSTRAINT `fk_usuario_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8$$


delimiter $$

CREATE TABLE `venta_diaria` (
  `venta_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `medicamento_id` int(11) NOT NULL,
  `tratamiento_id` int(11) NOT NULL,
  `nota_venta_id` int(11) NOT NULL,
  `consulta_id` int(11) NOT NULL,
  `descuento` int(11) DEFAULT NULL,
  `vale` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `pago_tarjeta` decimal(10,0) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`venta_id`),
  KEY `fk_ventas_diarias_medicamento1_idx` (`medicamento_id`),
  KEY `fk_ventas_diarias_tratamiento1_idx` (`tratamiento_id`),
  KEY `fk_venta_diaria_usuario1_idx` (`usuario_id`),
  KEY `fk_venta_diaria_nota_venta1_idx` (`nota_venta_id`),
  KEY `fk_venta_diaria_consulta1_idx` (`consulta_id`),
  CONSTRAINT `fk_ventas_diarias_medicamento1` FOREIGN KEY (`medicamento_id`) REFERENCES `medicamento` (`medicamento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_diarias_tratamiento1` FOREIGN KEY (`tratamiento_id`) REFERENCES `tratamiento` (`tratamiento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_diaria_consulta1` FOREIGN KEY (`consulta_id`) REFERENCES `consulta` (`consulta_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_diaria_nota_venta1` FOREIGN KEY (`nota_venta_id`) REFERENCES `nota_venta` (`nota_venta_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_diaria_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8$$


SELECT * FROM sanantialdb.paciente;