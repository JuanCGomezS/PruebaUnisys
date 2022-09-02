------Crear BD
CREATE DATABASE PruebaPuntoDos 

------Usar BD
USE PruebaPuntoDos 

------Crear Tabla Números
CREATE TABLE numeros(
    numero bigint NOT NULL,
    cuadrado bigint,
    cubo bigint,
    PRIMARY KEY (numero)
);

------Crear Trigger
CREATE trigger Trigger_calcular on numeros
after
INSERT,

UPDATE as begin
declare @cuadrado as bigint
declare @cubo as bigint
declare @num as bigint

SET @num = ( select numero from inserted )
SET @cuadrado = @num * @num
SET @cubo = @num * @num * @num

UPDATE numeros
SET cuadrado = @cuadrado,
    cubo = @cubo
WHERE numero like @num
END

INSERT INTO numeros(numero) VALUES (2);

UPDATE numeros
SET numero = 10
WHERE numero = 5

SELECT *
FROM numeros