<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!-- CSS 연결 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productDetailPageStyle.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


<div class="wrapper">
	<div class="productDetailContent d-flex flex-column align-items-center">
		<h2 id="productTitle">${product.productName}</h2>
		<img id="productImage" src="data:image/jpeg;base64, ${convertedImage}"/>
		<h3 id="productName">${product.productName}</h3>
		<table class="productDetailTable mb-3">
			<tr class="priceGroup">
				<th class="mr-4">Price</th>
				<td>
					<span>KRW</span>
					<span><fmt:formatNumber value="${product.productPrice}" pattern="#,###" /></span>
				</td>
			</tr>
			<tr class="discountedPriceGroup">
				<th class="mr-4">Discounted Price</th>
				<td>
					<span>KRW</span>
					<span id="discountedPrice"><fmt:formatNumber value="${discountedPrice}" pattern="#,###" /></span>
					<span>(KRW</span>
					<span id="discountAmount"><fmt:formatNumber value="${discountAmount}" pattern="#,###" /></span>
					<span>할인)</span>
				</td>
			</tr>
			<tr class="sizeGroup">
				<th class="mr-4">Size</th>
				<td>
					<select name="selectSize">
						<option>--옵션을 선택해주세요--</option>
						<option value="297 x 420mm">297 x 420mm</option>
						<option value="420 x 594mm">420 x 594mm</option>
						<option value="500 x 700mm">500 x 700mm</option>
					</select>
				</td>
			</tr>
			<tr class="frameGroup">
				<th class="mr-4">Frame</th>
				<td>
					<select name="selectFrame">
						<option>--옵션을 선택해주세요--</option>
						<option value="noframe">선택안함</option>
						<option value="black">black</option>
						<option value="silver">silver</option>
						<option value="white">white</option>
						<option value="gold">gold</option>
					</select>
				</td>
			</tr>
		</table>
		<!-- 선택상품 리스트 -->
		<%-- <c:forEach var="item" items="${selectedItems}"> --%>
			<table class="selectedItemTable">
				<tr>
					<td>${product.productName}</td>
					<td id="seletedSize" ></td>
					<td id="seletedFrame"></td>
					<td>
						<span>
							<a><i class="fa fa-minus ml-5"></i></a>
							<input id="selectedQty" type="text" size="1" min="1" style="text-align: center; border-bottom: none;" value="1"></input>
							<a><i class="fa fa-plus"></i></a>
						</span>
					</td>
					<td>
						<a><i class="material-icons ml-5" style="font-weight: bold; font-size: 18px;">clear</i></a>
					</td>
				</tr>
			</table>
		<%-- </c:forEach> --%>
		
		<div class="totalPrice"></div>
		<div class="btnGroup d-flex">
			<a class="btn" href="addCart">Add to Cart</a>
			<a class="btn" href="orderNow">Order Now</a>
		</div>
	</div>
</div>
<script>
	$( "select[name=selectSize]" )
	  .on( "change", function() {
	    var str = "";
	    $( "select[name=selectSize] option:selected" ).each( function() {
	      str += $( this ).text() + " ";
	    } );
	    $( "#seletedSize" ).text( str );
	  } );
	
	$( "select[name=selectFrame]" )
	  .on( "change", function() {
	    var str = "";
	    $( "select[name=selectFrame] option:selected" ).each( function() {
	      str += $( this ).text() + " ";
	    } );
	    $( "#seletedFrame" ).text( str );
	  } );
	
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>