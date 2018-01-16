<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/style2.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
</head>
<body>
	<div class="main">
		<div class="header">
			<h1>上传歌曲</h1>
		</div>
		<p></p>
		<form action="FileUpLoad" enctype="multipart/form-data" method="post" >
			<ul class="left-form">
				<h2>新歌曲:</h2>
				<li><input type="file" id="path" name="path"
					placeholder="本地路径" required /> <!--	<a href="#" class="icon ticker"> </a> -->
					<div class="clear"></div></li>
				<li><input type="text" id="musicname" name="musicname"
					placeholder="歌曲名" required /> <!--	<a href="#" class="icon ticker"> </a> -->
					<div class="clear"></div></li>
				<li><input type="text" id="singlename" name="singlename"
					placeholder="歌手名" required /> <!--	<a href="#" class="icon into"> </a> -->
					<div class="clear"></div></li>
				<li><input type="text" id="time" name="time"
					placeholder="时长(单位:秒)" required /> <!--	<a href="#" class="icon into"> </a> -->
					<div class="clear"></div></li>
				<input type="submit" value="上传歌曲">
				<div class="clear"></div>
			</ul>
			<div class="clear"></div>
		</form>
	</div>
</body>
</html>