-- 1) Primera transaccion: eliminacion de registros
start transaction;
select * from centros;
delete from centros where id_centro in (2000,1999,1998);
-- rollback;
commit;
insert into centros(nombre, apellido, mail, telefono)
values ('rosella', 'foster', 'rosellafoster@gmail.com', '5667814158'),
('becky', 'sanders', 'beckysanders@gmail.com', '3541395657'),
( 'nathan', 'foster', 'nathanfoster@gmail.com', '7080401538');


-- 2) Segunda transaccion: insercion de registros
start transaction;
select * from miembros;
-- primera insercion
insert into miembros(id_centro, nombre, apellido, mail, telefono, relacion_centro, items_compartidos)
values (189, 'Susana', 'Gimenez', 'susanagimenez@gmail.com', 1827364567, 'abuela', 0);
-- segunda insercion
insert into miembros(id_centro, nombre, apellido, mail, telefono, relacion_centro, items_compartidos)
values (777, 'Moria', 'Casan', 'moriacasan@gmail.com', 1873364567, 'tia', 5);
-- tercera insercion 
insert into miembros(id_centro, nombre, apellido, mail, telefono, relacion_centro, items_compartidos)
values (1234, 'Dua', 'Lipa', 'dualipa@gmail.com', 1873328367, 'hermana', 5);
savepoint despues_3;
-- cuarta insercion
insert into miembros(id_centro, nombre, apellido, mail, telefono, relacion_centro, items_compartidos)
values (1, 'Daddy', 'Yankee', 'daddyyankee@gmail.com', 3328367821, 'padre', 2);
-- quinta insercion
insert into miembros(id_centro, nombre, apellido, mail, telefono, relacion_centro, items_compartidos)
values (847, 'Chris', 'Martin', 'chrismartin@gmail.com', 3820112456, 'amigo', 3);
savepoint despues_5;
-- release savepoint despues_3;
rollback to savepoint despues_3;
commit;












