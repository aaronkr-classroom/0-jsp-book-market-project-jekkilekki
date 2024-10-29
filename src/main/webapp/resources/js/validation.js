/**
 * 
 */
function CheckAddBook() {
	
	let bookId = document.getElementById("bookId");
	let name = document.getElementById("name");
	let unitPrice = document.getElementById("unitPrice");
	let unitsInStock = document.getElementById("unitsInStock");
	let description = document.getElementById("description");
	
	// 도서 아이디 체크
	if (!check())
		return false;
		
	// 도서명 체크
	if (name.value.length < 4 || name.value.length > 50) {
		alert("[도서명]\n최소 4자에서 최대 50자까지 입력하세요.");
		name.focus();
		return false;
	}
	
	// 도서 가격 체크
	
	// 제고 수 체크
}