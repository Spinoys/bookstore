<h3>Formulär för att ändra försäljningspris</h3>
<form id="sell_price_form" method="post" action="price-input.php">
    <div class="form-input">
        <label for="isbn">ISBN:</label>
        <input id="isbn" name="isbn" type="text" placeholder="ISBN-nummer" maxlength=13 required>
    </div>
    <div>
        <label for="sell_price">Pris:</label>
        <input id="sell_price" name="sell_price" type="text" placeholder="försäljningspris" required>
    </div>
    <div class="button">
        <button class="black" type="submit">Skicka!</button>
    </div>
    <div>
        <span class="on-error isbn">ISBN: Snälla mata in ett 13-siffrigt ISBN-nummer med bara siffror!</span>
        <span class="on-error fprice">Pris: Snälla mata in ett pris, enbart siffror!</span>
    </div>
</form>
<!-- denna tomma box kommer visa resultatet! -->
<div id="sell_price_result_ajax">...</div>