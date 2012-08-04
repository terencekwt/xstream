<?
	require_once "database.php";
	
	// API Key used to access OpenTok
	$apiKey = '';

	session_name('xstreamLogin');
	//cookies last for two weeks
	session_set_cookie_params(2*7*24*60*60);
	session_start();

	echo $_SESSION['token'];
	
	// Include jQuery
	echo '<script type="text/javascript">';
	echo '<script src="jquery.min.js" type="text/javascript"></script>';
	echo '<script src="http://staging.tokbox.com/v0.91/js/TB.min.js" type="text/javascript" charset="utf-8"></script>';
	echo '</script>';

?>
