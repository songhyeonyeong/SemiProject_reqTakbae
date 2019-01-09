<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>
<% 
	String tabon="1";
	ArrayList<Change> list = (ArrayList<Change>)request.getAttribute("list");	
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

		<div class="tit">&bull; 충전 관리</div>

		<div class="contBox mt30"><!-- contBox S -->	
			
			<%@ include file="include/tab_point.jsp" %>

			<table class="boardList mt20"  id="idPrint" border="1px">
			<caption>충전적립 리스트입니다.</caption><br>
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
				<th scope="col">No</th>
				<th scope="col">구분</th>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">충전금액</th>
				<th scope="col">실금액</th>
				<th scope="col">계좌번호</th>
				<th scope="col">은행</th>
				<th scope="col">날짜</th>
			</tr>
			</thead>
			<tbody id="money">
			<%for(Change m : list){ %>
			<tr>
				<%-- <input type="hidden" value="<%=i++%>"> --%>
				<td><%=m.getCh_no() %></td>
				<td>충전</td>
				<td><%=m.getUser_id() %></td>
				<td><%=m.getUser_name() %></td>
				<td><%=m.getCh_rmoney() %></td>
				<td><%=m.getCh_cmoney() %></td>
				<td><%=m.getBank_num() %></td>
				<td><%=m.getBank_name() %></td>
				<td><%=m.getCh_date() %></td>
				<script>	

					var t=$('#money').children().eq(<%=i%>).children().eq(4).text();	
					console.log(t);
					$('#money').children().eq(<%=i%>).children().eq(4).text(Number(t).format());
		 			
		 			var t=$('#money').children().eq(<%=i%>).children().eq(5).text();	
		 			$('#money').children().eq(<%=i%>).children().eq(5).text(Number(t).format());
		 			
					<%=i++%>


				</script>
				
				
			</tr>
			<%} %>
			</tbody>
		</table>
		
		<br>
		<button class="mbtn bk" onclick="printCharge();">인쇄하기</button>

		<div class="numbox pt40 pb50" align="center"> 
			<span><a class="num" href="#" onclick="location.href='<%=request.getContextPath()%>/selectAll.mo?currentPage=1'"><<</a></span>
			<% if(currentPage <=1){ %>
				<span><a class="num" href="#" disable><</a></span> <!-- 비활성화 -->
			<%}else{%>
				<span><a class="num" href="#" onclick="location.href='<%=request.getContextPath()%>/selectAll.mo?currentPage=<%=currentPage - 1 %>'"><</a></span> <!-- 하나 이전페이지로 이동 -->
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){%>
				
				<span><a class="num" href="#" disable><%= p %></a></span> <!-- 비활성화 -->
			<%  }else{ %>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.mo?currentPage=<%= p %>'"><%= p %></a></span>
			
			
			<% } %>
			<%} %>
			
			<%if(currentPage >= maxPage){ %>
				<span><a class="num" href="#" disable>></a></span> <!-- 비활성화 -->
			<%}else{%>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.mo?currentPage=<%=currentPage + 1 %>'">></a></span> <!-- 하나 다음페이지로 이동 -->
			<%} %>
				<span><a class="num" href="#" onclick ="location.href='<%=request.getContextPath()%>/selectAll.mo?currentPage=<%=maxPage%>'">>></a></span>
		</div>
	

		</div><!--// contBox E-->

	</div><!--// container E-->

	<%@ include file="include/footer.jsp" %>


</div><!--// Wrap E-->

	<script>

		function printCharge(){
			var strFeature = "";
 			strFeature += "width=1000, height=1000, all=no"; 

			var objWin = window.open('', 'print',strFeature);
			objWin.document.write("충전 적립 리스트 입니다.");
			objWin.document.write("<table width='1000' border='1'>");
			objWin.document.write("<tr align='center'>");
			objWin.document.write("<td>");
			objWin.document.write("no");
			objWin.document.write("</td>");
			objWin.document.write("<td>");
			objWin.document.write("구분");
			objWin.document.write("</td>");
			objWin.document.write("<td>");
			objWin.document.write("아이디");
			objWin.document.write("</td>");
			objWin.document.write("<td>");
			objWin.document.write("이름");
			objWin.document.write("</td>");
			objWin.document.write("<td>");
			objWin.document.write("충전금액");
			objWin.document.write("</td>");
			objWin.document.write("<td>");
			objWin.document.write("실금액");
			objWin.document.write("</td>");
			objWin.document.write("<td>");
			objWin.document.write("계좌번호");
			objWin.document.write("</td>");
			objWin.document.write("<td>");
			objWin.document.write("은행이름");
			objWin.document.write("</td>");
			objWin.document.write("<td>");
			objWin.document.write("날짜");
			objWin.document.write("</td>");
			objWin.document.write("</tr>");
			<%for(Change m : list){%>
			objWin.document.write("<tr align='center'>");
			objWin.document.write("<td>");
			objWin.document.write(<%=m.getCh_no() %>);
			objWin.document.write("</td>");
			objWin.document.write("<td>");
			objWin.document.write($('tr').eq(1).children().eq(1).text());
			objWin.document.write("</td>");
			objWin.document.write("<td>");
			objWin.document.write("<%=m.getUser_id() %>");
			objWin.document.write("</td>");
			objWin.document.write("<td>");
			objWin.document.write("<%=m.getUser_name() %>");
			objWin.document.write("</td>");
			objWin.document.write("<td>");
			objWin.document.write("<%=m.getCh_rmoney() %>");
			objWin.document.write("</td>");
			objWin.document.write("<td>");
			objWin.document.write("<%=m.getCh_cmoney() %>");
			objWin.document.write("</td>");
			objWin.document.write("<td>");
			objWin.document.write("<%=m.getBank_num() %>");
			objWin.document.write("</td>");
			objWin.document.write("<td>");
			objWin.document.write("<%=m.getBank_name() %>");
			objWin.document.write("</td>");
			objWin.document.write("<td>");
			objWin.document.write("<%=m.getCh_date() %>");
			objWin.document.write("</td>");
			objWin.document.write("</tr>");
			<%}%>
			objWin.document.write("</table>");
			objWin.document.close();


			objWin.print();
			objWin.close();


		}


	</script>

</body>
</html>