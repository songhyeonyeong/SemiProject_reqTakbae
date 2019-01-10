<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>
<% 
	String tabon="1";
	int total = (int)request.getAttribute("total");
	int today = (int)request.getAttribute("today");
	int yesterday = (int)request.getAttribute("yesterday");
	int year = (int)request.getAttribute("year");
	int month = (int)request.getAttribute("month");
	ChartDay ch = (ChartDay)request.getAttribute("ch");
	
	
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
	if(<%=month%>==2){
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawVisualization);
		function drawVisualization() { 
			var data = google.visualization.arrayToDataTable([
				['Element', '방문수', { role: 'style' }],
		        ['1', <%=ch.getA1()%>, 'ffd700 '],        
		        ['2', <%=ch.getA2()%>, 'ffd700 '],            // English color name
		      	['3', <%=ch.getA3()%>, 'ffd700 '],
		        ['4', <%=ch.getA4()%>, 'color: #ffd700' ], // CSS-style declaration
		        ['5', <%=ch.getA5()%>, 'color: #ffd700' ],
		        ['6', <%=ch.getA6()%>, 'color: #ffd700' ],
		        ['7', <%=ch.getA7()%>, 'color: #ffd700' ],
		        ['8', <%=ch.getA8()%>, 'color: #ffd700 ' ],
		        ['9', <%=ch.getA9()%>, 'color: #ffd700 ' ],
		        ['10', <%=ch.getA10()%>, 'color: #ffd700 ' ],
		        ['11', <%=ch.getA11()%>, 'color: #ffd700 ' ],
		        ['12', <%=ch.getA12()%>, 'color: #ffd700 ' ],
		        ['13', <%=ch.getA13()%>, 'ffd700 '],        
		        ['14', <%=ch.getA14()%>, 'ffd700 '],            // English color name
		      	['15', <%=ch.getA15()%>, 'ffd700 '],
		        ['16', <%=ch.getA16()%>, 'color: #ffd700' ], // CSS-style declaration
		        ['17', <%=ch.getA17()%>, 'color: #ffd700' ],
		        ['18', <%=ch.getA18()%>, 'color: #ffd700' ],
		        ['19', <%=ch.getA19()%>, 'color: #ffd700' ],
		        ['20', <%=ch.getA20()%>, 'color: #ffd700 ' ],
		        ['21', <%=ch.getA21()%>, 'color: #ffd700 ' ],
		        ['22', <%=ch.getA22()%>, 'color: #ffd700 ' ],
		        ['23', <%=ch.getA23()%>, 'color: #ffd700 ' ],
		        ['24', <%=ch.getA24()%>, 'color: #ffd700 ' ], 
		        ['25', <%=ch.getA25()%>, 'color: #ffd700' ],
		        ['26', <%=ch.getA26()%>, 'color: #ffd700' ],
		        ['27', <%=ch.getA27()%>, 'color: #ffd700 ' ],
		        ['28', <%=ch.getA28()%>, 'color: #ffd700 ' ],
		      <%--   ['29', <%=ch.getA29()%>, 'color: #ffd700 ' ],
		        ['30', <%=ch.getA30()%>, 'color: #ffd700 ' ],
		        ['31', <%=ch.getA31()%>, 'color: #ffd700 ' ],  --%>
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
	}else if(<%=month%>==1 || <%=month%>==3 || <%=month%>==5 || <%=month%>==7 || <%=month%>==8 || <%=month%>==10 || <%=month%>==12){
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawVisualization);
		function drawVisualization() { 
			var data = google.visualization.arrayToDataTable([
				['Element', '방문수', { role: 'style' }],
		        ['1', <%=ch.getA1()%>, 'ffd700 '],        
		        ['2', <%=ch.getA2()%>, 'ffd700 '],            // English color name
		      	['3', <%=ch.getA3()%>, 'ffd700 '],
		        ['4', <%=ch.getA4()%>, 'color: #ffd700' ], // CSS-style declaration
		        ['5', <%=ch.getA5()%>, 'color: #ffd700' ],
		        ['6', <%=ch.getA6()%>, 'color: #ffd700' ],
		        ['7', <%=ch.getA7()%>, 'color: #ffd700' ],
		        ['8', <%=ch.getA8()%>, 'color: #ffd700 ' ],
		        ['9', <%=ch.getA9()%>, 'color: #ffd700 ' ],
		        ['10', <%=ch.getA10()%>, 'color: #ffd700 ' ],
		        ['11', <%=ch.getA11()%>, 'color: #ffd700 ' ],
		        ['12', <%=ch.getA12()%>, 'color: #ffd700 ' ],
		        ['13', <%=ch.getA13()%>, 'ffd700 '],        
		        ['14', <%=ch.getA14()%>, 'ffd700 '],            // English color name
		      	['15', <%=ch.getA15()%>, 'ffd700 '],
		        ['16', <%=ch.getA16()%>, 'color: #ffd700' ], // CSS-style declaration
		        ['17', <%=ch.getA17()%>, 'color: #ffd700' ],
		        ['18', <%=ch.getA18()%>, 'color: #ffd700' ],
		        ['19', <%=ch.getA19()%>, 'color: #ffd700' ],
		        ['20', <%=ch.getA20()%>, 'color: #ffd700 ' ],
		        ['21', <%=ch.getA21()%>, 'color: #ffd700 ' ],
		        ['22', <%=ch.getA22()%>, 'color: #ffd700 ' ],
		        ['23', <%=ch.getA23()%>, 'color: #ffd700 ' ],
		        ['24', <%=ch.getA24()%>, 'color: #ffd700 ' ], 
		        ['25', <%=ch.getA25()%>, 'color: #ffd700' ],
		        ['26', <%=ch.getA26()%>, 'color: #ffd700' ],
		        ['27', <%=ch.getA27()%>, 'color: #ffd700 ' ],
		        ['28', <%=ch.getA28()%>, 'color: #ffd700 ' ],
		        ['29', <%=ch.getA29()%>, 'color: #ffd700 ' ],
		        ['30', <%=ch.getA30()%>, 'color: #ffd700 ' ],
		        ['31', <%=ch.getA31()%>, 'color: #ffd700 ' ], 
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
	}else{
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawVisualization);
		function drawVisualization() { 
			var data = google.visualization.arrayToDataTable([
				['Element', '방문수', { role: 'style' }],
		        ['1', <%=ch.getA1()%>, 'ffd700 '],        
		        ['2', <%=ch.getA2()%>, 'ffd700 '],            // English color name
		      	['3', <%=ch.getA3()%>, 'ffd700 '],
		        ['4', <%=ch.getA4()%>, 'color: #ffd700' ], // CSS-style declaration
		        ['5', <%=ch.getA5()%>, 'color: #ffd700' ],
		        ['6', <%=ch.getA6()%>, 'color: #ffd700' ],
		        ['7', <%=ch.getA7()%>, 'color: #ffd700' ],
		        ['8', <%=ch.getA8()%>, 'color: #ffd700 ' ],
		        ['9', <%=ch.getA9()%>, 'color: #ffd700 ' ],
		        ['10', <%=ch.getA10()%>, 'color: #ffd700 ' ],
		        ['11', <%=ch.getA11()%>, 'color: #ffd700 ' ],
		        ['12', <%=ch.getA12()%>, 'color: #ffd700 ' ],
		        ['13', <%=ch.getA13()%>, 'ffd700 '],        
		        ['14', <%=ch.getA14()%>, 'ffd700 '],            // English color name
		      	['15', <%=ch.getA15()%>, 'ffd700 '],
		        ['16', <%=ch.getA16()%>, 'color: #ffd700' ], // CSS-style declaration
		        ['17', <%=ch.getA17()%>, 'color: #ffd700' ],
		        ['18', <%=ch.getA18()%>, 'color: #ffd700' ],
		        ['19', <%=ch.getA19()%>, 'color: #ffd700' ],
		        ['20', <%=ch.getA20()%>, 'color: #ffd700 ' ],
		        ['21', <%=ch.getA21()%>, 'color: #ffd700 ' ],
		        ['22', <%=ch.getA22()%>, 'color: #ffd700 ' ],
		        ['23', <%=ch.getA23()%>, 'color: #ffd700 ' ],
		        ['24', <%=ch.getA24()%>, 'color: #ffd700 ' ], 
		        ['25', <%=ch.getA25()%>, 'color: #ffd700' ],
		        ['26', <%=ch.getA26()%>, 'color: #ffd700' ],
		        ['27', <%=ch.getA27()%>, 'color: #ffd700 ' ],
		        ['28', <%=ch.getA28()%>, 'color: #ffd700 ' ],
		        ['29', <%=ch.getA29()%>, 'color: #ffd700 ' ],
		        ['30', <%=ch.getA30()%>, 'color: #ffd700 ' ],
		       <%--  ['31', <%=ch.getA31()%>, 'color: #ffd700 ' ],  --%>
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
	}
	</script> 
</head>
<body>
<div id="Wrap"><!-- Wrap S -->

	<%@ include file="include/header.jsp" %>

	<div id="container"><!-- container S -->

		<div class="tit">&bull; 일일 방문자 통계</div>

		<div class="contBox mt30"><!-- contBox S -->	
			
			<%@ include file="include/tab_statistics.jsp" %>
			
		</div><!--// contBox E-->
	&nbsp&nbsp&nbsp<span style="font-weight:bold">오늘방문수 : <%=today %></span>&nbsp&nbsp&nbsp&nbsp
	<span style="font-weight:bold">어제방문수 : <%= yesterday %></span>&nbsp&nbsp&nbsp&nbsp
	<span style="font-weight:bold">누적방문수 : <%= total %></span>
	
	<div class="numb pb10"  align="left"> 
		&nbsp&nbsp&nbsp<span><a class="num1"><</a></span>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="font-weight:bold; font-size:23px;"><%=year %>&nbsp.&nbsp<%=month %></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<span><a class="num2" href="#" disable>></a></span>&nbsp&nbsp&nbsp
	</div>
	</div><!--// container E-->
	
	<div id="chart_div" style="width:1540px; height: 500px;"></div>
	
	
	<%@ include file="include/footer.jsp" %>


</div><!--// Wrap E-->
<script>
	$('.num1').click(function(){
		var year = <%=year%>;
		
		if(<%= month %>==1){
			var month = 12;
			year = <%=year%>- 1;
		}else{
			var month = <%= month %> - 1;
		}
		
		location.href = "<%=request.getContextPath()%>/SelectChartToday?year="+year+"&month="+month;
	});
	
	$('.num2').click(function(){
		var year = <%=year%>;
		
		if(<%= month %>==12){
			var month = 1;
			year = <%=year%> +1;
		}else{
			var month = <%= month %> + 1;
		}
		
		location.href = "<%=request.getContextPath()%>/SelectChartToday?year="+year+"&month="+month;
	});
	
</script>
</body>
</html>