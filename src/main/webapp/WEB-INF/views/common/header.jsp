<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			<nav class="navbar" style="position: fixed; z-index: 99; left: 0; top: 0; width: 100%;">
				<a class="" href="${pageContext.request.contextPath}"> 
					<img alt="" src="${pageContext.request.contextPath}/resources/images/poster4j.png" width="20px">
					<span style="font-size: 20px; font-weight: 500; color: #212529">poster4j</span>
				</a>
				<div>
					<c:if test="${customerLogin == null}">
						<div style="margin-top: 17px" >
							<a href="${pageContext.request.contextPath}/">
								<img alt="" src="${pageContext.request.contextPath}/resources/images/search.png" width="25px;"/>
							</a>
							<a href="${pageContext.request.contextPath}/login">
								<img alt="" src="${pageContext.request.contextPath}/resources/images/login.png" width="25px;"/>
							</a>
							<a href="${pageContext.request.contextPath}/">
								<img alt="" src="${pageContext.request.contextPath}/resources/images/menu.png" width="25px;"/>
							</a>
						</div>
					</c:if>
					<c:if test="${customerLogin != null}">
						<a href="${pageContext.request.contextPath}/">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/search.png" width="25px;"/>
						</a>
						<a href="${pageContext.request.contextPath}/mypage">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/login.png" width="25px;"/>
						</a>
						<a href="${pageContext.request.contextPath}/">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/menu.png" width="25px;"/>
						</a>
					</c:if>
					<%-- admin menu --%>
					<%--
						<c:if test="${customerLogin.customerId == 'admin'}">
							<a href="${pageContext.request.contextPath}/admin/menu"><img alt="" src=""></a>
						</c:if>
					--%>
				</div>
			</nav>