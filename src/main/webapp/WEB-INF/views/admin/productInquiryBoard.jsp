<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container-fluid flex-grow-1" style="margin-top:80px;">
	<div class="col">
		<div class="py-2 px-4">
			<div style="font-size: 20px">주문 문의</div>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col"><span class="d-flex justify-content-center">상품ID</span></th>
					<th scope="col"><span class="d-flex justify-content-center">고객ID</span></th>
					<th scope="col"><span class="d-flex justify-content-center">문의 내용</span></th>
					<th scope="col"><span class="d-flex justify-content-center">문의 날짜</span></th>
					<th scope="col"><span class="d-flex justify-content-center">상태</span></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="productInquiry" items="${productInquiryList}" varStatus="status">
					<tr>
						<td class="align-middle" scope="row" style="width:10px;"><span class="d-flex justify-content-center">${productInquiry.productId}</span></td>
						<td class="align-middle" style="width:10px;"><span class="d-flex justify-content-center">${productInquiry.productId}</span></td>
						<td class="align-middle" style="width:30px;"><span class="d-flex justify-content-center">${productInquiry.productInquiryContent}</span></td>
						<td class="align-middle" style="width:50px;"><span class="d-flex justify-content-center"><fmt:formatDate value="${productInquiry.productInquiryDate}" pattern="yyyy-MM-dd"/></span></td>
						<c:if test='${productInquiry.productInquiryAnswered == "false"}'>
							<td class="align-middle" style="width:30px;">
								<span class="d-flex justify-content-center">
									<a href="#" onClick='answerProductInquiry(${productInquiry.productInquiryId}, "${productInquiry.productInquiryContent}"); return false;' class="btn btn-warning btn-sm">답변 등록</a>
								</span>
							</td>
						</c:if>
						<c:if test='${productInquiry.productInquiryAnswered == "true"}'>
							<td class="align-middle" style="width:30px;">
								<span class="d-flex justify-content-center">
									<a href="#" onClick='editProductInquiry(${productInquiry.productInquiryId}, "${productInquiry.productInquiryContent}"); return false;' class="btn btn-success btn-sm">답변 수정</a>
								</span>
							</td>
						</c:if>
					</tr>
				</c:forEach>
				<script>
					function answerProductInquiry(productInquiryId, productInquiryContent) {
						var popupWidth = 600;
						var popupHeight = 300;
						var popupX = (window.screen.width/2) - (popupWidth/2);
						var popupY= (window.screen.height/2) - (popupHeight/2);
						console.log("1");
						
						let options = "toolbar=no,scrollbars=no,location=no,resizable=yes,status=no,menubar=no,height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY";
						window.open("productInquiryAnswerForm?productInquiryId="+productInquiryId+"&productInquiryContent="+productInquiryContent, "_blank", "toolbar=no,scrollbars=no,location=no,resizable=yes,status=no,menubar=no,height="+popupHeight+", width="+popupWidth+", left="+popupX+", top="+popupY);
					}
					
					function editProductInquiry(productInquiryId, productInquiryContent) {
						var popupWidth = 600;
						var popupHeight = 300;
						var popupX = (window.screen.width/2) - (popupWidth/2);
						var popupY= (window.screen.height/2) - (popupHeight/2);
						
						let options = "toolbar=no,scrollbars=no,location=no,resizable=yes,status=no,menubar=no,height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY";
						window.open("productInquiryAnswerUpdateForm?productInquiryId="+productInquiryId+"&productInquiryContent="+productInquiryContent, "_blank", "toolbar=no,scrollbars=no,location=no,resizable=yes,status=no,menubar=no,height="+popupHeight+", width="+popupWidth+", left="+popupX+", top="+popupY);
					}
				</script>
				<tr>
					<td colspan="12" class="text-center">
						<div>
							<a class="btn btn-outline-primary btn-sm" href="orderInquiryBoard?pageNo=1">처음</a>
							<c:if test="${pager.groupNo>1}">
								<a class="btn btn-outline-info btn-sm" href="orderInquiryBoard?pageNo=${pager.startPageNo-1}">이전</a>
							</c:if>
							
							<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
								<c:if test="${pager.pageNo != i}">
									<a class="btn btn-outline-success btn-sm" href="orderInquiryBoard?pageNo=${i}">${i}</a>
								</c:if>
								<c:if test="${pager.pageNo == i}">
									<a class="btn btn-danger btn-sm" href="orderInquiryBoard?pageNo=${i}">${i}</a>
								</c:if>
							</c:forEach>
							
							<c:if test="${pager.groupNo<pager.totalGroupNo}">
								<a class="btn btn-outline-info btn-sm" href="orderInquiryBoard?pageNo=${pager.endPageNo+1}">다음</a>
							</c:if> 
							<a class="btn btn-outline-primary btn-sm" href="orderInquiryBoard?pageNo==${pager.totalPageNo}">맨끝</a>
						</div>
					</td>
				</tr>
			
			</tbody>
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>