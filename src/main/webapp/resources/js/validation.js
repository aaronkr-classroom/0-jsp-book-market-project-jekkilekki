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
	if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[가격]\n숫자만 입력하세요");
		unitPrice.focus();
		return false;
	}
	
	if (unitPrice.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다");
		unitPrice.focus();
		return false;
	}
	
	// 제고 수 체크
	if (isNaN(unitsInStock.value)) {
		alert("[재고 수]\n숫자만 입력하세요");
		unitsInStock.focus();
		return false;
	}
	
	if (description.value.length < 100) {
		alert("[상세설명]\n최소 100자 이상 입력하세요");
		description.focus();
		return false;
	}
	
	let check = (regExp, e, msg) => {
		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.focus();
		return false;
	};
	
	document.newBook.submit();
}