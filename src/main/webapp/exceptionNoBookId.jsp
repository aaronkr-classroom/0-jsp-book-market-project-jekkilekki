<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
        <title>���� ���̵� ����</title>
    </head>
    <body>
        <div class="container py-4">
            <%@ include file="menu.jsp" %>
            <div class="p-5 mb-4 bg-body-tertiary rounded-3">
                <div class="container-fluid py-5">
                    <h1 class="alert alert-danger">�ش� ������ �������� �ʽ��ϴ�.</h1>
                    <p class="col-md-8 fs-4">No Book ID</p>
                </div>
            </div>

            <div class="row align-items-md-stretch">
                <div class="col-md-12">
                    <div class="h-100 p-5">
                        <p><%= request.getRequestURL() %>?<%= request.getQueryString() %></p>
                        <p><a href="books.jsp" class="btn btn-secondary">���� ��� &raquo;</a></p>
                    </div>
                </div>
            </div>

            <%@ include file="footer.jsp" %>
        </div>
    </body>
</html>