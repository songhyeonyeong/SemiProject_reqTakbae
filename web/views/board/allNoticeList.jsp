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
	int i = 0;
%>	
	
<%@ include file="/views/include/common.jsp" %>


<title>전체 공고</title>

<script type="text/javascript">
function fn_open() {
   window.open('/reqtakbae/views/board/reportPop.jsp','reportPop','scrollbars=yes,menubar=no,toolbar=no,location=no,top=50,left=50,width=600,height=600');
}
</script>
<script>

 	Number.prototype.format = function(){
	    if(this==0) return 0;
	 
	    var reg = /(^[+-]?\d+)(\d{3})/;
	    var n = (this + '');
	 
	    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
	 
	    return n;
	};

</script>
<style>
	#submit,button{
		width:70px;
		
		height:28px;

   		background-color: gray;

    	border: none;

    	color:#fff;

    	padding: 6px 2px;

    	text-align: center;

    	text-decoration: none;

   		display: inline-block;

    	font-size: 13px;

    	margin: 4px;

    	cursor: pointer;
		border-radius:3px;
	}
</style>
</head>
<body>


<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="subvisual">전체 공고</div>

<div id="subContainer">
	<div class="contBox inner"><!-- inner S -->
	 
		<div class="titNavi">
			전체 공고
			<span>홈 &gt; 전체 공고</span>
		</div>

		<table class="searchTbl mt30 mb30"><!-- searchTbl S -->
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
				<form action="<%=request.getContextPath() %>/searchMain.fi" method="POST" name="fr">
					<tr>
						<th scope="col">도착</th>
						<td>
							<label for=""></label>
							<select id="destination" name="destination" class="wth150">
							<option value="" selected="selected" selected disabled hidden>도착지 선택</option>
							<option value="강남구">강남구</option>
							<option value="강동구">강동구</option>
							<option value="강북구">강북구</option>
							<option value="강서구">강서구</option>
							<option value="관악구">관악구</option>
							<option value="광진구">광진구</option>
							<option value="구로구">구로구</option>
							<option value="금천구">금천구</option>
							<option value="노원구">노원구</option>
							<option value="도봉구">도봉구</option>
							<option value="동대문구">동대문구</option>
							<option value="동작구">동작구</option>
							<option value="마포구">마포구</option>
							<option value="서대문구">서대문구</option>
							<option value="서초구">서초구</option>
							<option value="성동구">성동구</option>
							<option value="성북구">성북구</option>
							<option value="송파구">송파구</option>
							<option value="양천구">양천구</option>
							<option value="영등포구">영등포구</option>
							<option value="용산구">용산구</option>
							<option value="은평구">은평구</option>
							<option value="종로구">종로구</option>
							<option value="중구">중구</option>
							<option value="중랑구">중랑구</option>
						</td>
						<th scope="col">크기</th>
						<td>
							<label for=""></label>
							<select id="size" name="size" class="wth150">
							<option value="" selected="selected" selected disabled hidden>전체</option>
							<option value="소">소</option>
							<option value="중">중</option>
							<option value="대">대</option>
						</td>
						<th scope="col">상태</th>
						<td>
							<label for=""></label>
							<select id="status" name="status" class="wth150">
							<option value="" selected="selected" selected disabled hidden>전체</option>
							<option value="매칭중">매칭중</option>
							<option value="매칭완료">매칭완료</option>					
						</td>
					</tr>
				</tbody>
		</table>
		
			<div class="btnbox mb30">
				<input type="submit" value="검색하기" id="submit">
			</div>
	</form>
		<!-- user에게만 보임 -->
		<%if(loginUser != null){%>
		<% if(loginUser.getUser_div().equals("신청자")){ %>
		<p class="flo_right mb10"><a class="mbtn or" href="<%=request.getContextPath()%>/InsertForm.bo?gongdiv=일반">공고등록하기</a></p>
		<% } %>
		<%}else{ %>
		<p hidden class="flo_right mb10"><a></a></p>
		<%} %>
		
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
			<thead id="money">
				<tr>
					<th scope="col">No</th>
					<th scope="col">공고등록일자</th>
					<th scope="col">출발지</th>
					<th scope="col">도착지</th>
					<th scope="col">공고제목</th>
					<th scope="col">배송날짜</th>
					<th scope="col">크기</th>
					<th scope="col">금액</th>
					<th scope="col">상태</th>
					<th scope="col">상세</th>
				</tr>
				<% for(Announcment a : list){ %>
				<tr>
					<input type="hidden" value="<%=i++%>">
					<td><%= a.getG_NO() %></td>
					<td><%= a.getG_S_DATE() %></td>
					<!--이거 1로 바꿔야함  -->
					<td><%= a.getG_S_AREA().split(" ")[1] %></td>
					<td><%= a.getG_E_AREA().split(" ")[1] %></td>
					<td><%= a.getG_TITLE() %></td>
					<td><%= a.getG_DAY() %></td>
					<td><%= a.getG_SIZE() %></td>
					<td><%= a.getG_PRICE() %></td>
					<td><%= a.getG_P_DIV() %></td>
					<td><a class="sbtn gy">상세보기</a></td>
					<script>	

		 					
							var t=$('#money').children().eq(<%=i%>).children().eq(8).text();	
		 					$('#money').children().eq(<%=i%>).children().eq(8).text(Number(t).format());
		 		
						</script>
						
				</tr>
				<% } %>
			</thead>
		</table>
		
	<!--페이징 처리 부분  -->
		
			<div class="numbox pt40 pb50"> 
			<% if(currentPage <= 1){ %>
			<span><a class="num" disabled>&lt;</a></span>
			<% }else{ %>
			<span><a class="num" href="<%=request.getContextPath()%>/selectList.bo?currentPage=<%=currentPage - 1%>&&gongdiv=일반">&lt;</a></span>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
						<span><a class="num on" disabled><%= p %></a></span>
			<%      }else{ %>
								<span><a class="num" href="<%=request.getContextPath()%>/selectList.bo?currentPage=<%= p %>&&gongdiv=일반"><%= p %></a></span>
			<%      } %>
	
			<% } %>
			
			
			<% if(currentPage >= maxPage){ %>
			<span><a class="num" disabled>></a></span>
			<% }else{ %>
				<span><a class="num" href="<%=request.getContextPath()%>/selectList.bo?currentPage=<%=currentPage + 1%>&&gongdiv=일반">></a></span>
			<% } %>
			
			
		</div>


	</div><!--// inner E-->
</div>

<%@ include file="/views/include/footer.jsp" %>


	<script type="text/javascript">
		$(function(){
			$(".sbtn.gy").click(function(){
				
				var num = $(this).parent().parent().children("td").eq(0).text();
				console.log(num);
				location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num+"&&gongdiv=일반";
			});
			
			});
		
		
	</script>
</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>

</body>
</html>