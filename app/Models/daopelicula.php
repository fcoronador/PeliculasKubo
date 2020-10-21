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

    public function setPeli($pelicula, $categoria)
    {
        DB::insert('INSERT INTO peliculas (titulo, descrip, duracion, trailer, estreno, img)VALUES (:titulo, :descrip, :duracion, :trailer, :estreno, :img)', $pelicula);

        $peli = DB::select("select max(idpelicula) as currval from peliculas order by idpelicula desc;");
        $id = $peli[0]->currval;
        /* foreach($peli as $item)
        {
            $id = $item->currval;
        } */

        DB::insert('INSERT INTO pelicula_categoria (P_idpelicula, C_idcategoria)
        VALUES (:P_idpelicula, :C_idcategoria)', ['P_idpelicula' => $id, 'C_idcategoria' => $categoria]);
    }
}
