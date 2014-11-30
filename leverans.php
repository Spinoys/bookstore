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
    <!-- Main.js here-->
    <!--<script src="js/main.js"></script>-->
</head>

<body>
    <!-- App starts-->
    <header>
        <nav>
            <?php include 'include/nav.html.php'; ?>
        </nav>
    </header>

    <main>
        <h3>Inleveransformulär</h3>
        <form id="deliveries" method="post" action="leverans-input.php">
            <div>
            <label for="isbn">ISBN:</label>
            <input id="isbn" name="isbn" type="text" placeholder="Skriv in ISBN-nummer" maxlength=13 required>
            </div>
            <div>
            <label for="quantity">Antal:</label>
            <input id="quantity" name="quantity" type="text" placeholder="Skriv in antal" required>
            </div>
            <div>
            <label for="fprice">F-pris:</label>
            <input id="fprice" name="fprice" type="text" placeholder="Skriv in Förlags-pris" required>
            </div>
            <div>
            <label for="shelf">Hylla:</label>
            <input id="shelf" name="shelf" type="text" placeholder="Skriv in hyll-placering" required>
            </div>
            <div class="button">
            <button type="submit">Skicka!</button>
            </div>
            <div><span class="on-error isbn">ISBN: Snälla mata in ett 13-siffrigt ISBN-nummer med bara siffror!</span>
            <span class="on-error fprice">F-pris: Snälla mata in ett pris, enbart siffror!</span></div>
        </form>



    </main>

    <footer>
    <p>FooterInfo</p>
    </footer>
    <!-- App ends-->


</body>

</html>
