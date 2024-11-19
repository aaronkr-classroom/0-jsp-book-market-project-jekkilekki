<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
	<title>주문 완료</title>
</head>
<body>
<%
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_date = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_address = "";
	String shipping_phone = "";
	String shipping_email = "";
	
	Cookie[] cookies = request.getCookies();
	
	if (cookies != null) {
		for (Cookie c : cookies) {
			String n = c.getName();
			
			if (n.equals("shipping_cartId"))
				shipping_cartId = URLDecoder.decode((c.getValue()), "utf-8");
			if (n.equals("shipping_date"))
				shipping_date = URLDecoder.decode((c.getValue()), "utf-8");
		}
	}
%>
	<div class="container py-4">
		<%@ include file = "menu.jsp" %>
		
		<div class="p5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">주문 완료</h1>
				<p class="col-md-8 fs-4">Order Completed</p>
			</div>
		</div>
		
		<div class="row align-items-md-stretch">
			<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
			<p>주문은 <%= shipping_date %>에 배송될 예정입니다!</p>
			<p>주문번호: <%= shipping_cartId %></p>
		</div>
		
		<div class="container">
			<p><a href="./books.jsp" class="btn btn-secondary">&laquo; 도서 목록</a></p>
		</div>
		
		<%@ include file = "footer.jsp" %>
	</div>
</body>
</html>

<%
	session.invalidate();

	for (Cookie c : cookies) {
		String n = c.getName();
		if (n.equals("shipping_cartId"))
			c.setMaxAge(0);
		if (n.equals("shipping_name"))
			c.setMaxAge(0);
		if (n.equals("shipping_date"))
			c.setMaxAge(0);
		if (n.equals("shipping_country"))
			c.setMaxAge(0);
		if (n.equals("shipping_zipCode"))
			c.setMaxAge(0);
		if (n.equals("shipping_address"))
			c.setMaxAge(0);
		if (n.equals("shipping_phone"))
			c.setMaxAge(0);
		if (n.equals("shipping_email"))
			c.setMaxAge(0);
		
		response.addCookie(c);
	}
%>