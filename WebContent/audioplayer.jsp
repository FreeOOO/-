<%@page import="java.util.Map"%>
<%@page import="Dao.Music"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>Insert title here</title>
<!-- Insert to your webpage before the </head> -->
<script id="aa" src="audioplayerengine/jquery.js"></script>
<script id="ab" src="audioplayerengine/amazingaudioplayer.js"></script>
<link rel="stylesheet" type="text/css"
	href="audioplayerengine/initaudioplayer-1.css">
<script id="ac" src="audioplayerengine/initaudioplayer-1.js"></script>
<!-- End of head section HTML codes -->
<style type="text/css">
#footer {
	z-index: 999;
	position: fixed;
	bottom: 0;
	left: 0;
	width: 100%;
	_position: absolute; /* for IE6 */
	_top: expression(documentElement.scrollTop +   
			 documentElement.clientHeight-this.offsetHeight); /* for IE6 */
	overflow: visible;
}
</style>
<script type="text/javascript">
	function getmusicid(id) {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("myDiv").innerHTML = xmlhttp.responseText;
				//reloadAbleJSFn('aa','audioplayerengine/jquery.js');
				//reloadAbleJSFn('ab','audioplayerengine/amazingaudioplayer.js');
				//reloadAbleJSFn('ac','audioplayerengine/initaudioplayer-1.js');
				//alert(xmlhttp.responseText.length);
				/* xmlDoc = xmlhttp.responseXML;
				txt = "";
				x = xmlDoc.getElementsByTagName("title");
				for (i = 0; i < x.length; i++) {
					txt = txt + x[i].childNodes[0].nodeValue + "<br />";
				}
				document.getElementById("myDiv").innerHTML = txt; */
			}
		}
		xmlhttp.open("POST", "getMusicListID?musiclistid=" + id, true);
		xmlhttp.send();
	}
</script>
</head>
<body>
	<div style="margin: 12px auto;" id="footer">
		<!-- Insert to your webpage where you want to display the audio player -->
		<div id="amazingaudioplayer-1"
			style="display: block; position: relative; width: 420px; height: auto; margin: 0px auto 0px;">
			<ul class="amazingaudioplayer-audios" style="display: none;">
				<%
					if (request.getAttribute("infomap") != null) {
						Map<String, Music> map = (Map) request.getAttribute("infomap");
						for (Map.Entry<String, Music> m : map.entrySet()) {
				%>
				<li data-artist="" data-title="<%=m.getValue().getName()%>"
					data-album="" data-info="" data-image=""
					data-duration="<%=m.getValue().getTime()%>">
					<div class="amazingaudioplayer-source"
						data-src="<%=m.getValue().getPath()%>" data-type="audio/mpeg" />
				</li>
				<%
					}
					} else {
				%>
				<li data-artist="" data-title="" data-album="Red" data-info=""
					data-image="" data-duration="">
					<div class="amazingaudioplayer-source" data-src=""
						data-type="audio/mpeg" />
				</li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
</body>
</html>