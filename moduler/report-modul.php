    <?php ?>
    <div>
    <h3>Rapportformulär</h3>
    <form id="report" method="post" action="report.php">
        <div class="form-input">
            <label for="isbn">ISBN:</label>
            <input id="isbn" name="isbn" type="text" placeholder="Skriv in ISBN-nummer" maxlength=13 required>
        </div>
        <div class="form-input">
            <label for="title">Titel:</label>
            <input id="title" name="title" type="text" placeholder="Skriv in Titeln på boken" required>
        </div>
        <div class="form-input">
        	<label for="start_date">Startdatum:</label>
			<input id="start_date" name="start_date" type="date" placeholder="yyyy/mm/dd" required>
		</div>
		<div class="form-input">
        	<label for="end_date">Slutdatum:</label>
			<input id="end_date" name="end_date" type="date" placeholder="yyyy/mm/dd" required>
		</div>
        <div class="button">
            <button class="black" type="submit">Skicka!</button>
        </div>
        <div><span class="on-error isbn">ISBN: Snälla mata in ett 13-siffrigt ISBN-nummer med bara siffror!</span>
    </form>
    </div>

    <div id="search-result">
    	<h3>Rapport</h3>
    	<table>
    		<tr>
    			<th>ISBN</th>
    			<th>Title</th>
    			<th>Försäljningspris (i genomsnitt per titel)</th>
    			<th>Inköpspris (i genomsnitt per titel)</th>
    			<th>Antal sålda</th>
    			<th>Försäljningssumma</th>
    			<th>Inköpssumma</th>
    		</tr>
    	</table>
    </div>
