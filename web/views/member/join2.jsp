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
				<td colspan="3">
					<label for=""></label>
					<!-- <input id="" name="" class="wth300" type="text" value="" > -->
					<input id="SId" name="" type="text" value="" >
					<span><a id="idCheckBtn" class="sbtn db" >중복확인</a></span>
					<span id="idCheck"> </span>
				</td>
			</tr>
			<tr>
				<th scope="row">비밀번호</th>
				<td>
					<label for=""></label>
					<input id="SPwd" name="" type="text" value="" > 
				</td>
			</tr>
			<tr>
				<th scope="row">비밀번호 확인</th>
				<td>
					<label for=""></label>
					<input id="SPwd2" name="" type="text" value="" > 
				</td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td>
					<label for=""></label>
					<input id="SName" name="" type="text" value="" > 
				</td>
			</tr>
			<tr>
				<th scope="row">휴대폰번호</th>
				<td>
					<span><label for=""></label><input id="Sphone1" name="" class="wth50" type="text" value="" ></span>
					<span> - </span>
					<span><label for=""></label><input id="Sphone2" name="" class="wth60" type="text" value="" ></span>
					<span> - </span>
					<span><label for=""></label><input id="Sphone3" name="" class="wth60" type="text" value="" ></span>
				</td>
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
					<span><a class="sbtn db" href="/reqtakbae/emailCheck.me">이메일 인증</a></span>
				</td>
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
						<!-- <span id="bankCheck" class="sbtn db">계좌 인증</span><br>
						<span id="testtest" class="sbtn db">testtest</span><br> -->
						<span id="bankCheck" class="sbtn db" onclick="testtest();">계좌 인증</span><br>
						
						<%
							Calendar cal = Calendar.getInstance();
							java.util.Date date = cal.getTime();
							String today = (new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(date));
						%>
						<input id="today" type="hidden" value="<%= today %>" ><br>
					</span>
				</td>
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
	$("#idCheckBtn").click(function(){
		var SId = $("#SId").val();
		
		$.ajax({
			url:"/reqtakbae/idCheck.me",
			type:"post",
			data:{SId:SId},
			success:function(data){
				if(data=="YES"){
					if(SId != "") {
						$("#idCheck").html("사용가능");
						$("#idCheck").css("color","black");
					}
				}else{
					$("#idCheck").html("사용불가");
					$("#idCheck").css("color","red");
					$("#SId").val('');
				}
			}
			
		})
	});
	
	
	
	
	
	
	
	 $("#email").change(function(){
		if($("#email option:selected").val() == "naver"){
			$("#Semail2").attr("value","naver.com");
		}else if($("#email option:selected").val() == "daum"){
			$("#Semail2").attr("value","daum.net");
		}else if($("#email option:selected").val() == "google"){
			$("#Semail2").attr("value","google.com");
		}else{
			$("#Semail2").attr("value","");
		}
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 
	 
	 /* var token;
	 $("#testtest").click(function(){
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
		
	}); */
	 
	
	/* $("#bankCheck").click(function(){
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
				}else{
					alert("계좌 인증 실패");
				}
			},
			error:function(data){
				alert("오류");
			}
			
		});

		
	}); */
	
	
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
					}else{
						alert("계좌 인증 실패");
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
















