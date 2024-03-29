<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>로그인</title>
<!-- Favicon -->
<link href="img/favicon.ico" rel="icon" />

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
	rel="stylesheet" />

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet" />
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet" />

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"
	integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="js/my.js"></script>
</head>
<body>
	<div class="container-fluid nav-bar bg-transparent">
		<nav class="navbar navbar-expand-lg bg-white navbar-light py-0 px-4">
			<a href="index.jsp"
				class="navbar-brand d-flex align-items-center text-center">
				<div class="icon p-2 me-2">
					<img class="img-fluid" src="img/icon-deal.png" alt="Icon"
						style="width: 30px; height: 30px" />
				</div>
				<h1 class="m-0 text-primary">Happy House</h1>
			</a>
		</nav>
	</div>

	<div class="login-page">
		<h1>Hi</h1>
		<div class="form">
			<form name="login-form" class="login-form">
				<input id="id" name="id" type="text" placeholder="ID" /> <input
					id="pw" name="pw" type="password"
					placeholder="password" />
				<button id="loginBtn" type="button">로그인</button>
				<button id="findPw" type="button">비밀번호 찾기</button>
			</form>
		</div>
	</div>
</body>
</html>
