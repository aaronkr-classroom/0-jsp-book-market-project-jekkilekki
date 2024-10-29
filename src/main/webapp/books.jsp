<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- BootStrap CSS URL 주소 입력 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<title>도서 목록</title>
</head>
<body>
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">도서 목록</h1>
				<p class="col-md-8 fs-4">BookList</p>
			</div>
		</div>
		
		<% 
			BookRepository dao = BookRepository.getInstance();
			ArrayList<Book> listOfBooks = bookDAO.getAllBooks();
		%>
		
		<div class="row align-items-md-stretch text-center">
			<%
				for (int i = 0; i < listOfBooks.size(); i++) { // 열린 {
					Book book = listOfBooks.get(i);
			%>
			<div class="col-md-4">
				<div class="h-100 p-2">
					<h5><strong><%= book.getName() %></strong></h5>
					<p><%= book.getAuthor() %></p>
					<p><%= book.getPublisher() %> | <%= book.getUnitPrice() %>원</p>
					<p><%= book.getDescription().substring(0, 60) %>...</p>
					<p><%= book.getUnitPrice() %>원</p>
					<p>
						<a href="./book.jsp?id=<%= book.getBookId() %>"
							class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
					</p>
				</div>
			</div>
			<%		
				} // 닫는 }
			%>
		</div>
		
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>





