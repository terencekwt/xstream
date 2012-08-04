<?php
//require_once "globalVariables.php";
// Global variables to store data
$hostName="localhost";  // name of the host server
$hostName_vis = "vis.cs.ucdavis.edu";
$username="shunyu"; // mysql account name
$password="vis@pass";  // mysql account password
$database="shunyu_xstream_users"; // Our database to connect to
$user_table="user";  // Table for storing account information


// Connecting to mysql
  $connection = mysql_connect($hostName, $username, $password) or die("Cannot connect to SQL");

// Connect to our database
  mysql_select_db($database) or die("Cannot connect database</br>");
?>
