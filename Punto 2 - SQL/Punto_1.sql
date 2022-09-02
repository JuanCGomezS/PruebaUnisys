
------Creacion de BD
CREATE DATABASE PruebaPuntoUno

------Usar BD
USE PruebaPuntoUno 

------Crear Tabla Linea Promo
CREATE table Linea_Promo (
    Linea_Promo_Id bigint PRIMARY KEY IDENTITY (1, 1) NOT NULL,
    Linea_Item bigint NOT NULL,
    Deal bigint NOT NULL,
    Valor float NOT NULL
);

------Crear tabla Descuentos
CREATE table Descuentos (
    Link_Descuento_Id bigint PRIMARY KEY NOT NULL,
    Descripcion varchar(20) NOT NULL
);

------Crear tabla Promo
CREATE table Promo (
    IdPromo bigint PRIMARY KEY IDENTITY (1, 1) NOT NULL,
    Caja bigint NOT NULL,
    Transaccion bigint NOT NULL,
    Link_Descuento_Id bigint NOT NULL,
    Linea_Promo_Id bigint NOT NULL,
    CONSTRAINT FK_Promo_Descuentos FOREIGN KEY (Link_Descuento_Id) REFERENCES Descuentos (Link_Descuento_Id),
    CONSTRAINT FK_Promo_Linea_Promo FOREIGN KEY (Linea_Promo_Id) REFERENCES Linea_Promo (Linea_Promo_Id)
);

------Insertar datos Linea Promo
INSERT INTO Linea_Promo(Linea_Item, Deal, Valor) VALUES (1, 1, 149947);
INSERT INTO Linea_Promo(Linea_Item, Deal, Valor) VALUES (1, 1, 10000);

------Insertar datos Descuentos
INSERT INTO Descuentos(Link_Dscto, Descripcion) VALUES (4321, 'Descuento 10%');
INSERT INTO Descuentos(Link_Dscto, Descripcion) VALUES (1234, '');

------Insertar datos Promo
INSERT INTO Promo(Caja, Transaccion, Link_Dscto, Linea_Promo) VALUES (17, 3333, 1234, 1);
INSERT INTO Promo(Caja, Transaccion, Link_Dscto, Linea_Promo) VALUES (18, 4444, 4321, 2);

------Consulta
SELECT a.Caja,
    a.Transaccion,
    b.Descripcion,
    c.Linea_Item,
    c.Valor,
    c.Deal
FROM Promo AS a
    INNER JOIN Descuentos AS b on a.Link_Dscto = b.Link_Dscto
    INNER JOIN Linea_Promo AS c on a.Linea_Promo = c.Linea_Promo