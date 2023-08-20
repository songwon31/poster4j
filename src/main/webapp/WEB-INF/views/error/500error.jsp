<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	body, html {
    height: 100%;
    margin: 0;
    padding: 0;
	}
	
	.full-screen-image {
	    position: relative;
	    width: 100%;
	    height: 100vh;
	    overflow: hidden;
	}
	
	.full-screen-image img {
	    width: 100%;
	    height: 100%;
	    object-fit: cover; 
	}
</style>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="full-screen-image">
	<img src="${pageContext.request.contextPath}/resources/images/errorImage500.png" alt="Full-Screen Image">
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>