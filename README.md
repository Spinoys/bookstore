bookstore
=========

group 3

Benjamin
Theo
Anna
Ömur
Magnus
Johanna

2014-12-07:

Personaladministreringen ligger i mappen /admin

2014-12-01:
Kunden vill att personalen vid inleverans direkt ska kunna mata in isbn, inköpspris, leveransdatum, antal levererade ex samt hyllplats
MEN ÄVEN
kunna lägga in författare och/eller titel om det nya författare och/eller titlar. Det senare vill kunden ska kunna göras antingen i samma fönster/sida eller att en ny sida visas då man klickar "Skicka!" där man kan lägga in uppgifter om författare och / eller titel.



2014-11-29:
DB modifierad/uppdaterad dock author_id kvar eftersom varje författare är ubik pss varje inleverans, försäljning & bok. Har däremot svårt att se att varje hylla skulle vara unik så de finns därför som kolumn i Book_items.


	Bokhandeln.

En bokhandel behöver ett nytt system för att hålla ordning på sin försäljning.

En boktitel identifieras av ett ISBN-nummer (som är unikt per titel).
Boken har även en titel och en författare.

Böcker har ett s.k. F-pris (priset man köper in dem från förlaget med) och ett försäljningspris. (På försäljningspriset tillkommer dessutom 6% moms.)

Bokhandeln använder inget lager - böcker placeras ut direkt på hyllorna.

Man vill kunna göra följande:

När man tar emot böcker för varje inleverans kunna ange isbn, F-pris, datum för leverans, och hur många ex av en bok som levererats till bokhandeln, samt därefter vilket hylla man placerat boken på (t.ex. H4).

-     Att boken automatiskt ska få ett försäljningspris som är 1,8 x F-pris.
      Men att detta går att ändra manuellt om man vill.

-     När man säljer böcker kunna söka fram en bok på ISBN och ange
       hur många ex man har sålt, samt datum för försäljning.

Få ut rapporter över hur mycket man tjänat på olika titlar, t.ex. per månad, vecka eller år.

-     Ha ett användargränssnitt riktat mot kunder där du kan söka fram en
      bok på ISBN, titel eller författare och där priset alltid visas som
      försäljningspris med moms. Även kunden ska kunna se hur många ex
       som finns inne just nu.

Bokhandeln kontaktar ert utvecklingsteam för att få en prototyp framtagen. De undrar hur de olika gränssnitten ovan skulle kunna se ut.

Prata med kunden.
Skissa på ett gränssnitt med papper och penna.
Ta därefter ett förnyat samtal med kunden.


2014-11-27: Database updated (version 2)
