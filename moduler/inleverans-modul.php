    <h3>Inleveransformulär</h3>
        <form id="deliveries" method="post" action="php_application_template1.php">
            <div>
            <label for="isbn">ISBN:</label>
            <input id="isbn" name="isbn" type="text" placeholder="Skriv in ISBN-nummer" maxlength=13 required>
            </div>
            <div>
            <label for="titel">Titel:</label>
            <input id="titel" name="titel" type="text" placeholder="Skriv in Titeln på boken" required>
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
        <!-- denna tomma box kommer visa resultatet! -->
        <div id="inleverans_resultat_ajax">...</div>
