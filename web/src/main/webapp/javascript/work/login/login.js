/**
 * 
 */

 	function check(){
		
		var id = document.getElementById("id");
		var passwd = document.getElementById("passwd");
		
		if(id.value == ""){
			alert("id입력");
			id.focus();
			return false;
		}
		if(passwd.value == ""){
			alert("pw입력");
			passwd.focus();
			return false;
		}
		
	}