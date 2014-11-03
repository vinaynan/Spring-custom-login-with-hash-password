<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Token Generator</title>
<link rel="stylesheet" href="./css/screen.css" type="text/css"
	media="screen" title="default" />
<link rel="stylesheet"
	href="./jquery-ui-1.9.2/css/smoothness/jquery-ui-1.9.2.custom.min.css"
	type="text/css" media="screen" title="default" />
<script src="./jquery-ui-1.9.2/js/jquery-1.8.3.js"
	type="text/javascript"></script>
<script src="./jquery-ui-1.9.2/js/jquery-ui-1.9.2.custom.min.js"
	type="text/javascript"></script>
<style type="text/css">
#login-bg {
	background: url(./images/login_bg.jpg) no-repeat top center;
	height: auto;
}

#loginbox {
	background: url(./images/loginbox_bg.png) no-repeat;
	font-size: 12px;
	height: 212px;
	line-height: 12px;
	padding-top: 60px;
	position: relative;
	width: 508px;
	margin-left: auto;
	margin-right: auto;
}

#login-inner {
	color: #161616;
	font-family: Tahoma;
	font-size: 13px;
	line-height: 12px;
	margin: 0 auto;
	width: 310px;
}

#login-inner label {
	color: #161616;
	cursor: pointer;
	font-family: Tahoma;
	font-weight: bold;
	line-height: 12px;
	padding-left: 10px;
}

.red-left {
	background: url(./images/message_red.gif) top left no-repeat;
	color: #ce2700;
	font-family: Tahoma;
	font-weight: bold;
	padding: 0 0 0 20px;
}

.red-right {
	width: 55px;
}

#message-red {
	margin-bottom: 5px;
}

.submit-login {
	background: url(./images/submit_login.gif) no-repeat;
	border: none;
	cursor: pointer;
	display: block;
	height: 29px;
	text-indent: -3000px;
	width: 73px;
}
</style>
</head>

<body id="login-bg" onload='document.loginForm.username.focus();'>

	<!--  start loginbox -->
	<div id="loginbox">

		<!--  start login-inner -->
		<div id="login-inner">
			<div>
				<h3>Login with Username and Password</h3>
			</div>

			<c:if test="${not empty error}">
				<!--  start message-red -->
				<div id="message-red">
					<table border="0" width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td class="red-left">${error}</td>
							<td class="red-right"><a class="close-red"><img
									src="./images/icon_close_red.gif" alt="" /></a></td>
						</tr>
					</table>
				</div>
				<!--  end message-red -->
			</c:if>
			<c:if test="${not empty msg}">
				<div id="message-red">
					<table border="0" width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td class="red-left">${msg}</td>

						</tr>
					</table>
				</div>
			</c:if>

			<form action="<c:url value='/j_spring_security_check' />"
				method='post'>

				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>User:</td>
						<td><input type='text' name='username' /></td>
					</tr>
					<tr>
						<td>Password:</td>
						<td><input type='password' name='password' /></td>
					</tr>
					<tr>
						<td colspan='1'></td>
						<td align="center"><input type="submit" class="submit-login" /></td>
					</tr>
				</table>

				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />

			</form>
		</div>
	</div>

</body>
</html>