<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addressListStyle.css">

<div id="addressList" style="margin: 0 auto">
	<div style="margin-top: 200px; min-width: 1080px;">
		<div class="title">
			ADDRESS
		</div>
		<table class="table mt-4">
			<tbody>
				<tr>
					<th scope="col"><input id="selectAll" type="checkbox"><label for="selectAll"></label></th>
					<th scope="col">배송지명</th>
					<th scope="col">수령인</th>
					<th scope="col">휴대전화</th>
					<th scope="col">주소</th>
					<th scope="col">수정</th>
				</tr>
				<c:forEach var="receiver" items="${receivers}">
					<tr>
						<th scope="row">
							<form action="">
								<%-- <input type="hidden" name="receiverId" value="${receiver.receiverId}"/> --%>
								<input class="check" type="checkbox" name="checkbox" value="${receiver.receiverId}">
								<label for="check"></label>
							</form>
							
						</th>
						<td scope="row">${receiver.receiverName}</td>
						<td>${receiver.receiverPersonName}</td>
						<td>${receiver.receiverTelno}</td>
						<td>[${receiver.receiverZip}]${receiver.receiverAddress} ${receiver.receiverAddressDetail}</td>
						<form class="form-inline" method="get" action="changeAddress">
							<td>
								<a type="submit" class="btn btn-dark btn-sm ml-2" href="updateAddressRegister?receiverId=${receiver.receiverId}">수정</a>
							</td>
						</form>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pagination" style="display: flex; justify-content: center;">
			<div class="text-center">
				<div>
					<a class="text-dark mr-2" href="addressList?pageNo=1" style="font-weight:600;">first</a>
					<c:if test="${pager.groupNo>1}">
						<a class="text-dark mr-2" href="addressList?pageNo=${pager.startPageNo-1}" style="font-weight:600;">prev</a>
					</c:if>
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<c:if test="${pager.pageNo != i}">
							<a class="text-dark" href="addressList?pageNo=${i}" style="font-weight:600;">${i}</a>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<a class="text-dark" href="addressList?pageNo=${i}" style="font-weight:600;">${i}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pager.groupNo<pager.totalGroupNo}">
						<a class="text-dark mr-2" href="addressList?pageNo=${pager.endPageNo+1}" style="font-weight:600;">next</a>
					</c:if>
					<a class="text-dark mr-2" href="addressList?pageNo=${pager.totalPageNo}" style="font-weight:600;">last</a>
				</div>
			</div>
		</div>
		<div style="text-align: center; margin-top: 30px;">
			<span><a class="btn btn-light" onclick="deleteValue()">선택 주소록 삭제</a></span>
			<span><a class="btn btn-dark" href="${pageContext.request.contextPath}/addressRegister">배송지등록</a></span>
		</div>
	</div>

</div>

<script>
$(function(){
    //전체선택 체크박스 클릭
	$("#selectAll").click(function(){
		//만약 전체 선택 체크박스가 체크된상태일경우
		if($("#selectAll").prop("checked")) {
			//해당화면에 전체 checkbox들을 체크해준다
			$("input[type=checkbox]").prop("checked",true);
		// 전체선택 체크박스가 해제된 경우
		} else {
			//해당화면에 모든 checkbox들의 체크를해제시킨다.
			$("input[type=checkbox]").prop("checked",false);
		}
	})
})


function deleteValue(){
	var url = "delete"; //Controller로 보내고자 하는 URL
	var checkboxArr = new Array();
	var list = $("input[name='checkbox']");
	for (var i = 0; i < list.length; i++){
		if(list[i].checked){ //선택되어 있으면 배열에 값을 저장
			checkboxArr.push(list[i].value);
		
		}
	}
	console.log(checkboxArr);
	if(checkboxArr.length == 0){
		alert("선택된 값이 없습니다.");
	}
	else{
		var check = confirm("정말 삭제하시겠습니까?");
		
		if(check){
			$.ajax({
				url: url,
				type : 'POST',
				traditional : true,
				data : {
					checkboxArr : checkboxArr
				},
				success: function(data){
					if(data = 1){
						alert("배송지가 삭제되었습니다.");
						location.replace("${pageContext.request.contextPath}/addressList");
					}
					else{
						alert("삭제 실패");
					}
				}
			})
		}
	}
}

</script>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>