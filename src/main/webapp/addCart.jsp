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

    ArrayList<Book> goodsList = dao.getAllBooks();
    Book goods = new Book();
    for (Book g : goodsList) {
        goods = goodsList.get(i);
        if (g.getBookId().equals(id)) {
            break;
        }
    }

    ArrayList<Book> list = (ArrayList<Book>) session.getAttribute("cartList");
    if (list == null) {
        list = new ArrayList<Book>();
        session.setAttribute("cartList", list);
    }

    int count = 0;
    Book goodsQty = new Book();
    for(Book g : list) {
        goodsQty = list.get(i);
        if (g.getBookId().equals(id)) {
            count++;
            int orderQty = goodsQty.getQuantity() + 1;
            goodsQty.setQuantity(orderQty);
        }
    }

    if (count == 0) {
        goods.setQuantity(1);
        list.add(goods);
    }

    response.sendRedirect("book.jsp?id=" + id);
%>