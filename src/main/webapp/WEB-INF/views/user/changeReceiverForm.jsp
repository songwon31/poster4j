<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/images/poster4j.ico" type="image/x-icon">
		<title>poster4j</title>
		
		<!-- BootStrap을 사용하기 위한 외부 라이브러리 가져오기 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<script>
			function chooseReceiver(receiverId) {
				window.opener.postMessage(receiverId, "*");
				window.close();
			}
		</script>
	</head>
	<body class="p-3">
		<c:forEach var="receiver" items="${receiverList}" varStatus="status">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">${receiver.receiverName}</h5>
					<p class="card-text">
						<div>
							<span>${receiver.receiverAddress}</span>
							<span>${receiver.receiverAddressDetail}</span>
						</div>
						<div>${receiver.receiverTelno}</div>
					</p>
					<a href="javascript:void(0)" onclick="chooseReceiver(${receiver.receiverId})" class="btn btn-primary">선택</a>
				</div>
			</div>
		</c:forEach>
	</body>
</html>

