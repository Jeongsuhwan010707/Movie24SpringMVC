<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Movie24</title>
<link rel="stylesheet"
	href="/resources/css/login/Movie24_sign_up.css">
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
					<li>약관동의</li>
					<li>정보입력</li>
					<li>가입완료</li>
				</ul>
			</div>
				<form name="enrollForm" action="/member/register.do" method="post">
					<div id="content_area">
						<ul>
							<li><label for="member-id">아이디</label> 
							<input type="text" name="member-id" id="member-id" placeholder=" 아이디를 입력해주세요."></li>
							<button type="button" onclick="checkId();">중복확인</button>
							<li><label for="pw">비밀번호</label> <input
								type="password" id="pw" onchange="check_pw()" name="member-pw"
								placeholder=" 비밀번호를 입력해주세요."></li>
							<li><label for="pw2">비밀번호 확인</label> <input
								type="password" id="pw2" onchange="check_pw()"
								name="member-pwCheck" placeholder=" 비밀번호를 다시 한 번 입력해주세요."><span
								id="check"></span></li>
							<li><label for="member-name">이름</label> <input type="text"
								id="member-name" name="member-name" placeholder=" ex) 홍길동"></li>
							<li><label for="member-nickName">닉네임</label> <input
								type="text" id="member-nickName" name="member-nickName" placeholder=" ex) cuty11, ..."></li>
							<li><label for="member-address">주소</label> <input type="text"
								name="member-address" id="member-address" placeholder=" 주소 입력"></li>
							<li><label for="member-phone">전화번호</label> <input type="tel"
								name="member-phone" id="member-phone" placeholder=" 010-XXXX-XXXX"></li>
							<li><label for="member-email">이메일</label> <input type="email"
								name="member-email" id="member-email" placeholder=" 이메일을 입력해주세요."></li>
							<li><input type="checkbox" name="member-emailYN" value="Y">
								<p>이메일 수신동의 (선택)</p></li>
						</ul>
					</div>
					<button type="button" id="sm" onclick="checkNext();" style="cursor:pointer">회원 가입</button>
				</form>
		</div>
		
	</main>
	<!-- --------------------푸터---------------------------------- -->
	<footer class="footer">
		<div class="footer-container">
			<ul class="footer-list">
				<li><a href="">이용약관</a></li>
				<li><a href="">개인정보처리방침</a></li>
				<li><a href="">회사소개</a></li>
				<li><a href="">광고/제휴/출점문의</a></li>
				<li><a href="">법적고지</a></li>
				<li><a href="">채용정보</a></li>
				<li><a href="">편성기준</a></li>
			</ul>
			<div class="footer-content">
				<hr class="footer-line">
				<p>저작권 © 2023 My Website. All rights reserved.</p>
			</div>
		</div>
		<p>
			()경기도 의정부시 상금로 102-37, 스페셜빌딩(금오동) <br>대표이사 : 정모씨 | 사업자 등록번호 :
			010-7777-7777 | 통신판매업신고번호 : 2023-의정부시-0527 <br>COPYRIGHT @
			Movie24.by_suhwan.All rights reserved
		</p>
	</footer>
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

        function check_pw(){
        	 
            var pw = document.getElementById('pw').value;
            var SC = ["?","!","@","#","$","%"];
            var check_SC = 0;
 
            if(pw.length < 6 || pw.length>16){
                window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
                document.getElementById('pw').value='';
            }
            for(var i=0;i<SC.length;i++){
                if(pw.indexOf(SC[i]) != -1){
                    check_SC = 1;
                }
            }
            if(check_SC == 0){
                window.alert('?,!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
                document.getElementById('pw').value='';
            }
            if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
                if(document.getElementById('pw').value==document.getElementById('pw2').value){
                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                    document.getElementById('check').style.color='red';
                }
            }
        }
        var on = false;
        function checkNext() {
			if(confirm("회원가입을 완료하시겠습니까?")) {
				if(on == false ){
					window.alert('중복 확인 테스트를 해주세요.');
					return false;
				}
				if(document.getElementById('pw').innerText != document.getElementById('pw2').innerText){
					window.alert('비밀번호와 비밀번호확인의 값이 다릅니다.')
					return false;
				}
				const form = document.enrollForm;
				form.submit();
			}
		}
        function checkId(){
        	const memberId = document.querySelector("#member-id").value;
        	if(confirm("아이디 중복확인을 하시겠습니까?")) {
        		on = true;
        		location.href="/member/checkId.do?member-id="+memberId;
        	}
        }
        function myCheck(){
        	alert("로그인이 되어있지 않습니다.");
        }
        
    </script>