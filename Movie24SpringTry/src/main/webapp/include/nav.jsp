<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<nav>
            <div id="navigator_tag">
                <ul id="nav_ul">
                    <li><a href="">영화</a></li>
                    <li><a href="/movie24/movieReservation/Movie24_time.html">예매</a></li>
                    <li><a href="">극장</a></li>
                    <li><a href="/movie24/store/Movie24_store.html">스토어</a></li>
                    <li><a href="">이벤트</a></li>
                    <li><a href="">혜택</a></li>
                </ul>

                <input name="movieSearch" type="text" placeholder=" 영화 제목을 검색해보세요.">
                <button><img src="/resources/images/돋보기.png" alt=""></button>
            </div>
        </nav>
        <div id="menu_text"> 
            <ul class="nav_menu">
                <h3>영화</h3>
                <li><a href="">인기차트</a></li>
                <li><a href="">전체영화</a></li>
            </ul>
            <ul class="nav_menu">
                <h3>예매</h3>
                <li><a href="/movie24/movieReservation/Movie24_time.html">빠른예매</a></li>
                <li><a href="/movie24/movieReservation/Movie24_time.html">상영시간표</a></li>
            </ul>
            <ul class="nav_menu">
                <h3>극장</h3>
                <li><a href="">근처영화관</a></li>
                <li><a href="">전체영화관</a></li>
            </ul>
            <ul class="nav_menu">
                <h3>스토어</h3>
                <li><a href="/movie24/store/Movie24_store.html">영화관람권</a></li>
                <li><a href="/movie24/store/Movie24_store.html">기프트카드</a></li>
                <li><a href="/movie24/store/Movie24_store.html">기프티콘</a></li>
            </ul>
            <ul class="nav_menu">
                <h3>이벤트</h3>
                <li><a href="">진행중인 이벤트</a></li>
                <li><a href="">당첨자 발표</a></li>
                <li><a href="">종료된 이벤트</a></li>
            </ul>
            <ul class="nav_menu" id="benefit">
                <h3>혜택</h3>
                <li><a href="">할인정보</a></li>
                <li><a href="">vip혜택</a></li>
            </ul>
        </div>
	</body>
</html>