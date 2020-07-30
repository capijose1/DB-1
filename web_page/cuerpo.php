<?php
$guardar_ventas=$_GET["resumen"];
$guardar_personal=$_GET["personal"];
if ($guardar_personal){
    if ($guardar_personal==1){
        empleados_todos();
    }
    else{
        empleados_algunos($guardar_personal);
        
    }

}

if ($guardar_ventas==1){
    echo "<div id='piechart' style='width: 900px; height: 500px;'></div>";
}
?>
