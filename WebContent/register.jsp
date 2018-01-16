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

<script type="text/javascript">
	function check() {
		var userid = document.getElementById("Username").value;
		var pwd1 = document.getElementById("pwd1").value;
		var pwd2 = document.getElementById("pwd2").value;
		var email = document.getElementById("Email").value;
		if (pwd1 != pwd2) {
			document.getElementById("pwd1").value = "";
			document.getElementById("pwd2").value = "";
			alert("两次密码不匹配");
			return false;
		}
		var rege = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
		if (email.length != 0 && rege.test(email) == false) {
			alert("请输入正确的邮箱地址");
			return false;
		}
		if (userid.length == 0 || email.length == 0 || pwd1.length == 0
				|| pwd2.length == 0) {
			return false;
		}
		var c = document.getElementById("checkdata");
		c.action = "getRegisterData";
		c.submit();
	}
</script>

</head>
<body>
	<div class="main">
		<div class="header">
			<h1>创建一个免费帐户！</h1>
		</div>
		<p></p>
		<form name="checkdata" id="checkdata" method="post">
			<ul class="left-form">
				<h2>新账户:</h2>
				<li><input type="text" id="Username" name="Username"
					placeholder="Username" required /> <!--	<a href="#" class="icon ticker"> </a> -->
					<div class="clear"></div></li>
				<li><input type="text" id="Email" name="Email"
					placeholder="Email" required /> <!--	<a href="#" class="icon ticker"> </a> -->
					<div class="clear"></div></li>
				<li><input type="password" id="pwd1" name="pwd1"
					placeholder="password" required /> <!--	<a href="#" class="icon into"> </a> -->
					<div class="clear"></div></li>
				<li><input type="password" id="pwd2" name="pwd2"
					placeholder="password" required /> <!--	<a href="#" class="icon into"> </a> -->
					<div class="clear"></div></li>
				<input type="button" onClick="check()" value="创建账户">
				<div class="clear"></div>
			</ul>
			<div class="clear"></div>
		</form>
	</div>
	<%
		if (request.getAttribute("msg") != null) {
	%>
	<script type="text/javascript">alert('<%=request.getAttribute("msg")%>')</script>
	<%
		}
	%>
</body>
</html>