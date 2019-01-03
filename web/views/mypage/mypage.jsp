<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.jinkuk.mypage.model.vo.*, com.kh.jinkuk.cybermoney_breakdown.model.vo.*,java.sql.*, java.util.*"%>
<%

	String bigtabon = "1";
	ArrayList<Mynotice> list = (ArrayList<Mynotice>) request.getAttribute("list");
	ArrayList<MyR_M_article> d_list = (ArrayList<MyR_M_article>) request.getAttribute("list");
	ArrayList<MyCharge> Clist = (ArrayList<MyCharge>)request.getAttribute("Clist");
	ArrayList<MyExchange> Elist = (ArrayList<MyExchange>)request.getAttribute("Elist");
%>

<%@ include file="/views/include/common.jsp"%>

<title>마이페이지</title>

</head>
<body>


	<div id="wrap">
		<!-- Wrap S -->

		<%@ include file="/views/include/header.jsp"%>

		<div id="subvisual">마이페이지</div>

		<div id="subContainer">
			<div class="contBox inner">
				<!-- inner S -->

				<%@ include file="/views/include/tabMypage.jsp"%>
				
				
				
				
				
				
				
				
				<!--신청자부분 -->
				
				<%
					
				if(loginUser.getUser_div().equals("신청자")){
					if(list!=null){	%>
				<!-- <div class="titNavi">
						마이페이지
					<span>홈 &gt; 마이페이지</span>
					</div>
					 -->
					</li>
					<!--내공고목록 최신 4개 출력  -->
						<ul class="mypgBox mt50">
						<li class="bx">
						<p class="font24">내 공고 목록</p>
						<ul class="boardShort">
						<%
							for (int i=0; i<4; i++) {
						%>
							<li>&bull; <a href="#"><%=list.get(i).getG_CONTEXT()%></a></li>
					
						<%
							}
					}
						%>
						</ul>
					</li>
						<!--기사부분 -->
			<%}else{
				if(d_list!=null){%>
			</li>
					<!--내공고목록 최신 4개 출력  -->
						<ul class="mypgBox mt50">
						<li class="bx">
						<p class="font24">내 공고 목록</p>
						<ul class="boardShort">
						<%
							for (int i=0; i<4; i++) {
						%>
							<input type="hidden" value="<%=d_list.get(i).getG_no()%>">
							<li>&bull;<a href="#"><%=d_list.get(i).getG_context()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color:blue"><%=d_list.get(i).getB_status()%></a></a></li>
					
						<%
							}
						}
						%>
						</ul>
					</li>
					
					<%} %> 
					
					
					<li class="bx">
						<p class="font24">충전/적립 내역</p>
						<ul class="boardShort">
						<%
							for(int i = 0; i < 4; i++){
								if(Clist.get(i).getCm_div()!=null){
									if(Clist.get(i).getCm_div().equals("공고등록") || Clist.get(i).getCm_div().equals("포인트사용")){
						%>
										<li>&bull; <%= Clist.get(i).getCm_div()%> -<%= Clist.get(i).getCm_use() %>원</li>	
						<%	
									}else{
						%>
										<li>&bull; <%= Clist.get(i).getCm_div()%> +<%= Clist.get(i).getCm_use() %>원</li>				
						
						<%			}
								}else{
						%>
									<li>내역이 없습니다.</li>	
									
						<%		}
							}
						%>
								
								
					
							<!-- <li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li> -->
						</ul>
					</li>
					<li class="bx mt30">
						<p class="font24">환전 내역</p>
						<ul class="boardShort">
						<%
							for(int i = 0; i < 4; i++){
								if(Elist.get(i)!=null){
						%>
										<li>&bull; <%= Elist.get(i).getcMoney()%>원 <%= Elist.get(i).geteStatus() %></li>	
						<%			
								}else{
						%>
									<li>내역이 없습니다.</li>	
						<%		
								}
							}
						%>
						
							<!-- <li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li> -->
						</ul>
					</li>
					<li class="bx mt30">
						<p class="font24">나의 문의내역</p>
						<ul class="boardShort">
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
							<li>&bull; <a href="#">배송합니다</a></li>
						</ul>
					</li>
			</div>
		</div>
		<!--// inner E-->
	</div>

	<%@ include file="/views/include/footer.jsp"%>


	</div>
	<!--// Wrap E-->


	<%@ include file="/views/include/myNav.jsp"%>

</body>
</html>