<?php
require_once "database.php";
require_once "Opentok-PHP-SDK/generate.php";

$name = mysql_real_escape_string($_POST['name']);
$pass = md5(mysql_real_escape_string($_POST['pass']));
$rpass = md5(mysql_real_escape_string($_POST['rpass']));
$username = mysql_real_escape_string(strtolower($_POST['username']));
$email = mysql_real_escape_string($_POST['email']);

$userQuery =
  "SELECT *
   FROM $user_table
   WHERE username='$username'";
$userQuery = mysql_query($userQuery);
$count = mysql_num_rows($userQuery);
$token = generate();

if($count == 0) {
  $userInsertQuery =
    "INSERT INTO $user_table(id, username, password, name, email, token)
    VALUES(NULL, '$username', '$pass', '$username', '$email', '$token')";
  //die($connection);
  $userInsertQuery = mysql_query($userInsertQuery) or die("Register unsuccessful");

  if($userInsertQuery) {
    $userQuery = "SELECT * FROM $user_table WHERE username='$username' and password='$pass'";
    $userQuery = mysql_query($userQuery) or die("Retrieving user information unsuccessful");
    $userQuery = mysql_fetch_assoc($userQuery);
    
    session_start();
    $_SESSION['username'] = $username;
    $_SESSION['id'] = $userQuery['id'];
    $_SESSION['name'] = $name;

    $redirectPath =
      ($_SERVER["HTTP_HOST"] == "localhost") ?
      "location:https://localhost/xstream/record.php" : "location:http://vis.cs.ucdavis.edu/~yus/xstream/record.php";
    header($redirectPath);
  }
}
else {
  //die("You got here!");
  $redirectPath =
    ($_SERVER["HTTP_HOST"] == "localhost") ?
    "location:https://localhost/xstream/index.html" : "location:http://vis.cs.ucdavis.edu/~yus/xstream/index.html";
  header($redirectPath);
}


?>
