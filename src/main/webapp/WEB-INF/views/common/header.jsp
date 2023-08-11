<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html style="width:100%; height:100%;">
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
		
		<!-- 아이콘 라이브러리  -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		
	</head>
	<body style="width:100%; height:100%;">
		<div id="headerMenu" class="d-flex justify-content-center align-items-center">
			<ul id="headerMenuList" class="list-group list-group-flush" style="padding: 0 30px;">
				<li class="list-group-item border-bottom border-dark">
					<a href="${pageContext.request.contextPath}/admin/orderBoard" 
					   class="text-decoration-none text-dark">주문 목록</a>
				</li>
				<li class="list-group-item border-bottom border-dark">
					<a href="${pageContext.request.contextPath}/admin/productBoard" 
					   class="text-decoration-none text-dark">상품 목록</a>
				</li>
				<li class="list-group-item border-bottom border-dark">
					<a href="${pageContext.request.contextPath}/admin/canceledOrderBoard" 
					   class="text-decoration-none text-dark">취소/교환/반품 목록</a>
				</li>
				<li class="list-group-item border-bottom border-dark">
					<a href="${pageContext.request.contextPath}/admin/orderInquiryBoard" 
					   class="text-decoration-none text-dark">배송 문의 목록</a>
				</li>
				<li class="list-group-item border-bottom border-dark">
					<a href="${pageContext.request.contextPath}/admin/productInquiryBoard" 
					   class="text-decoration-none text-dark">상품 문의 목록</a>
				</li>
			</ul>
		</div>
		<div class="d-flex flex-column vh-100" >
			<nav class="navbar" style="position: fixed; z-index: 99; left: 0; top: 0; width: 100%;
				 background: linear-gradient(to bottom, rgba(255,255,255,1) 80%, rgba(255, 255, 255, 0) 100%);">
				<a class="" href="${pageContext.request.contextPath}"> 
					<img alt="" src="${pageContext.request.contextPath}/resources/images/poster4j.png" width="20px">
					<span style="font-size: 20px; font-weight: 500; color: #212529">poster4j</span>
				</a>
				<div>
					<c:if test="${customerLogin == null}">
						<div style="padding-top:10px; padding-bottom:10px">
							<a href="${pageContext.request.contextPath}/search">
								<i class="material-icons">search</i>
							</a>
							<a href="${pageContext.request.contextPath}/login">
								<i class="material-icons">person_outline</i>
							</a>
							<a id="headerMenuButton" href="#">
								<i class="material-icons">menu</i>
							</a>
						</div>
					</c:if>
					<c:if test="${customerLogin != null}">
						<div style="padding-top:10px; padding-bottom:10px">
							<a href="${pageContext.request.contextPath}/search">
								<i class="material-icons">search</i>
							</a>
							<a href="${pageContext.request.contextPath}/mypage">
								<i class="material-icons">person_outline</i>
							</a>
							<a id="headerMenuButton" href="#">
								<i class="material-icons">menu</i>
							</a>
						</div>
					</c:if>
					<script>
						$(init);
						function init() {
							if ($("#headerMenu").css("z-index") == 50) {
								$("#headerMenu").css("z-index", -1);
							}
							if ($("#headerMenu").css("opacity") == 1) {
								$("#headerMenu").fadeTo(1, 0);
							}
							
							$("#headerMenuButton").click(function() {
								if ($("#headerMenu").css("opacity") == 1) {
									$("#headerMenu").fadeTo(100, 0);
									$("#headerMenu").css("z-index", -1);
								} else if ($("#headerMenu").css("opacity") == 0) {
									$("#headerMenu").fadeTo(100, 1);
									$("#headerMenu").css("z-index", 50);
								}
							});
						}
					</script>
					<%-- admin menu --%>
					<%--
						<c:if test="${customerLogin.customerId == 'admin'}">
							<a href="${pageContext.request.contextPath}/admin/menu"><img alt="" src=""></a>
						</c:if>
					--%>
				</div>
			</nav>