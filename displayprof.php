<?php
$servername = "ugrad.bitdegree.ca";
$username = "lauramahmoudhass";
$password = "cjxZWbuN4L";
$dbname = "lauramahmoudhass";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM PROF";
$result = $conn->query($sql);


echo " PROF TABLE <br>  "; 


echo "<table border='1'>
<tr>
<th>ProfID</th>
<th>ProfEmail</th>
<th>ContractLength</th>
<th>CourseID</th>
</tr>";

while($row = mysqli_fetch_array($result))
{
echo "<tr>";
echo "<td>" . $row['PROFID'] . "</td>";
echo "<td>" . $row['PROFEMAIL'] . "</td>";
echo "<td>" . $row['CONTRACTLENGTH'] . "</td>";
echo "<td>" . $row['COURSEID'] . "</td>";
echo "<td><a href='updateprof2.php?id=".$row['CONTRACTLENGTH']."'>Update</td>";


echo "</tr>";
}
echo "</table>";
?>
