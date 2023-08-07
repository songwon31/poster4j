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
		
		<script>
			$(init);
			
			function init() {
				if ('${quit}' == -1) {
					opener.parent.location.reload();
					window.close();
				}
			}
		</script>
	</head>
	<body>
		<div class="d-flex flex-column vh-100">
			<div class="container-fluid flex-grow-1">
				<div class="col">
					<div class="py-2 px-4">
						<div style="font-size: 20px">상품 등록</div>
						<div class="mt-2">
							<form id="registerProductForm" method="post" action="register" enctype="multipart/form-data">
							
								<div class="input-group" style="width:100%;">
									<div class="input-group-addon" style="width:35%; text-align:left;"><span class="input-group-text">상품명</span></div>
									<input id="productName" type="text" name="productName" class="form-control" style="width:65%;">
								</div>
								
								<div class="input-group" style="width:100%;">
									<div class="input-group-addon" style="width:35%; text-align:left;"><span class="input-group-text">가격</span></div>
									<input id="productPrice" type="text" name="productPrice" class="form-control" style="width:65%;">
								</div>
								
								<div class="input-group" style="width:100%;">
									<div class="input-group-addon" style="width:35%; text-align:left;"><span class="input-group-text">할인율(%)</span></div>
									<input id="productDiscountRate" type="text" name="productDiscountRate" class="form-control" style="width:65%;">
								</div>
								
								<div class="input-group" style="width:100%;">
									<div class="input-group-addon" style="width:35%; text-align:left;"><span class="input-group-text">테마</span></div>
									<input id="productTheme" type="text" name="productTheme" class="form-control" style="width:65%;">
								</div>
								
								<div class="input-group" style="width:100%;">
									<div class="input-group-addon" style="width:35%; text-align:left;"><span class="input-group-text">아티스트</span></div>
									<input id="productArtist" type="text" name="productArtist" class="form-control" style="width:65%;">
								</div>
								
								<div class="input-group" style="width:100%;">
									<div class="input-group-addon" style="width:35%; text-align:left;"><span class="input-group-text">텍스처</span></div>
									<input id="productTexture" type="text" name="productTexture" class="form-control" style="width:65%;">
								</div>
								
								<div class="input-group" style="width:100%;">
									<div class="input-group-addon" style="width:35%; text-align:left;"><span class="input-group-text">재고(옵션)</span></div>
									<input id="productStock" type="text" name="productStock" class="form-control" style="width:65%;">
								</div>
								
								<div class="input-group" style="width:100%;">
									<div class="input-group-addon" style="width:35%; text-align:left;"><span class="input-group-text">대표 이미지</span></div>
									<input required id="pattach" type="file" name="representImage" class="form-control" style="width:65%;">
								</div>
								
								<div class="input-group" style="width:100%;">
									<div class="input-group-addon" style="width:35%; text-align:left;"><span class="input-group-text">상세 이미지</span></div>
									<input multiple id="pattach" type="file" name="detailImages" class="form-control" style="width:65%;">
								</div>
								
								<button class="btn btn-info btn-sm">등록</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

