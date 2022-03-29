$(document).ready(function () {
	const id = $.cookie("id");
	if (id) {
		$("#loginSpan").html(id + "<button id ='logoutBtn'>logout</button>");
	}

	$(document).on("click", "#logoutBtn", function () {
		$.post("main", { sign: "logout" }, function () {
			$.removeCookie("id");
			location.reload();
		});
	});

	$("#loginBtn").click(function () {
		const id = $("#id").val();
		const pw = $("#pw").val();

		$.post("main", { id, pw, sign: "login" }, function (data) {
			if(data=="ok"){
				$.cookie("id", id);
				location.href = "index.jsp";
			}
		});
	});
	
	$("#findPw").click(function () {
		let id = $("#id").val();
		let user = JSON.parse(localStorage.getItem(id));

		alert("비밀번호는 " + user.password + "입니다.");
	});

	$("#registBtn").click(function () {
		let id = $("#id").val();
		let password = $("#password").val();
		let name = $("#name").val();
		let email = $("#email").val();
		let age = $("#age").val();
		
		$.post("main", { id, password, name, email, age, sign: "regist" }, function (data) {
			if(data=="ok"){
				location.href = "index.jsp";
			}
		});
	});

	$("#user_info_button_ok").click(function () {
		location.href = "index.jsp";
	});

	$("#user_info_button_edit").click(function () {
		let id = $("#user_info_id").val();
		let password = $("#user_info_password").val();
		let name = $("#user_info_name").val();
		let email = $("#user_info_email").val();
		let age = $("#user_info_age").val();

		const user = {
				id: id,
				password: password,
				name: name,
				email: email,
				age: age,
		};

		localStorage.setItem(id, JSON.stringify(user));
		alert("회원정보 수정");
		location.href = "index.jsp";
	});
	
	$("#user_info_button_remove").click(function () {
		alert(user_info.id + "님 회원탈퇴하셨습니다.");
		$.removeCookie("id");
		localStorage.removeItem(user_info.id);
		location.href = "index.jsp";
	});

	var aptname;
	$(".aptlistBtn").click(function () {
		window.open("detail.html", "poll", "width=420, height=300, top=300, left=400");
		aptname = $();
	});
});
