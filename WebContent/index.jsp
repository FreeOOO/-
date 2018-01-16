<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/style1.css" rel='stylesheet' type='text/css' />
<style type="text/css">
#hh{
	margin:0 auto;
	width:450px;
}
#footer {
margin-left:450px;
	z-index: 999;
	position: fixed;
	bottom: 0;
	left: 0;
	width: 420px;
	_position: absolute; /* for IE6 */
	_top: expression(documentElement.scrollTop +   
			 documentElement.clientHeight-this.offsetHeight); /* for IE6 */
	overflow: visible;
	text-align: center;
}
</style>
<script type="text/javascript">
	function GetData(data) {
		alert(data);
	}
	function iFrameHeight(id) {
		var ifm = document.getElementById(id);
		var subWeb = document.frames ? document.frames[id].document
				: ifm.contentDocument;
		if (ifm != null && subWeb != null) {
			ifm.height = subWeb.body.scrollHeight;
		}
	}
</script>
</head>
<body>
<div class="header">
		
			<!-- header -->
            
				<!-- logo -->
				<div class="logo">
					<a href="index.jsp"><img src="./images/web1/topbar1.png" title="网易云音乐" /></a>
				</div>
				<!-- logo -->
				<!-- top-nav -->
				<div class="top-nav">
					<span class="menu"> </span>
					<ul>
						<li class="active"><a href="index.jsp">主页<span> </span></a></li>
						<%if(request.getSession().getAttribute("user_name") != null){ %>
						<li><a href="#"><%=request.getSession().getAttribute("user_name").toString() %></a></li>
						<%}else{ %>
						<li><a href="login.jsp">登录</a></li>
						<%} %>
						<li><a href="#">发现音乐</a></li>
						<%if(request.getSession().getAttribute("user_id") == null){ %>
						<li><a href="login.jsp">我的音乐</a></li>
						<%}else{ %>
						<li><a href="getUserFirstList" target="iframepage">我的音乐</a></li>
						<%} %>
						<li><a href="#">朋友</a></li>
						<li><a href="#">下载客户端</a></li>
						<%if(request.getSession().getAttribute("user_id") != null){
						if(request.getSession().getAttribute("user_id").toString().equals("3")){ %>
					<li><a href="uploadMusic.jsp">添加歌曲</a></li>
					<%}} %>
						<div class="clearfix"> </div>
					</ul>
				</div>
				<div class="imageset"> </div>
                
				<!-- top-nav -->
				<!-- script-for-menu -->
				<script>
					$(document).ready(function(){
						$("span.menu").click(function(){
							$(".top-nav ul").slideToggle(200);
						});
					});
				</script>
				<!-- script-for-menu -->
		</div>
			<!-- header -->
	<iframe src="homePage" marginheight="0" marginwidth="0"
		frameborder="0" scrolling="no" width="100%" height=100% title="iframepage"
		id="iframepage" name="iframepage" onLoad="iFrameHeight('iframepage')"></iframe>
	<div id="footer">
		<iframe height="295px" width="420px" border="0" frameborder="0"
			src="audioplayer.jsp" name="bottomFrame" id="bottomFrame"
			title="bottomFrame"></iframe>
	</div>
</body>
</html>