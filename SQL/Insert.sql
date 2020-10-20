/* Creando peliculas */

INSERT INTO `peliculas` (`titulo`, `descrip`, `duracion`, `trailer`, `estreno`, `img`)
VALUES ('Película1', 'Una descripción llamativa', '1:30:45', 'https://youtu.be/-RSseKOWpEQ', '2018/10/21', 'https://i.imgur.com/Hvw1negs.png');

INSERT INTO `peliculas` (`titulo`, `descrip`, `duracion`, `trailer`, `estreno`, `img`)
VALUES ('Película2', 'Una descripción llamativa', '1:30:45', '	https://youtu.be/u9Mv98Gr5pY', '2018/10/21', 'https://i.imgur.com/3oMB4Xxs.jpg');

INSERT INTO `peliculas` (`titulo`, `descrip`, `duracion`, `trailer`, `estreno`, `img`)
VALUES ('Película3', 'Una descripción llamativa', '1:30:45', 'https://youtu.be/09zP4iK6QuI', '2018/10/21', 'https://i.imgur.com/ilnScv9s.jpg');

/* Creando categorias */


INSERT INTO `categorias` (`nombre`)
VALUES ('accion');

INSERT INTO `categorias` (`nombre`)
VALUES ('superheroes');

INSERT INTO `categorias` (`nombre`)
VALUES ('antiheroes');

/* Creando asociaciones */

INSERT INTO `pelicula_categoria` (`P_idpelicula`, `C_idcategoria`)
VALUES ('1', '1');

INSERT INTO `pelicula_categoria` (`P_idpelicula`, `C_idcategoria`)
VALUES ('1', '2');

INSERT INTO `pelicula_categoria` (`P_idpelicula`, `C_idcategoria`)
VALUES ('2', '1');

INSERT INTO `pelicula_categoria` (`P_idpelicula`, `C_idcategoria`)
VALUES ('2', '3');

INSERT INTO `pelicula_categoria` (`P_idpelicula`, `C_idcategoria`)
VALUES ('3', '1');

INSERT INTO `pelicula_categoria` (`P_idpelicula`, `C_idcategoria`)
VALUES ('3', '3');