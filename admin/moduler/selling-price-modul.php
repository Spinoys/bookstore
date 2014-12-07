<h3>Formulär för att ändra försäljningspris</h3>
<form id="sellingprice" method="post" action="change-selling-price.php">
    <div class="form-input">
        <label for="isbn">ISBN:</label>
        <input id="isbn" name="isbn" type="text" placeholder="ISBN-nummer" maxlength=13 required>
    </div>
    <div class="form-input">
        <label for="sell_price">Pris:</label>
        <input id="sell_price" name="sell_price" type="text" placeholder="Försäljningspris" required>
    </div>
    <div class="button">
        <button class="black" type="submit">Skicka!</button>
    </div>
    <div>
        <span class="on-error isbn">ISBN: Snälla mata in ett 13-siffrigt ISBN-nummer med bara siffror!</span>
        <!--<span class="on-error fprice">Pris: Snälla mata in ett pris, enbart siffror!</span>-->
    </div>
</form>
<!-- denna tomma box kommer visa resultatet! -->
<div id="sell_price_result_ajax">...</div>
<div id="change-sell-price">Hej</div>