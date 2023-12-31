<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/writeQnaFormStyle.css">

<script>
	$(".cancel-button").click(function() {
		var productId = ${productId};
		$(".cancel-button").attr("href", "productDetailPage?productId=" + productId);
	});
</script>
<div id="wrapper">
    <div id="container">
        <form id="form" method="post" action="writeQna">
        	<input type="hidden" name="productId" value="${productId}" />
        	
        	<%-- 상품문의 --%>
            <div class="title mb-4">
                <div class="h4 font-weight-bold">상품 문의</div>
            </div>
            
            <%-- 문의할 상품 --%>
            <div class="product-info d-flex flex-column mb-4">
            	<img id="qnaProductImage" style="width: 30%; height: auto;" alt="문의할 상품 이미지" src="data:image/jpeg;base64, ${convertedImage}" />
                <div id="productName" class="font-weight-bold my-3" style="font-size: 20px;">${productName}</div>
            </div>
            
            <%-- 문의 입력란 --%>
            <div class="qnaContent mb-4">
                <div class="h5 font-weight-bold">문의하기</div>
                <div>
                    <textarea id="productInquiryContent" name="productInquiryContent" rows="4" class="form-control" placeholder="상품에 대해 궁금한 점을 질문해주세요. 친절히 답변드리겠습니다." required></textarea>
                    <div class="small text-muted mt-2">상품과 관계없는 내용은 비공개 처리될 수 있습니다.</div>
                </div>
            </div>
            
            <%-- 등록/취소 버튼 --%>
            <div id="buttonContainer" class="text-center mt-4">
                <a class="btn btn-light mr-3 cancel-button" href="productDetailPage" type="button">취소하기</a>
                <button class="btn btn-dark submit-button">등록하기</button>
            </div>
        </form>
    </div>
</div>