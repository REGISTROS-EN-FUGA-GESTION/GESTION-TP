USE GD2C2020
GO

CREATE SCHEMA [REGISTROS_EN_FUGA]
GO

-- CREACIÓN DE TABLAS

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
		autoparte_precio_facturado decimal(18) not null, --acá no sé si está bien el tipo
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

	--TIPO_TRANSMISIÓN
		create table [REGISTROS_EN_FUGA].Tipo_transmision(
		tipo_transmision_codigo decimal(18) primary key not null,
		tipo_transmision_desc nvarchar(255) not null
		)

	--MOTORES
		create table [REGISTROS_EN_FUGA].Motores(
		motor_nro int primary key identity, --NO ME ACUERDO DE DONDE SACABAMOS ESTE NUMERO
		tipo_motor decimal(18) not null
		)
	
	--AUTOMÓVILES
	--COMPRA_AUTOMÓVIL
	--COMPRA_AUTOPARTE
	--AUTO_MODELOS
	--FACTURAS
	--AUTOPARTE_POR_VENTA
	--STOCK