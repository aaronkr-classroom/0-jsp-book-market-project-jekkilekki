<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dconn.jsp" %>
<%
    String bookId = request.getParameter("id");

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    // String sql = "SELECT * FROM book WHERE b_id=?"; // Update
    String sql = "SELECT * FROM book";

    pstmt = conn.prepareStatement(sql);
    // pstmt.setString(1, bookId); // Update
    rs = pstmt.executeQuery();

    if (rs.next()) {
        sql = "DELETE FROM book WHERE b_id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, bookId);
        pstmt.executeUpdate();
    } else {
        out.println("<script>alert('도서 정보를 찾을 수 없습니다.'); history.go(-1);</script>");
    }

    if (rs != null)
        rs.close();
    if (pstmt != null)
        pstmt.close();
    if (conn != null)
        conn.close();

    response.sendRedirect("./editBook.jsp?edit=delete");
%>