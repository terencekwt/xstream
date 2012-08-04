<?php
session_start();
session_unset();
session_destroy();


// Redirect to main page
$redirectPath =
  ($_SERVER["HTTP_HOST"] == "localhost") ?
  "location:https://localhost/xstream/index.html" : "location:http://vis.cs.ucdavis.edu/~yus/xstream/index.html";
header($redirectPath);
?>