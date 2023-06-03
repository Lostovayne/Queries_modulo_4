-- Active: 1684982784502@@127.0.0.1@3306@otro_mundo2

CREATE USER 'otro_mundo2'@'127.0.0.1' IDENTIFIED BY 'otro_mundo2';
GRANT ALL PRIVILEGES ON OTRO_MUNDO.* TO 'otro_mundo2'@'127.0.0.1';

CREATE DATABASE OTRO_MUNDO2;

CREATE TABLE USUARIO_INACTIVO (
ID_USUARIO_INACTIVO INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(100) NOT NULL,
APELLIDO VARCHAR(100) NOT NULL,
CORREO VARCHAR(100) NOT NULL,
TELEFONO VARCHAR(100) NOT NULL,
GENERO VARCHAR(100) NOT NULL
);

CREATE TABLE USUARIO_ESPECIAL (
ID_USUARIO_ESPECIAL INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(100) NOT NULL,
APELLIDO VARCHAR(100) NOT NULL,
CORREO VARCHAR(100) NOT NULL,
TELEFONO VARCHAR(100) NOT NULL,
GENERO VARCHAR(100) NOT NULL
);

INSERT INTO USUARIO_INACTIVO (NOMBRE, APELLIDO, CORREO, TELEFONO, GENERO)
VALUES ('Juan', 'Perez', 'Juan@gmail', '123456789', 'Masculino'),
('felipe', 'Perez', 'felipe@gmail', '123456789', 'Masculino'),
('cristian', 'Perez', 'cristian@gmail', '54545487', 'Masculino'),
('maria', 'Perez', 'maria@gmail', '65654874', 'Femenino'),
('pepito', 'Perez', 'pepito@gmail', '87878787', 'undefined');


-- CREA UNA TRANSACCION DE 3 USUARIOS DE LA TABLA USUARIO_INACTIVO A USUARIO_ESPECIAL

SET AUTOCOMMIT=0;

START TRANSACTION;
INSERT INTO USUARIO_ESPECIAL (NOMBRE, APELLIDO, CORREO, TELEFONO, GENERO)
SELECT NOMBRE, APELLIDO, CORREO, TELEFONO, GENERO FROM USUARIO_INACTIVO WHERE ID_USUARIO_INACTIVO IN (1, 2, 3);
-- DELETE FROM USUARIO_INACTIVO WHERE ID_USUARIO_INACTIVO IN (1, 2, 3) NO LO ELIMINAMOS PARA LAS PRUEBAS DE JUAN;
ROLLBACK;
INSERT INTO USUARIO_ESPECIAL (NOMBRE, APELLIDO, CORREO, TELEFONO, GENERO)
SELECT NOMBRE, APELLIDO, CORREO, TELEFONO, GENERO FROM USUARIO_INACTIVO WHERE ID_USUARIO_INACTIVO IN (1, 2);
COMMIT;


-- PARTE TEORICA CREADA OBVIAMENTE SIN USAR UNA IA , TODO PLENAMENTE CONOCIMIENTO ORGANICO , NO NOS GUSTA LO ARTIFICIAL.


-- - ¿Qué es una transacción en MySql? Definalo y escriba un ejemplo.

    -- Una transacción en MySQL es una secuencia de operaciones que se realizan como una sola unidad lógica e indivisible de trabajo. Esto significa que las operaciones en una transacción se ejecutan como una sola entidad, como si fueran una sola operación, y todas deben completarse correctamente para que la transacción se considere exitosa. Si una de las operaciones falla, la transacción se revierte a su estado anterior y se deshacen todos los cambios realizados.
        
    START TRANSACTION;
    UPDATE cuentas SET saldo = saldo - 100 WHERE id_cuenta = 1;
    UPDATE cuentas SET saldo = saldo + 100 WHERE id_cuenta = 2;
    COMMIT;

    
-- - Qué beneficios tiene para la consistencia de los datos, ejecutar transacciones.
        -- Permite la permanencia y la coherencia entre los datos, evitando asi conflictos entre ellos y mejorando el orden

-- - ¿Qué propiedades tienen las transacciones? Definirlas.

        -- Ejecutar transacciones en MySQL tiene varios beneficios para la consistencia de los datos:

        -- Atomicidad: Las transacciones en MySQL son atómicas, lo que significa que todas las operaciones dentro de una transacción se ejecutan como una sola entidad lógica e indivisible. Esto garantiza que todas las operaciones se completen con éxito o que se deshagan todas las operaciones si alguna falla, evitando así inconsistencias en la base de datos.

        -- Consistencia: Las transacciones en MySQL garantizan la consistencia de los datos, ya que todas las operaciones dentro de una transacción se ejecutan como una sola entidad y deben cumplir con las restricciones de integridad referencial y las reglas de validación de datos. Esto evita que se produzcan cambios en la base de datos que puedan dejarla en un estado inconsistente.

        -- Aislamiento: Las transacciones en MySQL ofrecen un nivel de aislamiento que garantiza que las operaciones no se vean afectadas por otras operaciones que se estén realizando en el mismo momento. Esto evita que se produzcan errores de concurrencia o conflictos que puedan afectar la integridad de los datos.

        -- Durabilidad: Las transacciones en MySQL garantizan la durabilidad de los datos, ya que todas las operaciones confirmadas en una transacción se aplican de manera permanente en la base de datos, incluso en caso de fallo del sistema o del hardware.

        -- En resumen, ejecutar transacciones en MySQL ayuda a garantizar la integridad y la consistencia de los datos, lo que es esencial para el correcto funcionamiento de cualquier aplicación que utilice una base de datos.

-- - Qué utilidades tienen las sentencias START TRANSACTION, COMMIT y ROLLBACK.

        -- Las sentencias START TRANSACTION, COMMIT y ROLLBACK tienen las siguientes utilidades:

        -- START TRANSACTION: Esta sentencia se utiliza para iniciar una transacción en MySQL. Una transacción es una secuencia de operaciones que se realizan como una sola unidad lógica e indivisible de trabajo. La sentencia START TRANSACTION indica el inicio de una transacción, y todas las operaciones que se ejecuten a partir de ese momento se consideran parte de la transacción.

        -- COMMIT: Esta sentencia se utiliza para confirmar una transacción en MySQL. La sentencia COMMIT indica que todas las operaciones realizadas dentro de una transacción se han completado con éxito y que los cambios se deben aplicar de manera permanente en la base de datos.

        -- ROLLBACK: Esta sentencia se utiliza para deshacer una transacción en MySQL. La sentencia ROLLBACK indica que se deben deshacer todas las operaciones realizadas dentro de una transacción y que se debe volver a un estado anterior de la base de datos.

        -- En resumen, las sentencias START TRANSACTION, COMMIT y ROLLBACK se utilizan en conjunto para garantizar la integridad y la consistencia de los datos en MySQL. La sentencia START TRANSACTION inicia una transacción, la sentencia COMMIT confirma los cambios realizados dentro de la transacción, y la sentencia ROLLBACK deshace los cambios realizados en caso de fallo o error en la transacción.


-- - En términos de sintaxis ¿Cuándo finaliza una transacción?

        -- En MySQL, una transacción finaliza cuando se ejecuta una de las siguientes sentencias:

        -- COMMIT: La sentencia COMMIT confirma una transacción y aplica todos los cambios realizados dentro de la transacción de manera permanente en la base de datos.

        -- ROLLBACK: La sentencia ROLLBACK deshace una transacción y revierte todos los cambios realizados dentro de la transacción, dejando la base de datos en el estado anterior a la transacción.

        -- Se cierra la conexión a la base de datos: Si la conexión a la base de datos se cierra antes de que se ejecute una sentencia COMMIT o ROLLBACK, la transacción se revierte automáticamente y se deshacen todos los cambios realizados dentro de la transacción.

        -- Es importante tener en cuenta que las sentencias START TRANSACTION y BEGIN son equivalentes y se utilizan para iniciar una transacción en MySQL, pero no finalizan la transacción. Para finalizar una transacción, es necesario ejecutar una de las sentencias mencionadas anteriormente.