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

		<table class="boardWrite wth500 mr_auto mt30"><!-- boardWrite S-->
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
					<span><label for=""></label><input id="Semail2" name="" class="wth100" type="text" value="" ></span>
					<span><a class="sbtn db" href="#">이메일 인증</a></span>
				</td>
			</tr>
			<tr>
				<th scope="row" rowspan="3">계좌번호</th>
				<td >
					<span>
						<label for=""></label>
						은행명  <select id="bankName">
								<option value="nongHyup">농협</option>
								<option value="shinHan">신한은행</option>
								<option value="ibk">기업은행</option>
							</select><br>
						계좌번호 <input id="accountNum" name="" type="text" value=""><br>
						생년월일 <input id="birth" name="" type="text" placeholder="951015형식으로 입력"><br>
						예금주  <input id="depositor" name="" type="text" value=""><span id="bankCheck" class="sbtn db">계좌 인증</span><br>
						<span id="testtest" class="sbtn db">testtest</span><br>
						
						<%-- <%
							Calendar cal = Calendar.getInstance();
							java.util.Date date = cal.getTime();
							String today = (new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(date));
						%>
						<input id="today" name="" type="text" value="<%= today %>" hidden><br> --%>
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
	
	
	
	
	/* $("#bankCheck").click(function(){
			var cId="l7xx4d589e5dd8fb46d6afcf7e22fd7039ed";
			var cSecret="2b229cffd50b45c08f0cde6158ab69c1";
		$.ajax({
			url:"https://testapi.open-platform.or.kr/oauth/2.0/token",
			type:"POST",
			contenttype:"application/x-www-form-urlencoded; charset=UTF-8",
			data:{client_id:cId, client_secret:cSecret, scope:"oob", grant_type:"client_credentials"},
			success:function(data){
				console.log(data);
			},
			error:function(data){
				alert("오류");
			}
			
		});
		
	});
	 */
	 var token;
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
			},
			error:function(data){
				alert("오류");
			}
			
		});
		
	});
	 
	
	$("#bankCheck").click(function(){
		var accountNum = $("#accountNum").val();
		var depositor = $("#depositor").val();
		var birth = $("#bankName").val();
		var bankName = $("#bankName").val();
		
		var today = $("#today").val();
		//console.log("today"); 
		
		var bankNum="0";
		
		
		if(bankName=="nongHyup"){
			bankNum="011";
		}else if(bankName=="shinHan"){
			bankNum="088";
		}else if(bankName=="ibk"){
			bankNum="003";
		}
		
		$.ajax({
			url:"https://testapi.open-platform.or.kr/inquiry/real_name",
			type:"POST",
			ContentType:"application/json; charset=UTF-8",
			/* data:{bank_code_std:bankNum, account_num:accountNum, account_holder_info_type:" ", account_holder_info:depositor, tran_dtime : today}, */
		    headers: {'Authorization': ('Bearer ' + token)},
			data:{"bank_code_std": "003","account_num": "01035861733", "account_holder_info": "951015", "tran_dtime": "20181226212139"},
			success:function(data){
				console.log(data);
			},
			error:function(data){
				alert("오류");
			}
			
		});
	});
	
	
	
	
	
	
	
	</script>

</body>
</html>
















