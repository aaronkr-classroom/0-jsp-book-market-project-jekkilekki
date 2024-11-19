<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>

<%
    String id = request.getParameter("id");
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("books.jsp");
        return;
    }

    BookRepository dao = BookRepository.getInstance();

    Book book = dao.getBookById(id);
    if (book == null) {
        response.sendRedirect("exceptionNoBookId.jsp");
    }

    ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartList");
    Book goodsQty = new Book();
    for (Book g : cartList) {
        goodsQty = cartList.get(i);
        if (goodsQty.getBookId().equals(id)) {
            cartList.remove(goodsQty);
        }
    }

    response.sendRedirect("cart.jsp");
%>