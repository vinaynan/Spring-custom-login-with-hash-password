<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Generate Token</title>
<script src="./jquery-ui-1.9.2/js/jquery-1.8.3.js"
	type="text/javascript"></script>
<script type="text/javascript">
	var $j = jQuery.noConflict();
</script>
<script type="text/javascript">
	function logout() {
		document.getElementById("logoutForm").submit();
	}
	function generateToken() {
		var key = $j('#key').val();
		$j.ajax({
			type : 'GET',
			url : "./generateKey",
			data : {
				key : key
			},
			success : function(result) {
				$j("#generatedResult").show();
				$j("#generatedKey").html(result);
			}
		});
	}
</script>
</head>
<body>
	<div>
		<c:url value="/j_spring_security_logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>


		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<h2>
				Welcome : ${pageContext.request.userPrincipal.name} | <a
					href="javascript:logout()"> Logout</a>
			</h2>
		</c:if>
	</div>


	<div>
		<h2>Generate Token</h2>
	</div>
	<div>
		<table>
			<tr>
				<td>Enter Key:</td>
				<td><input type="text" value="key123" name="key" id="key" /></td>
				<td><img src="./images/generate.png" alt="Generate" style="cursor:pointer;"
					onclick="javascript:generateToken()" /></td>
			</tr>
		</table>
	</div>

	<div style="display: none;" id="generatedResult">
		<table>
			<tr>
				<td><h2>Generated Key :</h2></td>
				<td><div id="generatedKey"
						style="color: green; font-size: 24px; font-style: inherit; font: bold;"></div></td>

			</tr>
		</table>
	</div>
</body>
</body>
</html>