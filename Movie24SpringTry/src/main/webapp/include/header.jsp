<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>메인 페이지</title>
        <link rel="stylesheet" href="/resources/css/main/Movie24.css">
    </head>
    <body>
        <div>
            <header>
                <div id="title_box">
                    <h1 id="title"><a href="/">MOVIE</a></h1>
                    <h1><a id="title_num" href="/">24</a></h1>
                </div>
                <div id="small_title_box">
                    <h3 id="small_title">All Time <br> Movie Theater*</h3>
                </div>
                <div id="title_right">
                    <ul>
                        <li><a href="/notice/help.do"><img src="/resources/images/free-icon-operator-8111794.png" alt=""></a></li>
                        <li><a href=""><img src="/resources/images/free-icon-help-round-button-61079.png" alt=""></a></li>
                        
                        <div id="login">
                        <c:if test="${sessionScope.memberId ne null }">
	                        <li><a href="/member/myPage.do?member-id=${memberId}"><img src="/resources/images/free-icon-user-5264565.png" alt=""></a></li>
	                        <li><a href="#" onclick="outCheck();"><img src="/resources/images/free-icon-lock-483412.png" alt="로그아웃"></a></li>
						</c:if>
						<c:if test="${memberId eq null }">
							<li><a href="#" onclick="myCheck();"><img src="/resources/images/free-icon-user-5264565.png" alt=""></a></li>
                            <li><a href="/member/login.do"><img src="/resources/images/free-icon-lock-2089784.png" alt="로그인"></a></li>
                        </c:if>
                        </div>
                    </ul>
                </div>
            </header>
	</body>
</html>