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
<script>
</script>
</head>

<body>
	<div class="container-xxl bg- p-0">
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
		<div>
			<div class="container-fluid bg-primary mb-5 wow fadeIn"
				data-wow-delay="0.1s" style="padding: 35px">
				<div class="container">
					<div class="row g-2">
						<div class="col-md-10">
							<div class="row g-2">
								<div class="col-md-4">
									<select class="form-select border-0 py-3" id="dosi"
										onchange="changeSelect1()">
										<option selected>시/도</option>
										<option value="서울특별시">서울특별시</option>
										<option value="부산광역시">부산광역시</option>
										<option value="대구광역시">대구광역시</option>
										<option value="인천광역시">인천광역시</option>
										<option value="광주광역시">광주광역시</option>
										<option value="대전광역시">대전광역시</option>
										<option value="울산광역시">울산광역시</option>
										<option value="경기도">경기도</option>
										<option value="강원도">강원도</option>
										<option value="충청북도">충청북도</option>
										<option value="충청남도">충청남도</option>
										<option value="전라북도">전라북도</option>
										<option value="전라남도">전라남도</option>
										<option value="경상북도">경상북도</option>
										<option value="경상남도">경상남도</option>
										<option value="제주특별자치도">제주특별자치도</option>
									</select>
								</div>
								<div class="col-md-4">
									<select class="form-select border-0 py-3" id="sigu"
										onchange="changeSelect2()">
										<option selected>시/구</option>
									</select>
								</div>
								<div class="col-md-4">
									<select class="form-select border-0 py-3" id="dong">
										<option selected>동/읍</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-2">
							<button id="searchBtn"
								class="btn btn-dark border-0 w-100 py-3">Search</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="apt_list">
			<!-- 좌측 아파트 목록 -->
			<ul>
				<h1>아파트 목록</h1>
				<div
					style="border: 1px solid black; width: 300px; height: 400px; overflow: scroll">
					<p id="aptlist"></p>
				</div>
			</ul>
		</div>

		<div>
			<!-- 우측 지도 -->

			<div id="maps"
				style="width: 70%; height: 400px; margin-left: 370px; margin-top: 105px"></div>
		</div>
		<!-- Header End -->
	</div>

	<!-- JavaScript Libraries -->
	<!--  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>-->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=856533f648c6f5e84ec9013a3ba3d8e4&libraries=services"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"
		integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script type="text/javascript" src="js/my.js"></script>
	<script type="text/javascript" src="js/map.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>
