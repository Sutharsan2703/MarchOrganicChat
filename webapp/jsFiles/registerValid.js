var nameError1 = document.getElementById("nameError");
var mailIdError2 = document.getElementById("mailIdError");
var userNameError3 = document.getElementById("userNameError");
var securityError4 = document.getElementById("securityError");
var passwordError5 = document.getElementById("passwordError");
var confirmError6 = document.getElementById("confirmError");
var submitError7 = document.getElementById("submitError");

function nameValidate() {
	let name1 = document.querySelector("#name").value;
	let nameCheck1 = /^([^-\s][a-z.A-Z]{3,35})$/;
	var message;
	if (name1.length === 0) {
		message = "Name must not be empty!";
		nameError1.innerHTML = message;
		return false;

	}
	if (!name1.match(nameCheck1)) {
		message = "Enter valid Name atleast 4 char as (sky.a or a.sky )!";
		nameError1.innerHTML = message;
		return false;

	}
	message = "Valid";
	nameError1.innerHTML = message;
	return true;

}
function mailIdValidate() {
	let mail2 = document.querySelector("#mailId").value;
	let mailCheck2 = /^[^\s@]+@chainsys\.com$/;
	var message;
	if (mail2.length === 0) {
		message = "Mailid must not be empty!";
		mailIdError2.innerHTML = message;
		return false;

	}
	if (!mail2.match(mailCheck2)) {
		message = "Enter valid mail as (name@chainsys.com)!";
		mailIdError2.innerHTML = message;
		return false;

	}
	message = "Valid";
	mailIdError2.innerHTML = message;
	return true;

}
function userNameValidate() {
	let user3 = document.querySelector("#userName").value;
	let userCheck3 = /^([^-\s][a-z .A-Z]{3,25})$/;
	var message;
	if (user3.length === 0) {
		message = "Name must not be empty!";
		userNameError3.innerHTML = message;
		return false;

	}
	if (!user3.match(userCheck3)) {
		message = "Enter valid userName as temporary of atleast 4 character, actual generated after registration!";
		userNameError3.innerHTML = message;
		return false;

	}
	message = "Valid";
	userNameError3.innerHTML = message;
	return true;

}

function securityValidate() {
	let secure4 = document.querySelector("#security").value;
	let secureCheck4 = /^([^-\s][a-zA-Z]{5,25})$/;
	var message;
	if (secure4.length === 0) {
		message = "Answer must not be empty!";
		securityError4.innerHTML = message;
		return false;
	}
	if (!secure4.match(secureCheck4)) {
		message = "Enter answer for security question atleast of six characters !  Only alphabets!";
		securityError4.innerHTML = message;
		return false;

	}
	message = "Valid";
	securityError4.innerHTML = message;
	return true;

}
function passwordValidate() {
	let pass5 = document.querySelector("#password").value;
	let passCheck5 = /^[1-9]\d{5,15}$/;
	var message;

	if (!pass5.match(passCheck5)) {
		message = "Enter Password within six to 16 digits !";
		passwordError5.innerHTML = message;
		return false;

	}
	message = "Valid";
	passwordError5.innerHTML = message;
	return true;

}

function viewPassword() {
	var view5 = document.getElementById("password");
	if (view5.type === "password") {
		view5.type = "text";
	} else {
		view5.type = "password";
	}

}


function confirmValidate() {
	let conf6 = document.querySelector("#confirm").value;
	let confCheck6 = /^[1-9]\d{5,20}$/;
	let pass5 = document.querySelector("#password").value;

	var message;

	if (!conf6.match(confCheck6)) {
		message = "Enter Password atleast six digits !";
		confirmError6.innerHTML = message;
		return false;

	}


	if (conf6 !== pass5) {
		message = "Confirm Password should be same as Password... !";
		confirmError6.innerHTML = message;
		return false;

	}
	message = "Valid";
	confirmError6.innerHTML = message;
	return true;

}

function formValidate() {
	if (!nameValidate() || !mailIdValidate() || !userNameValidate() || !securityValidate() || !passwordValidate()
		|| !confirmValidate()) {
		submitError7.style.display = 'block';
		submitError7.innerHTML = 'Errors On Form ... Fix it to Register! ';
		setTimeout(function() { submitError7.style.display = 'none'; }, 3000)
		return false;
	}
	let form1 = document.querySelector("#regForm");
	form1.style.display = 'none';
	form1.submit();
	alert('Registration Successfull');
	return true;

}


