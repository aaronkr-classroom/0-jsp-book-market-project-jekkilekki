<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "dto.Book" %>
<%@ page import = "dao.BookRepository" %>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    // FileUpload handling ...
    String filename = "";
    String realFolder = "C:\\Users"; // Update...
    
    int maxSize = 5 * 1024 * 1024; 	// 최대 업로드될 파일의 크기 5MB
    String encType = "utf-8";		// 인코딩 유형
    
    MultipartRequest multi = new MultipartRequest(
    		request,
    		realFolder,
    		maxSize,
    		encType,
    		new DefaultNamePolicy()
    );
    
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
    
    Enumeration files = multi.getFileNames();
    String fname = (String) files.nextElement();
    String filename = multi.getFilesystemName(fname);

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

    BookRepository dao = BookRepository.getInstance();
    Book newBook = new Book();
    newBook.setBookId(bookId);
    newBook.setName(name);
    newBook.setUnitPrice(price); // unitPrice 대신 price
    newBook.setAuthor(author);
    newBook.setPublisher(publisher);
    newBook.setReleaseDate(releaseDate);
    newBook.setDescription(description);
    newBook.setCategory(category);
    newBook.setUnitsInStock(stock);
    newBook.setCondition(condition);
    newBook.setFilename(filename);

    dao.addBook(newBook);

    response.sendRedirect("books.jsp");
%>
