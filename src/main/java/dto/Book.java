package dto;

import java.io.Serializable;

public class Book implements Serializable {

	private static final long serialVersionUID = -4274700572038677000L;
	
	private String bookId;			// 도서ID
	private String name; 			// 도서명
	private int unitPrice;			// 가격
	private String author;			// 저자
	private String description;		// 설명
	private String publisher;		// 출판사
	private String category;		// 분류
	private long unitsInStock;		// 재고 개수
	private String releaseDate;		// 출판일 (월/년)
	private String condition;		// 신제품 or 구제품 or 리퍼브제품
	private String filename;		// 이미지 파일명
	
	// 생성자
	public Book() {
		super(); // Serializable() 부모 클래스의 생성자를 호출하기
	}
	
	public Book(String bookId, String name, Integer unitPrice) {
		this.bookId = bookId;
		this.name = name;
		this.unitPrice = unitPrice;
	}

	// Getter와 Setter 함수들
	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
}