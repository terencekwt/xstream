<?php

$str = file_get_contents("php://input");
file_put_contents("/tmp/upload.jpg", pack("H*", $str));

?>