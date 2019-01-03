<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>
<% 
	String tabon="3";
	ArrayList<Exchange> list = (ArrayList<Exchange>)request.getAttribute("list");	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>	
<%@ include file="/views/admin/include/common.jsp" %>


<title>택배를 부탁해 관리자페이지</title>
<style>
	button{
		width:80px;

   		background-color: #f8585b;

    	border: none;

    	color:#fff;

    	padding: 10px 0;

    	text-align: center;

    	text-decoration: none;

   		display: inline-block;

    	font-size: 15px;

    	margin: 4px;

    	cursor: pointer;
		border-radius:10px;
	}
</style>
</head>
<body>
<div id="Wrap"><!-- Wrap S -->

	<%@ include file="include/header.jsp" %>

	<div id="container"><!-- container S -->

		<div class="tit">&bull; 환전 내역 관리</div>

		<div class="contBox mt30"><!-- contBox S -->	
			
			<%@ include file="include/tab_point.jsp" %>

			<table class="boardList mt30">
			<caption>충전적립 리스트입니다.</caption>
			<colgroup>
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
				<col style="width:%;"><!--  -->
			</colgroup>
			<thead>
			
			<tr>
				<th scope="col">no</th>
				<th scope="col">구분</th>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">포인트</th>
				<th scope="col">실수령액</th>
				<th scope="col">계좌번호</th>
				<th scope="col">은행명</th>
				<th scope="col">일시</th>
				<th scope="col">상태</th>
			</tr>

			</thead>
			<tbody>
			<%for(Exchange m : list){ %>
			<tr>
				<td><%=m.getC_no() %></td>
				<td>환전</td>
				<td><%=m.getUser_id() %></td>
				<td><%=m.getUser_name() %></td>
				<td><%=m.getcMoney() %></td>
				<td><%=m.getrMoney() %></td>
				<td><%=m.getBankNum() %></td>
				<td><%=m.getBankName() %></td>
				<td><%=m.getcDate() %></td>
				<td><button class="Exchange" value="<%=m.geteStatus() %>"><%=m.geteStatus() %></button></td>
			</tr>
			<%} %>
			</tbody>
		</table>
		
		<br>
		<span><a class="mbtn bk" onclick="printExchange();">인쇄하기</a></span>
		
	<div class="numbox pt40 pb50" align="center"> 
			<span><a class="num" href="#" onclick="location.href='<%=request.getContextPath()%>/selectAll.ex?currentPage=1'"><<</a></span>
			<% if(currentPage <=1){ %>
				<span><a class="num" href="#" disable><</a></span> <!-- 비활성화 -->
			<%}else{%>
				<span><a class="num" href="#" onclick="location.href='<%=request.getContextPath()%>/selectAll.ex?currentPage=<%=currentPage - 1 %>'"><</a></span> <!-- 하나 이전페이지로 이동 -->
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){%>
				
				<span><a class="num" href="#" disable><%= p %></a></span> <!-- 비활성화 -->
			<%  }else{ %>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.ex?currentPage=<%= p %>'"><%= p %></a></span>
			
			
			<%         } %>
			<%} %>
			
			<%if(currentPage >= maxPage){ %>
				<span><a class="num" href="#" disable>></a></span> <!-- 비활성화 -->
			<%}else{%>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.ex?currentPage=<%=currentPage + 1 %>'">></a></span> <!-- 하나 다음페이지로 이동 -->
			<%} %>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.ex?currentPage=<%=maxPage%>'">>></a></span>
			
			
		</div>


		</div><!--// contBox E-->

	</div><!--// container E-->

	<%@ include file="include/footer.jsp" %>


</div><!--// Wrap E-->

	<script>
		function printExchange(){
			window.print();
			
		}
		

		
		$(".Exchange").each(function(){
		if(($(this).attr('value'))==('환전완료')){
			$(this).prop("disabled",true);
			$(this).css("background","lightgray");
			$(this).css("cursor","default");
		}
		
	
		});
		
		$(function(){
			$(".Exchange").click(function(){

				var num = $(this).parent().parent().children().eq(0).text();
				console.log(num);
				location.href="<%=request.getContextPath()%>/updateEx?num=" + num; 
	
				
			});
			
		});
		
		

		 $('span').eq(2).click(function() {

			

		});
		 
		
		

	</script>

</body>
</html>