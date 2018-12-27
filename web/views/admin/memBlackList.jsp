<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>
<% 
	String tabon="3";
	ArrayList<Admin> list = (ArrayList<Admin>)request.getAttribute("list");
%>
<%@ include file="/views/admin/include/common.jsp" %>


<title>택배를 부탁해 관리자페이지</title>
</head>
<body>
<div id="Wrap"><!-- Wrap S -->

	<%@ include file="include/header.jsp" %>

	<div id="container"><!-- container S -->

		<div class="tit">&bull; 회원관리 - 블랙리스트 관리</div>

		<div class="contBox mt30"><!-- contBox S -->
	
			<%@ include file="include/tab_member.jsp" %>
			
			<div class="topsearch mt30 mb30"><!-- topsearch S -->
				<span>
					<label for="col01"></label>
					<select id="col01" name="col01" class="wth140">
						<option value="">아이디</option>
						<option value="">이름</option>
						<option value="">휴대폰번호</option>
						<option value="">이메일주소</option>
					</select> 
				</span>
				<span>
					<label for="Keyword"></label><input id="Keyword" name="Keyword" class="wth240" type="text">
					<a class="sch" href="#"><img src="/reqtakbae/views/common/images/contents/icoSearch.png" alt="검색" title="검색"></a> 
				</span>
			</div>			
			
			<div class="flo_left mt30 mb30">
				<span><a class="mbtn wh" href="#">전체선택</a></span>
				<span><a class="mbtn bk" href="#">개인 회원으로 이동</a></span>
				<span><a class="mbtn bk" href="#">기사 회원으로 이동</a></span>
				<span><a class="mbtn rd" href="#">회원삭제</a></span>
			</div>


			<table class="boardList mt20">
				<caption>회원관리 리스트입니다.</caption>
				<colgroup>
					<col style="width:7%;"><!-- No -->
					<col style="width:%;"><!--  -->
					<col style="width:%;"><!--  -->
					<col style="width:10%;"><!--  -->
					<col style="width:10%;"><!--  -->					
					<col style="width:%;"><!--  -->
					<col style="width:10%;"><!--  -->
					<col style="width:10%;"><!--  -->
					<col style="width:10%;"><!--  -->
					<col style="width:10%;"><!--  -->
				</colgroup>
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">휴대폰번호</th>
						<th scope="col">이메일 주소</th>
						<th scope="col">가입일</th>
						<th scope="col">블랙리스트 유무</th>
						<th scope="col">보유 사이버머니</th>
						<th scope="col">보유포인트</th>
					</tr>
				</thead>
				<tbody>
					<% for(Admin m : list){ %>
					<tr>
						<td>
							<label for=""> 체크</label>
							<input id="" name="" class="check" type="checkbox">
						</td>
					
						
							
							<td><%= m.getUserId() %></td>
							<td><%= m.getUserName() %></td>
							<td><%= m.getPhone()%></td>
							<td><%= m.getEmail()%></td>
							<td><%= m.getU_date() %></td>
							<td><%= m.getBlackList() %></td>
							<td><%= m.getC_money() %></td>
							<td><%= m.getC_point() %></td>

							
						
						
					</tr>
				<% } %> 
				</tbody>
			</table>

			
			<div class="numbox pt40 pb50"> 
				<span><a class="num" href="#">&lt;</a></span>
				<span><a class="num on" href="#">1</a></span>
				<span><a class="num" href="#">2</a></span>
				<span><a class="num" href="#">3</a></span>
				<span><a class="num" href="#">4</a></span>
				<span><a class="num" href="#">5</a></span>
				<span><a class="num" href="#">6</a></span>
				<span><a class="num" href="#">7</a></span>
				<span><a class="num" href="#">8</a></span>
				<span><a class="num" href="#">9</a></span>
				<span><a class="num" href="#">&gt;</a></span>
			</div>
		</div><!--// contBox E-->

	</div><!--// container E-->

	<%@ include file="include/footer.jsp" %>


</div><!--// Wrap E-->

</body>
</html>