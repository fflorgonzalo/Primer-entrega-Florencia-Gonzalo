
drop trigger if exists `proyecto_final_SQL`.`centros_insert_after`;

DELIMITER $$
use `proyecto_final_SQL` $$
CREATE definer = current_user  TRIGGER `proyecto_final_SQL`.`centros_insert_after`
after insert ON `centros`
FOR EACH ROW
BEGIN
  insert into auditoria (tabla, descripcion, usuario, fecha, accion)
  values ('centros', 'alta usuario', user(), now(), concat('Nuevo usuario registrado: ', new.id_centro,' ', new.nombre, ' ', new.apellido));
END$$
DELIMITER ;


drop trigger if exists `proyecto_final_SQL`.`centros_delete_before`;

DELIMITER $$
use `proyecto_final_SQL` $$
CREATE definer = current_user  TRIGGER `proyecto_final_SQL`.`centros_delete_before`
before delete ON `centros`
FOR EACH ROW
BEGIN
  insert into auditoria (tabla, descripcion, usuario, fecha, accion)
  values ('centros', 'baja usuario', user(), now(), concat('Usuario dado de baja: ', old.id_centro,' ', old.nombre, ' ', old.apellido ));
END$$
DELIMITER ;






