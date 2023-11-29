// ID중복검사

function idcheck() {
	var id = document.getElementById("id");
	if (id.value == "") {
		alert("아이디 입력")
		id.focus();
		return false;
	} else {
		var ref = "idcheck.jsp?id=" + id.value;
		// open("팝업창에 실행될 문서명", "윈도우 이름", "옵션");
		window.open(ref, "idcheck", "width=300px, height=200px");

	}
}

// 주민번호 뒷자리로 포커스 이동	

function move() {
	var jumin1 = document.getElementById("jumin1");
	var jumin2 = document.getElementById("jumin2");

	if (jumin1.value.length == 6)
		jumin2.focus();

}

// 도메인 선택
function sel() {
	var domain = document.getElementById("domain");
	var email = document.getElementById("email");

	if (email.value == "") { // 직접 입력을 선택한 경우
		domain.readOnly = false;
		domain.value = "";
		domain.focus();


	} else {
		domain.value = email.value;
		domain.readOnly = true;
	}


}

// 유효성 검사

function check() {
	var id = document.getElementById("id");
	var passwd = document.getElementById("passwd");
	var name = document.getElementById("name");
	var jumin1 = document.getElementById("jumin1");
	var jumin2 = document.getElementById("jumin2");
	var mailid = document.getElementById("mailid");
	var domain = document.getElementById("domain");
	var tel1 = document.getElementById("tel1");
	var tel2 = document.getElementById("tel2");
	var tel3 = document.getElementById("tel3");
	var phone1 = document.getElementById("phone1");
	var phone2 = document.getElementById("phone2");
	var phone3 = document.getElementById("phone3");
	var post = document.getElementById("post");
	var address = document.getElementById("address");
	var male = document.getElementById("male");
	var female = document.getElementById("female");
	var h1 = document.getElementById("h1");
	var h2 = document.getElementById("h2");
	var h3 = document.getElementById("h3");
	var h4 = document.getElementById("h4");
	var h5 = document.getElementById("h5");
	var h6 = document.getElementById("h6");
	var h7 = document.getElementById("h7");
	var h8 = document.getElementById("h8");
	var intro = document.getElementById("intro");

	if (id.value == "") {
		alert("ID 입력");
		id.focus();
		return false;
	}
	if (passwd.value == "") {
		alert("비밀번호 입력");
		passwd.focus();
		return false;
	}
	if (name.value == "") {
		alert("이름 입력");
		name.focus();
		return false;
	}
	if (jumin1.value == "") {
		alert("주민번호 앞자리 입력");
		jumin1.focus();
		return false;
	}
	if (jumin1.value.length != 6) {
		alert("주민번호 앞자리 6자 입력");
		jumin1.value = "";
		jumin1.focus();
		return false;
	}
	if (isNaN(jumin1.value)) {
		alert("주민번호 앞자리 숫자만 입력");
		jumin1.value = "";
		jumin1.focus();
		return false;
	}

	if (jumin2.value == "") {
		alert("주민번호 뒷자리 입력");
		jumin2.focus();
		return false;
	}
	if (jumin2.value.length != 7) {
		alert("주민번호 뒷자리 7자 입력");
		jumin2.value = "";
		jumin2.focus();
		return false;
	}
	if (isNaN(jumin2.value)) {
		alert("주민번호 뒷자리 숫자만 입력");
		jumin2.value = "";
		jumin2.focus();
		return false;
	}
	if (mailid.value == "") {
		alert("Email 주소를 입력");
		mailid.focus();
		return false;
	}
	if (domain.value == "") {
		alert("도메인명을 입력");
		domain.focus();
		return false;
	}
	if (tel1.value == "") {
		alert("전화번호 앞자리 입력");
		tel1.focus();
		return false;
	}
	if (isNaN(tel1.value)) {
		alert("전화번호 앞자리 숫자만 입력");
		tel1.value = "";
		tel1.focus();
		return false;
	}
	if (tel2.value == "") {
		alert("전화번호 중간자리 입력");
		tel2.focus();
		return false;
	}
	if (isNaN(tel2.value)) {
		alert("전화번호 중간자리 숫자만 입력");
		tel2.value = "";
		tel2.focus();
		return false;
	}
	if (tel3.value == "") {
		alert("전화번호 뒷자리 입력");
		tel3.focus();
		return false;
	}
	if (isNaN(tel3.value)) {
		alert("전화번호 뒷자리 숫자만 입력");
		tel3.value = "";
		tel3.focus();
		return false;
	}
	if (phone1.value == "") {
		alert("핸드폰 앞자리 입력");
		phone1.focus();
		return false;
	}
	if (isNaN(phone1.value)) {
		alert("핸드폰 앞자리 숫자만 입력");
		phone1.value = "";
		phone1.focus();
		return false;
	}
	if (phone2.value == "") {
		alert("핸드폰 중간자리 입력");
		phone2.focus();
		return false;
	}
	if (isNaN(phone2.value)) {
		alert("핸드폰 중간자리 숫자만 입력");
		phone2.value = "";
		phone2.focus();
		return false;
	}
	if (phone3.value == "") {
		alert("핸드폰 뒷자리 입력");
		phone3.focus();
		return false;
	}
	if (isNaN(phone3.value)) {
		alert("핸드폰 뒷자리 숫자만 입력");
		phone3.value = "";
		phone3.focus();
		return false;
	}
	if (post.value == "") {
		alert("우편번호 선택");
		post.focus();
		return false;
	}
	if (address.value == "") {
		alert("우편번호 선택");
		address.focus();
		return false;
	}
	if (male.checked == false && female.checked == false) {
		alert("성별을 선택");
		return false;
	}

	var cnt = 0;
	if (h1.checked) cnt++;
	if (h2.checked) cnt++;
	if (h3.checked) cnt++;
	if (h4.checked) cnt++;
	if (h5.checked) cnt++;
	if (h6.checked) cnt++;
	if (h7.checked) cnt++;
	if (h8.checked) cnt++;

	if (cnt < 2) {
		alert("취미를 2개 이상 선택하세요.");
		return false;
	}
	if (intro.value == "") {
		alert("자기소개를 입력하세요");
		intro.focus();
		return false;
	}
	if (intro.value.length > 100) {
		alert("자기소개를 100자 이내로 입력하세요")
		intro.focus();
	}


}

