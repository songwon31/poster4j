<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- OrderForm 스타일 설정을 위한 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/writeReviewFormStyle.css">

<div id="wrapper">
    <div id="container">
        <form id="form" method="post" action="postWriteReview">
        	<input name="orderId" type="hidden" value="${productReview.orderId}">
        	<input name="productId" type="hidden" value="${productReview.productId}">
        	<input name="optionSize" type="hidden" value="${productReview.optionSize}">
        	<input name="optionFrame" type="hidden" value="${productReview.optionFrame}">
        	<input id="ratingInput" name="reviewStarRating" type="hidden" value="">
        	
            <div class="title mb-4">
                <div class="h4 font-weight-bold">상품 리뷰</div>
                <div class="small text-muted">이 상품에 대해 얼마나 만족하시나요?</div>
            </div>
            <div class="product-info d-flex align-items-center mb-4">
                <img class="orderItemImage mr-3" alt="리뷰할 상품 이미지" src="data:image/jpeg;base64, ${productReview.productImage}" width="200px">
                <div class="product-details">
                    <div id="productName" class="font-weight-bold mb-3" style="font-size: 20px;">[${productReview.productTheme}]${productReview.productName}</div>
                    <div>${productReview.optionSize}, ${productReview.optionFrame}</div>
                    <div class="mt-5 star-rating">
                        <span class="rating-star">&#9733;</span>
                        <span class="rating-star">&#9733;</span>
                        <span class="rating-star">&#9733;</span>
                        <span class="rating-star">&#9733;</span>
                        <span class="rating-star">&#9733;</span>
                    </div>
                </div>
            </div>
            <div class="detail-review mb-4">
                <div class="h5 font-weight-bold">상세 리뷰</div>
                <div>
                    <textarea id="reviewText" name="reviewContent" rows="4" class="form-control"></textarea>
                    <div class="small text-muted mt-2">상품 품질과 관계없는 내용은 비공개 처리될 수 있습니다.</div>
                </div>
                <div class="mt-2 small text-muted character-count">글자수 세기: <span id="charCount">0</span></div>
            </div>
            <div class="attach-photo mb-4">
                <div class="h5 font-weight-bold">사진 첨부하기</div>
                <div class="upload-file">첨부파일</div>
            </div>
            <div id="buttonContainer" class="text-center mt-4">
                <a class="btn btn-light mr-3 cancel-button" href="orderList" type="button">취소하기</a>
                <button class="btn btn-dark submit-button" type="button">등록하기</button>
            </div>
        </form>
    </div>
</div>

<style>
    .rating-star {
        color: #ccc;
    }

    .rating-star.selected {
        color: gold;
    }
</style>

<script>
    let selectedRating = 0;

    $(document).ready(function() {
        $('.rating-star').on('click', function() {
            const starIndex = $(this).index() + 1;
            selectedRating = starIndex;

            $('.rating-star').removeClass('selected');
            $('.rating-star:lt(' + starIndex + ')').addClass('selected');
        });

        $('#reviewText').on('input', function() {
            const charCount = $(this).val().length;
            $('#charCount').text(charCount);
        });

        $('.submit-button').on('click', function() {
            // 선택된 별의 개수를 form에 추가
            $('#ratingInput').val(selectedRating);
            // 폼 제출
            $('#form').submit();
        });
    });
</script>





