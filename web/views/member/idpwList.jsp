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


		<div class="mr_auto wth550" align="center">
			<ul>
				<li>
					<input type="radio" name="userDiv" value="신청자" >신청자
					<input type="radio" name="userDiv" value="기사" >기사
				</li>
			</ul>
		</div>
		
		<div class="mr_auto wth550">
			
			
			<ul class="flo_left wth250 mt50">
				<li class="font24 bold tcen ">아이디찾기</li><br>
				<li class="mt10">
					<span>
						<img src="/reqtakbae/views/common/images/contents/name.PNG" width="35px" height="35px" align="center">&nbsp;&nbsp;
						<input id="IdFindName" name="name" class="pt5 pl5 pr5 pb5" type="text" value="" placeholder="이름" >
					</span>
				</li>
				<!-- <li class="mt10">
					<span class="wth50 inline"><img src="/reqtakbae/views/common/images/contents/email.PNG"></span>
					<span><label for=""></label><input id="IdFindEmail" name="email" class="pt5 pl5 pr5 pb5" type="text" value="" ></span> 
				</li> -->
				
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
				<li class="font24 bold tcen ">비밀번호찾기</li><br>
				<li class="mt10">
					<span>
						<img src="/reqtakbae/views/common/images/contents/name.PNG" width="35px" height="35px" align="center">&nbsp;&nbsp;
						<input id="PwdFindName" name="name" class="pt5 pl5 pr5 pb5" type="text" value="" placeholder="이름">
					</span>
				</li>
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
	if($("input:radio:checked").val()=="기사"){
		userDiv="기사";
	}else if($("input:radio:checked").val()=="신청자"){
		userDiv="신청자";
	}
	
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
	
	
	function pwdFind(){
		var randomCode = Math.floor((Math.random()*9999999-999999))+1000000;
		
		var findDiv="pw";
		
		var name = $("#PwdFindName").val();
		var email = $("#PwdFindEmail").val();
		var id = $("#PwdFindId").val();
		
		$.ajax({
			url:"/reqtakbae/findPw.me",
			type:"post",
			data:{name:name,email:email,id:id,userDiv:userDiv,findDiv:findDiv,randomCode:randomCode,userPwd:userPwd},
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