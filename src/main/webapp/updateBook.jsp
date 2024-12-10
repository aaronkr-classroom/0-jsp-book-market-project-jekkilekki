<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta charset="UTF-8">
        <!-- BootStrap CSS URL 주소 입력 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="./resources/css/boostrap.min.css" />
        <title>도서 수정</title>
    </head>
    <body>
        <div class="container py-4">
            <%@ include file="menu.jsp" %>

            <div class="p-5 mb-4 bg-body-tertiary rounded-3">
                <div class="container-fluid py-5">
                    <h1 class="display-5 fw-bold">도서 수정</h1>
                    <p class="col-md-8 fs-4">Book Updating</p>
                </div>
            </div>

            <%@ include file="dconn.jsp" %>
            <%
                String bookId = request.getParameter("id");
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                String sql = "SELECT * FROM book WHERE b_id=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, bookId);
                rs = pstmt.executeQuery();
                if (rs.next()) {
            %>
            <div class="row align-items-md-stretch">
                <div class="col-md-5">
                    <img src='./resources/img/<%= rs.getString("b_filename") %>' style="width: 100%;" />
                </div>
                <div class="col-md-7">
                    <form name="newBook" action="./processUpdateBook.jsp" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="bookId" value="<%= rs.getString("b_id") %>" /><!-- 추가 - for security -->
                        <div class="mb-3 row">
                            <label for="bookId" class="form-label col-sm-2">도서코드</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="bookId" name="bookId" value="<%= rs.getString("b_id") %>" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="name" class="form-label col-sm-2">도서명</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="name" name="name" value="<%= rs.getString("b_name") %>" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="unitPrice" class="form-label col-sm-2">가격</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="unitPrice" name="unitPrice" value="<%= rs.getString("b_unitPrice") %>" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="author" class="form-label col-sm-2">저자</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="author" name="author" value="<%= rs.getString("b_author") %>" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="publisher" class="form-label col-sm-2">출판사</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="publisher" name="publisher" value="<%= rs.getString("b_publisher") %>" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="releaseDate" class="form-label col-sm-2">출판일</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="releaseDate" name="releaseDate" value="<%= rs.getString("b_releaseDate") %>" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="description" class="form-label col-sm-2">상세정보</label>
                            <div class="col-sm-8">
                                <textarea class="form-control" id="description" name="description" rows="5"><%= rs.getString("b_description") %></textarea>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="category" class="form-label col-sm-2">분류</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="category" name="category" value="<%= rs.getString("b_category") %>" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="unitsInStock" class="form-label col-sm-2">재고수량</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="unitsInStock" name="unitsInStock" value="<%= rs.getString("b_unitsInStock") %>" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="condition" class="form-label col-sm-2">상태</label>
                            <div class="col-sm-8">
                                <input type="radio" class="form-control" id="condition" name="condition" value="New" /> 신규도서
                                <input type="radio" class="form-control" id="condition" name="condition" value="Old" /> 중고도서
                                <input type="radio" class="form-control" id="condition" name="condition" value="EBook" /> Ebook
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="filename" class="form-label col-sm-2">이미지</label>
                            <div class="col-sm-8">
                                <input type="file" class="form-control" id="filename" name="filename" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="submit" class="btn btn-primary" value="수정" />
                            </div>
                        </div>
                    </form>
                </div>
                <%
                    } // 닫는 }
                    if (rs != null)
                        rs.close();
                    if (pstmt != null)
                        pstmt.close();
                    if (conn != null)
                        conn.close();
                %>

            <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>