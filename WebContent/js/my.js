//$(document).ready(function(){
//	const id = $.cookie("id");
//	if(id){
//		$("#loginSpan").html( user.id+"님 접속" +"<button id='logoutBtn'>logout</button>");
//	}
//	
//	$("#loginBtn").click(function () {
//		const id = $("#id").val();
//		const pw = $("#pw").val();
//		$.post("http://localhost:8080/0310_HaapyHouse/main", { id, pw, sign:"login" }, function (data) {
//			const user = JSON.parse(data);
//			if(user.id){
//				$.cookie("id",user.id)
//			}
////			if(user.id=="ssafy"&& user.pw=="1234"){
////				alert("로그인 성공");
////				 $('#loginSpan').html( user.id+"님 접속" +"<button id='logoutBtn'>logout</button>");
////			} else if(user.id!="ssafy"){
////				alert("아이디가 잘 못 되었습니다.");
////				location.reload();
////			} else{
////				alert("비밀번호가 잘 못 되었습니다.");
////				location.reload();
////			}
//			});
//	})
//	
//	$(document).on("click","#logoutBtn",function(){
//		alert("로그아웃!");
//		location.reload();
//	})
//})
//

$(document).ready(function(){
   const id = $.cookie("id");
   if(id){
      $("#loginSpan").html(id +"<button id ='logoutBtn'>logout</button>")
   }
   $(document).on("click", "#logoutBtn", function() {
      $.post("main",{sign:"logout"},function(){
         $.removeCookie("id");
         location.reload();
      });
   });
   $("#loginBtn").click(function() {
      const id = $("#id").val();
      const pw = $("#pw").val();
      
      $.post("main", {id, pw, sign: "login"}, function(data){
         //const user = JSON.parse(document.cookie);
         console.log(data);
         let obj = JSON.parse(data);
         console.log(obj);
         if(obj.id){
            $.cookie("id", obj.id);
            $("#loginSpan").html(id +"<button id ='logoutBtn'>logout</button>")
         }
      });
   });

   $("#regist").click(function(){
	   let id = $("#id").val();
	   let password = $("#password").val();
	   let name = $("#name").val();
	   let email = $("#email").val();
	   let age = $("#age").val();
	   
	   const user  = {
			      id: id,
			      password: password,
			      name: name,
			      email: email,
			      age: age,
	   };
	   
	   localStorage.setItem(name, JSON.stringify(user));
	   alert("회원가입 완료");
   });
   
});
