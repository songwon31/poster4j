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
					<div class="input-group">
						<div class="input-group-prepend"><span class="input-group-text">ID</span></div>
						<input id="productImageId" type="text" name="productImageId" class="form-control">
					</div>
					
					<div class="input-group">
						<div class="input-group-prepend"><span class="input-group-text">카테고리</span></div>
						<input id="productImageCtgry" name="productImageCtgry" class="form-control"></input>
					</div>
					
					<div class="input-group">
						<div class="input-group-prepend"><span class="input-group-text">파일</span></div>
						<input id="productImageSource" type="file" name="productImageSource" class="form-control">
					</div>
					
					<button class="btn btn-info btn-sm">등록</button>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>