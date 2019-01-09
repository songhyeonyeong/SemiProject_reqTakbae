<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>
<% 
	String tabon="2";
	ArrayList<Admin> list = (ArrayList<Admin>)request.getAttribute("list");	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int i = 0;
%>
<%@ include file="/views/admin/include/common.jsp" %>

<script>

 	Number.prototype.format = function(){
	    if(this==0) return 0;
	 
	    var reg = /(^[+-]?\d+)(\d{3})/;
	    var n = (this + '');
	 
	    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
	 
	    return n;
	};

</script>
<title>택배를 부탁해 관리자페이지</title>
</head>
<body>
<div id="Wrap"><!-- Wrap S -->

	<%@ include file="include/header.jsp" %>

	<div id="container"><!-- container S -->

		<div class="tit">&bull; 회원관리 - 기사 회원 관리</div>

		<div class="contBox mt30"><!-- contBox S -->
	
			<%@ include file="include/tab_member.jsp" %>
		
			<div class="topsearch mt30 mb30"><!-- topsearch S -->
				<span>
					<label for="col01"></label>
					<form action="<%=request.getContextPath() %>/search.de" method="post">
					<select id="select" name="select" class="wth140">
						<option value="choose" name="searchCondition" selected disabled hidden>선택</option>
						<option value="userId" name="searchCondition">아이디</option>
						<option value="userName" name="searchCondition">이름</option>
					</select>
						
				</span>
		
				<span>
					<label for="Keyword"></label><input type="text" id="Keyword" name="searchTxt" class="wth240" >
					<input type="submit" value="검색">
					<!-- <a class="sch" href="#"> -->
					<!-- <img src="/reqtakbae/views/common/images/contents/icoSearch.png" alt="검색" title="검색" ></a> -->
				</span>
				</form> 
			</div>			
			
			<div class="flo_left mt30 mb30">
				<span><a class="mbtn wh" href="#">전체선택</a></span>
				<span><a class="mbtn bk" href="#">블랙리스트로 이동</a></span>
				<span><a class="mbtn rd" href="#">회원삭제</a></span>
			</div>


			<table class="boardList mt20">
				<caption>회원관리 리스트입니다.</caption>
				<colgroup>
					<col style="width:7%;"><!-- No -->
					<col style="width:%;"><!--  -->
					<col style="width:%;"><!--  -->
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
						<th scope="col">신고횟수</th>
						<th scope="col">블랙리스트 유무</th>
						<th scope="col">사이버머니</th>
						<th scope="col">보유포인트</th>
					</tr>
				</thead>
				<tbody id="money">
					<form  id="add" method="get" action="<%=request.getContextPath()%>/delete.de">
					<% for(Admin m : list){ %>
					<tr>
						<td>
							<label for=""> 체크</label>
							<input id="memCheck" name="memCheck" class="check" type="checkbox" value="<%=m.getUserId()%>">
						</td>
							<input type="hidden" value="<%=i++%>">
							<td><%= m.getUserId() %></td>
							<td><%= m.getUserName() %></td>
							<td><%= m.getPhone()%></td>
							<td><%= m.getEmail()%></td>
							<td><%= m.getU_date() %></td>
							<td><%= m.getReportCount() %></td>
							<td><%= m.getBlackList() %></td>
							<td><%= m.getC_money() %></td>
							<td><%= m.getC_point() %></td>
						<script>	
		 					
							var t=$('#money').children().eq(<%=i%>).children().eq(9).text();	
		 					$('#money').children().eq(<%=i%>).children().eq(9).text(Number(t).format());
		 					
							var t=$('#money').children().eq(<%=i%>).children().eq(10).text();	
		 					$('#money').children().eq(<%=i%>).children().eq(10).text(Number(t).format());

						</script>
						
					</tr>
				<% } %> 
				</form>
				</tbody>
				
			</table>

			
		<div class="numbox pt40 pb50" align="center"> 
			<span><a class="num" href="#" onclick="location.href='<%=request.getContextPath()%>/selectAll.me?currentPage=1'"><<</a></span>
			<% if(currentPage <=1){ %>
				<span><a class="num" href="#" disable><</a></span> <!-- 비활성화 -->
			<%}else{%>
				<span><a class="num" href="#" onclick="location.href='<%=request.getContextPath()%>/selectAll.me?currentPage=<%=currentPage - 1 %>'"><</a></span> <!-- 하나 이전페이지로 이동 -->
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){%>
				
				<span><a class="num" href="#" disable><%= p %></a></span> <!-- 비활성화 -->
			<%  }else{ %>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.me?currentPage=<%= p %>'"><%= p %></a></span>
			
			
			<%         } %>
			<%} %>
			
			<%if(currentPage >= maxPage){ %>
				<span><a class="num" href="#" disable>></a></span> <!-- 비활성화 -->
			<%}else{%>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.me?currentPage=<%=currentPage + 1 %>'">></a></span> <!-- 하나 다음페이지로 이동 -->
			<%} %>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.me?currentPage=<%=maxPage%>'">>></a></span>
			
			
		</div>
	
		</div><!--// contBox E-->

	</div><!--// container E-->

	<%@ include file="include/footer.jsp" %>


</div><!--// Wrap E-->

	<script>
	
		 $('span').eq(2).click(function() {

			$("input[name=memCheck]:checkbox").each(function() {

				$(this).attr("checked", true);

			});

		});
		 
 		var selected = new Array();
		 
		 $(function(){
				$("span").eq(3).click(function(){
					 $("input:checkbox[name=memCheck]:checked").each(function() {
					        selected.push($(this).parent().parent().children().eq(1).text());
					   });
					console.log(selected);
					$.ajax({
						url:"/reqtakbae/goBlack.de", 
						data:{selected:selected},
						type:"post",
						success:function(data){
							console.log(data);
							location.reload();
						},
						error:function(){
							console.log("실패");
						}
					});
				});
			});
		 

		 
		 
		 $('span').eq(4).click(function() {
			 
				$("input[name=memCheck]:checked").each(function() {

					
					var test =$(this).val();

					console.log(test);
					
					$("#add").submit();
				});
				
			

			});

		 
		
		
		
	</script>

	

</body>
</html>