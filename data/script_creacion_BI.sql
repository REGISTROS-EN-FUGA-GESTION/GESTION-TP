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

IF object_id('CREAR_ANIOS_Y_MESES_DE_INTERES','p') is not null
	DROP PROCEDURE [dbo].[CREAR_ANIOS_Y_MESES_DE_INTERES]

IF object_id('CANTIDAD_AUTOS_VENDIDOS_Y_COMPRADOS_X_SUCURSAL_Y_MES','v') is not null
	DROP VIEW [dbo].[CANTIDAD_AUTOS_VENDIDOS_Y_COMPRADOS_X_SUCURSAL_Y_MES]

IF object_id('PRECIO_PROMEDIO_AUTOMOVILES_VENDIDOS_Y_COMPRADOS','v') is not null
	DROP VIEW [dbo].[PRECIO_PROMEDIO_AUTOMOVILES_VENDIDOS_Y_COMPRADOS]

IF object_id('GANANCIAS_X_SUCURSAL_Y_MES_AUTOMOVILES','v') is not null
	DROP VIEW [dbo].[GANANCIAS_X_SUCURSAL_Y_MES_AUTOMOVILES]

IF object_id('PRECIO_PROMEDIO_AUTOPARTE_VENDIDA_Y_COMPRADA','v') is not null
	DROP VIEW [dbo].[PRECIO_PROMEDIO_AUTOPARTE_VENDIDA_Y_COMPRADA]

IF object_id('GANANCIAS_X_SUCURSAL_Y_MES_AUTOPARTES','v') is not null
	DROP VIEW [dbo].[GANANCIAS_X_SUCURSAL_Y_MES_AUTOPARTES]

-------------------------------Dimensiones--------------------------------
create table [REGISTROS_EN_FUGA].BI_Tiempo(
		tiempo_id int primary key identity,
		mes_numero			INTEGER not null,
		mes_nombre			CHAR(30),
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
GO
-----------------------------------------Creación de Stored Procedures--------------------
CREATE PROCEDURE [dbo].[CREAR_ANIOS_Y_MESES_DE_INTERES]
AS
	BEGIN
		CREATE TABLE Anios
		(
			Anio INTEGER
		);

		create table Meses
		(
			Mes INTEGER,
			Nombre NVARCHAR (50)
		);

		insert into Anios values (2018)
		insert into Anios values (2019)
		insert into Anios values (2020)
		insert into Anios values (2021)
		
		insert into Meses values (1, 'ENERO')
		insert into Meses values (2, 'FEBRERO')
		insert into Meses values (3, 'MARZO')
		insert into Meses values (4, 'ABRIL')
		insert into Meses values (5, 'MAYO')
		insert into Meses values (6, 'JUNIO')
		insert into Meses values (7, 'JULIO')
		insert into Meses values (8, 'AGOSTO')
		insert into Meses values (9, 'SEPTIEMBRE')
		insert into Meses values (10, 'OCTUBRE')
		insert into Meses values (11, 'NOVIEMBRE')
		insert into Meses values (12, 'DICIEMBRE')
	END
GO

-----------------------------------------Carga de dimensiones------------------------------

--BI_Tiempo
EXEC CREAR_ANIOS_Y_MESES_DE_INTERES

INSERT INTO [REGISTROS_EN_FUGA].[BI_Tiempo] SELECT m.mes, m.Nombre, a.anio FROM Anios a CROSS JOIN Meses m

DROP TABLE MESES
DROP TABLE ANIOS

--BI_CLIENTES
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

-------------------------------------FACT TABLES Y TEMPORALES--------------------------------------------
drop table #TempVentaAutoparte

--temporal venta autoparte
USE GD2C2020
SELECT fac_fecha as FECHA_FACTURA, 
		CASE
			WHEN DateDiff (Year, c.cli_fecha_nac, f.fac_fecha) <= 30 THEN 1
			WHEN DateDiff (Year, c.cli_fecha_nac, f.fac_fecha) <= 50 THEN 2
			ELSE 3
		END as EDAD_CLIENTE,
	   s.sucursal_direccion SUCURSAL_DIRECCION,
	   av.autoparte_id AUTOPARTE_ID, 
	   fa.fabricante_nombre NOMBRE_FAB, 
	   ar.autoparte_precio_facturado PRECIO, 
	   av.cantidad CANTIDAD
	   into #TempVentaAutoparte  
	   from [REGISTROS_EN_FUGA].[Facturas] f 
			inner join REGISTROS_EN_FUGA.Clientes c on c.cliente_id = f.fac_cliente_fk 
			inner join REGISTROS_EN_FUGA.Sucursales s on s.sucursal_id = f.fac_sucursal_fk 	
			inner join REGISTROS_EN_FUGA.Autoparte_por_venta av on av.factura_id = f.factura_nro
			inner join REGISTROS_EN_FUGA.Autopartes ar on ar.autoparte_codigo = av.autoparte_id
			inner join REGISTROS_EN_FUGA.Fabricantes fa on fa.fabricante_id = ar.autoparte_fabricante_fk 

-- FACT TABLE VENTA AUTOPARTE
INSERT [REGISTROS_EN_FUGA].BI_Ventas_Autopartes
	SELECT t.tiempo_id,
	 c.cliente_id, 
	 s.sucursal_id, 
	 a.autoparte_id, 
	 fa.fabricante_id, 
	 Temp.PRECIO, Temp.CANTIDAD
	from #TempVentaAutoparte Temp
		inner join REGISTROS_EN_FUGA.BI_Tiempo t on
		year(Temp.FECHA_FACTURA) = t.anio and month(Temp.FECHA_FACTURA) = t.mes_numero
		inner join REGISTROS_EN_FUGA.BI_Cliente c on c.cliente_id = Temp.EDAD_CLIENTE
		inner join REGISTROS_EN_FUGA.BI_Sucursal s on s.sucursal_direccion = Temp.SUCURSAL_DIRECCION
		inner join REGISTROS_EN_FUGA.BI_Autoparte a on a.autoparte_id = Temp.AUTOPARTE_ID
		inner join REGISTROS_EN_FUGA.BI_Fabricante fa on fa.fabricante_nombre = Temp.NOMBRE_FAB


--temporal compra autoparte
SELECT ca.compra_fecha,
	   s.sucursal_direccion,
	   ar.autoparte_codigo,
	   fa.fabricante_nombre,
	   ar.autoparte_precio_compra, 
	   ac.cantidad
	   into #TempCompraAutoparte  
	   from REGISTROS_EN_FUGA.Compra_Autoparte ca 
			inner join REGISTROS_EN_FUGA.Sucursales s on s.sucursal_id = ca.compra_sucursal_fk
			inner join REGISTROS_EN_FUGA.Autoparte_por_compra ac on ac.compra_nro = ca.compra_nro
			inner join REGISTROS_EN_FUGA.Autopartes ar on ar.autoparte_codigo = ac.autoparte_id
			inner join REGISTROS_EN_FUGA.Fabricantes fa on fa.fabricante_id = ar.autoparte_fabricante_fk


-- FACT TABLE COMPRA AUTOPARTE ----------------------------------------- ya actualizado el insert
INSERT [REGISTROS_EN_FUGA].BI_Compras_Autopartes
		SELECT T.tiempo_id, 
			   S.sucursal_id, 
			   TA.autoparte_codigo, 
			   F.fabricante_id, 
			   TA.autoparte_precio_compra, 
			   TA.cantidad FROM #TempCompraAutoparte TA
		INNER JOIN REGISTROS_EN_FUGA.BI_Tiempo T ON T.anio = YEAR(TA.compra_fecha) AND T.mes_numero = MONTH(TA.compra_fecha)
		INNER JOIN REGISTROS_EN_FUGA.BI_Fabricante F ON F.fabricante_nombre = TA.fabricante_nombre 
		INNER JOIN REGISTROS_EN_FUGA.BI_Sucursal S ON S.sucursal_direccion = TA.sucursal_direccion

DROP TABLE #TempCompraAutoparte


---temporal venta automovil
SELECT  fac_fecha as FECHA_FACTURA, 
		CASE
			WHEN DateDiff (Year, c.cli_fecha_nac, f.fac_fecha) <= 30 THEN 1
			WHEN DateDiff (Year, c.cli_fecha_nac, f.fac_fecha) <= 50 THEN 2
			ELSE 3
		END as EDAD_CLIENTE,
		s.sucursal_direccion, 
		ar.auto_nro_chasis, 
		mot.motor_nro,
		ta.tipo_auto_codigo,
		mr.modelo_potencia AS POTENCIA,
		mr.modelo_nombre,
		tc.tipo_caja_codigo,
		tt.tipo_transmision_codigo,
		f.fac_precio_total_facturado
		into #TempVentaAutomovil
			from REGISTROS_EN_FUGA.Facturas f 
				inner join REGISTROS_EN_FUGA.Clientes c on  c.cliente_id = f.fac_cliente_fk 
				inner join REGISTROS_EN_FUGA.Sucursales s on s.sucursal_id = f.fac_sucursal_fk 	
				inner join REGISTROS_EN_FUGA.Automoviles ar on ar.auto_id = f.fac_auto_fk
				inner join REGISTROS_EN_FUGA.Modelo_auto mr on mr.modelo_codigo = ar.auto_modelo_fk
				inner join REGISTROS_EN_FUGA.Tipo_transmision tt on tt.tipo_transmision_codigo = mr.modelo_tipo_transmision_fk
				inner join REGISTROS_EN_FUGA.Motores mot on mot.motor_nro = ar.auto_nro_motor
				inner join REGISTROS_EN_FUGA.Tipo_caja tc on tc.tipo_caja_codigo = mr.modelo_tipo_caja_fk
				inner join REGISTROS_EN_FUGA.Tipo_auto ta on ta.tipo_auto_codigo = ar.auto_tipo_fk

-- FACT TABLE VENTAS AUTOMOVIL 
INSERT [REGISTROS_EN_FUGA].BI_Ventas_Automovil
	SELECT T.tiempo_id,
		   C.cliente_id,
		   S.sucursal_id,
		   A.automovil_id,
		   CASE
				WHEN TA.POTENCIA <= 150 THEN 1
				WHEN TA.POTENCIA <= 300 THEN 2
				ELSE 3
		   END as Potencia_Cod,
		   TA.tipo_transmision_codigo,
		   TA.motor_nro,
		   TA.tipo_caja_codigo,
		   TA.tipo_auto_codigo,
		   M.modelo_id,
		   TA.fac_precio_total_facturado,
		   1
	    FROM #TempVentaAutomovil TA
		INNER JOIN REGISTROS_EN_FUGA.BI_Tiempo T ON T.anio = YEAR(TA.FECHA_FACTURA) AND T.mes_numero = MONTH(TA.FECHA_FACTURA)
		INNER JOIN REGISTROS_EN_FUGA.BI_Cliente C ON C.cliente_id = TA.EDAD_CLIENTE
		INNER JOIN REGISTROS_EN_FUGA.BI_Sucursal S ON S.sucursal_direccion = TA.sucursal_direccion
		INNER JOIN REGISTROS_EN_FUGA.BI_Automovil A ON A.automovil_nro_chasis = TA.auto_nro_chasis
		INNER JOIN REGISTROS_EN_FUGA.BI_Modelo M ON M.modelo_nombre = TA.modelo_nombre

DROP TABLE #TempVentaAutomovil

--temporal compra automovil
select  ca.compra_fecha FECHA_COMPRA,
		s.sucursal_direccion,
		a.auto_nro_chasis,
		mot.motor_nro,
		ta.tipo_auto_codigo,
		mr.modelo_potencia AS POTENCIA,
		mr.modelo_nombre,
		tc.tipo_caja_codigo,
		tt.tipo_transmision_codigo,
	 	a.auto_precio
		into #TempCompraAutomovil
			from REGISTROS_EN_FUGA.Compra_Automovil ca
				join REGISTROS_EN_FUGA.Sucursales s on s.sucursal_id = ca.compra_sucursal_fk
				join REGISTROS_EN_FUGA.Automoviles a on ca.compra_auto_fk = a.auto_id
				inner join REGISTROS_EN_FUGA.Modelo_auto mr on mr.modelo_codigo = a.auto_modelo_fk
				inner join REGISTROS_EN_FUGA.Tipo_transmision tt on tt.tipo_transmision_codigo = mr.modelo_tipo_transmision_fk
				inner join REGISTROS_EN_FUGA.Motores mot on mot.motor_nro = a.auto_nro_motor
				inner join REGISTROS_EN_FUGA.Tipo_caja tc on tc.tipo_caja_codigo = mr.modelo_tipo_caja_fk
				inner join REGISTROS_EN_FUGA.Tipo_auto ta on ta.tipo_auto_codigo = a.auto_tipo_fk

INSERT [REGISTROS_EN_FUGA].BI_Compras_Automovil
	SELECT T.tiempo_id,
		   S.sucursal_id,
		   A.automovil_id,
		   CASE
				WHEN CA.POTENCIA <= 150 THEN 1
				WHEN CA.POTENCIA <= 300 THEN 2
				ELSE 3
		   END as Potencia_Cod,
		   CA.tipo_transmision_codigo,
		   CA.motor_nro,
		   CA.tipo_caja_codigo,
		   CA.tipo_auto_codigo,
		   M.modelo_id,
		   CA.auto_precio,
		   1 as Cantidad
	    FROM #TempCompraAutomovil CA
		INNER JOIN REGISTROS_EN_FUGA.BI_Tiempo T ON T.anio = YEAR(CA.FECHA_COMPRA) AND T.mes_numero = MONTH(CA.FECHA_COMPRA)
		INNER JOIN REGISTROS_EN_FUGA.BI_Sucursal S ON S.sucursal_direccion = CA.sucursal_direccion
		INNER JOIN REGISTROS_EN_FUGA.BI_Automovil A ON A.automovil_nro_chasis = CA.auto_nro_chasis
		INNER JOIN REGISTROS_EN_FUGA.BI_Modelo M ON M.modelo_nombre = CA.modelo_nombre

GO


---------------------------------------------VISTAS-------------------------------------------------------------

CREATE VIEW CANTIDAD_AUTOS_VENDIDOS_Y_COMPRADOS_X_SUCURSAL_Y_MES AS	 
	SELECT sum(V.unidades) AS Cant_Vendidos, sum(C.unidades) AS Cant_Comprados 
		FROM REGISTROS_EN_FUGA.BI_Ventas_Automovil V
		JOIN REGISTROS_EN_FUGA.BI_Compras_Automovil C on C.tiempo_id_fk + C.sucursal_id_fk = V.tiempo_id_fk + V.sucursal_id_fk
		group by V.tiempo_id_fk, C.tiempo_id_fk, V.sucursal_id_fk, C.sucursal_id_fk
GO

CREATE VIEW PRECIO_PROMEDIO_AUTOMOVILES_VENDIDOS_Y_COMPRADOS AS	 
	SELECT AVG(V.precio_venta) Precio_venta_promedio, AVG(C.precio_compra) Precio_compra_promedio
		FROM REGISTROS_EN_FUGA.BI_Ventas_Automovil V
		JOIN REGISTROS_EN_FUGA.BI_Compras_Automovil C on C.tiempo_id_fk + C.sucursal_id_fk = V.tiempo_id_fk + V.sucursal_id_fk
		group by C.precio_compra, V.precio_venta
GO

CREATE VIEW GANANCIAS_X_SUCURSAL_Y_MES_AUTOMOVILES AS	 
	SELECT ((SUM(V.unidades)*(V.precio_venta)) - (SUM(C.unidades)*(C.precio_compra))) AS 'GANANCIA'
		FROM REGISTROS_EN_FUGA.BI_Ventas_Automovil V
		JOIN REGISTROS_EN_FUGA.BI_Compras_Automovil C on C.tiempo_id_fk + C.sucursal_id_fk = V.tiempo_id_fk + V.sucursal_id_fk
		group by  V.tiempo_id_fk, C.tiempo_id_fk, V.sucursal_id_fk, C.sucursal_id_fk, C.precio_compra, V.precio_venta
GO

--ACÁ NO ESTÁ LO DE PROMEDIO DE TIEMPO EN STOCK DE CADA MODELO DE AUTO, NO SÉ SI AL FINAL NO IBA O NOS LO COMIMOS
/*CREATE VIEW automoviles AS	 
		SELECT sum(V.unidades) AS Cant_Vendidos, sum(C.unidades) AS Cant_Comprados, AVG(V.precio_venta) Precio_venta_promedio, AVG(C.precio_compra) Precio_compra_promedio,
		((SUM(V.unidades)*(V.precio_venta)) - (SUM(C.unidades)*(C.precio_compra))) GANANCIA 
		FROM REGISTROS_EN_FUGA.BI_Ventas_Automovil V
		JOIN REGISTROS_EN_FUGA.BI_Compras_Automovil C on C.tiempo_id_fk+C.sucursal_id_fk=V.tiempo_id_fk+V.sucursal_id_fk
		group by V.tiempo_id_fk, C.tiempo_id_fk, V.sucursal_id_fk, C.sucursal_id_fk, C.precio_compra, V.precio_venta	
GO*/


CREATE VIEW PRECIO_PROMEDIO_AUTOPARTE_VENDIDA_Y_COMPRADA AS	 
		SELECT AVG(V.precio_venta) AS Precio_Prom_Vendido, AVG(C.precio_compra) AS Precio_Prom_Comprado
			FROM REGISTROS_EN_FUGA.BI_Ventas_Autopartes V
			JOIN REGISTROS_EN_FUGA.BI_Compras_Autopartes C on C.autoparte_id_fk = V.autoparte_id_fk
			group by V.autoparte_id_fk, C.autoparte_id_fk
GO

CREATE VIEW GANANCIAS_X_SUCURSAL_Y_MES_AUTOPARTES AS	 
		SELECT (SELECT ((SUM(V2.unidades)*(V2.precio_venta)) - (SUM(C2.unidades)*C2.precio_compra)) FROM REGISTROS_EN_FUGA.BI_Ventas_Autopartes V2
			JOIN REGISTROS_EN_FUGA.BI_Compras_Autopartes C2 on C2.autoparte_id_fk = V2.autoparte_id_fk
			WHERE c2.autoparte_id_fk = v.autoparte_id_fk GROUP BY C2.precio_compra, V2.precio_venta) as 'GANANCIAS' 
		FROM REGISTROS_EN_FUGA.BI_Ventas_Autopartes V
		JOIN REGISTROS_EN_FUGA.BI_Compras_Autopartes C on C.autoparte_id_fk=V.autoparte_id_fk
GO

--ACÁ NO ESTÁ NI MAXIMA CANTIDAD DE STOCK POR SUCURSAL DE FORMA ANUAL NI PROMEDIO DE TIEMPO EN STOCK DE CADA AUTOPARTE.
/*CREATE VIEW autopartes AS	
		SELECT 
			AVG(V.precio_venta) AS Precio_Prom_Vendido,
			AVG(C.precio_compra) AS Precio_Prom_Comprado,
			(SELECT ((SUM(V2.unidades)*(V2.precio_venta)) - (SUM(C2.unidades)*C2.precio_compra)) FROM REGISTROS_EN_FUGA.BI_Ventas_Autopartes V2
				JOIN REGISTROS_EN_FUGA.BI_Compras_Autopartes C2 on C2.autoparte_id_fk=V2.autoparte_id_fk
				WHERE c2.autoparte_id_fk = v.autoparte_id_fk GROUP BY C2.precio_compra, V2.precio_venta) GANANCIA 
		FROM REGISTROS_EN_FUGA.BI_Ventas_Autopartes V
		JOIN REGISTROS_EN_FUGA.BI_Compras_Autopartes C on C.autoparte_id_fk=V.autoparte_id_fk
		group by V.autoparte_id_fk, C.autoparte_id_fk, C.sucursal_id_fk, C.tiempo_id_fk, V.sucursal_id_fk, V.tiempo_id_fk	
GO*/