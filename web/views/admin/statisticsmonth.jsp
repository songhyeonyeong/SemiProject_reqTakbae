<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>
<% 
	String tabon="2";
	ChartMonth2 c = (ChartMonth2)request.getAttribute("c");
	int total = (int)request.getAttribute("total");
	int today = (int)request.getAttribute("today");
	int yesterday = (int)request.getAttribute("yesterday");
	int a1 = c.getA1();
	int a2 = c.getA2();
	int a3 = c.getA3();
	int a4 = c.getA4();
	int a5 = c.getA5();
	int a6 = c.getA6();
	int a7 = c.getA7();
	int a8 = c.getA8();
	int a9 = c.getA9();
	int a10 = c.getA10();
	int a11 = c.getA11();
	int a12 = c.getA12();
	
	int year = (int)request.getAttribute("year");
%>	
<%@ include file="/views/admin/include/common.jsp" %>

<style>
	.numb {clear:both;  height:30px;}
	.numb span {display:inline-block; }
	.numb a {display:block; width:30px; height:30px; line-height:30px;}
	.num1, .num2{border:1px solid #dfdfdf; text-align:center;}
	.numb .on, .num1:hover, .num2:hover  {border:0; background:#444; border:1px solid #444; color:#fff; cursor:pointer;}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>택배를 부탁해 관리자페이지</title>
	
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawVisualization);
	
		function drawVisualization() { 
		
			var data = google.visualization.arrayToDataTable([
				
				['Element', '방문수', { role: 'style' }],
		        ['1월', <%= c.getA1()%>, 'ffd700 '],        
		        ['2월', <%= c.getA2()%>, 'ffd700 '],            // English color name
		      	['3월', <%= c.getA3()%>, 'ffd700 '],
		        ['4월', <%= c.getA4()%>, 'color: #ffd700' ], // CSS-style declaration
		        ['5월', <%= c.getA5()%>, 'color: #ffd700' ],
		        ['6월', <%= c.getA6()%>, 'color: #ffd700' ],
		        ['7월', <%= c.getA7()%>, 'color: #ffd700' ],
		        ['8월', <%= c.getA8()%>, 'color: #ffd700 ' ],
		        ['9월', <%= c.getA9()%>, 'color: #ffd700 ' ],
		        ['10월', <%= c.getA10()%>, 'color: #ffd700 ' ],
		        ['11월', <%= c.getA11()%>, 'color: #ffd700 ' ],
		        ['12월', <%= c.getA12()%>, 'color: #ffd700 ' ], 
				]);
			var options = {
					/* title : '지역별 신청 통계', */
					fontSize:12,
				/* 	vAxis: {title: 'Cups'}, */
				/* 	hAxis: {title: 'Month'},  */
					/*  seriesType: 'bars', */
					legend : 'none',
					/* animation: { //차트가 뿌려질때 실행될 애니메이션 효과
	                 startup: true,
	                 duration: 1000,
	                 easing: 'linear' },
	                 tooltip:{textStyle : {fontSize:12}}, */
                 	annotations: {
                      textStyle: {
                       fontSize: 10,
                       bold: true,
                       italic: true,
                       color: '#871b47',
                       auraColor: '#d799ae',
                       opacity: 0.8
                     } 
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

		<div class="tit">&bull; 월별 방문자 통계</div>

		<div class="contBox mt30"><!-- contBox S -->	
			
			<%@ include file="include/tab_statistics.jsp" %>
			
		</div><!--// contBox E-->
	&nbsp&nbsp&nbsp<span style="font-weight:bold">오늘방문수 : <%=today %></span>&nbsp&nbsp&nbsp&nbsp
	<span style="font-weight:bold">어제방문수 : <%= yesterday %></span>&nbsp&nbsp&nbsp&nbsp
	<span style="font-weight:bold">누적방문수 : <%= total %></span>
	
	<div class="numb pb10"  align="left"> 
		&nbsp&nbsp&nbsp<span><a class="num1"><</a></span>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="font-weight:bold; font-size:23px;"><%=year %></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<span><a class="num2" href="#" disable>></a></span>&nbsp&nbsp&nbsp
	</div>
	</div><!--// container E-->
	
	<div id="chart_div" style="width:1540px; height: 500px;"></div>
	
	
	<%@ include file="include/footer.jsp" %>


</div><!--// Wrap E-->
<script>
	$('.num1').click(function(){
		console.log("asdaa")
		var i = <%=year%>-1;
		location.href = "<%=request.getContextPath()%>/SelectChartMonthServlet?year="+i;
	});
	
	$('.num2').click(function(){
		console.log("asdaa")
		var i = <%=year%>+1;
		location.href = "<%=request.getContextPath()%>/SelectChartMonthServlet?year="+i;
	});
	
</script>
</body>
</html>