<?
require_once "global_lib.php";

$id = $_SESSION['id'];
$archiveId = $_POST['archiveId'];


$insertQuery = "INSERT INTO video(userId, archiveId, filename) VALUES('$id', '$archiveId', '$_SESSION[username]')";
$insertQuery = mysql_query($insertQuery);
if($insertQuery)
	echo "Success";
else
	echo "Failed";
?>