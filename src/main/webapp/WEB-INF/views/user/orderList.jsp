<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div id="wrapper">
	<div id="container">
		 <div id="contents">
		 	<form action="">
		 		<div>
		 			<select>
		 				<option>전체 주문처리상태</option>
		 				<option>입금 전</option>
		 				<option>배송 준비중</option>
		 				<option>배송 중</option>
		 				<option>배송 완료</option>
		 				<option>취소</option>
		 				<option>교환</option>
		 				<option>반품</option>
		 			</select>
		 		</div>
		 	</form>
		 </div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>