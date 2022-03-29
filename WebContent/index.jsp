<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>HAPPYHOUSE</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="keywords" />
<meta content="" name="description" />

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
</head>

<body>
	<div class="container-xxl bg-white p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->

		<!-- Navbar Start -->
		<div class="container-fluid nav-bar bg-transparent">
			<nav class="navbar navbar-expand-lg bg-white navbar-light py-0 px-4">
				<a href="index.jsp"
					class="navbar-brand d-flex align-items-center text-center">
					<div class="icon p-2 me-2">
						<img class="img-fluid" src="img/icon-deal.png" alt="Icon"
							style="width: 30px; height: 30px" />
					</div>
					<h1 class="m-0 text-primary">HappyHouse</h1>
				</a> <span id="loginSpan"> <a id="toLogin" href="Login.jsp"><h3
							class="m-0 text-primary">로그인</h3></a> <a id="toRegist"
					href="Regist.jsp"><h3 class="m-0 text-primary">회원가입</h3></a>
				</span>
				<button type="button" class="navbar-toggler"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<div class="navbar-nav ms-auto">
						<a href="" class="nav-item nav-link active">공지사항</a> <a
							href="apt_info.jsp" class="nav-item nav-link">아파트 시세</a> <a
							href="" class="nav-item nav-link">관심 지역 설정</a> <a href=""
							class="nav-item nav-link">관심 지역 둘러보기</a> <a href="user_info.jsp"
							class="nav-item nav-link">회원정보</a>
					</div>
				</div>
			</nav>
		</div>
		<!-- Navbar End -->

		<!-- Header Start -->
		<div class="container-fluid header bg-white p-0">
			<img class="img-fluid" src="img/mainHouse.jpg" width="100%"
				height="20%" />
		</div>
		<!-- Header End -->

		<!-- Team Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="text-center mx-auto mb-5 wow fadeInUp"
					data-wow-delay="0.1s" style="max-width: 600px">
					<h1 class="mb-3">who made</h1>
				</div>
				<div class="row g-4">
					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
						<div class="team-item rounded overflow-hidden">
							<div class="position-relative">
								<img class="img-fluid" src="img/team-1.jpg" alt="" />
								<div
									class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
									<a class="btn btn-square mx-1"
										href="https://www.instagram.com/tion_k/"><i
										class="fab fa-instagram"></i></a>
								</div>
							</div>
							<div class="text-center p-4 mt-3">
								<h5 class="fw-bold mb-0">김시언</h5>
								<small>SSAFY 7기</small>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
						<div class="team-item rounded overflow-hidden">
							<div class="position-relative">
								<img class="img-fluid" src="img/team-2.jpg" alt="" />
								<div
									class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
									<a class="btn btn-square mx-1"
										href="https://www.instagram.com/nada_s_j/"><i
										class="fab fa-instagram"></i></a>
								</div>
							</div>
							<div class="text-center p-4 mt-3">
								<h5 class="fw-bold mb-0">김성진</h5>
								<small>SSAFY 7기</small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Team End -->

		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
	</div>

	<!-- JavaScript Libraries -->
	<!--  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"
		integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script type="text/javascript" src="js/my.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>
