<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loginFormStyle.css"/>

<div class="wrapper">
	<div class="loginContent d-flex justify-content-center">
		<form method="post" action="login">
			<table class="loginInputTable mb-3">
				<tr class="loginInputGroup">
					<td>
						<label for="customerId" class="mr-4">ID</label>
					</td>
					<td>
						<input type="text" name="customerId" class="form-control" value="">
					</td>
				</tr>
				<tr class="loginInputGroup">
					<td>
						<label for="customerPassword" class="mr-4">Password</label>
					</td>
					<td>
						<input type="password" name="customerPassword" class="form-control" value="">
					</td>
				</tr>
			</table>
			<div class="btnGroup d-flex row">
				<a class="btn btn-sm btn-dark col" href="login">Login</a>
				<a class="joinBtn btn btn-sm col" href="join">Join</a>
			</div>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>