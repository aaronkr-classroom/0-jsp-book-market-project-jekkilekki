<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;

    try {
        String url = "jdbc:mysql://localhost:3306/bookmarket?serverTimezone=UTC";
        String user = "root";
        String password = "1234";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        if (conn != null) {
            out.println("DB ���� ����");
        } else {
            out.println("DB ���� ����");
        }
    } catch (SQLException e) {
        out.println("�����ͺ��̽� ������ �����߽��ϴ�.<br>");
        out.println("SQLException: " + e.getMessage());
    }