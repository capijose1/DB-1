<meta charset="utf-8">
<title>
    Administración      
</title>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/estilos.css">
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.bundle.js"></script>
<script src="js/loader.js">     </script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
       var arreglo=[
          ['Task', 'Hours per Day'],
          ['Work',     11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ];
    
      function drawChart() {
       
        var data = google.visualization.arrayToDataTable(arreglo);
        var i=0;
         
        <?php
            $prueb='hasdasdasd'; 
            echo "var options = {
            
            title: '$prueb'
          }; " ?>
        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }

</script>
       
