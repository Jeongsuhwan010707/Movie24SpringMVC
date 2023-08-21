<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Movie24</title>
        <link rel="stylesheet" href="/resources/css/include/header.css">
        <link rel="stylesheet" href="/resources/css/include/nav.css">
        <link rel="stylesheet" href="/resources/css/include/footer.css">
        <link rel="stylesheet" href="/resources/css/login/Movie24_agree.css">
    </head>
    <body>
        <div>
            <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------네비게이터 영역----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
        <!-- -----------------메인--------------------------- -->
		<main>
		    <div id="main_logo">
		        <h1>회원가입</h1>
		    </div>
		    <div id="main_content">
		        <div id="login_li">
		            <ul>
		                <li>본인인증</li>
		                <li><strong>약관동의</strong></li>
		                <li>정보입력</li>
		                <li>가입완료</li>
		            </ul>
		        </div>
		    <div><p class="main_small">* 이용약관</p></div>
		    <div><p class="long"><br>제 1장 총칙<br>
				<br>제 1장 총칙<br>
				
				<br>제 1 조(목적)<br><br>
				본 약관은 국가공간정보포털 웹사이트(이하 "국가공간정보포털")가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 회원과 국가공간정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.<br>
		
				<br>제 2 조(약관의 효력과 변경)<br><br>
				1. 국가공간정보포털은 이용자가 본 약관 내용에 동의하는 경우, 국가공간정보포털의 서비스 제공 행위 및 회원의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.<br>
				2. 국가공간정보포털은 약관을 개정할 경우, 적용일자 및 개정사유를 명시하여 현행약관과 함께 국가공간정보포털의 초기화면에 그 적용일 7일 이전부터 적용 전일까지 공지합니다. 단, 회원에 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 국가공간정보포털은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 회원이 알기 쉽도록 표시합니다.<br>
				3. 변경된 약관은 국가공간정보포털 홈페이지에 공지하거나 e-mail을 통해 회원에게 공지하며, 약관의 부칙에 명시된 날부터 그 효력이 발생됩니다. 회원이 변경된 약관에 동의하지 않는 경우, 회원은 본인의 회원등록을 취소(회원탈퇴)할 수 있으며, 변경된 약관의 효력 발생일로부터 7일 이내에 거부의사를 표시하지 아니하고 서비스를 계속 사용할 경우는 약관 변경에 대한 동의로 간주됩니다.<br>
			
				<br>제 3 조(약관 외 준칙)<br><br>
				본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.<br>
		
				<br>제 4 조(용어의 정의)<br><br>
				본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
				1. 이용자 : 본 약관에 따라 국가공간정보포털이 제공하는 서비스를 받는 자<br>
				2. 가입 : 국가공간정보포털이 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위<br>
				3. 회원 : 국가공간정보포털에 개인 정보를 제공하여 회원 등록을 한 자로서 국가공간정보포털이 제공하는 서비스를 이용할 수 있는 자.<br>
				4. 계정(ID) : 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 국가공간정보포털에서 부여하는 문자와 숫자의 조합<br>
				5. 비밀번호 : 회원과 계정이 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 회원 자신이 선정한 문자와 숫자의 조합<br>
				6. 탈퇴 : 회원이 이용계약을 종료시키는 행위<br>
				7. 본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도 약관 및 이용규정에서 정의합니다.
		        </p></div>
		        <input id="terms1" type="checkbox" name="agreeCheck"><p><label for="terms1">위 이용약관에 동의합니다.</label></p>
		    <div><p class="main_small">* 개인정보 수집 및 이용에 대한 안내</p></div>
		    <div><p class="long"><b>가. 개인정보의 수집 및 이용 목적</b><br>
				① 국가공간정보포털은 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.<br>
				<b style="font-size: 17px; color: #007dcd;">1. 국가공간정보포털 서비스 제공을 위한 회원관리</b><br>
				<b style="font-size: 17px; color: #007dcd;">1) 공간정보 다운로드, 오픈API 신청 및 활용 등 포털 서비스 제공과 서비스 부정이용 방지를 목적으로 개인정보를 <br>&nbsp;&nbsp;&nbsp;처리합니다.</b><br>
				
				<br><b>나. 정보주체와 법정대리인의 권리ㆍ의무 및 행사방법</b><br>
				<b style="font-size: 14px; color: #007dcd;">① 정보주체(만 14세 미만인 경우에는 법정대리인을 말함)는 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.</b><br>
				② 제1항에 따른 권리 행사는 개인정보보호법 시행규칙 별지 제8호 서식에 따라 작성 후 서면, 전자우편 등을 통하여 하실 수 있으며, 기관은 이에 대해 지체 없이 조치하겠습니다.<br>
				③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.<br>
				④ 개인정보 열람 및 처리정지 요구는 개인정보 보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.<br>
				⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.<br>
				⑥ 정보주체 권리에 따른 열람의 요구, 정정ㆍ삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.<br>
				
				<br><b>다. 수집하는 개인정보의 항목</b><br>
				<b style="font-size: 14px; color: #007dcd;">① 국가공간정보포털 회원정보(필수): 이름, 이메일(아이디), 비밀번호</b><br>
				
				<br><b>라. 개인정보의 보유 및 이용기간</b><br>
				① 국가공간정보포털은 법령에 따른 개인정보 보유ㆍ이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유ㆍ이용기간 내에서 개인정보를 처리ㆍ보유합니다.<br>
				<b style="font-size: 14px; color: #007dcd;">1. 국가공간정보포털 회원정보</b><br>
				<b style="font-size: 14px; color: #007dcd;">- 수집근거: 정보주체의 동의</b><br>
				<b style="font-size: 17px; color: #007dcd;">- 보존기간: 회원 탈퇴 요청 전까지(1년 경과 시 재동의)</b><br>
				<b style="font-size: 14px; color: #007dcd;">- 보존근거: 정보주체의 동의</b><br>
										
				<br><b>마. 동의 거부 권리 및 동의 거부에 따른 불이익 </b><br>
				위 개인정보의 수집 및 이용에 대한 동의를 거부할 수 있으나, 동의를 거부할 경우 회원 가입이 제한됩니다.<br></p></div> 
		        <input id="terms2" type="checkbox" name="agreeCheck"><p><label for="terms2">위 약관에 동의합니다.</label></p>
		        <a href="javascript:void(0)" onclick="OnSave();">다음 단계</a>
		        </div> 
		</main>
         <!-- --------------------푸터---------------------------------- -->
         <!-- <footer> ----------------------------</footer> -->
            <jsp:include page="/include/footer.jsp"></jsp:include>
    	</div>
	    <!-- 스크립트 -->
	    <script>
	        var ulElement = document.getElementById('nav_ul');
	        var liElements = ulElement.querySelectorAll('li');
	        var menuText = document.getElementById('menu_text');
	
	        liElements.forEach(li => {
	        li.addEventListener('mouseenter', () => {
	                menuText.classList.add('active');
	                menuText.style.zIndex= 5000;
	            });
	
	        });
	        document.getElementById("menu_text").addEventListener('mouseleave', () => {
	            menuText.classList.remove('active');
	            menuText.style.zIndex= -1;
	        });
	        function OnSave() {
	        	  var cob_check = document.querySelectorAll('input[name="agreeCheck"]:checked').length;
	        	  if(cob_check < 2) {
	        	      alert("약관을 모두 동의하지 않았습니다.");
	        	      return false;
	        	  }else{
	        		  location.href = "/member/quote.do";
	        	  }
	        	}
	        function myCheck(){
	        	alert("로그인이 되어있지 않습니다.");
	        }
	    </script>
    </body>
</html>