<!DOCTYPE html>
<html>
<head>
<title>Hacks</title>
</head>

<body>

<!--
<input type="file" accept="image/*;capture=camera">
-->
<div id="camera"></div>
<div id="cams"></div>
<div id="flash"></div>
<canvas id="canvas" height="240" width="320"></canvas>

<p style="width:360px;text-align:center;font-size:12px"><a href="javascript:webcam.capture(3);void(0);">Take a picture after 3 seconds</a> | <a href="javascript:webcam.capture();void(0);">Take a picture instantly</a></p>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="./jQuery-webcam/jquery.webcam.js" type="text/javascript"></script>
<script type="text/javascript">

var pos = 0;
var ctx = null;
var cam = null;
var image = null;


$("#camera").webcam({
	width: 320,
	height: 240,
	mode: "callback",
	swffile: "./jQuery-webcam/jscam_canvas_only.swf",
	onTick: function() {},
	onSave: function(data) {
		var col = data.split(";");
		var img = image;

		for(var i = 0; i < 320; i++) {
			var tmp = parseInt(col[i]);
			img.data[pos + 0] = (tmp >> 16) & 0xff;
			img.data[pos + 1] = (tmp >> 8) & 0xff;
			img.data[pos + 2] = tmp & 0xff;
			img.data[pos + 3] = 0xff;
			pos+= 4;
		}

		if (pos >= 4 * 320 * 240) {
			ctx.putImageData(img, 0, 0);
			pos = 0;
		}
/*		
		var canvas = document.getElementById("canvas");

	if (canvas.getContext) {
		ctx = document.getElementById("canvas").getContext("2d");
		ctx.clearRect(0, 0, 320, 240);

		var img = new Image();
		img.src = "";
		img.onload = function() {
			ctx.drawImage(img, 129, 89);
		}
		image = ctx.getImageData(0, 0, 320, 240);
	}
*/
	},
	onCapture: function() {
		$("#flash").css("display", "block");
		$("#flash").fadeOut("fast", function () {
			$("#flash").css("opacity", 1);
		});
		webcam.save();
	},
	debug: function() {},
	onLoad: function() {
		var cams = webcam.getCameraList();
		for(var i in cams) {
			jQuery("#cams").append("<li>" + cams[i] + "</li>");
		}
    }
	
});

window.addEventListener("load", function() {

	//jQuery("body").append("<div id=\"flash\"></div>");

	var canvas = document.getElementById("canvas");

	if (canvas.getContext) {
		ctx = document.getElementById("canvas").getContext("2d");
		ctx.clearRect(0, 0, 320, 240);

		var img = new Image();
		img.src = "";
		img.onload = function() {
			ctx.drawImage(img, 129, 89);
		}
		image = ctx.getImageData(0, 0, 320, 240);
	}

	//var pageSize = getPageSize();
	//jQuery("#flash").css({ height:"500px" });

}, false);

</script>
</body>

</html>


