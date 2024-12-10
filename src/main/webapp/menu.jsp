<%@ page contentType="text/html; charset=UTF-8" %>
<!-- Taglib below may break the file execution -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String sessionId = (String) session.getAttribute("sessionId"); %>
<header class="pb-3 mb-4 border-bottom">
	<div class="container">
		<div class="d-flex flex-wrap align-items-center justify-content-between">
			<a href="./welcome.jsp" class="d-flex align-items-center text-dark text-decoration-none">
				<svg width="32" height="32" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
					<path d="" />
					<path d="" />
				</svg>
				<span class="fs-4">Home</span>
			</a>
			<ul class="nav nav-pills">
				<c:choose>
					<c:when test="${empty sessionId}">
						<li class="nav-item"><a href="<c:url value='/member/loginMember.jsp' />" class="nav-link">로그인</a></li>
						<li class="nav-item"><a href="<c:url value='/member/addMember.jsp' />" class="nav-link">회원 가입</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a href="<c:url value='/member/logoutMember.jsp' />" class="nav-link">로그아웃</a></li>
						<li class="nav-item"><a href="<c:url value='/member/updateMember.jsp' />" class="nav-link">회원 수정</a></li>
					</c:otherwise>
				</c:choose>
				<li class="nav-item"><a href="./books.jsp" class="nav-link">도서 목록</a></li>
				<li class="nav-item"><a href="./addBook.jsp" class="nav-link">도서 등록</a></li>
				<li class="nav-item"><a href="./editBook.jsp?edit=update" class="nav-link">도서 수정</a></li>
				<li class="nav-item"><a href="./editBook.jsp?edit=delete" class="nav-link">도서 삭제</a></li>
				<li class="nav-item"><a href="./cart.jsp" class="nav-link">장바구니</a></li>
			</ul>
			<div class="d-flex">
				<a href="./login.jsp" class="btn btn-outline-primary me-2">Login</a>
				<a href="./register.jsp" class="btn btn-primary">Sign up</a>
			</div>
		</div>
	</div>
</header>
