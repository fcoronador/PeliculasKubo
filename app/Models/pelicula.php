<?php

namespace App\Models;

use App\Models\daopelicula;

class pelicula 
{
    private $dao;

    public function __construct()
    {
        $this->dao = new daopelicula();
    }


    public function getPeliculas()
    {
        
        $index = $this->dao->getPeli();
        $peliculas = [];

        foreach($index as $item)
        {
            if(array_key_exists($item->idpelicula,$peliculas))
            {
                array_push($peliculas[$item->idpelicula]->cate, $item->nombre);
            }
            else{
                $item->cate = [$item->nombre];
                $peliculas[$item->idpelicula]= $item;
            }
        }

        foreach($peliculas as $item)
        {
            unset($item->nombre);
        }

        //dd($peliculas);
        //$index[0]->nuevo = ['cat', 'dog'];
        return $peliculas;
    }

    public function setPeliculas($request)
    {
        $pelicula = [];
        $pelicula['titulo'] = $request->get('titulo');
        $pelicula['descrip'] = $request->get('descrip');
        $pelicula['estreno'] = str_replace('-','/',$request->get('estreno'));
        $pelicula['duracion'] = $request->get('duracion');
        $pelicula['img'] = $request->get('img');
        $pelicula['trailer'] = $request->get('trailer');
        $categoria = $request->get('cate');
        
        $this->dao->setPeli($pelicula, $categoria);

    }



}
