<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Book" %>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<title>도서 정보</title>
</head>
<body>
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">도서정보</h1>
				<p class="col-md-8 fs-4">BookInfo</p>
			</div>
		</div>
		
		<%
			String id = request.getParameter("id");
			Book book = bookDAO.getBookById(id);
		%>
		
		<div class="row align-items-md-stretch">
			<div class="col-md-12">
				<h3><strong><%= book.getName() %></strong></h3>
				
				<p><%= book.getDescription() %></p>
				<p>
					<strong>도서코드:</strong>
					<span class="badge text-bg-danger"><%= book.getBookId() %></span>
				</p>
				<p><strong>저자:</strong> <%= book.getAuthor() %></p>
				<p><strong>출판사:</strong> <%= book.getPublisher() %></p>
				<p><strong>출판일:</strong> <%= book.getReleaseDate() %></p>
				<p><strong>분류:</strong> <%= book.getCategory() %></p>
				<p><strong>제고수:</strong> <%= book.getUnitsInStock() %></p>
				
				<h4><%= book.getUnitPrice() %>원</h4>
				
				<p>
					<a href="#" class="btn btn-info">도서주문 &raquo;</a>
					<a href="./books.jsp" class="btn btn-secondary">도서목록 &raquo;</a>
				</p>
			</div>
		</div>
		
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>