-- Stored Procedure 1: Búsqueda de transacciones

USE `proyecto_final_SQL`;
DROP procedure IF EXISTS `alert_check`;

DELIMITER $$
USE `proyecto_final_SQL`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alert_check` (in p_id_centro int, in p_nombre varchar(100), in p_limite_inf int, in p_limite_sup int)
BEGIN
declare name_ varchar(100);
set name_ = lcase(trim(p_nombre));
select *
from transacciones 
where nombre like concat('%',name_,'%')
and monto between p_limite_inf and p_limite_sup
and id_centro = p_id_centro;
END$$

DELIMITER ;

-- Stored Procedure 2: Información de centros por cantidad de miembros/ contactos de confianza

USE `proyecto_final_SQL`;
DROP procedure IF EXISTS `cantidad_por_centro`;

DELIMITER $$
USE `proyecto_final_SQL`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cantidad_por_centro` (in p_tabla varchar(50), in cantidad_a_comparar int, in p_orden varchar(50))
BEGIN
case lcase(trim(p_tabla))
	when 'miembros' then
		if p_orden != '' then
			set @clausula = concat(
			"select centros.id_centro,centros.nombre as nombre_centro, centros.apellido as apellido_centro,
			centros.mail as mail_centro, centros.telefono as tel_centro, count(*) as ", concat('cant_',p_tabla),
			" from centros, ", p_tabla,
			" where centros.id_centro = " ,concat(p_tabla,'.id_centro'),
			" group by centros.id_centro
			having ", concat('cant_',p_tabla) ,">", cantidad_a_comparar,
			" order by ", p_orden);
		else 
			set @clausula = concat(
			"select centros.id_centro,centros.nombre as nombre_centro, centros.apellido as apellido_centro,
			centros.mail as mail_centro, centros.telefono as tel_centro, count(*) as ", concat('cant_',p_tabla),
			" from centros, ", p_tabla,
			" where centros.id_centro = " ,concat(p_tabla,'.id_centro'),
			" group by centros.id_centro
			having ", concat('cant_',p_tabla) ,">", cantidad_a_comparar);
		end if;
        
prepare ejecutar_query from @clausula;
execute ejecutar_query;
deallocate prepare ejecutar_query;   

	when 'contactos_de_confianza' then
		if p_orden != '' then
			set @clausula = concat(
			"select centros.id_centro,centros.nombre as nombre_centro, centros.apellido as apellido_centro,
			centros.mail as mail_centro, centros.telefono as tel_centro, count(*) as ", concat('cant_',p_tabla),
			" from centros, ", p_tabla,
			" where centros.id_centro = " ,concat(p_tabla,'.id_centro'),
			" group by centros.id_centro
			having ", concat('cant_',p_tabla) ,">", cantidad_a_comparar,
			" order by ", p_orden);
		else 
			set @clausula = concat(
			"select centros.id_centro,centros.nombre as nombre_centro, centros.apellido as apellido_centro,
			centros.mail as mail_centro, centros.telefono as tel_centro, count(*) as ", concat('cant_',p_tabla),
			" from centros, ", p_tabla,
			" where centros.id_centro = " ,concat(p_tabla,'.id_centro'),
			" group by centros.id_centro
			having ", concat('cant_',p_tabla) ,">", cantidad_a_comparar);
		end if;

prepare ejecutar_query from @clausula;
execute ejecutar_query;
deallocate prepare ejecutar_query;   
	
else 
        select concat("El criterio es incorrecto: ", p_tabla) as msg_error;  
end case;
END$$

DELIMITER ;







