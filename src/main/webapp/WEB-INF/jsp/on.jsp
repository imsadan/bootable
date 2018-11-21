<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'on.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
  </head>
  
  <body>
   <div class="left"></div>
	<table class="layui-table">
	  <thead>
	    <tr>
	      <th>加入时间</th>
	      <th>签名</th>
	    </tr> 
	  </thead>
	  <tbody>
	    <tr>
	      <td>贤心</td>
	      <td>
		    <select class="on1"  id="Numbers1" name="vvvvv1">
			  <option value ="1" >1</option>
			  <option value ="2">2</option>
			  <option value="3">3</option>
			  <option value="4">4</option>
			</select>	      
	      </td>
	    </tr>
	    <tr>
	      <td>许闲心</td>
	      <td>
            <select class="on2"  id="Numbers2" name="vvvv2">
			  <option value ="0.5" checked>0.5</option>
			  <option value ="1">1</option>
			  <option value="3">3</option>
			  <option value="4">4</option>
			</select>	      
	      </td>
	    </tr>
	  </tbody>
	</table>
  </body>
  <script>
function selectTeacherDayShow(temp){

	
/* 	var grade=0;
	$(".fqTeacherGradeSum"+teacherId).each(function(){
		grade+=parseFloat($(this).val());
	})
	$(".fqTeacherGrade"+teacherId).text(grade) */
	
	var id=temp.id;
	var grade=0;
		$(".on"+id).each(function(){
			grade+=parseFloat($(this).val())
		});
    console.log(grade)
    var html="<p>变量:"+grade+"</p>";
    $(".left").empty().append(html);	
}  


(function(){
    var values = {};
    function setVal(){ //循环读取values对象的所有属性，加起来，兼容以后增加select的情况。
        var val = 0;
        for(var k in values){
            val += parseFloat(values[k]);
        }
       var html="<p>变量:"+val+"</p>";
       $(".left").empty().append(html);	
    }
    $('#Numbers1,#Numbers2').change(function(){ //select的值有改变的时候，把改变后的值全局保存到values对象里，key为select的name，以免之后重复叠加。
        var $this = $(this),name = $this.attr('name');
        values[name] = $this.val();
        setVal();
        console.log(values)
    });
}());
  </script>
</html>
