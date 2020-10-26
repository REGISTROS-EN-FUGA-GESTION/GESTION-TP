USE GD2C2020
GO

IF EXISTS ( SELECT 1 FROM information_schema.schemata WHERE   schema_name = 'REGISTROS_EN_FUGA' )
	BEGIN
		IF object_id('REGISTROS_EN_FUGA.Compra_automovil') is not null
			drop table [REGISTROS_EN_FUGA].Compra_automovil
		
		IF object_id('REGISTROS_EN_FUGA.Stock') is not null
			drop table [REGISTROS_EN_FUGA].Stock

		IF object_id('REGISTROS_EN_FUGA.Autoparte_por_venta') is not null
			drop table [REGISTROS_EN_FUGA].Autoparte_por_venta

		IF object_id('REGISTROS_EN_FUGA.Facturas') is not null
			drop table [REGISTROS_EN_FUGA].Facturas

		IF object_id('REGISTROS_EN_FUGA.Automoviles') is not null
			drop table [REGISTROS_EN_FUGA].Automoviles

		IF object_id('REGISTROS_EN_FUGA.Autoparte_por_compra') is not null
			drop table [REGISTROS_EN_FUGA].Autoparte_por_compra

		IF object_id('REGISTROS_EN_FUGA.Compra_Autoparte') is not null
			drop table [REGISTROS_EN_FUGA].Compra_Autoparte

		IF object_id('REGISTROS_EN_FUGA.Autopartes') is not null
			drop table [REGISTROS_EN_FUGA].Autopartes

		IF object_id('REGISTROS_EN_FUGA.Modelo_auto') is not null
			drop table [REGISTROS_EN_FUGA].Modelo_auto

		IF object_id('REGISTROS_EN_FUGA.Clientes') is not null
			drop table [REGISTROS_EN_FUGA].Clientes

		IF object_id('REGISTROS_EN_FUGA.Sucursales') is not null
			drop table [REGISTROS_EN_FUGA].Sucursales

		IF object_id('REGISTROS_EN_FUGA.Fabricantes') is not null
			drop table [REGISTROS_EN_FUGA].Fabricantes

		IF object_id('REGISTROS_EN_FUGA.Tipo_auto') is not null
			drop table [REGISTROS_EN_FUGA].Tipo_auto

		IF object_id('REGISTROS_EN_FUGA.Tipo_caja') is not null
			drop table [REGISTROS_EN_FUGA].Tipo_caja

		IF object_id('REGISTROS_EN_FUGA.Tipo_transmision') is not null
			drop table [REGISTROS_EN_FUGA].Tipo_transmision

		IF object_id('REGISTROS_EN_FUGA.Motores') is not null
			drop table [REGISTROS_EN_FUGA].Motores
		
		DROP SCHEMA [REGISTROS_EN_FUGA]
	END
GO

CREATE SCHEMA [REGISTROS_EN_FUGA]
GO

--------------------------------------------------------CREACI?N DE TABLAS----------------------------------------------------------
	--CLIENTES
		create table [REGISTROS_EN_FUGA].Clientes(
		cliente_id int primary key identity,
		cli_nombre    nvarchar(255) not null,
		cli_apellido  nvarchar(255) not null,
		cli_direccion nvarchar(255) not null,
		cli_DNI       decimal(18),
		cli_fecha_nac datetime2(3)  not null,
		cli_mail	  nvarchar(255) not null
		)

	--SUCURSALES
		create table [REGISTROS_EN_FUGA].Sucursales(
		sucursal_id int primary key identity,
		sucursal_direccion nvarchar(255) not null,
		sucursal_mail      nvarchar(255) not null,
		sucursal_telefono  decimal(18) not null,
		sucursal_ciudad	   nvarchar(255) not null
		)

	--AUTOPARTES
		create table [REGISTROS_EN_FUGA].Autopartes(
		autoparte_codigo      decimal(18) primary key not null,
		autoparte_descripcion nvarchar(255) not null,
		autoparte_precio_facturado decimal(18,2),	--poner not null
		autoparte_precio_compra      decimal(18,2),	--poner not null
		autoparte_modelo_fk     decimal(18) not null,
		autoparte_fabricante_fk	   int         not null,
		unique (autoparte_codigo)
		)

	--FABRICANTES
		create table [REGISTROS_EN_FUGA].Fabricantes(
		fabricante_id int primary key identity,
		fabricante_nombre nvarchar(255) not null
		)

	--TIPO_AUTO
		create table [REGISTROS_EN_FUGA].Tipo_auto(
		tipo_auto_codigo decimal(18) primary key not null,
		tipo_auto_desc nvarchar(255) not null
		)

	--TIPO_CAJA
		create table [REGISTROS_EN_FUGA].Tipo_caja(
		tipo_caja_codigo decimal(18) primary key not null,
		tipo_caja_desc nvarchar(255) not null
		)


	--TIPO_TRANSMISI?N
		create table [REGISTROS_EN_FUGA].Tipo_transmision(
		tipo_transmision_codigo decimal(18) primary key not null,
		tipo_transmision_desc nvarchar(255) not null
		)

	--MOTORES
		create table [REGISTROS_EN_FUGA].Motores(
		motor_nro  nvarchar(50) primary key,
		tipo_motor decimal(18) not null
		)
	
	--MODELO_AUTO
		create table [REGISTROS_EN_FUGA].Modelo_auto(
		modelo_codigo			   decimal(18)  primary key,
		modelo_nombre			   nvarchar(255) not null,
		modelo_potencia			   decimal(18)   not null,
		modelo_tipo_caja_fk        decimal(18) not null,
		modelo_tipo_transmision_fk decimal(18) not null 
		)

	--AUTOM?VILES

		create table [REGISTROS_EN_FUGA].Automoviles(
		auto_id			int primary key identity,
		auto_nro_chasis nvarchar(50) not null,
		auto_nro_motor  nvarchar(50) not null,
		auto_patente    nvarchar(50) not null,
		auto_fecha_alta datetime2(3) not null,
		auto_cant_kms   decimal(18)  not null,
		auto_modelo_fk  decimal(18)  not null,
		auto_precio		decimal(18,2)  not null,
		auto_tipo_fk    decimal(18)  not null
		)

	--COMPRA_AUTOM?VIL

		create table [REGISTROS_EN_FUGA].Compra_automovil(
		compra_nro		   decimal(18)  primary key,
		compra_fecha	   datetime2(3) not null,
		compra_auto_fk     int          not null,
		compra_sucursal_fk int			not null
		)

	--COMPRA_AUTOPARTE
		create table [REGISTROS_EN_FUGA].Compra_Autoparte(
		compra_nro		   decimal(18) primary key,							  
		categoria		   nvarchar(255),									  
		compra_sucursal_fk int		   not null,									
		compra_fecha	   datetime2(3)  not null,
		compra_precio_total	   decimal(18,2)  not null	
		)
		
	--AUTOPARTE_POR_COMPRA
		create table [REGISTROS_EN_FUGA].Autoparte_por_compra(
		auto_compra_id int primary key identity,
		compra_nro	 decimal(18) not null,
		autoparte_id decimal(18) not null,
		cantidad     decimal(18) not null,
		)
		/* cambio la primary key (autoparte_id,compra_nro) por id autogenerado
			select * 
			from gd_esquema.Maestra where (AUTO_PARTE_CODIGO = 5017 OR AUTO_PARTE_CODIGO = 5006)
			and (compra_nro = 175488  OR compra_nro = 135193) 
		*/
	
	--FACTURAS
		create table [REGISTROS_EN_FUGA].Facturas(
		factura_nro			decimal(18)  primary key,
		fac_fecha	        datetime2(3) not null,
		fac_precio_total_facturado decimal(18,2) not null,
		fac_cliente_fk         int not null,
		fac_sucursal_fk	       int not null,
		fac_sucursal_compra_fk int,
		fac_auto_fk			   int 
		)

	--AUTOPARTE_POR_VENTA
		create table [REGISTROS_EN_FUGA].Autoparte_por_venta(
		auto_venta_id int primary key identity,
		autoparte_id decimal(18) not null,
		factura_id	 decimal(18) not null,
		cantidad     int         not null
		)


	--STOCK
		create table [REGISTROS_EN_FUGA].Stock(
		item_id		      decimal(18) primary key identity,
		item_auto_fk      int,
		item_autoparte_fk decimal(18),
		item_precio_venta decimal(18,2) not null,
		item_sucursal_fk  int,
		cantidad		  int not null
		)

--------------------------------------------------------DECLARACI?N DE CONSTRAINTS--------------------------------------------------

	--MODELO_AUTO
		ALTER TABLE [REGISTROS_EN_FUGA].Modelo_auto 
			ADD CONSTRAINT FK_Tipo_Caja_cod FOREIGN KEY (modelo_tipo_caja_fk) REFERENCES [REGISTROS_EN_FUGA].Tipo_caja(tipo_caja_codigo)

		ALTER TABLE [REGISTROS_EN_FUGA].Modelo_auto 
			ADD CONSTRAINT FK_Tipo_Transmision FOREIGN KEY (modelo_tipo_transmision_fk) REFERENCES [REGISTROS_EN_FUGA].Tipo_transmision(tipo_transmision_codigo)


	--AUTOM?VILES

		ALTER TABLE [REGISTROS_EN_FUGA].Automoviles
			ADD CONSTRAINT FK_Auto_Modelo FOREIGN KEY (auto_modelo_fk) REFERENCES [REGISTROS_EN_FUGA].Modelo_auto(modelo_codigo)

		ALTER TABLE [REGISTROS_EN_FUGA].Automoviles
			ADD CONSTRAINT FK_Auto_Tipo FOREIGN KEY (auto_tipo_fk) REFERENCES [REGISTROS_EN_FUGA].Tipo_auto(tipo_auto_codigo)


	--COMPRA_AUTOM?VIL

		ALTER TABLE [REGISTROS_EN_FUGA].Compra_automovil 
			ADD CONSTRAINT FK_Compra_Auto FOREIGN KEY (compra_auto_fk) REFERENCES [REGISTROS_EN_FUGA].Automoviles(auto_id)

		ALTER TABLE [REGISTROS_EN_FUGA].Compra_automovil 
			ADD CONSTRAINT FK_Compra_Sucursal FOREIGN KEY (compra_sucursal_fk) REFERENCES [REGISTROS_EN_FUGA].Sucursales(sucursal_id)

	--AUTOPARTES
		ALTER TABLE [REGISTROS_EN_FUGA].Autopartes
			ADD CONSTRAINT FK_autoparte_modelo FOREIGN KEY (autoparte_modelo_fk) REFERENCES [REGISTROS_EN_FUGA].Modelo_auto(modelo_codigo)

		ALTER TABLE [REGISTROS_EN_FUGA].Autopartes
			ADD CONSTRAINT FK_autoparte_fabricante FOREIGN KEY (autoparte_fabricante_fk) REFERENCES [REGISTROS_EN_FUGA].Fabricantes(fabricante_id)


	--COMPRA_AUTOPARTE
		ALTER TABLE [REGISTROS_EN_FUGA].Compra_Autoparte 
			ADD CONSTRAINT FK_Compra_Sucursal_cod FOREIGN KEY (compra_sucursal_fk) REFERENCES [REGISTROS_EN_FUGA].Sucursales(sucursal_id)
													  
	--AUTOPARTE_POR_COMPRA
		ALTER TABLE [REGISTROS_EN_FUGA].Autoparte_por_compra
			ADD CONSTRAINT FK_Compra FOREIGN KEY (compra_nro) REFERENCES [REGISTROS_EN_FUGA].Compra_Autoparte(compra_nro)

		ALTER TABLE [REGISTROS_EN_FUGA].Autoparte_por_compra
			ADD CONSTRAINT FK_Autoparte FOREIGN KEY (autoparte_id) REFERENCES [REGISTROS_EN_FUGA].Autopartes(autoparte_codigo)																													 


	--FACTURAS
		ALTER TABLE [REGISTROS_EN_FUGA].Facturas
			ADD CONSTRAINT FK_Cliente FOREIGN KEY (fac_cliente_fk) REFERENCES [REGISTROS_EN_FUGA].Clientes(cliente_id)

		ALTER TABLE [REGISTROS_EN_FUGA].Facturas
			ADD CONSTRAINT FK_Sucursal FOREIGN KEY (fac_sucursal_fk) REFERENCES [REGISTROS_EN_FUGA].Sucursales(sucursal_id)

		ALTER TABLE [REGISTROS_EN_FUGA].Facturas
			ADD CONSTRAINT FK_Sucursal_Compra FOREIGN KEY (fac_sucursal_compra_fk) REFERENCES [REGISTROS_EN_FUGA].Sucursales(sucursal_id)

		ALTER TABLE [REGISTROS_EN_FUGA].Facturas
			ADD CONSTRAINT FK_Auto FOREIGN KEY (fac_auto_fk) REFERENCES [REGISTROS_EN_FUGA].Automoviles(auto_id)


	--AUTOPARTE_POR_VENTA
		ALTER TABLE [REGISTROS_EN_FUGA].Autoparte_por_venta
			ADD CONSTRAINT FK_Autoparte_Venta FOREIGN KEY (autoparte_id) REFERENCES [REGISTROS_EN_FUGA].Autopartes(autoparte_codigo)

		ALTER TABLE [REGISTROS_EN_FUGA].Autoparte_por_venta
			ADD CONSTRAINT FK_Factura FOREIGN KEY (factura_id) REFERENCES [REGISTROS_EN_FUGA].Facturas(factura_nro)

	--STOCK
		ALTER TABLE [REGISTROS_EN_FUGA].Stock
			ADD CONSTRAINT FK_Item_Auto FOREIGN KEY (item_auto_fk) REFERENCES [REGISTROS_EN_FUGA].Automoviles(auto_id)

		ALTER TABLE [REGISTROS_EN_FUGA].Stock
			ADD CONSTRAINT FK_Item_Autoparte FOREIGN KEY (item_autoparte_fk) REFERENCES [REGISTROS_EN_FUGA].Autopartes(autoparte_codigo)

		ALTER TABLE [REGISTROS_EN_FUGA].Stock
			ADD CONSTRAINT FK_Item_Sucursal FOREIGN KEY (item_sucursal_fk) REFERENCES [REGISTROS_EN_FUGA].Sucursales(sucursal_id)



--------------------------------------------------------MIGRACI?N DE DATOS----------------------------------------------------------

	--MIGRACI?N FABRICANTES
	INSERT INTO [REGISTROS_EN_FUGA].Fabricantes SELECT distinct(FABRICANTE_NOMBRE) FROM [GD2C2020].[gd_esquema].[Maestra] order by FABRICANTE_NOMBRE
	
	--MIGRACI?N SUCURSALES
	INSERT INTO [REGISTROS_EN_FUGA].Sucursales SELECT distinct(SUCURSAL_DIRECCION), SUCURSAL_MAIL, SUCURSAL_TELEFONO, SUCURSAL_CIUDAD 
			FROM [GD2C2020].[gd_esquema].[Maestra] WHERE SUCURSAL_DIRECCION IS NOT NULL order by SUCURSAL_DIRECCION

	--MIGRACI?N CLIENTES
		  
	INSERT INTO [REGISTROS_EN_FUGA].Clientes (cli_DNI, cli_nombre, cli_apellido, cli_direccion, cli_fecha_nac, cli_mail) 
	SELECT DISTINCT DNI , NOMBRE, APELLIDO, DIRECCION, FEC_NAC, MAIL FROM (SELECT CLIENTE_DNI AS DNI, CLIENTE_NOMBRE AS NOMBRE, CLIENTE_APELLIDO AS APELLIDO, CLIENTE_DIRECCION AS DIRECCION,  CLIENTE_FECHA_NAC AS FEC_NAC, CLIENTE_MAIL  AS MAIL
			FROM [GD2C2020].[gd_esquema].[Maestra] WHERE CLIENTE_DNI IS NOT NULL
		UNION 
		SELECT M.FAC_CLIENTE_DNI as DNI, M.FAC_CLIENTE_NOMBRE as NOMBRE, M.FAC_CLIENTE_APELLIDO as APELLIDO ,M.FAC_CLIENTE_DIRECCION DIRECCION, M.FAC_CLIENTE_FECHA_NAC AS FEC_NAC, M.FAC_CLIENTE_MAIL as MAIL 
			FROM [GD2C2020].[gd_esquema].[Maestra] M 
			WHERE FAC_CLIENTE_DNI IS NOT NULL) D
	
	--MIGRACIO?N TIPO_CAJA
	INSERT INTO [REGISTROS_EN_FUGA].Tipo_caja 
		select DISTINCT(TIPO_CAJA_CODIGO), TIPO_CAJA_DESC from gd_esquema.Maestra WHERE TIPO_CAJA_CODIGO is not null order by TIPO_CAJA_CODIGO
	

	--MIGRACIO?N TIPO_TRANSMISION
	INSERT INTO [REGISTROS_EN_FUGA].Tipo_transmision
		select DISTINCT(TIPO_TRANSMISION_CODIGO), TIPO_TRANSMISION_DESC from gd_esquema.Maestra WHERE TIPO_TRANSMISION_CODIGO is not null order by TIPO_TRANSMISION_CODIGO
   

	--MIGRACIO?N MODELO_AUTO
	INSERT INTO [REGISTROS_EN_FUGA].Modelo_auto
		select DISTINCT(MODELO_CODIGO),MODELO_NOMBRE,MODELO_POTENCIA,c.TIPO_CAJA_CODIGO,t.TIPO_TRANSMISION_CODIGO 
		from gd_esquema.Maestra m
		JOIN [REGISTROS_EN_FUGA].Tipo_caja c ON m.TIPO_CAJA_CODIGO = c.tipo_caja_codigo
		JOIN [REGISTROS_EN_FUGA].Tipo_transmision t ON m.TIPO_TRANSMISION_CODIGO = t.tipo_transmision_codigo
		order by MODELO_CODIGO

	--MIGRACI�N AUTOPARTES
	INSERT INTO [REGISTROS_EN_FUGA].Autopartes	
		SELECT DISTINCT(AUTO_PARTE_CODIGO), AUTO_PARTE_DESCRIPCION, max(isNull(PRECIO_FACTURADO,0)) precio_facturado, max(isNull(COMPRA_PRECIO,0)) compra_precio, mo.modelo_codigo, f.fabricante_id
		FROM [GD2C2020].[gd_esquema].[Maestra] m
		JOIN [REGISTROS_EN_FUGA].Modelo_auto mo ON m.MODELO_CODIGO = mo.modelo_codigo
		JOIN [REGISTROS_EN_FUGA].Fabricantes f ON m.FABRICANTE_NOMBRE = f.fabricante_nombre
		WHERE AUTO_PARTE_CODIGO IS NOT NULL
		group by AUTO_PARTE_CODIGO, AUTO_PARTE_DESCRIPCION, mo.modelo_codigo, f.fabricante_id
		order by AUTO_PARTE_CODIGO
	GO		

	--MIGRACION MOTORES
	INSERT INTO [REGISTROS_EN_FUGA].Motores
		select DISTINCT(AUTO_NRO_MOTOR), TIPO_MOTOR_CODIGO from gd_esquema.Maestra WHERE AUTO_NRO_MOTOR is not null order by AUTO_NRO_MOTOR
	

	--MIGRACION TIPO_AUTO
	INSERT INTO [REGISTROS_EN_FUGA].Tipo_auto
		select DISTINCT(TIPO_AUTO_CODIGO), TIPO_AUTO_DESC from gd_esquema.Maestra WHERE TIPO_AUTO_CODIGO is not null order by TIPO_AUTO_CODIGO
   

	--MIGRACION COMPRA_AUTOPARTE
    INSERT INTO [REGISTROS_EN_FUGA].Compra_Autoparte
        select DISTINCT(COMPRA_NRO),'ninguna' categoria,s.sucursal_id,COMPRA_FECHA, (select sum(isNull(COMPRA_CANT*compra_precio, 0)) precio_total from gd_esquema.Maestra 
		where COMPRA_NRO = m.COMPRA_NRO) as precio_total
        from gd_esquema.Maestra m
        JOIN [REGISTROS_EN_FUGA].Sucursales s ON m.SUCURSAL_DIRECCION = s.sucursal_direccion
        where AUTO_PARTE_CODIGO is not null
        order by COMPRA_NRO DESC
    GO

	--MIGRACION AUTOPARTE_POR_COMPRA
	INSERT INTO [REGISTROS_EN_FUGA].Autoparte_por_compra
		select DISTINCT(c.compra_nro),a.autoparte_codigo,COMPRA_CANT from gd_esquema.Maestra m
		JOIN [REGISTROS_EN_FUGA].Autopartes a ON m.AUTO_PARTE_CODIGO = a.autoparte_codigo
		JOIN [REGISTROS_EN_FUGA].Compra_Autoparte c ON m.COMPRA_NRO = c.compra_nro
		where c.compra_nro IS NOT NULL and AUTO_PARTE_CODIGO IS NOT NULL
										 
	--MIGRACIÓN AUTOMÓVIL
	INSERT INTO [REGISTROS_EN_FUGA].Automoviles
		SELECT M.AUTO_NRO_CHASIS, M.AUTO_NRO_MOTOR, M.AUTO_PATENTE, M.AUTO_FECHA_ALTA, M.AUTO_CANT_KMS, M.modelo_codigo, (M.COMPRA_PRECIO * 1.2) AS PRECIO, 
	    M.tipo_auto_codigo from [GD2C2020].[gd_esquema].[Maestra] M WHERE M.AUTO_NRO_CHASIS IS NOT NULL AND M.FACTURA_NRO IS NULL ORDER BY AUTO_NRO_CHASIS
	
	--MIGRACIÓN FACTURAS
	INSERT INTO [REGISTROS_EN_FUGA].Facturas SELECT DISTINCT(FACTURA_NRO), FACTURA_FECHA, (SELECT SUM(ISNULL(CANT_FACTURADA,1)*PRECIO_FACTURADO) AS 
    PRECIO FROM [GD2C2020].[gd_esquema].[Maestra] MS WHERE FACTURA_NRO = M.FACTURA_NRO AND PRECIO_FACTURADO IS NOT NULL) AS PRECIO_TOTAL_FACTURADO,
    C.cliente_id, SV.sucursal_id, SC.sucursal_id, A.auto_id
        FROM [GD2C2020].[gd_esquema].[Maestra] M 
        LEFT JOIN [REGISTROS_EN_FUGA].Clientes c on M.FAC_CLIENTE_DNI = C.cli_DNI AND M.FAC_CLIENTE_NOMBRE = C.cli_nombre
        LEFT JOIN [REGISTROS_EN_FUGA].Sucursales SV on M.FAC_SUCURSAL_DIRECCION = SV.sucursal_direccion
        LEFT JOIN [REGISTROS_EN_FUGA].Sucursales SC on M.SUCURSAL_DIRECCION = SC.sucursal_direccion
        LEFT JOIN [REGISTROS_EN_FUGA].Automoviles A on M.AUTO_PATENTE = A.auto_patente
        WHERE FACTURA_NRO IS NOT NULL order by FACTURA_NRO


	--MIGRACIÓN COMPRA_AUTOMÓVIL
	INSERT INTO [REGISTROS_EN_FUGA].Compra_automovil SELECT M.COMPRA_NRO, M.COMPRA_FECHA, A.auto_id, S.sucursal_id
		from gd_esquema.Maestra M 
		INNER JOIN [REGISTROS_EN_FUGA].Automoviles A on M.AUTO_PATENTE = A.auto_patente
		INNER JOIN [REGISTROS_EN_FUGA].Sucursales S on M.FAC_SUCURSAL_DIRECCION = S.sucursal_direccion
		where M.COMPRA_NRO IS NOT NULL and M.FACTURA_NRO IS NOT NULL

	--MIGRACIÓN AUTOPARTE_POR_VENTA
	INSERT INTO [REGISTROS_EN_FUGA].Autoparte_por_venta select M.AUTO_PARTE_CODIGO, M.FACTURA_NRO, M.CANT_FACTURADA
		from gd_esquema.Maestra M WHERE FACTURA_NRO IS NOT NULL AND SUCURSAL_DIRECCION IS NULL
		
	--MIGRACIÓN STOCK
	INSERT INTO [REGISTROS_EN_FUGA].Stock SELECT C.compra_auto_fk, NULL, A.auto_precio * 1.2 , C.compra_sucursal_fk, 1
		from [REGISTROS_EN_FUGA].Compra_automovil C
		LEFT JOIN [REGISTROS_EN_FUGA].Facturas F on C.compra_auto_fk = F.fac_auto_fk and F.fac_auto_fk IS NULL
		INNER JOIN [REGISTROS_EN_FUGA].Automoviles A on C.compra_auto_fk = A.auto_id


	INSERT INTO [REGISTROS_EN_FUGA].Stock SELECT NULL AS AUTO, A.autoparte_codigo, (A.autoparte_precio_compra * 1.2) AS PRECIO_VENTA, NULL AS SUCURSAL
		,((SELECT SUM(ISNULL(AC1.cantidad,0)) FROM [REGISTROS_EN_FUGA].Autoparte_por_compra AC1 where AC1.autoparte_id = A.autoparte_codigo) -
		(SELECT SUM(ISNULL(AV1.cantidad,0)) FROM [REGISTROS_EN_FUGA].Autoparte_por_venta AV1 where AV1.autoparte_id = A.autoparte_codigo)) as CANTIDAD_TOTAL
		from [REGISTROS_EN_FUGA].Autopartes A
		LEFT JOIN [REGISTROS_EN_FUGA].Autoparte_por_compra AC on AC.autoparte_id = autoparte_codigo
		LEFT JOIN [REGISTROS_EN_FUGA].Autoparte_por_venta AV on AV.autoparte_id = autoparte_codigo
		GROUP BY A.autoparte_codigo, A.autoparte_precio_compra 