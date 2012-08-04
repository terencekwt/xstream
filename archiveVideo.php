<?
	require_once('global_lib.php');
	
	
	$userQuery = "INSERT INTO video (userId, archiveId, filename) VALUES ('" . $_SESSION['id'] . "','" . $_POST['data'] . "','" . $_SESSION['username'] . "')";
	$userQuery = mysql_query($userQuery) or die("Retrieving user information unsuccessful");
	
?>