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
	
	--MODELO_AUTO
		create table [REGISTROS_EN_FUGA].Modelo_auto(
		modelo_codigo			   decimal(18)  primary key,
		modelo_nombre			   nvarchar(255) not null,
		modelo_potencia			   decimal(18)   not null,
		modelo_tipo_caja_fk        decimal(18) not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Tipo_caja(tipo_caja_codigo),
		modelo_tipo_transmision_fk decimal(18) not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Tipo_transmision(tipo_transmision_codigo)
		)

	--AUTOMÓVILES
		create table [REGISTROS_EN_FUGA].Automoviles(
		auto_id			int primary key identity,
		auto_nro_chasis nvarchar(50) not null,
		auto_nro_motor  nvarchar(50) not null,
		auto_patente    nvarchar(50) not null,
		auto_fecha_alta datetime2(3) not null,
		auto_cant_kms   decimal(18)  not null,
		auto_modelo_fk  decimal(18)  not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Modelo_auto(modelo_codigo),
		auto_precio		decimal(18)  not null, --NO SÉ SI ESTÁ BIEN EL TIPO
		auto_tipo_fk    decimal(18)  not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Tipo_auto(tipo_auto_codigo)
		)

	--COMPRA_AUTOMÓVIL
		create table [REGISTROS_EN_FUGA].Compra_automovil(
		compra_nro		   decimal(18)  primary key,
		compra_fecha	   datetime2(3) not null,
		compra_auto_fk     int          not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Automoviles(auto_id),
		compra_sucursal_fk int			not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Sucursales(sucursal_id)
		)

	--COMPRA_AUTOPARTE
		create table [REGISTROS_EN_FUGA].Compra_Autoparte(
		compra_nro		   decimal(18) primary key,
		autoparte_cod_fk   decimal(18) not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Autopartes(autoparte_codigo),
		categoria		   nvarchar(255), --PROVISORIAMENTE CREO QUE ES STRING Y NULO PORQUE NO TENEMOS DATOS
		auto_modelo_fk     decimal(18) not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Modelo_auto(modelo_codigo),
		compra_sucursal_fk int		   not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Sucursales(sucursal_id),
		fabricante_fk	   int         not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Fabricantes(fabricante_id),
		compra_fecha	   datetime2(3)  not null,
		compra_precio      decimal(18,2) not null,
		compra_cantidad	   decimal(18)	 not null
		)

	--FACTURAS
		create table [REGISTROS_EN_FUGA].Facturas(
		factura_nro			decimal(18)  primary key,
		fac_fecha	        datetime2(3) not null,
		fac_precio_total_facturado decimal(18) not null, --NO SE SI ESTA BIEN EL TIPO
		fac_cliente_fk         int not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Clientes(cliente_id),
		fac_sucursal_fk	       int not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Sucursales(sucursal_id),
		fac_sucursal_compra_fk int not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Sucursales(sucursal_id),
		fac_auto_fk			   int not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Automoviles(auto_id)
		)

	--AUTOPARTE_POR_VENTA
		create table [REGISTROS_EN_FUGA].Autoparte_por_venta(
		autoparte_id decimal(18) not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Autopartes(autoparte_codigo),
		factura_id	 decimal(18) not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Facturas(factura_nro),
		cantidad     int         not null 
		)

	--STOCK
		create table [REGISTROS_EN_FUGA].Stock(
		item_id		      decimal(18) primary key identity,
		item_auto_fk      int         not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Automoviles(auto_id),
		item_autoparte_fk decimal(18) not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Autopartes(autoparte_codigo),
		item_precio_venta decimal(18) not null, --no toy segura de type
		item_sucursal_fk  int		  not null FOREIGN KEY REFERENCES [REGISTROS_EN_FUGA].Sucursales(sucursal_id)
		)