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
?>

<html>
<head>
</head>
<body>
<form method="post">
Update Contract Length : <input type="number" name="contractlength"/><br />
<input type="submit" name="update" value="update record"/>
</form>
</body>
</html>

<?php
if(isset($_POST['update'])) {
$id=$_GET['id'];
$contractlength=$_POST['contractlength'];
if(mysqli_query($conn, "Update Contract Length='".$contractlength."' where id=".$id)){
echo "Record Updated Successfully";
header("Location:displayprof.php");
}
else {
echo "Failed to Update Record";
}
}
?>