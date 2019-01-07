<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>
<% 
	String tabon="4";
	 ArrayList<Chart> c = (ArrayList<Chart>)request.getAttribute("c");
	/* for(int i = 0; i < c.size();i++){
			Chart ch = c.get(i);
	} */
	int gangnam1 = c.get(0).getCount();
	int gangnam2 = c.get(1).getCount();
	int gangnam3 = c.get(2).getCount();
	int gangnam4 = c.get(3).getCount();
	int gangnam5 = c.get(4).getCount();
	int gangnam6 = c.get(5).getCount();
	int gangnam7 = c.get(6).getCount();
	int gangnam8 = c.get(7).getCount();
	int gangnam9 = c.get(8).getCount();
	int gangnam10 = c.get(9).getCount();
	int gangnam11 = c.get(10).getCount();
	int gangnam12 = c.get(11).getCount();
	int gangnam13 = c.get(12).getCount();
	int gangnam14 = c.get(13).getCount();
	int gangnam15 = c.get(14).getCount();
	int gangnam16 = c.get(15).getCount();
	int gangnam17 = c.get(16).getCount();
	int gangnam18 = c.get(17).getCount();
	int gangnam19 = c.get(18).getCount();
	int gangnam20 = c.get(19).getCount();
	int gangnam21 = c.get(20).getCount();
	int gangnam22 = c.get(21).getCount();
	int gangnam23 = c.get(22).getCount();
	int gangnam24 = c.get(23).getCount();
	int gangnam25 = c.get(24).getCount();
%>	
<%@ include file="/views/admin/include/common.jsp" %>


<title>택배를 부탁해 관리자페이지</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawVisualization);
	
		$(function(){
			if(true){
				console.log('asd');
			}
		});
		
		function drawVisualization() { 
			if(true){
				console.log('asd');
			}
			var a = 7;
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
					title : '지역별 신청 통계',
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

	</div><!--// container E-->
	<%-- <div align="center">
		<%@ include file="chart.jsp" %>
	</div> --%>
	<div id="chart_div" style="width:1570px; height: 500px;"></div>
	
	
	<%@ include file="include/footer.jsp" %>


</div><!--// Wrap E-->

</body>
</html>