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
					<span style="font-size: 20px; font-weight: 600; color: #212529">poster4j</span>
				</a>
				<div>
					<%-- Ch08
					<c:if test="${login == null}">
						<div>
							<a href="${pageContext.request.contextPath}/ch08/content" class="btn btn-success btn-sm">로그인</a>
						</div>
					</c:if>
					<c:if test="${login != null}">
						<img src="${pageContext.request.contextPath}/resources/images/face/${login.mid}.png" width="30" height="30"/>
						<a href="${pageContext.request.contextPath}/ch08/logout" class="btn btn-success btn-sm">로그아웃</a>
					</c:if>
					 --%>
					 
					<%-- Ch13 --%>
					<c:if test="${ch13Login == null}">
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
					<c:if test="${ch13Login != null}">
						<img src="${pageContext.request.contextPath}/resources/images/face/member07.png" width="30" height="30";/>
						<a href="${pageContext.request.contextPath}/ch13/logout" class="btn btn-success btn-sm">로그아웃</a>
					</c:if>
					<a href="${pageContext.request.contextPath}/admin/menu"><img alt="" src=""></a>
				</div>
			</nav>
	
		<%-- 	<div class="flex-grow-1 container-fluid">
				<div class="row h-100">
					<div class="col-md-4 p-3 bg-dark">
						<div class="h-100 d-flex flex-column">
							<div class="flex-grow-1" style="height: 0px; overflow-y: auto; overflow-x: hidden;">
								<%@ include file="/WEB-INF/views/common/menu.jsp"%>
							</div>
						</div>
					</div>
	
					<div class="col-md-8 p-3">
						<div class=" h-100 d-flex flex-column">
							<div class="flex-grow-1 overflow-auto pr-3" style="height: 0px"> --%>