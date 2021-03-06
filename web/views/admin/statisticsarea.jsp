<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>
<% 
	String tabon="3";
	ArrayList<Chart> c = (ArrayList<Chart>)request.getAttribute("c");
 	
	int gangnam1 = 0;
	int gangnam2 = 0;
	int gangnam3 = 0;
	int gangnam4 = 0;
	int gangnam5 = 0;
	int gangnam6 = 0;
	int gangnam7 = 0;
	int gangnam8 = 0;
	int gangnam9 = 0;
	int gangnam10 = 0;
	int gangnam11 = 0;
	int gangnam12 = 0;
	int gangnam13 = 0;
	int gangnam14 = 0;
	int gangnam15 = 0;
	int gangnam16 = 0;
	int gangnam17 = 0;
	int gangnam18 = 0;
	int gangnam19 = 0;
	int gangnam20 = 0;
	int gangnam21 = 0;
	int gangnam22 = 0;
	int gangnam23 = 0;
	int gangnam24 = 0;
	int gangnam25 = 0;
	int sum=0;
	
	if(c.size() != 0){
		gangnam1 = c.get(0).getCount();
		gangnam2 = c.get(1).getCount();
		gangnam3 = c.get(2).getCount();
		gangnam4 = c.get(3).getCount();
		gangnam5 = c.get(4).getCount();
		gangnam6 = c.get(5).getCount();
		gangnam7 = c.get(6).getCount();
		gangnam8 = c.get(7).getCount();
		gangnam9 = c.get(8).getCount();
		gangnam10 = c.get(9).getCount();
		gangnam11 = c.get(10).getCount();
		gangnam12 = c.get(11).getCount();
		gangnam13 = c.get(12).getCount();
		gangnam14 = c.get(13).getCount();
		gangnam15 = c.get(14).getCount();
		gangnam16 = c.get(15).getCount();
		gangnam17 = c.get(16).getCount();
		gangnam18 = c.get(17).getCount();
		gangnam19 = c.get(18).getCount();
		gangnam20 = c.get(19).getCount();
		gangnam21 = c.get(20).getCount();
		gangnam22 = c.get(21).getCount();
		gangnam23 = c.get(22).getCount();
		gangnam24 = c.get(23).getCount();
		gangnam25 = c.get(24).getCount();
	
		for(int i = 0 ; i < 25 ; i++){
			sum = sum + c.get(i).getCount();
		}
	}

%>	
<%@ include file="/views/admin/include/common.jsp" %>


<title>택배를 부탁해 관리자페이지</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawVisualization);
			
			function drawVisualization() { 
				var data = google.visualization.arrayToDataTable([
					
					['Element', '신청수', { role: 'style' }],
						
			        ['강남', <%=gangnam1%>, 'ffd700 '],        
			        ['강동', <%=gangnam2%>, 'ffd700 '],            // English color name
			        ['강북', <%=gangnam3%>, 'ffd700 '],
			        ['강서', <%=gangnam4%>, 'color: #ffd700' ], // CSS-style declaration
			        ['관악', <%=gangnam5%>, 'color: #ffd700' ],
			        ['광진', <%=gangnam6%>, 'color: #ffd700' ],
			        ['구로', <%=gangnam7%>, 'color: #ffd700' ],
			        ['금천', <%=gangnam8%>, 'color: #ffd700 ' ],
			        ['노원', <%=gangnam9%>, 'color: #ffd700 ' ],
			        ['도봉', <%=gangnam10%>, 'color: #ffd700 ' ],
			        ['동대문', <%=gangnam11%>, 'color: #ffd700 ' ],
			        ['동작', <%=gangnam12%>, 'color: #ffd700 ' ],
			        ['마포', <%=gangnam13%>, 'color: #ffd700 ' ],
			        ['서대문', <%=gangnam14%>, 'color: #ffd700 ' ],
			        ['서초', <%=gangnam15%>, 'color: #ffd700 ' ],
			        ['성동', <%=gangnam16%>, 'color: #ffd700 ' ],
			        ['성북', <%=gangnam17%>, 'color: #ffd700 ' ],
			        ['송파', <%=gangnam18%>, 'color: #ffd700 ' ],
			        ['양천', <%=gangnam19%>, 'color: #ffd700 ' ],
			        ['영등포', <%=gangnam20%>, 'color: #ffd700 ' ],
			        ['용산', <%=gangnam21%>, 'color: #ffd700 ' ],
			        ['종로', <%=gangnam22%>, 'color: #ffd700 ' ],
			        ['은평', <%=gangnam23%>, 'color: #ffd700 ' ],
			        ['중구', <%=gangnam24%>, 'color: #ffd700 ' ],
			        ['중랑', <%=gangnam25%>, 'color: #ffd700 ' ],
			        
					]);
				var options = {
						/* title : '지역별 신청 통계', */
						fontSize:12,
					/* 	vAxis: {title: 'Cups'}, */
					/* 	hAxis: {title: 'Month'},  */
						seriesType: 'bars',
						legend : 'none',
						animation: { //차트가 뿌려질때 실행될 애니메이션 효과
		                 startup: true,
		                 duration: 1000,
		                 easing: 'linear' },
		                 tooltip:{textStyle : {fontSize:12}},
	                 	annotations: {
	                    /*  textStyle: {
	                       fontSize: 10,
	                       bold: true,
	                       italic: true,
	                       color: '#871b47',
	                       auraColor: '#d799ae',
	                       opacity: 0.8
	                     } */
	               		 }
	
					};
				var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
				chart.draw(data, options);
			}
	</script>
</head>
<body>
<div id="Wrap"><!-- Wrap S -->

	<%@ include file="include/header.jsp" %>

	<div id="container"><!-- container S -->

		<div class="tit">&bull; 지역별 신청 통계</div>

		<div class="contBox mt30"><!-- contBox S -->	
			
			<%@ include file="include/tab_statistics.jsp" %>
			
		</div><!--// contBox E-->

	&nbsp&nbsp&nbsp<span id="sp" style="font-weight:bold">누적게시물수 : <%=sum %></span>
	

	</div><!--// container E-->
	<%-- <div align="center">
		<%@ include file="chart.jsp" %>
	</div> --%>
	<div id="chart_div" style="width:1570px; height: 500px;"></div>
	
	
	<%@ include file="include/footer.jsp" %>


</div><!--// Wrap E-->

</body>
</html>