<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container-fluid flex-grow-1" style="margin-top:80px;">
	<div class="row">
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
						<div class="input-group-addon" style="width:35%; text-align:left;"><span class="input-group-text">이미지 카테고리</span></div>
						<input id="productImageCtgry" name="productImageCtgry" class="form-control" style="width:65%;"></input>
					</div>
					
					<div class="input-group" style="width:100%;">
						<div class="input-group-addon" style="width:35%; text-align:left;"><span class="input-group-text">이미지 파일</span></div>
						<input id="pattach" type="file" name="pattach" class="form-control" style="width:65%;">
					</div>
					
					<button class="btn btn-info btn-sm">등록</button>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>