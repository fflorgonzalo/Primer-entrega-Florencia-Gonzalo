-- Cantidad de miembros por centro
create view cantidad_miembros_por_centro as 
select  centros.id_centro,centros.mail, count(*) as cantidad_miembros
from miembros, centros
where centros.id_centro = miembros.id_centro
group by centros.id_centro
order by centros.id_centro;


-- Balances actuales de los centros
create view balances_actuales as 
select centros.id_centro, centros.nombre, centros.apellido, sum(transacciones.monto) as balance_actual
from centros, transacciones
where centros.id_centro = transacciones.id_centro
group by centros.id_centro
order by balance_actual;


-- Vendedores ordenados por cantidad de transacciones (los mas populares)
create view vendedores_mas_populares as 
select vendedores.nombre, count(*) as cantidad_transacciones
from vendedores, transacciones
where vendedores.id_vendedor = transacciones.id_vendedor
group by vendedores.id_vendedor
order by cantidad_transacciones desc;


-- Cuentas bancarias y todos sus datos, por centro 
create view datos_cuentas_bancarias as
select centros.id_centro, centros.nombre, centros.apellido, cuentas_bancarias.id_cuenta, instituciones_bancarias.nombre as institucion_bancaria, tipos_cuentas_bancarias.nombre as tipo_de_cuenta
from centros, cuentas_bancarias, instituciones_bancarias, tipos_cuentas_bancarias
where centros.id_centro = cuentas_bancarias.id_centro
and cuentas_bancarias.id_institucion = instituciones_bancarias.id_institucion
and  cuentas_bancarias.id_tipo_cuenta = tipos_cuentas_bancarias.id_tipo_cuenta 
order by centros.id_centro;


-- Lista de contacto con los caregivers y centros
create view centros_caregivers_datos_de_contacto as
select centros.nombre as nombre_centro, centros.apellido as apellido_centro, centros.mail as mail_centro, centros.telefono as telefono_centro, managers.nombre as nombre_manager, managers.apellido as apellido_manager, managers.mail as mail_manager, managers.telefono as telefono_manager
from centros, managers
where centros.id_centro = managers.id_centro
order by centros.id_centro;












