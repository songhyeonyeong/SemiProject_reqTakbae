<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.kh.jinkuk.border.announcment.model.vo.*"%>
<%
	ArrayList<Announcment> list = (ArrayList<Announcment>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>	

<%@ include file="/views/include/common.jsp" %>

<title>오늘의 공고</title>

<script type="text/javascript">
function fn_open() {
   window.open('reportPop.jsp','reportPop','scrollbars=yes,menubar=no,toolbar=no,location=no,top=50,left=50,width=600,height=600');
}
</script>

</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">오늘의 공고</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			오늘의 공고
			<span>홈 &gt; 오늘의 공고</span>
		</div>

		
		<h2 class="tcen cal mt20">당일 날짜 : <em class="font20 darkred">2019.01.01</em></h2>

		<table class="searchTbl mt20 mb30"><!-- searchTbl S -->
			<caption>공고 검색입니다.</caption>
			<colgroup>
				<col style="width:15%;">
				<col style="width:%;">
				<col style="width:15%;">
				<col style="width:%;">
				<col style="width:15%;">
				<col style="width:%;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="col">도착</th>
					<td>
						<label for=""></label>
						<select id="" name="" class="wth150">
						<option value="" selected="selected">서울시 전체</option>
						<option value="">강남구</option>
						<option value="">---</option>
					</td>
					<th scope="col">크기</th>
					<td>
						<label for=""></label>
						<select id="" name="" class="wth150">
						<option value="" selected="selected">전체</option>
						<option value="">소</option>
						<option value="">중</option>
						<option value="">대</option>
					</td>
					<th scope="col">상태</th>
					<td>
						<label for=""></label>
						<select id="" name="" class="wth150">
						<option value="" selected="selected">전체</option>
						<option value="">모집중</option>
						<option value="">배송중</option>					
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="btnbox mb30">
			<span><a class="mbtn db wth60" href="#">검색</a></span>
		</div>

		
		<!-- user에게만 보임 -->
		<% if(loginUser != null){ %>
		<p class="flo_right mb10"><a class="mbtn or" href="<%=request.getContextPath()%>/reset?p=writer">공고등록하기</a></p>
		<% } %>

		<table class="boardList mt20">
			<caption>전체공고 리스트입니다.</caption>
			<colgroup>
				<col style="width:7%;"><!-- No -->
				<col style="width:10%;"><!--  -->
				<col style="width:10%;"><!--  -->
				<col style="width:10%;"><!--  -->
				<col style="width:13%;"><!--  -->
				<col style="width:10%;"><!--  -->
				<col style="width:10%;"><!--  -->
				<col style="width:10%;"><!--  -->
				<col style="width:10%;"><!--  -->
				<col style="width:10%;"><!--  -->
			</colgroup>
			<thead>
				<tr>
					<th scope="col">No</th>
					<th scope="col">공고등록일자</th>
					<th scope="col">출발지</th>
					<th scope="col">도착지</th>
					<th scope="col">공고내용</th>
					<th scope="col">배송날짜</th>
					<th scope="col">크기</th>
					<th scope="col">금액</th>
					<th scope="col">상태</th>
					<th scope="col">상세</th>
				</tr>
					<% for(Announcment a : list){ %>
				<tr>
					<input type="hidden" value="<%= a.getG_NO() %>">
					<td><%= a.getG_NO() %></td>
					<td><%= a.getG_S_DATE() %></td>
					<td><%= a.getG_S_AREA() %></td>
					<td><%= a.getG_E_AREA() %></td>
					<td><%= a.getG_TITLE() %></td>
					<td><%= a.getG_DAY() %></td>
					<td><%= a.getG_SIZE() %></td>
					<td><%= a.getG_PRICE() %></td>
					<td><%= a.getG_P_DIV() %></td>
					<td><a class="sbtn gy">상세보기</a></td>
				</tr>
				<% } %>
			</thead>
		</table>
		
		<!--페이징 처리 부분  -->
		
			<div class="numbox pt40 pb50"> 
			<% if(currentPage <= 1){ %>
			<span><a class="num" disabled>&lt;</a></span>
			<% }else{ %>
			<span><a class="num" href="<%=request.getContextPath()%>/selectTodayList.bo?currentPage=<%=currentPage - 1%>">&lt;</a></span>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
						<span><a class="num on" disabled><%= p %></a></span>
			<%      }else{ %>
								<span><a class="num" href="<%=request.getContextPath()%>/selectTodayList.bo?currentPage=<%= p %>"><%= p %></a></span>
			<%      } %>
	
			<% } %>
			
			
			<% if(currentPage >= maxPage){ %>
			<span><a class="num" disabled>></a></span>
			<% }else{ %>
				<span><a class="num" href="<%=request.getContextPath()%>/selectTodayList.bo?currentPage=<%=currentPage + 1%>">></a></span>
			<% } %>
			
			
		</div>
		


	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->

	<script>
		$(function(){
			$(".sbtn").click(function(){
				
				var num = $(this).parent().parent().children("td").eq(0).text();
				console.log(num);
				location.href="<%=request.getContextPath()%>/selectoneTodayList.bo?num=" + num;
			});
		});
	</script>

<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>