<?php // include 'main_application.php';?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Bookstore</title>
    <meta name="description" content="Awesome bookstore">
    <link rel="stylesheet" href="css/meyer-reset.css">
    <!-- main.css-->
    <link rel="stylesheet" href="css/main.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <!-- jQuery fallback om jQuery inte kan laddas om google ligger nere eller är bannat i ett land kör vi jQuery från vår server måste vara i vanilla js! -->
    <script>window.jQuery || document.write('<script src="js/jquery-1.10.2.min.js"><\/script>')</script>



</head>

<body>
    <!-- App starts-->
    <header>
        <nav>
            <!-- Nav i now back in here cause we don't need to have it in an other file-->
            <ul id="mainNav">
                <li><a href="#" id="start" class="active">Start</a></li>
                <li><a href="#" id="inleverans">Inleverans</a></li>
                <!--<li><a href="#" id="forsaljning">Försäljning</a></li>
                <li><a href="#" id="report">Rapporter</a></li>
                <li><a href="#" id="sell_price">Ändra försäljningspris</a></li>-->
            </ul>
        </nav>
    </header>

<main>
    <div id="start-modul" class="modul">
        <?php include 'moduler/start-modul.php'; ?>
    </div>
    <div id="inleverans-modul" class="modul">
        <?php include 'moduler/inleverans-modul.php'; ?>
    </div>
    <div id="forsaljning-modul" class="modul">
        <?php include 'moduler/forsaljning-modul.php'; ?>
    </div>
    <div id="selling-price-modul" class="modul">
        <?php include 'moduler/selling-price-modul.php'; ?>
    </div>
    <div id="report-modul" class="modul">
        <?php include 'moduler/report-modul.php'; ?>
    </div>
</main>

<footer>

</footer>
<!-- App ends-->

<!-- Module JS -->
<script src="js/moduler/inleverans-modul.js"></script>
<!-- Module JS -->
<script src="js/moduler/forsaljning-modul.js"></script>
<!-- Module JS -->
<script src="js/moduler/selling-price-modul.js"></script>
<!-- Module JS -->
<script src="js/moduler/report-modul.js"></script>

<!-- This js have to be here and will not work in the header -->
<script src="js/tab_handler.js"></script>

</body>

</html>
