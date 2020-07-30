<?php
    $connection=mysqli_connect('localhost','root','','concesionaria');
    if(!$connection){
        die("No se conecto con la Base de datos".mysqli_error($connection));
    }
    return $connection;
?>