<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addressRegisterFormStyle.css">

<div class="wrapper" style="margin: 0 auto; width: 350px; font-size: 13px;">
	<div style="margin-top: 200px;">
		<form method="post" action="addressRegister" style="font-size: 13px;">
			<table class="getInputTable">
				<tr class="addressRegisterInputGroup">
					<td>
						<label for="shipAddressName" class="mr-4">배송지명</label>
					</td>
					<td>
						<input type="text" name="receiverName" class="form-control" value="" style="width: 270px;">
						<form:errors cssClass="text-danger" path="receiver.receiverName" />
					</td>
				</tr>	
				<tr class="addressRegisterInputGroup">
					<td>
						<label for="receiverPersonName" class="mr-4">성명</label>
					</td>
					<td>
						<input type="text" name="receiverPersonName" class="form-control" value="">
					</td>
				</tr>
				<tr class="addressRegisterInputGroup">
					<td>
						<label for="receiverAddress" class="mr-4">주소</label>
					</td>
					<td>
						<input type="text" id="postcode" name="receiverZip" class="form-control" placeholder="우편번호" value="" style="font-size: 13px; width:200px; display: inline;">
						<input class="btn" type="button" onclick="execDaumPostcode()" value="Search" style="border: 1px solid; border-radius: 0"><br>
						<input type="text" id="address" name="receiverAddress" class="form-control" placeholder="기본주소" value="">
						<input type="text" id="detailAddress" name="receiverAddressDetail" class="form-control" placeholder="나머지 주소(선택 입력 가능)" value="">
					</td>
				</tr>
				<tr class="addressRegisterInputGroup">
					<td>
						<label for="customerTelno" class="mr-4">휴대전화</label>
					</td>
					<td>
						<input type="text" name="receiverTelno" class="form-control" value="">
					</td>
				</tr>
			</table>
			
			<div class="AddressRegisterBtn" style="width: 100%; text-align: center;">
				<span>
					<input class="btn btn-dark btn-sm mt-3" type="submit" value="등록"/>
				</span>
				<span >
					<input class="btn btn-dark btn-sm mt-3" type="submit" value="취소"/>
				</span>
			</div>
		</form>
	</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                   // document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>