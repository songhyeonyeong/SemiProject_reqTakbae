<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/include/common.jsp" %>

<title>회원가입</title>
</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">회원가입</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			회원가입
			<span>홈 &gt; 회원가입</span>
		</div>

		<table class="boardWrite wth700 mr_auto mt30"><!-- boardWrite S-->
			<caption>회원가입 리스트입니다.</caption>
			<colgroup>
				<col style="width:30%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
			<tr>
				<th scope="row">아이디</th>
				<td >
					<label for=""></label>
					<input id="SId" name="" type="text" value="" >
					<span>
						<a id="idCheckBtn" class="sbtn db" >중복확인</a>
						<span id="idCheckMsg"></span>
					</span>
				</td>
				<td><img id="idCheckImg" src=""></td>
			</tr>
			<tr>
				<th scope="row">비밀번호</th>
				<td>
					<label for=""></label>
					<input id="SPwd" name="" type="password" value="" > 
					<span id="pwdCheckMsg"></span>
				</td>
				<td><img id="pwdCheckImg" src=""></td>
			</tr>
			<tr>
				<th scope="row">비밀번호 확인</th>
				<td>
					<label for=""></label>
					<input id="SPwd2" name="" type="password" value="" > 
				</td>
				<td><img id="pwdCheckImg2" src=""></td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td>
					<label for=""></label>
					<input id="SName" name="" type="text" value="" > 
				</td>
				<td><img id="nameCheckImg" src=""></td>
			</tr>
			<tr>
				<th scope="row">휴대폰번호</th>
				<td>
					<!-- <span><label for=""></label><input id="Sphone1" name="" class="wth50" type="text" value="" ></span>
					<span> - </span>
					<span><label for=""></label><input id="Sphone2" name="" class="wth60" type="text" value="" ></span>
					<span> - </span>
					<span><label for=""></label><input id="Sphone3" name="" class="wth60" type="text" value="" ></span>
				 -->
				 <span><label for=""></label><input id="Sphone" name="" type="text" value="" placeholder="-없이 입력"></span>
				 </td>
				<td><img id="phoneCheckImg" src=""></td>
			</tr>
			<tr>
				<th scope="row">이메일</th>
				<td>
					<span><label for=""></label><input id="Semail1" name="" class="wth100" type="text" value="" ></span>
					<span>@</span>
					<span><label for=""></label>
						<input id="Semail2" type="text" class="wth100">
						<select id="email">
								<option value="self" selected>직접입력</option>
								<option value="naver">naver.com</option>
								<option value="daum">daum.net</option>
								<option value="google">google.com</option>
						</select>
					</span>
					<span>
						<a class="sbtn db" id="sendEmail">인증번호 발송</a>
					</span>
					
					
					<%
						//인증시 인증하기 버튼 보이게
					%>
					
					<%!
						public int getRandom(){
							int randomCode=0;
							randomCode = (int)Math.floor((Math.random()*99999-10000+1))+10000;
							return randomCode;
						}
					%>
					
					<span>
						<input type="hidden" value="<%=getRandom()%>" id="randomCode">
						<input type="hidden" value="takbububu@gmail.com" id="from">
					</span>
					
					<br><br>
					<span>
						<input id="authCode" type="text" placeholder="인증번호를 입력하세요">
						<a class="sbtn db" onclick="auth();">인증하기</a>
					</span>
					
				</td>
				<td><img id="emailCheckImg" src=""></td>
			</tr>
			<tr>
				<th scope="row" rowspan="3">계좌번호</th>
				<td >
					<span>
						<label for=""></label>
						은행명  <select id="bankName" name="bankName">
								<option value="nongHyup">농협</option>
								<option value="shinHan">신한은행</option>
								<option value="ibk">기업은행</option>
							</select><br>
						계좌번호 <input id="accountNum" name="" type="text"><br>
						생년월일 <input id="birth" type="text" placeholder="951015형식으로 입력"><br>
						예금주  <input id="depositor" type="text">
						<span id="bankCheck" class="sbtn db" onclick="testtest();">계좌 인증</span>
						<!-- <span id="accountCheck"> </span> -->
						<%
							Calendar cal = Calendar.getInstance();
							java.util.Date date = cal.getTime();
							String today = (new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(date));
						%>
						<input id="today" type="hidden" value="<%= today %>" ><br>
					</span>
				</td>
				<td><img id="accountCheck" src=""></td>
			</tr>
			</tbody>
		</table><!--// boardWrite E-->

		<div class="btnbox mt20"><!-- btnbox S-->
			<span><a class="mbtn gy" href="#">새로입력</a></span>
			<span><a class="mbtn db" href="join3.jsp">회원가입하기</a></span>
		</div><!--// btnbox E-->

	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

<script>
	var checkImgPath="/reqtakbae/views/common/images/contents/check.PNG";
	
	//아이디 정규표현식 && 중복체크
	$("#idCheckBtn").click(function(){
		var SId = $("#SId").val();
		var regExp = /^[a-z0-9]{3,}$/;
		
		if(regExp.test(SId)){
			$.ajax({
				url:"/reqtakbae/idCheck.me",
				type:"post",
				data:{SId:SId},
				success:function(data){
					if(data=="YES"){
						if(SId != "") {
							$("#idCheckMsg").html("");
							//$("#idCheckMsg").css("color","black");
							$("#idCheckImg").attr("src",checkImgPath);
						}
					}else{
						$("#idCheckMsg").html("이미 사용중인 아이디입니다");
						$("#idCheckMsg").css("color","red");
						$("#idCheckImg").attr("src","");
					}
				}
				
			})
		}else{
			alert("아이디 : 영문소문자/숫자 조합 3자리 이상");
			$("#idCheckMsg").html("");
			//$("#idCheckMsg").css("color","red");
			$("#idCheckImg").attr("src","");
		}
	});
	
	
	//비밀번호 유효성체크
	$("#SPwd").change(function(){
		var pwd1 = $("#SPwd").val();
		
		var regExp=/^[a-z0-9]{3,}$/;
		
		if(!regExp.test(pwd1)){
			alert("비밀번호 : 영문소문자/숫자 조합 3자리 이상");
			$("#SPwd").val("");
			$("#SPwd2").val("");
			$("#pwdCheckImg").attr("src","");
			$("#pwdCheckImg2").attr("src","");
		}else{
			
		}
	});
	
	//비밀번호 체크
	$("#SPwd2").change(function(){
		var pwd1 = $("#SPwd").val();
		var pwd2 = $("#SPwd2").val();
		
		if(pwd1 != pwd2){
			$("#pwdCheckMsg").html("비밀번호가 일치하지 않습니다");
			$("#pwdCheckMsg").css("color","red");
			
			$("#SPwd").val("");
			$("#SPwd2").val("");
			$("#pwdCheckImg").attr("src","");
			$("#pwdCheckImg2").attr("src","");
		}else if(pwd2==null || pwd1==null){
			$("#pwdCheckMsg").html('');
			$("#pwdCheckImg").attr("src","");
			$("#pwdCheckImg2").attr("src","");
		}else{
			$("#pwdCheckMsg").html('');
			$("#pwdCheckImg").attr("src",checkImgPath);
			$("#pwdCheckImg2").attr("src",checkImgPath);
		}
		
	});
	
	
	//이름 체크
	$("#SName").change(function(){
		var name = $("#SName").val();
		var regExp =/^[ㄱ-ㅎㅏ-ㅣ가-힣]{1,}$/;
		
		if(regExp.test(name)){
			$("#nameCheckImg").attr("src",checkImgPath);
		}else{
			alert("이름 : 한글 ");
			$("#nameCheckImg").attr("src","");
		}
	});
	
	
	//핸드폰 체크
	$("#Sphone").change(function(){
		var phone = $("#Sphone").val();
		var regExp=/[^-]{11,12}$/;
		
		if(regExp.test(phone)){
			$("#phoneCheckImg").attr("src",checkImgPath);
		}else{
			alert("휴대폰번호 : -없이 11-12자리");
			$("#phoneCheckImg").attr("src","");
		}
		
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//이메일 select 선택시 값 변경
	 $("#email").change(function(){
		if($("#email option:selected").val() == "naver"){
			//$("#Semail2").attr("value",$(this).find("option[value='" + $(this).val() + "']").text());
			$("#Semail2").attr("value","naver.com");
		}else if($("#email option:selected").val() == "daum"){
			$("#Semail2").attr("value","daum.net");
		}else if($("#email option:selected").val() == "google"){
			$("#Semail2").attr("value","google.com");
		}else if($("#email option:selected").val() == "self"){
			$("#Semail2").attr("value","");
		}
	}); 
	
	
	
	
	
	var randomCode = $("#randomCode").val();
	//이메일 인증번호 발송
	$("#sendEmail").click(function(){		
		var email1 = $("#Semail1").val();
		var email2 = $("#Semail2").val();
		var fullEmail = email1 + "@" +email2;
	
		$.ajax({
			url:"/reqtakbae/sendEmail",
			type:"post",
			data:{fullEmail:fullEmail,randomCode:randomCode},
			success:function(data){
				if(data == "YES"){
					alert("인증코드 발송");
				}else{
					alert("인증코드실패");
				}
			},
			error:function(data){
				console.log("이메일 통신 실패");
			}
			
		});
	});
	
	
	
	
	//이메일 인증코드 확인
	function auth(){
		if($("#authCode").val() == randomCode){
			alert("이메일 인증 성공");
			//$("#emailCheck").html("인증 성공");
			//$("#emailCheck").css("color","black");
			$("#emailCheck").attr("src","/reqtakbae/views/common/images/contents/check.PNG");
		}else{
			alert("이메일 인증 실패");
			$("#emailCheck").html("인증 실패");
			$("#emailCheck").css("color","red");
		}
		
	}
	
	
	
	
	//계좌 인증
	var token;
	function testtest(){
		
		var cId="l7xx4d589e5dd8fb46d6afcf7e22fd7039ed";
		var cSecret="2b229cffd50b45c08f0cde6158ab69c1";
		
		$.ajax({
			url:"https://testapi.open-platform.or.kr/oauth/2.0/token",
			type:"POST",
			contenttype:"application/x-www-form-urlencoded; charset=UTF-8",
			data:{client_id:cId, client_secret:cSecret, scope:"oob", grant_type:"client_credentials"},
			success:function(data){
				console.log(data);
				
				token=data.access_token;
				console.log(token);
				
				bankbank();
			},
			error:function(data){
				alert("오류");
			}
		});
	}
	
	function bankbank(){
			var accountNum = $("#accountNum").val();
			var depositor = $("#depositor").val();
			var birth = $("#birth").val();
			var bankName = $("#bankName option:selected").val();
			var today = $("#today").val();
			
			var bankNum="0";
			
			
			if(bankName=="nongHyup"){
				bankNum="011";
			}else if(bankName=="shinHan"){
				bankNum="088";
			}else if(bankName=="ibk"){
				bankNum="003";
			}
			console.log("bankNum: "+bankNum);
			
			console.log("accountNum: "+accountNum);
			console.log("depositor: "+depositor);
			console.log("birth: "+birth);
			console.log("bankName: "+bankName);
			console.log("today: "+today); 
			
			
			var data={
					"bank_code_std": bankNum,"account_num": accountNum, "account_holder_info": birth, "tran_dtime": today
					
			}
			
			
			$.ajax({
				url:"https://testapi.open-platform.or.kr/inquiry/real_name",
				type:"POST",
				ContentType:"application/json; charset=UTF-8",
				redirect_uri:"http://localhost:8880/html/callback.html",
			    headers: {'Authorization': ('Bearer ' + token)},
				data:JSON.stringify(data),
				success:function(data){
					console.log(data);
					if(depositor==data.account_holder_name && accountNum==data.account_num && bankNum==data.bank_code_std){
						alert("계좌 인증 성공");
						//$("#accountCheck").html("인증 성공");
						//$("#accountCheck").css("color","black");
						$("#accountCheck").attr("src","/reqtakbae/views/common/images/contents/check.PNG");
					}else{
						alert("계좌 인증 실패");
						$("#accountCheck").html("인증 실패");
						$("#accountCheck").css("color","red");
					}
				},
				error:function(data){
					alert("오류");
				}
				
			});
	}
	
	
	
	</script>

</body>
</html>
















