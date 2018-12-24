<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/admin/include/common.jsp" %>


<title>택배를 부탁해 관리자페이지</title>
</head>
<body>
<div id="loginWrap"><!-- loginWrap S -->

	<h1><em class="orange font30 bold">택배를 부탁해</em> 관리자페이지</h1>

	<div class="loginBar mt20">
		<div class="loginBox">				
			<p class="mt50"><span>아이디</span> <label for="member_id">아이디</label><input name="member_id" id="member_id" type="text" placeholder="아이디를 입력하세요" /></p>
			<p class="mt5"><span>패스워드</span> <label for="member_pass">패스워드</label><input name="member_pass" id="member_pass" type="password"  placeholder="비밀번호를 입력하세요"/></p>
			<div><a class="flo_right btn" href="memberList1.jsp">로그인</a></div>
		</div>
	</div>
</div><!--// loginWrap E-->

</body>
</html>