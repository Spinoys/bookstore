<?php
$q = intval($_GET['q']);

$con = mysqli_connect('localhost','root','mysql',);
if (!$con) {
  die('Could not connect: ' . mysqli_error($con));
}

mysqli_select_db($con, "bookstore");
$sql="SELECT * FROM current_stock_extended WHERE isbn = '".$q."'";
$result = mysqli_query($con,$sql);

echo "<table border='1'>
<tr>
<th>ISBN</th>
<th>Title</th>
<th>Author: First Name</th>
<th>Author: Last Name</th>
<th>Description</th>
</tr>";

while($row = mysqli_fetch_array($result)) {
  echo "<tr>";
  echo "<td>" . $row['isbn'] . "</td>";
  echo "<td>" . $row['title'] . "</td>";
  echo "<td>" . $row['author_first_name'] . "</td>";
  echo "<td>" . $row['author_last_name'] . "</td>";
  echo "<td>" . $row['description'] . "</td>";
  echo "</tr>";
}
echo "</table>";

mysqli_close($con);
?>
