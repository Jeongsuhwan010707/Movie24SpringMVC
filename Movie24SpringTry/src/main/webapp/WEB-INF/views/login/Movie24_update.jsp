<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<link rel="stylesheet" href="/resources/css/login/Movie24_update.css">
	</head>
	<body> 
		<div>
			<jsp:include page="/include/header.jsp"></jsp:include>
	            <!-- -----------네비게이터 영역----------------------------------- -->
				<jsp:include page="/include/nav.jsp"></jsp:include>
		<!-- -----------------메인--------------------------- -->
			<main>
				<div id="main_logo">
					<h1>가입정보 수정/삭제</h1>
				</div>
				<div id="main_content">
					<div id="content_area">
						<form action="/member/updateInfo.do" method="post">
							<ul>
								<li><label for="member-id">아이디</label> 
									<input type="text" name="member-id" id="member-id" value="${member.memberId}" readonly></li>
								<li><label for="pw">비밀번호</label> 
									<input type="password" id="pw" onchange="check_pw();" name="member-pw" placeholder=" 비밀번호를 입력해주세요."></li>
								<li><label for="pw2">비밀번호 확인</label> 
									<input type="password" id="pw2" onchange="check_pw();" name="member-pwCheck" placeholder=" 비밀번호를 다시 한 번 입력해주세요."> <span id="check"></span></li>
								<li><label for="member-name">이름</label> 
									<input type="text" id="member-name" name="member-name" value="${member.memberName}"></li>
								<li><label for="member-nickName">닉네임</label> 
									<input type="text" id="member-nickName" name="member-nickName" value="${member.memberNickname}"></li>
								<li><label for="member-address">주소</label> 
									<input type="text" name="member-address" id="member-address" value="${member.memberAddress}"></li>
								<li><label for="member-phone">전화번호</label> 
									<input type="tel" name="member-phone" id="member-phone" value="${member.memberPhone}"></li>
								<li><label for="member-email">이메일</label> 
									<input type="email" name="member-email" id="member-email" value="${member.memberEmail}"></li>
								<li><input type="checkbox" value="Y" name="member-emailYN" <c:if test="${member.memberEmailYN eq 'Y'}">checked</c:if>>
									<p>이메일 수신동의 (선택)</p></li>
							</ul>
					</div>
					<a href="javascript:void(0)" onclick="checkDelete();" id="delete">삭제하기</a>
					<button id="submit" onclick="checkNext();">정보 수정</button>
				</div>
				</form>
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
	        function checkNext() {
				if(confirm("정보를 수정하시겠습니까?")) {
					if(document.getElementById('pw').innerText != document.getElementById('pw2').innerText){
						window.alert('비밀번호와 비밀번호확인의 값이 다릅니다.')
						return false;
					}
				}
			}
	        function checkDelete(){
		        const memberId = '${member.memberId }';
				if(confirm("탈퇴하시겠습니까?")) {
					location.href = "/member/delete.do?memberId="+memberId;
				}
	        }
	        function outCheck(){
	        	if(confirm("로그아웃 하시겠습니까?")){
	        		location.href="/member/logout.do";
	        	}
	        }
	    </script>
	 </body>
  </html>