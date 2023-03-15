create schema negocio;

use negocio;

# tendra todos los tipos de producto, por ejemplo lacteos, verduras, carnicos, abarrotes, etc
CREATE TABLE tipoProducto(
	tipoProducto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	tipo VARCHAR(30)
);
# tendra el producto como tal, por ejemplo , leche, huevos, bebida, lechuga, etc
CREATE TABLE producto(
	producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombreProducto VARCHAR(30),
	precio INTEGER,
	tipoProducto_id INTEGER,
	FOREIGN KEY (tipoProducto_id) REFERENCES tipoProducto(tipoProducto_id)
);

# tendra a todos los proveedores
CREATE TABLE proveedor(
	proveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombreProveedor VARCHAR(30),
	contacto VARCHAR(15)
);
#tabla relacional , hace la conjuncion entre el producto y el proveedor que lo trae 
CREATE TABLE productoDelProveedor(
	productoDelProveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	producto_id INTEGER,
	proveedor_id INTEGER,
	FOREIGN KEY (producto_id) REFERENCES producto(producto_id),
	FOREIGN KEY (proveedor_id) REFERENCES proveedor(proveedor_id)	
);
# tendra todas las ventas por producto que se hagan, para despues sacar reportes mas facilmente
CREATE TABLE ventasPorProducto(
	venta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	fechaVenta DATE,
	cantidadProducto INTEGER,
	totalVenta INTEGER,
	producto_id INTEGER,
	FOREIGN KEY(producto_id) REFERENCES producto(producto_id)
);
#tendra a todos los clientes que compren en la tienda
CREATE TABLE cliente(
	cliente_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombreCliente varchar(50),
	correo varchar(30)
);
# tendra la boleta por compra realizada 
CREATE TABLE boleta(
	boleta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	fechaBoleta DATE,
	cantidadTotalProductos INTEGER,
	valorTotal INTEGER,
	cliente_id INTEGER,
	FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id)
);



INSERT INTO tipoProducto (tipo) VALUES
("lacteos"),
("Bebestibles"),
("Cecinas"),
("Verduras"),
("Confites");


INSERT INTO proveedor(nombreProveedor,contacto) VALUES
("Esteban Dido","+56988489898"),
("Armando Casas","+56997448899"),
("Elba Zurita","+56977666601"),
("Alan Brito","+56995963742"),
("Aquiles Brinco","+56956892231");

INSERT INTO cliente(nombreCliente,correo) VALUES
("Susana Horia","shoria@gmail.com"),
("Marcia Anna","area69@gmail.com"),
("Mario Neta","pinocho_mario@gmail.com"),
("Elmer Curio","diarioElmer@gmail.com"),
("Elvis Tek","carnitasElvis@gmail.com");

INSERT INTO producto(nombreProducto,precio,tipoProducto_id) VALUES
("Leche",900,1),
("CocaCola 3lt",2500,2),
("Lechuga",700,4),
("Galleta",650,5),
("Jamonada de pavo",2200,3);

INSERT INTO productoDelProveedor(producto_id,proveedor_id) VALUES
(5,1),
(1,3),
(2,5),
(3,2),
(4,4);

INSERT INTO ventasPorProducto (fechaVenta,cantidadProducto,totalVenta,producto_id) VALUES
("2023-03-01",10,9000,1),
("2023-03-01",5,12500,2),
("2023-03-01",3,2100,3),
("2023-03-03",5,3250,4),
("2023-03-03",1,2200,5);

INSERT INTO boleta(fechaBoleta,cantidadTotalProductos,valorTotal,cliente_id) VALUES
("2023-03-01",18,23600,3),
("2023-03-01",7,8500,1),
("2023-03-01",6,1500,5),
("2023-03-03",50,150000,4),
("2023-03-03",15,35000,2);

# 2 CONSULTAS BASICAS

# trae todas las boletas que cumplan con la fecha
select * from boleta
where fechaBoleta = "2023-03-01" ;


# trae a todos los clientes que tengan una a entre medio de su nombre
select * from cliente
where nombreCliente like "%a%";

# ganancias totales anuales 

select sum(valorTotal) as gananciaTotalAnual from boleta
where fechaBoleta between "2023-01-01" and "2023-12-31";
 


# Generar una consulta que una a lo menos 2 tablas (JOIN).

# uno la tabla producto, proveedor y producto del proveedor para que me muestre los productos con el proveedor que corresponde y su contacto
SELECT producto.nombreProducto, producto.precio, tipoProducto.tipo,proveedor.nombreProveedor,proveedor.contacto
from producto join tipoProducto on producto.tipoProducto_id = tipoProducto.tipoProducto_id
join productoDelProveedor on productoDelProveedor.producto_id = producto.producto_id
join proveedor on proveedor.proveedor_id = productoDelProveedor.proveedor_id;










