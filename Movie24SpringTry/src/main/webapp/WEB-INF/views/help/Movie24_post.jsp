<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인 페이지</title>
<link rel="stylesheet" href="/resources/css/help/Movie24_post.css">
</head>
<body>
	<div>
		<jsp:include page="/include/header.jsp"></jsp:include>
		<!-- -----------네비게이터 영역----------------------------------- -->
		<jsp:include page="/include/nav.jsp"></jsp:include>
		<!-- -----------------메인--------------------------- -->
		<main>

			<div id="blank_1"></div>
			<div id="main_menu">
				<div id="member">
					<h3>1:1 문의사항</h3>
					<ul>
						<li><a href="#">문의하기</a></li>
						<c:if test="${sessionScope.memberId ne null }">
							<li><a href="/member/myPage.do">문의내역보기</a></li>
						</c:if>
						<li><a href="#">약관 확인</a></li>
					</ul>
					<h3>공지사항</h3>
					<ul>
						<li><a href="/notice/post.do">공지사항목록</a></li>
					</ul>
					<h3>자주 찾는 질문</h3>
					<ul>
						<li><a href="#">자주 찾는 질문</a></li>
					</ul>

					<h3>건의사항</h3>
					<ul>
						<li><a href="#">건의사항</a></li>
						<li><a href="#">개선사항</a></li>
						<li><a href="#">도움말</a></li>
					</ul>
					<h3>검색</h3>
					<ul>
						<li><a href="#">검색하기</a></li>
					</ul>

					<h3>환불문의</h3>
					<ul>
						<li><a href="#">환불문의하기</a></li>
						<c:if test="${sessionScope.memberId ne null }">
							<li><a href="/member/myPage.do">환불문의 내역보기</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<div id="main_blank"></div>
			<div id="h2">
				<h2>공지사항</h2>
			</div>
			<form name="searchForm" action="/notice/search.do" method="get">
				<div id="post-text">
					<select name="searchCondition" id="searchOption">
						<option value="all">전체</option>
						<option value="writer">작성자</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" placeholder="검색할 내용을 입력해주세요." name="searchKeyword">
					<button type="button" id="searchPost" onclick="noticeSearch();">검색하기</button>
					<c:if test="${memberId ne null}">
						<a href="/notice/postInsert.do?memberNickname=${memberNickname }"
							id="postInsert">글쓰기</a>
					</c:if>
				</div>
				<div id="table">
					<table>
						<tr id="tr1">
							<th class="tr">번호</th>
							<th class="tr">글쓴이</th>
							<th id="tr">제목</th>
							<th class="tr">등록일</th>
							<th class="tr">조회수</th>
						</tr>
					</table>
				</div>
				<div id="table-1">
					<table>
						<tr id="postMain">
							<td class="tr">공지</td>
							<td class="tr">관리자</td>
							<td id="tr"><a
								href="/notice/postInfo.do?noticeNo=${notice0.noticeNo}">${notice0.noticeSubject}</a></td>
							<td class="tr">${notice0.noticeDate }</td>
							<td class="tr">${notice0.viewCount }</td>
						</tr>
						<c:forEach var="notice" items="${nList}">
							<c:if test="${notice.noticeNo ne '0' }">
								<tr id="postList">
									<td class="tr">${notice.noticeNo }</td>
									<td class="tr">${notice.noticeWriter }</td>
									<td id="tr"><a
										href="/notice/postInfo.do?noticeNo=${notice.noticeNo}">${notice.noticeSubject}</a></td>
									<td class="tr">${notice.noticeDate }</td>
									<td class="tr">${notice.viewCount }</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
				<div id="number">
					<c:if test="${pInfo.startNavi ne 1}">
						<c:url var="pageUrl" value="/notice/post.do">
							<c:param name="page" value="${pInfo.startNavi-1}"></c:param>
						</c:url>
						<a id="postNum" href="${pageUrl}"><</a> &nbsp;
					</c:if>
					<c:forEach begin="${pInfo.startNavi}" end="${pInfo.endNavi}" var="p">
						<c:url var="pageUrl" value="/notice/post.do">
							<c:param name="page" value="${p}"></c:param>
						</c:url>
						<a href="${pageUrl}">${p}</a>
					</c:forEach>
					<c:if test="${pInfo.endNavi ne pInfo.naviTotalCount}">
						<c:url var="pageUrl" value="/notice/post.do">
							<c:param name="page" value="${pInfo.endNavi+1}"></c:param>
						</c:url>
						<a id="postNum" href="${pageUrl}">></a> &nbsp;
					</c:if>
				</div>
			</form>
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
        function myCheck(){
        	alert("로그인이 되어있지 않습니다.");
        }
        function outCheck(){
        	if(confirm("로그아웃 하시겠습니까?")){
        		location.href="/member/logout.do";
        	}
        }
        function noticeSearch(){
        	const searchValue = document.getElementById("searchPost").value;
        	if(searchValue != null){
        		const form = document.searchForm;
				form.submit();
        	}else{
        		alert("검색할 내용을 입력해주세요.");
        	}
        }
    </script>