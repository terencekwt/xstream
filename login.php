<?php
require_once "database.php";

// username and pass sent from form
$username = $_POST['username'];
$pass = $_POST['pass'];

// MySQL injection prevention
$username = mysql_real_escape_string(strtolower($username));
$pass = md5(mysql_real_escape_string($pass));

// Debug
//echo $username."</br>";
//echo $pass."</br>";

// Query to the database for account info
$userQuery =
  "SELECT *
   FROM $user_table
   WHERE username='$username' AND password='$pass'";
$userQuery = mysql_query($userQuery);
$userQuery = mysql_fetch_assoc($userQuery);

//die(var_dump($userQuery));

if($userQuery) { // Login success
  session_start();  // Start session
  
  // Set the session variables
  $_SESSION['username'] = $username;
  $_SESSION['id'] = $userQuery['id'];

  // Redirect the user
  $redirectPath =
    ($_SERVER["HTTP_HOST"] == "localhost") ?
    "location:https://localhost/xstream/record.php" : "location:http://vis.cs.ucdavis.edu/~yus/xstream/record.php";
  header($redirectPath);
}
else {  // Redirect
  $redirectPath =
    ($_SERVER["HTTP_HOST"] == "localhost") ?
    "location:https://localhost/xstream/index.html" : "location:http://vis.cs.ucdavis.edu/~yus/xstream/index.html";
  header($redirectPath+"#fail");
}
?>