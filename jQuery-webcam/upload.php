<?php

//$str = file_get_contents("php://input");
//file_put_contents("./tmp/upload.jpg", $str);
$str = $_POST["hi"];
file_put_contents("./tmp/upload.txt", $str);
file_put_contents("./tmp/upload.jpg", pack("H*", $str));

?>
