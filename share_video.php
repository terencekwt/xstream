<?
require_once "global_lib.php";

$id = $_SESSION['id'];
$archiveId = $_POST['archiveId'];
$sharepersonUsername = $_POST['sharepersonUsername'];
$filename = $_POST['filename'];
$comments = $_POST['comments'];
/*
$id = $_GET['id'];
$archiveId = $_GET['archiveId'];
$sharepersonUsername = $_GET['sharepersonUsername'];*/


$sharepersonQuery = "SELECT id FROM user WHERE username='$sharepersonUsername'";
$sharepersonQuery = mysql_query($sharepersonQuery);
$sharepersonQuery = mysql_fetch_assoc($sharepersonQuery);

$sharepersonId = $sharepersonQuery['id'];

$videoIdQuery = "SELECT id FROM video WHERE userId='$id' AND archiveId='$archiveId'";
$videoIdQuery = mysql_query($videoIdQuery);
$videoIdQuery = mysql_fetch_assoc($videoIdQuery);

$videoId = $videoIdQuery['id'];


$insertQuery = "INSERT INTO share(userId, videoId, sharepersonId) VALUES('$id', '$videoId', '$sharepersonId')";
$insertQuery = mysql_query($insertQuery);

$updateQuery = "UPDATE video
				SET comment = '$comments', filename = '$filename', username = '$_SESSION[username]'
				WHERE archiveId = '$archiveId'";
$updateQuery = mysql_query($updateQuery);
?>