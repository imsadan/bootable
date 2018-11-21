<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>系统设置-学生综合素质评价系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE"/>
<meta name="description" content=""/>
<link rel="stylesheet" type="text/css" href="js/node-modules/bootstrap/css/bootstrap.m.min.css">
<link rel="stylesheet" type="text/css" href="js/node-modules/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="js/node-modules/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="js/assets/css/base.css">
<link rel="stylesheet" type="text/css" href="js/assets/css/sweetalert2.min.css">
<link rel="stylesheet" type="text/css" href="js/assets/css/layout.css">
<link rel="icon" type="image/png" href="js/assets/img/favicon.png">
<script type="text/javascript" src="js/assets/javascript/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/assets/javascript/sweetalert2.min.js"></script>
<script type="text/javascript" src="js/node-modules/layui/lay/dest/layui.all.js"></script>
<style type="text/css">
.md-modal,.md-modal2 {
	/*background-color:rgb(56,171,255);*/
	position: fixed;
	top: 50%;
	left: 50%;
	width: 70%;
	max-width: 860px;
	min-width: 320px;
	height: auto;
	z-index: 2000;
	display:none;
	 -webkit-transform: translateX(-50%) translateY(-50%);
	-moz-transform: translateX(-50%) translateY(-50%);
	-ms-transform: translateX(-50%) translateY(-50%);
	transform: translateX(-50%) translateY(-50%);
}
.show-authority{
	text-align:center;
	width: 100%;
	height: 70px;
	line-height: 70px;
}
.authority{
	padding: 10px;
	margin:10px;
	background-color: #DFF0D8;
	text-align: center;
	cursor: pointer;
	color: #A9A8A8;
}
.show-message{
	overflow: auto;
	overflow-x: auto;
}
.layui-form input[type=checkbox], .layui-form input[type=radio], .layui-form select {display: inline-block;}
.layui-layer-btn .cdsw-btn{height: 28px;
    line-height: 28px;
    margin: 6px 6px 0;
    padding: 0 15px;
    border: 1px solid #dedede;
    border-radius: 2px;
    font-weight: 400;
    cursor: pointer;
    text-decoration: none;
    color: #fff;}
</style>
</head>
<body class="color-green">
	<div class="md-modal md-effect-1 layui-layer layui-layer-dialog layui-layer-molv layer-anim-01" id="modal-1">
		<div class="layui-layer-title" style="cursor: move;">信息</div>
		<div  class="md-content" id="md-content" style="font-size: 15px;  overflow-y:auto ;height:300px;margin:15px;">
			<table class="layui-table h m-none" lay-skin="row">
				<colgroup>
				    <col width="120">
				    <col width="150">
				    <col>
				</colgroup>
				<thead><tr><th>姓名</th><th>班级</th><th>科目</th></tr></thead>
				<tbody>
				<tr class="bg-white">
					<td><select class="addTeacherList form-control"></select></td>
					<td class="form-inline">
						<div class='w'>
							<select class="addTeacherEnterSchoolClassList form-control w-100"></select>
							<!--<select class="addTeacherClassList form-control w-80"></select>-->
							<div class="addTeacherClassList mt-md" style="height:150px"></div>
						</div>
					</td>
					<td><div class="addTeacherSubjectLists"></div></td>
				</tr>
				</tbody>
			</table>
		</div>
		<div class="layui-layer-btn layui-layer-btn-"><a class="md-save cdsw-btn">保存</a><a class="md-close cdsw-btn">取消</a></div>
	</div>
	<div class="container">
		<form class="show-message layui-form cbox"></form>
	</div>
</body>
<script>
$.getJSON("js/school.json", function(data){
   console.log(data)
   $(".replaceBox").remove();
	var tr='';
	tr+='<div class="replaceBox m-none">';
	tr+="<h1 class='form-inline p-none mh-md pt-sm pr'>";
	tr+="<span class='ml-sm'>创建班级</span>";
	tr+="<span class='pa ml-35' style='top:7px;'><div class='input-group'><input type='hidden' class='schoolId' value='1'>";					
	tr+='<select class="year form-control lay-ignore w-100"  style="border-right: none;border-radius: 4px 0 0 4px;">';
	for(var t=2000;t<=2100;t++){
		tr+='<option value="'+t+'">'+t+'届</option>';
	}
	tr+='</select>';
	tr+='<select class="classs form-control lay-ignore w-80" style="border-right: none;">';
	for(var t=1;t<=50;t++){
		tr+='<option value="'+t+'班">'+t+'班</option>>';
	}
	tr+='</select>';
	tr+='<button type="button" class="btn layui-bg-default c-white addClass" onclick="addClass()" style="border-radius:0 4px 4px 0;">添加班级</button></div>';
	tr+='<div class="input-group ml-35">';
	tr+='<select class="changYear form-control lay-ignore w-100" style="border-right: none;">';
	for(var r=2000;r<=2100;r++){
		tr+='<option value="'+r+'">'+r+'届</option>';
	}
	tr+='</select>';
	tr+='<button type="button" class="btn layui-bg-default c-white seek" onclick="seek()" style="border-radius:0 4px 4px 0;">搜索</button>';
	
	tr+='</div>';
	tr+='<div class="input-group ml-35">';
	tr+='<button type="button" class="btn layui-bg-default c-white seekAllClass" onclick="show(6)" style="display: none;">查看所有班级</button>';
	tr+='</div>';
	tr+="</span><hr class='mt-xs'>";
	tr+="</h1>";
	tr+='<div class="classCenter ph-md">';
	/*排序*/
	function JsonSort(json,key){
	    for(var j=1,k=json.length;j < k;j++){
	        var temp = json[j],
	            val  = temp[key],
	            i    = j-1;
	        while(i >=0 && json[i][key]>val){
	            json[i+1] = json[i];
	            i = i-1;    
	        }
	        json[i+1] = temp;
	        
	    }
	    return json;
	} 
	//把不同年份分隔
	var obj=JsonSort(data,'enterSchool'); 
	for(var u=0;u<data.length;u++){
		/* tr+='<fieldset class="layui-elem-field inline-block w-120 mr-sm"><div class="layui-field-box pr tc lh-48">'+data[u].enterSchool+"届"+data[u].className+'<i class="layui-icon pa top0 right0 mt-xs mr-xs lh-20 pointer" onclick="removeClassBo(this,'+data[u].id+')">&#x1006;</i> </fieldset>'; */
		for(var j=u+1;j<data.length;j++){
		  if(data[u].enterSchool==data[j].enterSchool){
		     var f_class_t=data[u].className;
		     var f_id=data[u].id;
		     var f_class=f_class_t.replace("班","");
		     console.log(f_class)
		     var s_class_t=data[j].className;
		     var s_id=data[j].id;
		     var s_class=s_class_t.replace("班","");
		     if(f_class>s_class){
		        data[u].className=s_class_t;
		        data[j].className=f_class_t;
		        data[u].id=s_id;
		        data[j].id=f_id;
		     }
		  }
		} 
	 tr+='<fieldset class="layui-elem-field inline-block w-120 mr-sm"><div class="layui-field-box pr tc lh-48">'+data[u].enterSchool+"届"+data[u].className+'<i class="layui-icon pa top0 right0 mt-xs mr-xs lh-20 pointer" onclick="removeClassBo(this,'+data[u].id+')">&#x1006;</i> </fieldset>';	  
	 if(u+1<data.length){
		if((data[u+1].enterSchool)!=(data[u].enterSchool)){
			tr+="<br>";
		}
	 }												 		 		
	}
	tr+='</div></div>';
	$(".show-message").empty().append(tr);
});
</script>
</html>