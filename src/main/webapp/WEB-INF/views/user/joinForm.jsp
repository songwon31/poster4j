<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/joinFormStyle.css"/>

<div class="wrapper">
	<div class="joinContent d-flex justify-content-center">
		<form method="post" action="join">
			<table class="joinInputTable">
				<tr class="joinInputGroup">
					<td>
						<label for="customerId" class="mr-4">ID</label>
					</td>
					<td>
						<input type="text" name="customerId" class="form-control" value="">
						<span>(영문소문자/숫자, 4~16자)</span>
					</td>
				</tr>
				<tr class="joinInputGroup">
					<td>
						<label for="customerPassword" class="mr-4">Password</label>
					</td>
					<td>
						<input type="password" name="customerPassword" class="form-control" value="">
						<span>(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</span>
					</td>
				</tr>
				<tr class="joinInputGroup">
					<td>
						<label for="customerPasswordCheck" class="mr-4">PW Check</label>
					</td>
					<td>
						<input type="password" name="customerPasswordCheck" class="form-control" value="">
					</td>
				</tr>
				<tr class="joinInputGroup">
					<td>
						<label for="customerName" class="mr-4">Name</label>
					</td>
					<td>
						<input type="text" name="customerName" class="form-control" value="">
					</td>
				</tr>
				<tr class="joinInputGroup">
					<td>
						<label for="receiverAddress" class="mr-4">Address</label>
					</td>
					<td>
						<div class="zipGroup row no-gutters" >
							<input type="text" id="receiverZip" name="receiverZip" class="col-9" placeholder="우편번호" value="">
							<input class="btn btn-sm btn-dark col-3" onclick="execDaumPostcode()" value="우편번호 찾기"/>
						</div>
						<input type="text" id="receiverAddress" name="receiverAddress" class="form-control" placeholder="기본주소" value="">
						<input type="text" id="receiverAddressDetail" name="receiverAddressDetail" class="form-control" placeholder="나머지 주소(선택 입력 가능)" value="">
					</td>
				</tr>
				<tr class="joinInputGroup">
					<td>
						<label for="customerTelno" class="mr-4">Tel</label>
					</td>
					<td>
						<input type="text" name="customerTelno" class="form-control" value="">
					</td>
				</tr>
				<tr class="joinInputGroup">
					<td>
						<label for="customerEmail" class="mr-4">E-mail</label>
					</td>
					<td>
						<input type="text" name="customerEmail" class="form-control" value="">
					</td>
				</tr>
			</table>
			<%-- 필수 이용약관 동의 --%>
			<div class="agreement d-flex flex-column">
				<p class="agreementTitle mb-2">[필수] 이용약관 동의</p>
				<div class="agreementContent">
					<p>
						제1조(목적)
						<br>
						이 약관은 poster4j 회사(전자상거래 사업자)가 운영하는 poster4j 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리.의무 및 책임사항을 규정함을 목적으로 합니다.
						<br>
						※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
					</p>
					<p>
						제2조(정의)
						<br>
						① “몰”이란 poster4j 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
						<br>
						② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
						<br>
						③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
						<br>
						④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.
					</p>
					<p>
						제3조 (약관 등의 명시와 설명 및 개정)
						<br>
						① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호.모사전송번호.전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보보호책임자등을 이용자가 쉽게 알 수 있도록 poster4j 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
						<br>
						② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회.배송책임.환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
						<br>
						③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
						<br>
						④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 “몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
						<br>
						⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
						<br>
						⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.
					</p>
				</div>
				<div class="agreeLayout">
					<span>이용약관에 동의하십니까?</span>
					<span>
						<input type="checkbox" id="customerTermAgree" name="customerTermAgree" value="TRUE"/>
						<label for="customerTermAgree">동의함</label>
					</span>
				</div>
			</div>
			<%-- 필수 개인정보 동의 --%>
			<div class="agreement d-flex flex-column">
				<p class="agreementTitle mb-3">[필수] 개인정보 수집 및 이용 동의</p>
				<div class="agreementContent">
					<p>1. 개인정보 수집목적 및 이용목적</p>
					<p>가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산</p>
					<p>콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스</p>
					<p>나. 회원 관리</p>
					<p>회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달</p>
					<p>2. 수집하는 개인정보 항목 : 이름 , 로그인ID , 비밀번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보</p>
					<p>3. 개인정보의 보유기간 및 이용기간</p>
					<p>원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.</p>
				</div>
				<div class="agreeLayout">
					<span>개인정보 수집 및 이용에 동의하십니까?</span>
					<span>
						<input type="checkbox" id="customerInfoAgree" name="customerInfoAgree" value="TRUE"/>
						<label for="customerInfoAgree">동의함</label>
					</span>
				</div>
			</div>
			<%-- 선택 쇼핑정보 동의 --%>
			<div class="agreement d-flex flex-column">
				<p class="agreementTitle mb-3">[선택] 쇼핑정보 수신 동의</p>
				<div class="agreementContent">
					<p>할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.</p>
					<p>단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.</p>
					<p>선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.</p>
				</div>
				<ul class="optionalAgree">
					<li class="agreeLayout">
						<span>SMS 수신을 동의하십니까?</span>
						<span>
							<input type="checkbox" id="customerSmsAgree" name="customerSmsAgree" value="TRUE"/>
							<label for="customerSmsAgree">동의함</label>
						</span>
					</li>
					<li class="agreeLayout">
						<span>이메일 수신을 동의하십니까?</span>
						<span>
							<input type="checkbox" id="customerEmailAgree" name="customerEmailAgree" value="TRUE"/>
							<label for="customerEmailAgree">동의함</label>
						</span>
					</li>
				</ul>
			</div>
			<div class="joinBtn">
				<input class=" btn btn-dark btn-sm mt-3 px-4" type="submit" value="Join"/>
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
                document.getElementById("receiverZip").value = data.zonecode;
                document.getElementById("receiverAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("receiverAddressDetail").focus();
            }
        }).open();
    }
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>