<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/include/common.jsp" %>

<title>아이디/비밀번호 찾기</title>
</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">아이디/비밀번호 찾기</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			아이디/비밀번호 찾기
			<span>홈 &gt; 아이디/비밀번호 찾기</span>
		</div>


		<div class="mr_auto wth250" align="center" >
			<ul>
				<li style="margin-top: 10px;">
					<input type="radio" name="userDiv" value="신청자" style="width:20px; height:20px" checked>신청자 &nbsp; &nbsp;
					<input type="radio" name="userDiv" value="기사" style="width:20px; height:20px">기사
				</li>
			</ul>
		</div>
		
		<div class="mr_auto wth550">
			<ul class="flo_left wth250 mt50">
				<li class="font22 bold tcen ">아이디찾기</li><br>
				<li class="mt10">
					<span>
						<img src="/reqtakbae/views/common/images/contents/name.PNG" width="35px" height="35px" align="center">&nbsp;&nbsp;
						<input id="IdFindName" name="name" class="pt5 pl5 pr5 pb5" type="text" value="" placeholder="이름" >
					</span>
				</li>
				
				<li class="mt10">
					<span>
						<img src="/reqtakbae/views/common/images/contents/email.PNG" width="35px" height="35px" align="center">&nbsp;&nbsp;
						<input id="IdFindEmail" name="email" class="pt5 pl5 pr5 pb5" type="text" value="" placeholder="이메일">
					</span>
				</li>
				<li>
					<div class="btnbox mt30">
						<span><a class="mbtn db wth70" onclick="idFind();">아이디 찾기</a></span>
					</div>
				</li>
			</ul>
			
			
			
			<ul class="flo_right wth250 mt50 ml50">
				<li class="font22 bold tcen ">비밀번호찾기</li><br>
				<li class="mt10">
					<span>
						<img src="/reqtakbae/views/common/images/contents/id.PNG" width="35px" height="35px" align="center">&nbsp;&nbsp;
						<input id="PwdFindId" name="id" class="pt5 pl5 pr5 pb5" type="text" value="" placeholder="아이디">
					</span>
					
				</li>
				<li class="mt10"> 
					<span>
						<img src="/reqtakbae/views/common/images/contents/email.PNG" width="35px" height="35px" align="center">&nbsp;&nbsp;
						<input id="PwdFindEmail" name="email" class="pt5 pl5 pr5 pb5" type="text" value="" placeholder="이메일">
					</span>
				
				</li>
				<li>
					<div class="btnbox mt30">
						<span><a class="mbtn db wth90" onclick="pwdFind();">비밀번호 찾기</a></span>
					</div>
				</li>
			</ul>
		</div>

	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

<script>
	var userDiv;
	if($("input:radio[name=userDiv]:checked").val()=="기사"){
		userDiv="기사";
	}else{
		userDiv="신청자";
	}
	
	//아이디찾기
	function idFind(){
		
		var findDiv="id";
		
		var name = $("#IdFindName").val();
		var email = $("#IdFindEmail").val();
		
		$.ajax({
			url:"/reqtakbae/find",
			type:"post",
			data:{name:name,email:email,userDiv:userDiv,findDiv:findDiv},
			success:function(data){
				if(data=="YES"){
					alert("이메일로 아이디 전송")
				}else{
					alert("이름과 아이디를 다시 확인해주세요")
				}
			}
		});
	}
	
	//비밀번호찾기
	function pwdFind(){
		//var randomCode = Math.floor((Math.random()*9999999-999999))+1000000;
		
		
		var randomCode ="";
		var word="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		for(var i=0;i<10;i++){
			randomCode += word.charAt(Math.floor(Math.random()*word.length));
		}
		console.log("과연 :"+randomCode);
		
		
		
		var findDiv="pw";
		
		var name = $("#PwdFindName").val();
		var email = $("#PwdFindEmail").val();
		var id = $("#PwdFindId").val();
		
		$.ajax({
			url:"/reqtakbae/findPw.me",
			type:"post",
			data:{email:email,id:id,userDiv:userDiv,findDiv:findDiv,randomCode:randomCode,userPwd:randomCode},
			success:function(data){
				if(data=="YES"){
					alert("이메일로 임시비밀번호 전송")
				}else{
					alert("이름, 이메일, 아이디를 다시 확인해주세요")
				}
			}
			
		});
		
		
	}
	
</script>

</body>
</html>