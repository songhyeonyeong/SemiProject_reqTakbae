<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic);
	
	function drawBasic() {
	
		 var data = google.visualization.arrayToDataTable([
	          ['Element', 'Density', { role: 'style' }],
	          ['Copper', 100, '#b87333'],            // RGB value
	          ['Silver', 150, 'silver'],            // English color name
	          ['Gold', 10, 'gold'],
	 	      ['Platinum', 50, 'color: #e5e4e2' ], // CSS-style declaration
	 	     ['Platinum', 50, 'color: #e5e4e2' ],
	 	    ['Platinum', 50, 'color: #e5e4e2' ],
	 	   ['Platinum', 50, 'color: #e5e4e2' ],
	 	  ['Platinum', 50, 'color: #e5e4e2' ],
	 	 ['Platinum', 50, 'color: #e5e4e2' ],
	 	['Platinum', 50, 'color: #e5e4e2' ],
	 	['Platinum', 50, 'color: #e5e4e2' ],
	 	['Platinum', 50, 'color: #e5e4e2' ],
	 	['Platinum', 50, 'color: #e5e4e2' ],
	 	['Platinum', 50, 'color: #e5e4e2' ],
	 	['Platinum', 50, 'color: #e5e4e2' ],
	 	['Platinum', 50, 'color: #e5e4e2' ],
	 	['Platinum', 50, 'color: #e5e4e2' ],
	 	['Platinum', 50, 'color: #e5e4e2' ],
	 	['Platinum', 50, 'color: #e5e4e2' ],
	 	['Platinum', 50, 'color: #e5e4e2' ],
	 	['Platinum', 50, 'color: #e5e4e2' ],
	 	['Platinum', 50, 'color: #e5e4e2' ],
	 	['Platinum', 50, 'color: #e5e4e2' ],
	 	['Platinum', 50, 'color: #e5e4e2' ],
	 	
	       ]);
	
	      var options = {
	        title: 'Motivation Level Throughout the Day',
	        hAxis: {
	          title: 'Time of Day',
	          format: 'h:mm a',
	       /*    viewWindow: {
	            min: [7, 30, 0],
	            max: [17, 30, 0]
	          } */
	        },
	       
	      };
	
	      var chart = new google.visualization.ColumnChart(
	        document.getElementById('chart_div'));
	
	      chart.draw(data, options);
	    }
</script>
</head>
<body>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <div id="chart_div" style="width: 1700px; height: 500px;" "></div>

<!-- <script>
	google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawVisualization);
	
	      $(function a(){
	      var data = google.visualization.arrayToDataTable([
	          ['Element', 'Density', { role: 'style' }],
	          ['Copper', 8.94, '#b87333'],            // RGB value
	          ['Silver', 10.49, 'silver'],            // English color name
	          ['Gold', 19.30, 'gold'],

	        ['Platinum', 21.45, 'color: #e5e4e2' ], // CSS-style declaration
	       ]);
	      });
	      </script> -->
	      
</body>
</html>



<!--<div id="chart_div" style="width: 1500px; height: 500px;"></div>
 function drawVisualization() {
	        // Some raw data (not necessarily accurate)
	        var data = google.visualization.arrayToDataTable([
	          ['Month', '강남구', '강동구', '강북구', '강서구', '관악구','광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구','마포구', '서대문구', '서초구', '성동구', '성북구', '송파구','양천구', '영등포구', '용산구', '은평구', '종로구', '중구','중랑구'],
	          ['신청 수', 165, 938, 522, 998, 450, 123, 165, 938, 522, 998, 450, 123, 165, 938, 522, 998, 450, 123, 165, 938, 522, 998, 450, 123, 123],
	         
	        ]);
	
	        var options = {
	          /* title : 'Monthly Coffee Production by Country', */
	          vAxis: {title: '신청수'},
	          hAxis: {title: '지역'},
	          seriesType: 'bars',
	          /* series: {5: {type: 'line'}} */
	        };
	
	        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	        chart.draw(data, options);
	      } -->