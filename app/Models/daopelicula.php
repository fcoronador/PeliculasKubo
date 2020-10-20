<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;


class daopelicula
{

    private $query = "select p.*,c.nombre from 
    (peliculas p join pelicula_categoria pc on p.idpelicula = pc.P_idpelicula)
    left join categorias c on c.idcategoria = pc.C_idcategoria";


    public function getPeli()
    {
        $peliculas = DB::select($this->query);
        return $peliculas;
    }
}
