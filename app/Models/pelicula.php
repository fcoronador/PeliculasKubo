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
        return $this->dao->getPeli();
    }



}
