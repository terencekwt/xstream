<?php
    require_once 'OpenTokSDK.php';
    require_once 'OpenTokArchive.php';
    require_once 'OpenTokSession.php';

function generate(){
	//change variables here
	$API_KEY = "17003151";
	$APP_SECRET = "69ce0c95e795ed1eb371ac59bb15d2827692bc09";
	//var TOKEN ="T1==cGFydG5lcl9pZD0xNzAwMzE5MiZzaWc9MmI3ZmM2ZTNiYTllNzY4ZDA4MWI2ZTBkMzUxYzdlY2EyNjJmODI4ZTpzZXNzaW9uX2lkPTJfTVg0eE56QXdNekUxTVg1LVUyRjBJRUYxWnlBd05DQXdNVG8xTWpvek1pQlFSRlFnTWpBeE1uNHdMakExT1RBNE9UTXdNMzQmY3JlYXRlX3RpbWU9MTM0NDA3Mzc2OCZleHBpcmVfdGltZT0xMzQ0MTYwMTY4JnJvbGU9bW9kZXJhdG9yJmNvbm5lY3Rpb25fZGF0YT0mbm9uY2U9NDEyMDk4";
	$sessionId = "2_MX4xNzAwMzE1MX5-U2F0IEF1ZyAwNCAwMTo1MjozMiBQRFQgMjAxMn4wLjA1OTA4OTMwM34";

	//creating a connection
	$apiObj = new OpenTokSDK($API_KEY, $APP_SECRET, TRUE);

	/* creating a session, don't need it 
	$session = $apiObj->createSession( $_SERVER["REMOTE_ADDR"] );
	$session = $apiObj->createSession( $_SERVER["REMOTE_ADDR"], array(SessionPropertyConstants::P2P_PREFERENCE=> "enabled") );
  	*/

	$sessionId = '1_MX4xMTQyMTg3Mn5-MjAxMi0wNi0wOCAwMTowNjo1MC40NTMxMzIrMDA6MDB-MC40OTY0OTM3NjIzMjh';
		
	$token = $apiObj->generateToken($sessionId, RoleConstants::MODERATOR, time() + (5*24*60*60), "hello world!" );
	
	return $token;
}
?>
