USE GD2C2020
IF object_id('REGISTROS_EN_FUGA.BI_Ventas_Autopartes') is not null
	drop table [REGISTROS_EN_FUGA].BI_Ventas_Autopartes

IF object_id('REGISTROS_EN_FUGA.BI_Ventas_Automovil') is not null
	drop table [REGISTROS_EN_FUGA].BI_Ventas_Automovil

IF object_id('REGISTROS_EN_FUGA.BI_Compras_Automovil') is not null
	drop table [REGISTROS_EN_FUGA].BI_Compras_Automovil

IF object_id('REGISTROS_EN_FUGA.BI_Compras_Autopartes') is not null
	drop table [REGISTROS_EN_FUGA].BI_Compras_Autopartes

IF object_id('REGISTROS_EN_FUGA.BI_Fabricante') is not null
	drop table [REGISTROS_EN_FUGA].BI_Fabricante

IF object_id('REGISTROS_EN_FUGA.BI_Modelo') is not null
	drop table [REGISTROS_EN_FUGA].BI_Modelo

IF object_id('REGISTROS_EN_FUGA.BI_Potencia') is not null
	drop table [REGISTROS_EN_FUGA].BI_Potencia

IF object_id('REGISTROS_EN_FUGA.BI_Sucursal') is not null
	drop table [REGISTROS_EN_FUGA].BI_Sucursal

IF object_id('REGISTROS_EN_FUGA.BI_Tiempo') is not null
	drop table [REGISTROS_EN_FUGA].BI_Tiempo

IF object_id('REGISTROS_EN_FUGA.BI_Tipo_automovil') is not null
	drop table [REGISTROS_EN_FUGA].BI_Tipo_automovil

IF object_id('REGISTROS_EN_FUGA.BI_Tipo_caja') is not null
	drop table [REGISTROS_EN_FUGA].BI_Tipo_caja

IF object_id('REGISTROS_EN_FUGA.BI_Tipo_transmision') is not null
	drop table [REGISTROS_EN_FUGA].BI_Tipo_transmision

IF object_id('REGISTROS_EN_FUGA.BI_Tipo_motor') is not null
	drop table [REGISTROS_EN_FUGA].BI_Tipo_motor

IF object_id('REGISTROS_EN_FUGA.BI_Automovil') is not null
	drop table [REGISTROS_EN_FUGA].BI_Automovil

IF object_id('REGISTROS_EN_FUGA.BI_Autoparte') is not null
	drop table [REGISTROS_EN_FUGA].BI_Autoparte

IF object_id('REGISTROS_EN_FUGA.BI_Cliente') is not null
	drop table [REGISTROS_EN_FUGA].BI_Cliente

-------------------------------Dimensiones--------------------------------
create table [REGISTROS_EN_FUGA].BI_Tiempo(
		tiempo_id int primary key identity,
		mes			char(2) not null,
		anio	char(4) not null
		)

create table [REGISTROS_EN_FUGA].BI_Cliente(
	cliente_id int primary key identity,
	cliente_rango_edad		nvarchar(40) not null,
	--cliente_sexo		int not null (decidimos sacarlo ya que no hay referencia a este --dato en ningun registro, seria un valor inventado que podria alterar los resultados   --generados)
	--cliente_nombre		nvarchar(255) not null,
	--cliente_apellido	nvarchar(255) not null,
	--cliente_direccion	nvarchar(255) not null,
	--cliente_dni			decimal(18,0) not null,
	--cliente_fecha_nacimiento datetime2(3) not null,
	--cliente_email		nvarchar(255) not null
)

create table [REGISTROS_EN_FUGA].BI_Sucursal(
	sucursal_id int primary key identity,
	sucursal_direccion nvarchar(255) not null,
	sucursal_email		nvarchar(255) not null,
	sucursal_telefono	decimal(18,0) not null,
	sucursal_ciudad		nvarchar(255)	not null
)

create table [REGISTROS_EN_FUGA].BI_Modelo(
	modelo_id int primary key identity,
	modelo_nombre nvarchar(255) not null
)

create table [REGISTROS_EN_FUGA].BI_Fabricante(
	fabricante_id int primary key identity,
	fabricante_nombre nvarchar(255) not null
)
create table [REGISTROS_EN_FUGA].BI_Tipo_automovil(
	tipo_auto_id int primary key identity,
	tipo_auto_desc nvarchar(255) not null
)

create table [REGISTROS_EN_FUGA].BI_Tipo_caja(
	tipo_caja_id int primary key identity,
	tipo_caja_desc nvarchar(255) not null
)

create table [REGISTROS_EN_FUGA].BI_Tipo_motor(
	motor_nro nvarchar(50) primary key,
	tipo_motor_codigo decimal(18,0) not null
)

create table [REGISTROS_EN_FUGA].BI_Tipo_transmision(
	tipo_transmision_id int primary key identity,
	tipo_transmision_desc nvarchar(255) not null
)

create table [REGISTROS_EN_FUGA].BI_Potencia(
	potencia_id int primary key identity,
	--potencia_codigo decimal(18,0) not null,
	potencia_rango nvarchar(40) not null
)

create table [REGISTROS_EN_FUGA].BI_Autoparte(
	autoparte_id int primary key identity,
	autoparte_desc nvarchar(255) not null,
	autoparte_precio_compra decimal(18,2) not null,
	autoparte_precio_venta decimal(18,2) not null,
)

create table [REGISTROS_EN_FUGA].BI_Automovil(
	automovil_id int primary key identity,
	automovil_nro_chasis nvarchar(50) not null,
	automovil_nro_motor nvarchar(50) not null, 
	automovil_nro_patente nvarchar(50) not null, 
	automovil_fecha_alta datetime2(3) not null,
	automovil_kms decimal(18,0) not null,
	automovil_precio_compra decimal(18,0) not null,
	automovil_precio_venta decimal(18,0) not null
)

-------------------------------Fact tables--------------------------------
create table [REGISTROS_EN_FUGA].BI_Ventas_Autopartes(
	tiempo_id_fk int not null,
	cliente_id_fk int not null,
	sucursal_id_fk int not null,
	autoparte_id_fk int not null,
	fabricante_id_fk int not null,
	precio_venta decimal(18,2) not null,
	unidades	decimal(18,0) not null
)

create table [REGISTROS_EN_FUGA].BI_Ventas_Automovil(
	tiempo_id_fk int not null,
	cliente_id_fk int not null,
	sucursal_id_fk int not null,
	automovil_id_fk int not null,
	potencia_id_fk int not null,
	tipo_transmision_id_fk int not null,
	tipo_motor_id_fk nvarchar(50) not null,
	tipo_caja_id_fk int not null,
	tipo_automovil_id_fk int not null,
	modelo_id_fk int not null,
	precio_venta decimal(18,2) not null,
	unidades	decimal(18,0) not null
)

create table [REGISTROS_EN_FUGA].BI_Compras_Autopartes(
	tiempo_id_fk int not null,
	sucursal_id_fk int not null,
	autoparte_id_fk int not null,
	fabricante_id_fk int not null,
	precio_compra decimal(18,2) not null,
	unidades	decimal(18,0) not null
)

create table [REGISTROS_EN_FUGA].BI_Compras_Automovil(
	tiempo_id_fk int not null,
	sucursal_id_fk int not null,
	automovil_id_fk int not null,
	potencia_id_fk int not null,
	tipo_transmision_id_fk int not null,
	tipo_motor_id_fk nvarchar(50) not null,
	tipo_caja_id_fk int not null,
	tipo_automovil_id_fk int not null,
	modelo_id_fk int not null,
	precio_compra decimal(18,2) not null,
	unidades	decimal(18,0) not null
)

-------------------------------Constraints--------------------------------

--CONSTRAINTS PARA BI_Ventas_Autopartes
ALTER TABLE [REGISTROS_EN_FUGA].BI_Ventas_Autopartes
			ADD CONSTRAINT FK_venta_autoparte_Tiempo FOREIGN KEY (tiempo_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Tiempo(tiempo_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Ventas_Autopartes
			ADD CONSTRAINT FK_venta_autoparte_Cliente FOREIGN KEY (cliente_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Cliente(cliente_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Ventas_Autopartes
			ADD CONSTRAINT FK_venta_autoparte_Sucursal FOREIGN KEY (sucursal_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Sucursal(sucursal_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Ventas_Autopartes
			ADD CONSTRAINT FK_venta_autoparte_Autoparte FOREIGN KEY (autoparte_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Autoparte(autoparte_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Ventas_Autopartes
			ADD CONSTRAINT FK_venta_autoparte_Fabricante FOREIGN KEY (fabricante_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Fabricante(fabricante_id)

------Contraints Venta_automovil
ALTER TABLE [REGISTROS_EN_FUGA].BI_Ventas_Automovil
	ADD CONSTRAINT FK_venta_automovil_tiempo_id FOREIGN KEY (tiempo_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Tiempo(tiempo_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Ventas_Automovil
	ADD CONSTRAINT FK_venta_automovil_cliente_id FOREIGN KEY (cliente_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Cliente(cliente_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Ventas_Automovil
	ADD CONSTRAINT FK_venta_automovil_sucursal_id FOREIGN KEY (sucursal_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Sucursal(sucursal_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Ventas_Automovil
	ADD CONSTRAINT FK_venta_automovil_automovil_id FOREIGN KEY (automovil_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Automovil(automovil_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Ventas_Automovil
	ADD CONSTRAINT FK_venta_automovil_potencia_id FOREIGN KEY (potencia_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Potencia(potencia_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Ventas_Automovil
	ADD CONSTRAINT FK_venta_automovil_tipo_transmision_id FOREIGN KEY (tipo_transmision_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Tipo_transmision(tipo_transmision_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Ventas_Automovil
	ADD CONSTRAINT FK_venta_automovil_tipo_motor_id FOREIGN KEY (tipo_motor_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Tipo_Motor(motor_nro)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Ventas_Automovil
	ADD CONSTRAINT FK_venta_automovil_tipo_caja_id FOREIGN KEY (tipo_caja_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Tipo_caja(tipo_caja_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Ventas_Automovil
	ADD CONSTRAINT FK_venta_automovil_tipo_automovil_id FOREIGN KEY (tipo_automovil_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Tipo_Automovil(tipo_auto_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Ventas_Automovil
	ADD CONSTRAINT FK_venta_automovil_modelo_id FOREIGN KEY (modelo_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Modelo(modelo_id)


--CONSTRAINTS PARA BI_Compras_Autopartes
ALTER TABLE [REGISTROS_EN_FUGA].BI_Compras_Autopartes
	ADD CONSTRAINT FK_compra_autoparte_Tiempo FOREIGN KEY (tiempo_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Tiempo(tiempo_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Compras_Autopartes
	ADD CONSTRAINT FK_compra_autoparte_Sucursal FOREIGN KEY (sucursal_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Sucursal(sucursal_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Compras_Autopartes
	ADD CONSTRAINT FK_compra_autoparte_Autoparte FOREIGN KEY (autoparte_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Autoparte(autoparte_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Compras_Autopartes
	ADD CONSTRAINT FK_compra_autoparte_Fabricante FOREIGN KEY (fabricante_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Fabricante(fabricante_id)

------Contraints Compra_automovil
ALTER TABLE [REGISTROS_EN_FUGA].BI_Compras_Automovil
	ADD CONSTRAINT FK_compra_automovil_tiempo_id FOREIGN KEY (tiempo_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Tiempo(tiempo_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Compras_Automovil
	ADD CONSTRAINT FK_compra_automovil_sucursal_id FOREIGN KEY (sucursal_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Sucursal(sucursal_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Compras_Automovil
	ADD CONSTRAINT FK_compra_automovil_automovil_id FOREIGN KEY (automovil_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Automovil(automovil_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Compras_Automovil
	ADD CONSTRAINT FK_compra_automovil_potencia_id FOREIGN KEY (potencia_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Potencia(potencia_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Compras_Automovil
	ADD CONSTRAINT FK_compra_automovil_tipo_transmision_id FOREIGN KEY (tipo_transmision_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Tipo_transmision(tipo_transmision_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Compras_Automovil
	ADD CONSTRAINT FK_compra_automovil_tipo_motor_id FOREIGN KEY (tipo_motor_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Tipo_Motor(motor_nro)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Compras_Automovil
	ADD CONSTRAINT FK_compra_automovil_tipo_caja_id FOREIGN KEY (tipo_caja_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Tipo_caja(tipo_caja_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Compras_Automovil
	ADD CONSTRAINT FK_compra_automovil_tipo_automovil_id FOREIGN KEY (tipo_automovil_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Tipo_Automovil(tipo_auto_id)

ALTER TABLE [REGISTROS_EN_FUGA].BI_Compras_Automovil
	ADD CONSTRAINT FK_compra_automovil_modelo_id FOREIGN KEY (modelo_id_fk) REFERENCES [REGISTROS_EN_FUGA].BI_Modelo(modelo_id)

-----------------------------------------Carga de dimensiones------------------------------

--BI_Tiempo
INSERT INTO [REGISTROS_EN_FUGA].[BI_Tiempo] 
	select MONTH(fac_fecha), YEAR(fac_fecha) from [REGISTROS_EN_FUGA].[Facturas]
	group by YEAR(fac_fecha), MONTH(fac_fecha) order by YEAR(fac_fecha), MONTH(fac_fecha)


--BI_CLIENTES
/*SET IDENTITY_INSERT [REGISTROS_EN_FUGA].BI_Cliente ON INSERT INTO [REGISTROS_EN_FUGA].BI_Cliente
	(cliente_id, cliente_edad, cliente_nombre, cliente_apellido, cliente_direccion, cliente_dni, cliente_fecha_nacimiento, cliente_email)
	SELECT cliente_id, CASE 
	WHEN FLOOR(DATEDIFF(DAY, cli_fecha_nac, CURRENT_TIMESTAMP) / 365.25) BETWEEN 18 AND 30 THEN '18 - 30 años'
	WHEN FLOOR(DATEDIFF(DAY, cli_fecha_nac, CURRENT_TIMESTAMP) / 365.25) BETWEEN 31 AND 50 THEN '31 - 50 años'
	WHEN FLOOR(DATEDIFF(DAY, cli_fecha_nac, CURRENT_TIMESTAMP) / 365.25) > 50 THEN '> 50 años'
	END AS cliente_edad,
	cli_nombre, cli_apellido, cli_direccion, 
	cli_DNI, cli_fecha_nac, cli_mail FROM [REGISTROS_EN_FUGA].CLIENTES
	SET IDENTITY_INSERT [REGISTROS_EN_FUGA].BI_Cliente OFF*/
INSERT INTO [REGISTROS_EN_FUGA].BI_Cliente (cliente_rango_edad) values('18 - 30 años');
INSERT INTO [REGISTROS_EN_FUGA].BI_Cliente (cliente_rango_edad) values('31 - 50 años');
INSERT INTO [REGISTROS_EN_FUGA].BI_Cliente (cliente_rango_edad) values('> 50 años');

--BI_Sucursal
SET IDENTITY_INSERT [REGISTROS_EN_FUGA].BI_Sucursal ON INSERT INTO [REGISTROS_EN_FUGA].BI_Sucursal 
	(sucursal_id, sucursal_direccion, sucursal_email, sucursal_telefono, sucursal_ciudad)
	SELECT sucursal_id, sucursal_direccion, sucursal_mail, sucursal_telefono, sucursal_ciudad
	FROM [REGISTROS_EN_FUGA].[Sucursales]
	SET IDENTITY_INSERT [REGISTROS_EN_FUGA].BI_Sucursal OFF

--BI_Modelo
SET IDENTITY_INSERT [REGISTROS_EN_FUGA].BI_Modelo ON INSERT INTO [REGISTROS_EN_FUGA].BI_Modelo 
	(modelo_id,modelo_nombre) SELECT modelo_codigo, modelo_nombre from [REGISTROS_EN_FUGA].Modelo_auto
	SET IDENTITY_INSERT [REGISTROS_EN_FUGA].BI_Modelo OFF

--BI_Fabricante
SET IDENTITY_INSERT [REGISTROS_EN_FUGA].BI_Fabricante ON INSERT INTO [REGISTROS_EN_FUGA].BI_Fabricante (fabricante_id,fabricante_nombre)
	SELECT fabricante_id, fabricante_nombre from [REGISTROS_EN_FUGA].Fabricantes
	SET IDENTITY_INSERT [REGISTROS_EN_FUGA].BI_Fabricante OFF

--BI_Tipo_automovil
SET IDENTITY_INSERT [REGISTROS_EN_FUGA].BI_Tipo_Automovil ON INSERT INTO [REGISTROS_EN_FUGA].BI_Tipo_Automovil (tipo_auto_id,tipo_auto_desc)
	SELECT tipo_auto_codigo, tipo_auto_desc from [REGISTROS_EN_FUGA].Tipo_auto
	SET IDENTITY_INSERT [REGISTROS_EN_FUGA].BI_Tipo_Automovil OFF

--BI_Tipo_caja
SET IDENTITY_INSERT [REGISTROS_EN_FUGA].BI_Tipo_caja ON INSERT INTO [REGISTROS_EN_FUGA].BI_Tipo_caja (tipo_caja_id, tipo_caja_desc)
	SELECT tipo_caja_codigo, tipo_caja_desc from [REGISTROS_EN_FUGA].Tipo_caja
	SET IDENTITY_INSERT [REGISTROS_EN_FUGA].BI_Tipo_caja OFF

--BI_Tipo_motor
INSERT  INTO[REGISTROS_EN_FUGA].BI_Tipo_motor 
	SELECT motor_nro, tipo_motor from [REGISTROS_EN_FUGA].Motores

--BI_Tipo_transmision
SET IDENTITY_INSERT [REGISTROS_EN_FUGA].BI_Tipo_transmision ON INSERT INTO [REGISTROS_EN_FUGA].BI_Tipo_transmision (tipo_transmision_id, tipo_transmision_desc)
	SELECT tipo_transmision_codigo, tipo_transmision_desc from [REGISTROS_EN_FUGA].Tipo_transmision
	SET IDENTITY_INSERT [REGISTROS_EN_FUGA].BI_Tipo_transmision OFF

--BI_Potencia
INSERT INTO [REGISTROS_EN_FUGA].BI_Potencia (potencia_rango) values('50 - 150cv');
INSERT INTO [REGISTROS_EN_FUGA].BI_Potencia (potencia_rango) values('151 - 300cv');
INSERT INTO [REGISTROS_EN_FUGA].BI_Potencia (potencia_rango) values('> 300cv');

--BI_Autoparte
SET IDENTITY_INSERT [REGISTROS_EN_FUGA].BI_Autoparte ON INSERT INTO [REGISTROS_EN_FUGA].BI_Autoparte (autoparte_id, autoparte_desc,autoparte_precio_compra, autoparte_precio_venta)
	SELECT distinct autoparte_codigo, autoparte_descripcion, autoparte_precio_compra, autoparte_precio_facturado from [REGISTROS_EN_FUGA].Autopartes
	SET IDENTITY_INSERT [REGISTROS_EN_FUGA].BI_Autoparte OFF

--BI_Automovil
SET IDENTITY_INSERT [REGISTROS_EN_FUGA].BI_Automovil ON INSERT INTO [REGISTROS_EN_FUGA].BI_Automovil (automovil_id, automovil_nro_chasis, automovil_nro_motor, automovil_nro_patente, automovil_fecha_alta, automovil_kms, automovil_precio_compra, automovil_precio_venta)
	SELECT auto_id, auto_nro_chasis, auto_nro_motor, auto_patente, auto_fecha_alta, auto_cant_kms, auto_precio, fac_precio_total_facturado
	from [REGISTROS_EN_FUGA].Automoviles
	JOIN [REGISTROS_EN_FUGA].Facturas on fac_auto_fk = auto_id
	SET IDENTITY_INSERT [REGISTROS_EN_FUGA].BI_Automovil OFF

-- FACT TABLE VENTAAUTOPARTE
INSERT [REGISTROS_EN_FUGA].BI_Ventas_Autopartes
SELECT tiempo_id, c.cliente_id, s.sucursal_id, av.autoparte_id, fa.fabricante_id, a.autoparte_precio_venta, av.cantidad
from REGISTROS_EN_FUGA.Facturas f inner join REGISTROS_EN_FUGA.BI_Tiempo t on
	year(f.fac_fecha) = t.anio and month(f.fac_fecha) = t.mes
	inner join REGISTROS_EN_FUGA.BI_Cliente c on c.cliente_id = f.fac_cliente_fk 
	inner join REGISTROS_EN_FUGA.BI_Sucursal s on s.sucursal_id = f.fac_sucursal_fk
	inner join REGISTROS_EN_FUGA.Autoparte_por_venta av on av.factura_id = f.factura_nro
	inner join REGISTROS_EN_FUGA.BI_Autoparte a on a.autoparte_id = av.autoparte_id
	inner join REGISTROS_EN_FUGA.Autopartes ar on ar.autoparte_codigo = a.autoparte_id
	inner join REGISTROS_EN_FUGA.BI_Fabricante fa on fa.fabricante_id = ar.autoparte_fabricante_fk 
	where f.fac_auto_fk is NULL order by tiempo_id


-- FACT TABLE COMPRA AUTOPARTE
INSERT [REGISTROS_EN_FUGA].BI_Compras_Autopartes
SELECT tiempo_id,  s.sucursal_id, a.autoparte_id, fa.fabricante_id, a.autoparte_precio_compra, ac.cantidad  
from REGISTROS_EN_FUGA.Compra_Autoparte ca inner join REGISTROS_EN_FUGA.BI_Tiempo t on  
	year(ca.compra_fecha) = t.anio and month(ca.compra_fecha) = t.mes
	inner join [REGISTROS_EN_FUGA].BI_Sucursal s on s.sucursal_id = ca.compra_sucursal_fk
	inner join REGISTROS_EN_FUGA.Autoparte_por_compra ac on ac.compra_nro = ca.compra_nro
	inner join REGISTROS_EN_FUGA.BI_Autoparte a on a.autoparte_id = ac.autoparte_id
	inner join REGISTROS_EN_FUGA.Autopartes ar on ar.autoparte_codigo = a.autoparte_id
	inner join REGISTROS_EN_FUGA.BI_Fabricante fa on fa.fabricante_id = ar.autoparte_fabricante_fk
	order by tiempo_id

--VENTAS AUTOMOVIL 
INSERT [REGISTROS_EN_FUGA].BI_Ventas_Automovil
SELECT tiempo_id, 
c.cliente_id, 
s.sucursal_id, 
a.automovil_id, 
--p.potencia_id, 
tt.tipo_transmision_id, 
tm.motor_nro,
tc.tipo_caja_id, 
ta.tipo_auto_id, 
m.modelo_id, 
f.fac_precio_total_facturado, 1
from REGISTROS_EN_FUGA.Facturas f 
	inner join REGISTROS_EN_FUGA.BI_Tiempo t on year(f.fac_fecha) = t.anio and month(f.fac_fecha) = t.mes
	inner join REGISTROS_EN_FUGA.BI_Cliente c on  c.cliente_id = f.fac_cliente_fk 
	inner join REGISTROS_EN_FUGA.BI_Sucursal s on s.sucursal_id = f.fac_sucursal_fk 	
	inner join REGISTROS_EN_FUGA.BI_Automovil a on a.automovil_id = f.fac_auto_fk 
	inner join REGISTROS_EN_FUGA.Automoviles ar on ar.auto_id = a.automovil_id
	inner join REGISTROS_EN_FUGA.Modelo_auto mr on mr.modelo_codigo = ar.auto_modelo_fk
	inner join REGISTROS_EN_FUGA.BI_Modelo m on m.modelo_id = ar.auto_modelo_fk
	--inner join REGISTROS_EN_FUGA.BI_Potencia p on p.potencia_codigo = mr.modelo_potencia
	inner join REGISTROS_EN_FUGA.BI_Tipo_transmision tt on tt.tipo_transmision_id = mr.modelo_tipo_transmision_fk
	inner join REGISTROS_EN_FUGA.BI_Tipo_motor tm on tm.motor_nro = ar.auto_nro_motor
	inner join REGISTROS_EN_FUGA.BI_Tipo_caja tc on tc.tipo_caja_id = mr.modelo_tipo_caja_fk
	inner join REGISTROS_EN_FUGA.BI_Tipo_automovil ta on ta.tipo_auto_id = ar.auto_tipo_fk
	where f.fac_auto_fk is NOT NULL order by tiempo_id

IF object_id('automoviles','v') is not null
	DROP VIEW [dbo].[automoviles]

IF object_id('autopartes','v') is not null
	DROP VIEW [dbo].[autopartes]

GO
CREATE VIEW automoviles AS	 
		SELECT sum(V.unidades) AS Cant_Vendidos, sum(C.unidades) AS Cant_Comprados, AVG(V.precio_venta) Precio_venta_promedio, AVG(C.precio_compra) Precio_compra_promedio,
		((SUM(V.unidades)*(V.precio_venta)) - (SUM(C.unidades)*(C.precio_compra))) GANANCIA 
		FROM REGISTROS_EN_FUGA.BI_Ventas_Automovil V
		JOIN REGISTROS_EN_FUGA.BI_Compras_Automovil C on C.tiempo_id_fk+C.sucursal_id_fk=V.tiempo_id_fk+V.sucursal_id_fk
		group by V.tiempo_id_fk, C.tiempo_id_fk, V.sucursal_id_fk, C.sucursal_id_fk, C.precio_compra, V.precio_venta	
GO

CREATE VIEW autopartes AS	
		SELECT 
			AVG(V.precio_venta) AS Precio_Prom_Vendido,
			AVG(C.precio_compra) AS Precio_Prom_Comprado,
			(SELECT ((SUM(V2.unidades)*(V2.precio_venta)) - (SUM(C2.unidades)*C2.precio_compra)) FROM REGISTROS_EN_FUGA.BI_Ventas_Autopartes V2
				JOIN REGISTROS_EN_FUGA.BI_Compras_Autopartes C2 on C2.autoparte_id_fk=V2.autoparte_id_fk
				WHERE c2.autoparte_id_fk = v.autoparte_id_fk GROUP BY C2.precio_compra, V2.precio_venta) GANANCIA 
		FROM REGISTROS_EN_FUGA.BI_Ventas_Autopartes V
		JOIN REGISTROS_EN_FUGA.BI_Compras_Autopartes C on C.autoparte_id_fk=V.autoparte_id_fk
		group by V.autoparte_id_fk, C.autoparte_id_fk, C.sucursal_id_fk, C.tiempo_id_fk, V.sucursal_id_fk, V.tiempo_id_fk	
GO