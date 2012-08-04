<!DOCTYPE html>
<html>
<head>
<title>Hacks</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<?
	require_once('global_lib.php');
?>

<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./css/style.css">

<script src="jquery.min.js" type="text/javascript"></script>
<script src="http://staging.tokbox.com/v0.91/js/TB.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="./bootstrap/js/bootstrap.js"></script>
<script src="./jQuery-webcam/jquery.webcam.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
	$('#SignUp_Modal').modal('hide');
	$('#currentCam').hide();
	$('#playbackCam').hide();

	var recorderManager;
	var recorder;
	var player;
	var recImgData;

	var API_KEY = "17003151";
	//var sessionId = "2_MX4xNzAwMzE1MX5-U2F0IEF1ZyAwNCAwMTo1MjozMiBQRFQgMjAxMn4wLjA1OTA4OTMwM34";
    var TOKEN = "<? echo $_SESSION['token']; ?>";
	
	var VIDEO_HEIGHT = 450;
	var VIDEO_WIDTH = 600;
	
	// Un-comment either of the following to set automatic logging and exception handling.
	// See the exceptionHandler() method below.
	// TB.setLogLevel(TB.DEBUG);
	// TB.addEventListener('exception', exceptionHandler);

	function init() {
		var dimensions = {width: VIDEO_WIDTH, height: VIDEO_HEIGHT};
		recorderManager = TB.initRecorderManager(API_KEY, dimensions);
		createRecorder();
	}

	function createRecorder() {

		recorder = recorderManager.displayRecorder(TOKEN, 'currentCam', { height: VIDEO_HEIGHT, width: VIDEO_WIDTH} );
		recorder.addEventListener('recordingStarted', recStartedHandler);
		recorder.addEventListener('archiveSaved', archiveSavedHandler);
	}

	function createPlayer() {

	}

	function getImg(imgData) {
		var img = document.createElement('img');
		img.setAttribute('src', 'data:image/png;base64,' + imgData);
		return img;
	}

	function loadArchiveInPlayer(archiveId) {
		$('#myTab a[href="#play"]').tab('show');
		//recorderManager.removeRecorder(recorder);
		if (!player) {			
			player = recorderManager.displayPlayer(archiveId, TOKEN, 'playbackCam', { height: VIDEO_HEIGHT, width: VIDEO_WIDTH} );
			
		} else {
			player.loadArchive(archiveId);
		}
	}

	//--------------------------------------
	//  OPENTOK EVENT HANDLERS
	//--------------------------------------

	function recStartedHandler(event) {
		recImgData = recorder.getImgData();
	}
	
	function archiveSavedHandler(event) {
		document.getElementById('archiveList').style.display = 'block';
		var aLink = document.createElement('a');
		aLink.setAttribute('href',
							"javascript:loadArchiveInPlayer(\'" + event.archives[0].archiveId + "\')");
		var recImg = getImg(recImgData);
		recImg.setAttribute('style', 'width:40; height:30; margin-right:2px');
		aLink.appendChild(recImg);
		document.getElementById('rightPanel').appendChild(aLink);
		
		console.log(event.archives[0].archiveId);
	}

	function archiveLoadedHandler(event) {
		archive = event.archives[0];
		archive.startPlayback();
	}

	/*
	If you un-comment the call to TB.addEventListener('exception', exceptionHandler) above, OpenTok calls the
	exceptionHandler() method when exception events occur. You can modify this method to further process exception events.
	If you un-comment the call to TB.setLogLevel(), above, OpenTok automatically displays exception event messages.
	*/
	function exceptionHandler(event) {
		alert('Exception: ' + event.code + '::' + event.message);
	}

</script>

<script type="text/javascript">
	function post_to_url(path, params, method) {
    method = method || "post"; // Set method to post by default, if not specified.

    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);

    for(var key in params) {
        if(params.hasOwnProperty(key)) {
            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", key);
            hiddenField.setAttribute("value", params[key]);

            form.appendChild(hiddenField);
         }
    }

    document.body.appendChild(form);
    form.submit();
	}

</script>
</head>

<body onload="init()">
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container">
				<a class="brand" href="#">
					xstream
				</a>

				<ul class="nav pull-right">
					<li class=""><a href="#"><? echo $_SESSION['username']; ?></a></li>					
					<li class="divider-vertical"></li>
					<li class=""><a href="logout.php">Sign Out</a></li>						
				</ul>
			</div>
		</div>
	</div>
	<div id="camera_panel">
		<div class="row-fluid">
		<div class="span3" id="leftPanel">
			<!--
			<div id="box1" class="box"></div>
			<div id="box2" class="box"></div>
			<div id="box3" class="box"></div>
			-->
		</div>
		<div class="span6" style="">
		<div id="myTab" class="tabbable tabs-below">
	        <div class="tab-content">
	          <div class="tab-pane active" id="record">
	            <div id="currentCam" style="">

				</div>
	          </div>
	          <div class="tab-pane" id="play">
	            <div id="playbackCam" style="height: 450px;">

				</div>			
	          </div>
	        </div>
	        <ul class="nav nav-tabs">
	          <li class="active"><a href="#record" data-toggle="tab">Record</a></li>
	          <li><a href="#play" data-toggle="tab">Play</a></li>
	        </ul>
	      </div>

		</div>
		<div class="span3" id="rightPanel"></div>
		</div>
	</div>
	
	<div id="archiveList" style="height:100px; display:none">
		<p>Recordings (click to play):</p>
	</div>
<!--
<input type="file" accept="image/*;capture=camera">

<div id="camera_panel">
	<div id="camera"></div>
</div>
-->



</body>

</html>

