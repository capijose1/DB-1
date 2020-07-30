<?php

function menuItems(){
    global $connection;
    $query=mysqli_query($connection,"Select * From departamentos");
    $name="";
    while ($row =mysqli_fetch_assoc($query)){
        $name=$row['nombre'];
        echo "<a name='prueba' class='dropdown-item' href='index.php?resumen=0&stock=0&personal={$name}' >{$name} </a> ";
    }
}
function empleados_todos(){
    global $connection;
    $query=mysqli_query($connection,"Select * From empleados");
    inicio_tabla_empleados();
    datos_empleados($query);
    echo "</table>";
}
function empleados_algunos($area){
    global $connection;
    $query=mysqli_query($connection," SELECT a.emp_id, a.nombre, a.apellidos,a.sueldo,a.telefono, a.dni
    FROM empleados a
    JOIN departamentos e on a.dep_id = e.dep_id
    where e.nombre='$area'  ");
    inicio_tabla_empleados();
    datos_empleados($query);
    echo "</table";
    
}
function arreglo(){
    global $connection;
    $query=mysqli_query($connection," SELECT a.nombre
    from empleados a
    JOIN departamentos b on a.dep_id=b.dep_id
    where b.nombre='Ventas'
    ");
   
    while ($row=mysqli_fetch_assoc($query)){
        $arreglo_name[]=$row['nombre'];        
    }
    $i=0;
    while ($i<count($arreglo_name)){
        $name=$arreglo_name[$i];
        $query=mysqli_query($connection," SELECT count(a.emp_id)
        from detalles_de_facturas a
        join empleados b on a.emp_id=b.emp_id
        where b.nombre='{$name}' ");
        $row=mysqli_fetch_assoc($query);
        $arreglo_contar[]=$row['count(a.emp_id)'];
        $i++;
    } 
    $i=0;
    while ($i<count($arreglo_contar)){
        $arreglo_fina[]=[$arreglo_name[$i] , $arreglo_contar[$i]];
        $i++;
    }
    echo $arreglo_contar;
    return $arreglo_contar;
}
    
function inicio_tabla_empleados(){
    echo "
        <table aling='center' class='table'>
            <thead align='center' class='thead-dark'>
            <tr>
                <th align='center' > Id </th>
                <th align='center' > Nombre </th>
                <th> Apellido </th>
                <th> Telefono </th>
                <th> Sueldo </th>
                <th> Empleado </th>
            </th>
            </thead> 
    ";
}
function datos_empleados($query){
    while ($row=mysqli_fetch_assoc($query)){
        $name=$row['nombre'];
        $id=$row['emp_id'];
        $apellido=$row['apellidos'];
        $telefono=$row['telefono'];
        $sueldo=$row['sueldo'];
        $dni=$row['dni'];
        echo "
            <tr>
                <td align='center' valing='middle' scope='row'> $id </td>
                <td align='center' valing='middle'> $name </th>
                <td align='center' valing='middle'> $apellido </th>
                <td align='center' valing='middle'> $telefono </th>
                <td align='center' valing='middle'> $sueldo </th>
                <td align='center' valing='middle'> <img src='imagenes/$dni.jpg' width='100' height='100' class='img-fluid' alt='Responsive image'> </th>
            </tr>
    ";
    }
}




