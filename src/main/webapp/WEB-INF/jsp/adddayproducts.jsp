<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script src="js/layui.js"></script>
		<script src="js/layer.js"></script>	
		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link href="css/font-awesome.min.css" rel="stylesheet">
		<link rel="icon" type="image/png" href="images/flag.jpg">
		<style>
		.admin-main{
			margin: 15px;
		}
		.admin-main .layui-field-title .layui-field-box{
			padding: 10px 30px;
		}
		.admin-main .layui-field-title .layui-field-box p{
			padding: 5px 0;
		}
		</style>
	</head>

	<body>
		<div class="admin-main">
         <div style="width:100%;height:500px;">
            <div style="margin-left:40%;margin-top:50px;position:absolute;">
			   <button class="layui-btn"><i class="fa fa-arrow-left"></i><a href="/bootable/dayplans" style="color:#fff;">返回查看日账单信息</a></button>			      
			</div> 
			<div style="margin-left:40%;margin-top:350px;position:absolute;">
			   <label class="layui-form-label">添加经轴数</label>	
			   <button class="layui-btn" style="width:50px;height:50px;border-radius:25px;" onclick="addBeams()"><i class="layui-icon">&#xe654;</i></button>			      
			</div>				
			<form class="layui-form" action="">
			  <div class="layui-form-item">
			   <div class="layui-inline">
				    <label class="layui-form-label">当前年份</label>
				    <div class="layui-input-inline" style="width:20%;">
				      <input type="text" class="layui-input" id="years" placeholder="年份">
				    </div>			   
			   </div>
			  </div>			  
			  <div class="layui-form-item" style="width:50%;">
			    <label class="layui-form-label">当前月份</label>
				    <div class="layui-input-block" style="width:20%;">
				      <select name="months" lay-verify="required" id="months">
				        <option value="0">选择月份...</option>
				        <option value="1">1月</option>
				        <option value="2">2月</option>
				        <option value="3">3月</option>
				        <option value="4">4月</option>
				        <option value="5">5月</option>
				        <option value="6">6月</option>
				        <option value="7">7月</option>
				        <option value="8">8月</option>
				        <option value="9">9月</option>
				        <option value="10">10月</option>
				        <option value="11">11月</option>	
				        <option value="12">12月</option>					        
				      </select>
				    </div>		   
			  </div>
			  <div class="layui-form-item">
             	<label class="layui-form-label">具体日期</label>
			    <div class="layui-input-inline" style="width:20%;">
			      <input type="text" class="layui-input" id="days" placeholder="账单具体日期(几号)">
			    </div>	
			  </div>	    
			  <div class="layui-form-item">
			    <label class="layui-form-label">进库数量(KG)</label>
			    <div class="layui-input-block" style="width:20%;">
			      <input type="text" name="IntolNum" id="IntolNum" required  lay-verify="required" placeholder="请输入当天账单号的进库重量" autocomplete="off" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">退回铁管数(个)</label>
			    <div class="layui-input-block" style="width:20%;">
			      <input type="text" name="sticksNum" id="sticksNum" required  lay-verify="required" placeholder="请输入铁管数量" autocomplete="off" class="layui-input"><br>
			      <input type="text" name="sticksWeight" id="sticksWeight" required  lay-verify="required" placeholder="请输入铁管重量" autocomplete="off" class="layui-input">
			    </div>
			  </div>				  
			  <div class="layui-form-item" id="upaddBeams">
			    <label class="layui-form-label">经轴</label>	 
			    <div class="layui-input-block" style="width:20%;">
			      <input type="text" name="BeamWeight" required  lay-verify="required" placeholder="请输入总质量" autocomplete="off" class="layui-input"><br>
			      <input type="text" name="BeamWeightPer" required  lay-verify="required" placeholder="轴自身重量(账单已标注)" autocomplete="off" class="layui-input">	<br>		    
			    </div>		    				    		      
			  </div>				  			  	      			  			  		  					  	  			  
			  <div class="layui-form-item">
			    <div class="layui-input-block">
			      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
			      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
			    </div>
			  </div>
			</form>           
         </div>
			
		</div>
		<script>
			//表单组件
			layui.use('form', function(){
			  var form = layui.form;	
				form.on('submit(formDemo)', function(data){
				    
				    var lastNum=0;
	                var BeamWeigs = document.getElementsByName("BeamWeight");
	                var BeamWeightPers = document.getElementsByName("BeamWeightPer");
					for(var i=0;i<BeamWeigs.length;i++){
					      lastNum+=(BeamWeigs[i].value-BeamWeightPers[i].value);
					}	
					var plan={
					   intolnum:$("#IntolNum").val(),
					   sticksnum:$("#sticksNum").val(),
					   sticksweight:$("#sticksWeight").val(),
					   beam:lastNum,
					   years:$("#years").val(),
					   months:$("#months").val(),
					   days:$("#days").val()
					}			
				  console.log(plan)
				  layer.open({
				          skin: 'layui-layer-molv',
				          title:'确定验证',
						  anim:1,
						  content:'确定输入的数据正确？',						  
						  btn:['是的','我再看看'],
						  zIndex:19950618,
						  yes:function(index){
						  $.ajax({
						       type:'post',
					           data:plan,
							   url:'/bootable/upDayplan',
							   success:function(data){
							     layer.msg('添加成功！', {icon: 1}); 
							   }
						  });
					   }
					   
					});    
				  return false; 
				});			  		 			 
		    });		
			
			//日期组件		
			layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  
			  //年 
			  laydate.render({
			    elem: '#years',
			    type:'year'
			  });						  
			 //日
			 laydate.render({
			    elem: '#days'
			  });			  
			});  						
           
           function addBeams(){
             var str="";
              str+="<div class='layui-form-item'>"; 
				  str+="<div class='layui-input-block' style='width:20%;'>";
				     str+="<input type='text' name='BeamWeight' required  lay-verify='required' placeholder='请输入总质量' autocomplete='off' class='layui-input'><br>";
				     str+="<input type='text' name='BeamWeightPer' required  lay-verify='required' placeholder='轴自身重量(账单已标注)' autocomplete='off' class='layui-input'><br>";			    
				   str+="</div>";		    				    		      
				str+="</div>";
             $("#upaddBeams").append(str);
           }
           
           
       </script>	
       	
 </body>
</html>