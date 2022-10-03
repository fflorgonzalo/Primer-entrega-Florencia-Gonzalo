
-- La siguiente sentencia crea el usuario michael_carefull con la contraseña 'password1'
create user 'michael_carefull'@'localhost' identified by 'password1';

-- La siguiente sentencia crea el usuario sebastian_carefull con la contraseña 'password2'
create user 'sebastian_carefull'@'localhost' identified by 'password2';


-- La siguiente sentencia le otorga permisos de lectura al usuario michael_carefull
grant select on *.* to 'michael_carefull'@'localhost';

-- La siguiente sentencia le otorga permisos de lectura, inserción y modificación al usuario sebastian_carefull
grant select, insert, update on *.* to 'sebastian_carefull'@'localhost';

-- Verifico los permisos otorgados 
use mysql;
select * from user;
show grants for 'michael_carefull'@'localhost';
show grants for 'sebastian_carefull'@'localhost';