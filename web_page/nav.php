<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link disabled" href="#">Human recourse</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="index.php?resumen=0&stock=0&personal=0">Home</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="index.php?resumen=1&stock=0&personal=0">Resumen</a>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="index.php?stock=0" data-toggle="dropdown" href="#personal" role="button" aria-haspopup="true" aria-expanded="false" href="index.php?resumen=0&stock=0&personal=0">Personal</a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="index.php?resumen=0&stock=0&personal=1"> Total </a>
        <?php include "function/function.php"; 
          menuItems();
          ?>
      </div>
    </li>    
  </ul>             
</nav>


