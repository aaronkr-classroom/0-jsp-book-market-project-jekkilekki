<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>

<%
    request.setCharacterEncoding("UTF-8");

    Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "UTF-8"));
    Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "UTF-8"));
    Cookie shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), "UTF-8"));
    Cookie country = new Cookie("Shipping_country", URLEncoder.encode(request.getParameter("country"), "UTF-8"));
    Cookie zipCode = new Cookie("Shipping_zipCode", URLEncoder.encode(request.getParameter("zipCode"), "UTF-8"));
    Cookie address = new Cookie("Shipping_address", URLEncoder.encode(request.getParameter("address"), "UTF-8"));
    Cookie phone = new Cookie("Shipping_phone", URLEncoder.encode(request.getParameter("phone"), "UTF-8"));
    Cookie email = new Cookie("Shipping_email", URLEncoder.encode(request.getParameter("email"), "UTF-8"));

    cartId.setMaxAge(60 * 60 * 24);
    name.setMaxAge(60 * 60 * 24);
    shippingDate.setMaxAge(60 * 60 * 24);
    country.setMaxAge(60 * 60 * 24);
    zipCode.setMaxAge(60 * 60 * 24);
    address.setMaxAge(60 * 60 * 24);
    phone.setMaxAge(60 * 60 * 24);
    email.setMaxAge(60 * 60 * 24);

    response.addCookie(cartId);
    response.addCookie(name);
    response.addCookie(shippingDate);
    response.addCookie(country);
    response.addCookie(zipCode);
    response.addCookie(address);
    response.addCookie(phone);
    response.addCookie(email);

    response.sendRedirect("orderConfirmation.jsp");
%>