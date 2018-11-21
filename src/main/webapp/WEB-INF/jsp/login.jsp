<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>纺织物料</title>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <script src="js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="css/login.css">
    <script src="js/layui.js"></script>
    <link rel="stylesheet" href="plugins/layui/css/layui_login.css" /> 
    <link rel="icon" type="image/png" href="images/flag.jpg">
</head>

<body>
    <h1>物料登录</h1>
    <div class="container w3">
        <h2>现在登录</h2>
		<form  method="post" id="formlogin" onsubmit="return false;">
			<div class="username">
				<span class="username" style="height:19px">用户:</span>
				<input type="text" name="name" class="name" placeholder="" required="" id="loginname">
				<div class="clear"></div>
			</div>
			<div class="password-agileits">
				<span class="username"style="height:19px">密码:</span>
				<input type="password" name="password" class="password" placeholder="" required="">
				<div class="clear"></div>
			</div>
			<div class="login-w3">
					<input type="submit" class="login" value="Login" id="loginsubmit">
			</div>
			<div class="clear"></div>
		</form>
	</div>
	<script src="js/layer.js"></script>	
	<script src="js/login.js"></script>
	<div class="footer-w3l">
		<p>物料登录系统</p>
	</div>
</body>
</html>