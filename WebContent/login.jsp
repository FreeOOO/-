<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/supersized.css">
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
	function login() {
		alert('sad');
		var uname = document.getElementById("username").value;
		var pwd = document.getElementById("password").value;
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("myDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("POST", "getLoginData?username=" + uname + "&password=" + pwd, true);
		xmlhttp.send();
	}
</script>
</head>
<body>

	<div class="page-container">
		<h1>登录(Login)</h1>
		<div id="myDiv"></div>
	<form action="getLoginData" method="post"> 
			<input type="text" id="username" name="username" class="username"
				placeholder="请输入您的用户名！"> <input type="password" id="password"
				name="password" class="password" placeholder="请输入您的用户密码！">
			<!--<input type="Captcha" class="Captcha" name="Captcha" placeholder="请输入验证码！"> -->
			<button type="submit" class="register_button"
				onclick="javascript:location.href=&apos;register.jsp&apos;">注册</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="submit" class="submit_button">登录</button>
			<div class="error">
				<span>+</span>
			</div>
		</form> 
	</div>

	<!-- Javascript -->
	<script src="js/jquery-1.8.2.min.js"></script>
	<script src="js/supersized.3.2.7.min.js"></script>
	<script src="js/supersized-init.js"></script>
	<script src="js/scripts.js"></script>
	<script type="text/javascript">document.getElementById()</script>
	<%
		if (request.getAttribute("msg") != null) {
	%>
	<script type="text/javascript">alert('<%=request.getAttribute("msg")%>')</script>
	<%
		}
	%>
</body>
<div style="text-align: center;">
</html>