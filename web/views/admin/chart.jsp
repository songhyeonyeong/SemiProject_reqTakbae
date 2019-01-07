<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
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
				
				['Element', 'Density', { role: 'style' }],
				
		        ['Copper', a, '#b87333'],        
				// RGB value
		        ['Silver', 10.49, 'silver'],            // English color name
		        ['Gold', 19.30, 'gold'],
		        ['Platinum', 21.45, 'color: #e5e4e2' ], // CSS-style declaration
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        ['Platinum', 21.45, 'color: #e5e4e2' ],
		        
				]);
			var options = {
					title : '지역별 신청 통계',
				/* 	vAxis: {title: 'Cups'}, */
				/* 	hAxis: {title: 'Month'},  */
					seriesType: 'bars',
					legend : 'none',
					/* series: {5: {type: 'line'}} */
				};
			var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
			chart.draw(data, options);
		}
	</script>
</head>
<body>
	<div id="chart_div" style="width:1500px; height: 500px;"></div>
</body>
</html>