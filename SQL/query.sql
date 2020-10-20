select p.*,c.nombre from 
(peliculas p join pelicula_categoria pc on p.idpelicula = pc.P_idpelicula)
left join categorias c on c.idcategoria = pc.C_idcategoria 