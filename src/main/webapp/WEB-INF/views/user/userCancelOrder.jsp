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
		
		<!-- 공통 스타일 설정을 위한 css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
		
	</head>
	<body>
		<div class="d-flex flex-column vh-100" >
			<div class="container-fluid flex-grow-1">
				<div class="col">
					<div class="py-2 px-4">
						<div style="font-size: 20px" class="d-flex justify-content-center mb-2">주문 취소</div>
						<div class="mt-2">
							<form id="updateProductForm" method="post" action="userPostCancelOrder">
								<input hidden id="orderId" type="text" name="orderId" value="${orderId}"/>
								<input hidden id="productId" type="text" name="productId" value="${productId}"/>
								<input hidden id="optionSize" type="text" name="optionSize" value="${optionSize}"/>
								<input hidden id="optionFrame" type="text" name="optionFrame" value="${optionFrame}"/>
								<div class="input-group mt-2" style="width:100%;">
									<div class="input-group-addon" style="width:20%; text-align:left;"><span class="input-group-text">카테고리</span></div>
									<select id="cancelCategory" name="cancelCategory" class="form-control" style="width:80%;">
										<option value="">카테고리 선택</option>
										<option value="발송 전 취소">발송 전 취소</option>
										<option value="교환">교환</option>
										<option value="반품">반품</option>
									</select>
								</div>
								<div class="input-group" style="width:100%;">
									<div class="mt-3 mb-1" style="width:20%; text-align:left;"><span>취소 사유</span></div>
									<textarea rows="10" cols="100" name="cancelReason"></textarea>
								</div>
								<div class="d-flex justify-content-end mt-2">
									<button class="btn btn-danger btn-sm">주문 취소</button>
								</div>
								<script>
									$(init);
									function init() {
										if ('${orderId}' == -1 && '${productId}' == -1) {
											opener.parent.location.reload();
											window.close();
										}
									}
								</script>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

