<%@ page contentType="text/html; charset=UTF-8" %>
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
