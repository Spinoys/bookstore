<strong>Tjena försäljningsmodulen!</strong>
    <h3>Försäljningsformulär</h3>
        <form id="sales" method="post" action="forsalj-input.php">
            <div>
            <label for="isbn">ISBN:</label>
            <input id="isbn" name="isbn" type="text" placeholder="Skriv in ISBN-nummer" maxlength=13 required>
            </div>
            <div>
            <label for="quantity">Antal:</label>
            <input id="sell_qty" name="sell_qty" type="text" placeholder="Skriv in antal sålda exemplar" required>
            </div>
            <div>
            <label for=" ">pris (exkl moms):</label>
            <input id="sell_price" name="sell_price" type="text" placeholder="Skriv in försäljninhgspris eklusive moms" required>
            </div>
            <div class="button">
            <button type="submit">Skicka!</button>
            </div>
            <div><span class="on-error isbn">ISBN: Snälla mata in ett 13-siffrigt ISBN-nummer med bara siffror!</span>
            <span class="on-error fprice">F-pris: Snälla mata in ett pris, enbart siffror!</span></div>
        </form>
        <!-- denna tomma box kommer visa resultatet! -->
        <div id="forsaljning_resultat_ajax">...</div>