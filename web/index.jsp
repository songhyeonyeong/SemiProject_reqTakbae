<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
   import="java.util.*, com.kh.jinkuk.admin.model.vo.*"%>
<%-- <% int count = (int)request.getAttribute("count"); %>  --%>
<%@ include file="/views/include/common.jsp" %>

<%
   ArrayList<Announcment> list = (ArrayList<Announcment>)request.getAttribute("list"); 
	int i = 0;
%>
<title>택배를 부탁해 홈</title>

<script type="text/javascript">
   $(document).ready(function(){
     $('.bxslider').bxSlider({
      touchEnabled: true,
      speed: 500,
      pager: true,
      pagerType: 'full',
     });

   });

</script>

<style>
   #today{
      color:yellow;
      
   }
   #slideContainer > div{
      color:white;
   }
   #slideContainer > div > a{
      color:white;

</style>


</head>
<body>
<%-- <script>
   $(function(){
      boolean t = false;
      if(!t){
         console.log(0);
         location.href="<%=request.getContextPath()%>/CountServlet";
      }else{
         console.log(<%=request.getAttribute("count")%>);
      }   
   });
</script> --%>

<div id="wrap"><!-- Wrap S -->

<%@ include file="/views/include/header.jsp" %>

<div id="visual"><!-- visual S -->
   <ul class="bxslider">
      <li class="banner01 tcen">
         <div class="text">
            <p class="font60">택배보다 <span class="font60 darkbluee">빠르고</span><br>퀵보다 <span class="font60 darkbluee">싸다!!</span></p>
            <p class="font30" id="msg">&nbsp;</p>
         </div>
         
         
         <div style="position: absolute;bottom:-15px;right:0px;" class="car">
            <img src="/reqtakbae/views/common/images/contents/222.png" width="150" height="80" style="">
         </div>
         
         
      </li>
      <li class="banner02">
         <div class="text">
            <p class="font60">택배보다 <span class="font60 darkbluee">빠르고</span><br>퀵보다 <span class="font60 darkbluee">싸다!!</span></p>
            <p class="font30">택배업계 최초 일반인 택배서비스</p>
         </div>
      </li>
   </ul>
</div><!--// visual E-->

<div class="noticeLine"><!-- noticeLine S -->
   <div class="inner"><!-- inner S -->
      <ul class="notice">
         <li class="tit bold mr20">공지사항</li>
         <li><a href="#">택배를 부탁해 홈페이지가 오픈되었습니다.</a></li>
      </ul>
      
    <a class="tit bold" id="today">오늘의 공고</a>       
    <div id="slideContainer">
    <%if(list != null){ %>
   <%for(Announcment m : list){ %>

         <div><%=m.getUSER_ID() %> <%=m.getG_S_AREA() %> ~ <%=m.getG_E_AREA() %> <%=m.getG_P_DIV() %></div>

      <%} }else{%>
         <div style="display:none;">--------</div>
      <%} %>

   </div>  


   </div><!--// inner E-->
</div><!--// noticeLine E-->


<%@ include file="/views/include/footer.jsp" %>


</div><!--// Wrap E-->


<%@ include file="/views/include/myNav.jsp" %>
<script type="text/javascript">
$(function(){
	 	$("#no").css("display","none");
		var num = 0;
      $.ajax({
         url:"/reqtakbae/AA", //댓글삽입 서블릿으로 전송
         type:"post",
         success:function(data){
            console.log(data);
        	var name = "";
        	var a = 0;
			$divs = $("#slideContainer");
			for(a = 0; a < data.length; a++){
				name = data[a].G_NO;
  				console.log(name);
  				var $div = $("<div>");
				$div.append(data[a].USER_ID);
				$div.append(" ");
				$div.append(data[a].G_S_AREA);
				$div.append(" ~ ");
				$div.append(data[a].G_E_AREA);
				$div.append(" ");
				$div.append(data[a].G_P_DIV);
				$divs.append($div);
				

	
			}
			
			
			$("#slideContainer").click(function(){	
				console.log(name);
	    <%-- 	  location.href = "<%=request.getContextPath()%>/selectOne.bo?num="+name; --%>
	    	  
	      });
			
			 $("#slideContainer").css({
		    	  "cursor" : "pointer",
		          "height" :$("#slideContainer div:first").css("height"),
		          "overflow" : "hidden"
		      });
		      
		      
		      function slide() {
		          $("#slideContainer div:first").slideUp(1500, function() {
		              var $this = $(this);
		              $this.parent().append(this);
		              $this.show();
		              slide();
		          });
		      }
		      slide();  

         },
         error:function(){
            console.log("실패");
         }
      });


   });



   $(".car").animate({
      left:0
   },function(){
      $(".car").fadeOut(1500);
      
      setTimeout(function(){
         $("#msg").append("택배업계 최초 일반인 택배서비스");      
      },300);
      
   });
   
   
   
</script>

<%if (loginUser !=null){ %>
<script>
	$(function(){
			var id="<%=loginUser.getUser_id()%>";
			$.ajax({
				url:"Visit",
				type:"get",
				data: {id:id},
				success:function(data){
				},
				error:function(request,status,error){
		      	},
			});	
	});
</script>
<%} %>


</body>
</html>