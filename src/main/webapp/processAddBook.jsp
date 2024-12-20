<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "dto.Book" %>
<%@ page import = "dao.BookRepository" %>
<%@ page import = "jakarta.servlet.*" %>
<%@ page import = "jakarta.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload2.*" %>
<%@ page import = "org.apache.commons.fileupload2.core.*" %>
<%@ page import = "org.apache.commons.fileupload2.disk.*" %>
<%@ page import = "org.apache.commons.fileupload2.servlet.*" %>
<%@ page import = "org.apache.commons.fileupload2.FileItem" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.nio.charset.StandardCharsets" %>
<%@ include file = "dconn.jsp" %>

<%
	// New code
	String path = "C:\\jsp_upload";
	File uploadDir = new File(path);

	// Create directory if it doesn't exist
	if (!uploadDir.exists())
		uploadDir.mkdirs();

	// Check we have a file upload request
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (isMultipart) {
		// Create a factory for disk-based file items
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// Set memory threshold
		factory.setSizeThreshold(4096);
		factory.setRepository(uploadDir); // repository for temp files

		// Create new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(1000000); // max file size

		try {
			// Parse the request
			List<FileItem> items = upload.parseRequest(request);

			for (FileItem item : items) {
				if (item.isFormField()) {
					String name = item.getFieldName();
					String value = item.getString(StandardCharsets.UTF_8);
					out.println(name + " = " + value + "<br>");
				} else {
					String fileFieldName = item.getFieldName();
					String fileName = item.getName();
					String contentType = item.getContentType();

					// Get the actual filename
					fileName = new File(fileName).getName();

					long fileSize = item.getSize();
					File file = new File(uploadDir, fileName);

					// Save the file
					item.write(file);

					out.println("-------------------------------<br>");
					out.println("요청 파라미터 이름: " + fileFieldName + "<br>");
					out.println("저장 파일 이름: " + fileName + "<br>");
					out.println("파일 콘텐츠 유형: " + contentType + "<br>");
					out.println("파일 크기: " + fileSize);
				}
			}
		} catch (Exception e) {
			out.println("파일 업로드 중 오류가 발생했습니다: " + e.getMessage());
		}
	} else {
		out.println("업로드 요청이 아닙니다.");
	}


	// Old code =======================================
    request.setCharacterEncoding("UTF-8");

    // FileUpload handling ...
    String filename = "";
    String realFolder = "C:\\Users"; // Update...

    int maxSize = 5 * 1024 * 1024; 	// 최대 업로드될 파일의 크기 5MB
    String encType = "utf-8";		// 인코딩 유형

    String bookId = request.getParameter("bookId"); // request 대신 multi?
    String name = request.getParameter("name");
    String unitPrice = request.getParameter("unitPrice");
    String author = request.getParameter("author");
    String publisher = request.getParameter("publisher");
    String releaseDate = request.getParameter("releaseDate");
    String description = request.getParameter("description");
    String category = request.getParameter("category");
    String unitsInStock = request.getParameter("unitsInStock");
    String condition = request.getParameter("condition");

    // Enumeration files = multi.getFileNames();
    // String fname = (String) files.nextElement();
    // String filename = multi.getFilesystemName(fname);

    Integer price;

    if (unitPrice.isEmpty())
        price = 0;
    else
        price = Integer.valueOf(unitPrice);

    long stock;

    if (unitsInStock.isEmpty())
        stock = 0;
    else
        stock = Long.valueOf(unitsInStock);

	PreparedStatement pstmt = null;

    String sql = "INSERT INTO book (b_id, b_name, b_unitPrice, b_author, b_publisher, b_releaseDate, b_description, b_category, b_unitsInStock, b_condition, b_filename) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	// Out of order compared to book example
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bookId);
	pstmt.setString(2, name);
	pstmt.setInt(3, price);
	pstmt.setString(4, author);
	pstmt.setString(5, publisher);
	pstmt.setString(6, releaseDate);
	pstmt.setString(7, description);
	pstmt.setString(8, category);
	pstmt.setLong(9, stock);
	pstmt.setString(10, condition);
	pstmt.setString(11, filename);
	pstmt.executeUpdate();

	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();

    response.sendRedirect("books.jsp");
%>
