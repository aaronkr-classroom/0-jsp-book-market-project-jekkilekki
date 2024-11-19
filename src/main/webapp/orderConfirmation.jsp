<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.net.URLDecoder" %>
<%@ page import = "dto.Product" %>
<%@ page import = "dao.ProductRepository" %>

<%
	request.setCharacterEncoding("UTF-8");

	String cartId = session.getId();
	
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
			if (n.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode((c.getValue()), "utf-8");
			if (n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode((c.getValue()), "utf-8");
			if (n.equals("Shipping_date"))
				shipping_date = URLDecoder.decode((c.getValue()), "utf-8");
			if (n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode((c.getValue()), "utf-8");
			if (n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode((c.getValue()), "utf-8");
			if (n.equals("Shipping_address"))
				shipping_address = URLDecoder.decode((c.getValue()), "utf-8");
			if (n.equals("Shipping_phone"))
				shipping_phone = URLDecoder.decode((c.getValue()), "utf-8");
			if (n.equals("Shipping_email"))
				shipping_email = URLDecoder.decode((c.getValue()), "utf-8");
			
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="./resources/css/boostrap.min.css" />
	<title>주문 정보</title>
</head>
<body>
	<div class="container py-4">
		<%@ include file = "menu.jsp" %>
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">주문 정보</h1>
				<p class="col-md-8 fs-4">Order Info</p>
			</div>
		</div>
		
		<div class="row align-items-md-stretch alert alert-info">
			<div class="text-center">
				<h1>영수증</h1>
			</div>
			
			<div class="row justify-content-between">
				<div class="col-4" align="left">
					<strong>배송 주소</strong><br>
					서명: <%= shipping_name %><br>
					주소: <%= shipping_address %>, <%= shipping_country %><br>
					우편번호: <%= shipping_zipCode %><br>
					<hr>
					전화번호: <%= shipping_phone %><br>
					이메일: <%= shipping_email %><br>
				</div>
				<div class="col-4" align="right">
					<p><em>배송일: <%= shipping_date %></em></p>
				</div>
			</div>
			
			<div class="py-5">
				<table class="table table-hover table-striped">
					<tr>
						<th class="text-center">도서</th>
						<th class="text-center">#</th>
						<th class="text-center">가격</th>
						<th class="text-center">소계</th>
					</tr>
					<%
						int sum = 0;
						ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartList");
						
						if (cartList == null)
							cartList = new ArrayList<Book>();
						
						for (Book b : cartList) {
							int total = b.getUnitPrice() * b.getQuantity();
							sum = sum + total;
					%>
					<tr>
						<td class="text-center"><em><%= book.getName() %></em></td>
						<td class="text-center"><%= book.getQuantity() %></td>
						<td class="text-center"><%= book.getUnitPrice() %></td>
						<td class="text-center"><%= total %>원</td>
					</tr>
					<%
						}
					%>
					<tr>
						<td colspan="3" class="text-right">
							<strong>총액:</strong>
						</td>
						<td class="text-center text-danger">
							<strong><%= sum %></strong>
						</td>
					</tr>
				</table>
				
				<a href="./shippingInfo.jsp?cartId=<%= shipping_cartId %>" class="btn btn-secondary" role="button">이전</a>
				<a href="./thankCustomer.jsp" class="btn btn-success" role="button">주문 완료</a>
				<a href="./checkoutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
			</div>
		</div>
		
		<jsp:include file="footer.jsp"></jsp:include>
	</div>
</body>
</html>