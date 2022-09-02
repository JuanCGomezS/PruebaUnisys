------Crear BD
CREATE DATABASE PruebaPuntoTres 

------Usar BD
USE PruebaPuntoTres 

------Creat tabla Empresa
CREATE table Empresa (
    Empresa_Id bigint PRIMARY KEY IDENTITY (1, 1) NOT NULL,
    Tipo_Identificacion varchar(50) NOT NULL,
    Num_Identificacion bigint NOT NULL,
    Nombre_Empresa varchar(50) NOT NULL,
    Feacha_Constitucion date NOT NULL,
    Direccion varchar(50) NOT NULL,
    Telefono varchar(50) NOT NULL
);

------Crear tabla Cliente
CREATE table Cliente (
    Cliente_Id bigint PRIMARY KEY IDENTITY (1, 1) NOT NULL,
    Tipo_Identificacion varchar(50) NOT NULL,
    Num_Identificacion bigint NOT NULL,
    Nombre varchar(50) NOT NULL,
    Apellido varchar(50) NOT NULL,
    Feacha_Nacimiento date NOT NULL,
    Sexo varchar(20) NOT NULL,
    Direccion varchar(50) NOT NULL,
    Telefono varchar(50) NOT NULL,
);

------Crear tabla Cliente - Empresa
CREATE table Cliente_Empresa (
    Empresa_Id bigint NOT NULL,
    Cliente_Id bigint NOT NULL PRIMARY KEY(Empresa_Id, Cliente_Id),
    CONSTRAINT FK_Cliente_Empresa_Empresa FOREIGN KEY (Empresa_Id) REFERENCES Empresa (Empresa_Id),
    CONSTRAINT FK_Cliente_Empresa_Cliente FOREIGN KEY (Cliente_Id) REFERENCES Cliente (Cliente_Id)
);

------Insertar datos Empresa
INSERT INTO Empresa( Tipo_Identificacion, Num_Identificacion, Nombre_Empresa, Feacha_Constitucion, Direccion, Telefono ) VALUES ( 'Nit', 8002145699, 'Xiaomy', '05/06/1970', 'Calle 10 No. 9 - 78', '3016728456' );
INSERT INTO Empresa( Tipo_Identificacion, Num_Identificacion, Nombre_Empresa, Feacha_Constitucion, Direccion, Telefono ) VALUES ( 'Nit', 5000541587, 'Samsung', '21/12/1968', 'Carrera 56A No. 51 - 81', '3103989702' );
INSERT INTO Empresa( Tipo_Identificacion, Num_Identificacion, Nombre_Empresa, Feacha_Constitucion, Direccion, Telefono ) VALUES ( 'Nit', 2105587856, 'Nokia', '18/09/1979', 'Carrera 54 No. 68 - 80', '3124136982' );
INSERT INTO Empresa( Tipo_Identificacion, Num_Identificacion, Nombre_Empresa, Feacha_Constitucion, Direccion, Telefono ) VALUES ( 'Nit', 7740000545, 'Iphone', '26/08/1988', 'Carrera 8  No. 20 - 59', '3023462443' );

------Insertar datos Cliente
INSERT INTO Cliente( Tipo_Identificacion, Num_Identificacion, Nombre, Apellido, Feacha_Nacimiento, Sexo, Direccion, Telefono ) VALUES ( 'CC', 5656565, 'Andres', 'Cepeda', '12/04/2006', 'Hombre', 'Calle 25 No. 4 - 38 piso 2', '3156419007' );
INSERT INTO Cliente( Tipo_Identificacion, Num_Identificacion, Nombre, Apellido, Feacha_Nacimiento, Sexo, Direccion, Telefono ) VALUES ( 'CC', 873555, 'Ricardo', 'Arjona', '12/04/2003', 'Homber', 'Calle 28 No. 8 - 69 CENTRO', '3217382017' );
INSERT INTO Cliente( Tipo_Identificacion, Num_Identificacion, Nombre, Apellido, Feacha_Nacimiento, Sexo, Direccion, Telefono ) VALUES ( 'CC', 656268, 'Manuel', 'Turiso', '12/03/1899', 'Hombre', 'Carrera 9  No. 7 - 34', '3123978079' );
INSERT INTO Cliente( Tipo_Identificacion, Num_Identificacion, Nombre, Apellido, Feacha_Nacimiento, Sexo, Direccion, Telefono ) VALUES ( 'CC', 52358, 'Natalia', 'Jimenez', '12/03/1969', 'Mujer', 'Calle 20 No. 3 - 22', '3113937857' );

------Insertar datos Cliente - Empresa
INSERT INTO Cliente_Empresa(Empresa_Id, Cliente_Id) VALUES(1, 4)
INSERT INTO Cliente_Empresa(Empresa_Id, Cliente_Id) VALUES(1, 3)
INSERT INTO Cliente_Empresa(Empresa_Id, Cliente_Id) VALUES(2, 2)
INSERT INTO Cliente_Empresa(Empresa_Id, Cliente_Id) VALUES(3, 2)

------Consulta para validar datos
SELECT *
FROM Cliente

SELECT *
FROM Empresa

SELECT *
FROM Cliente_Empresa 

------Borrar clientes No asociados a una empresa
DELETE cli
FROM Cliente AS cli
LEFT JOIN Cliente_Empresa as ce ON cli.Cliente_Id = ce.Cliente_Id
WHERE ce.Cliente_Id IS NULL

------Mostrar clientes asociados a una empresa
SELECT a.Cliente_Id, c.Nombre, c.Apellido, d.Nombre_Empresa
FROM (
        SELECT Cliente_Id
        FROM Cliente_Empresa
        GROUP BY Cliente_Id
        HAVING COUNT(*) = 1
    ) AS a
INNER JOIN Cliente_Empresa AS b ON a.Cliente_Id = b.Cliente_Id
INNER JOIN Cliente AS c ON a.Cliente_Id = c.Cliente_Id
INNER JOIN Empresa AS d ON b.Empresa_Id = d.Empresa_Id

------Total de clientes por empresa (Ordenados)
SELECT DISTINCT cli.Empresa_Id, cli.NumClientes, emp.Nombre_Empresa
FROM (
        SELECT Empresa_Id, COUNT(*) AS NumClientes
        FROM Cliente_Empresa
        GROUP BY Empresa_Id
        HAVING COUNT(*) >= 1
    ) AS cli
INNER JOIN Cliente_Empresa AS ce ON a.Empresa_Id = ce.Empresa_Id
INNER JOIN Empresa AS emp ON ce.Empresa_Id = emp.Empresa_Id
ORDER BY cli.NumClientes DESC

------Clientes menores de 22 años
SELECT ce.Empresa_Id, emp.Nombre_Empresa, cli.Nombre, cli.Apellido, cli.Feacha_Nacimiento
FROM Cliente_Empresa AS ce
INNER JOIN Cliente AS cli ON ce.Cliente_Id = cli.Cliente_Id
INNER JOIN Empresa AS emp ON ce.Empresa_Id = emp.Empresa_Id
WHERE cli.Feacha_Nacimiento > (DATEADD(YEAR, -22, GETDATE()))