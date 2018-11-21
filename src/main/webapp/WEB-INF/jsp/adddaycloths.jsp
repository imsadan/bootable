<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link href="css/font-awesome.min.css" rel="stylesheet">
		<link rel="icon" type="image/png" href="images/flag.jpg">
		<script src="js/layui.js"></script>
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
			   <button class="layui-btn"><i class="fa fa-arrow-left"></i><a href="/bootable/dayoutcloths" style="color:#fff;">&nbsp;返回查看出库布料</a></button>		
			   <button class="layui-btn"><i class="fa fa-refresh"></i><a href="/bootable/adddaycloths" style="color:#fff;">&nbsp;刷新经纬参数</a></button>		      
			</div> 			
			<p style="color:red;">无经纬参数请先添加！<button class="layui-btn"><i class="fa fa-gear"></i><a href="/bootable/parameter" style="color:#fff;">&nbsp;查看</a></button>	</p>
			<br>
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
			  <div class="layui-form-item" style="width:50%;">
			    <label class="layui-form-label">纬数</label>
				    <div class="layui-input-block" style="width:20%;">
				      <select name="weiNum" lay-verify="required" id="weiNum">
				        <option>请选择</option>			        
				      </select>
				    </div>		   
			  </div>	    
			  <div class="layui-form-item" style="width:50%;">
			    <label class="layui-form-label">经数</label>
				    <div class="layui-input-block" style="width:20%;">
				      <select name="jinNum" lay-verify="required" id="jinNum">
				        <option>请选择</option>			        
				      </select>
				    </div>		   
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">布料数量</label>
			    <div class="layui-input-block" style="width:20%;">
			      <input type="text" name="clothsNum" id="clothsNum" required  lay-verify="required" placeholder="请输入对应的布料数" autocomplete="off" class="layui-input"><br>			     
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
		    function renderForm(){
		        layui.use('form',function(){
		            var form=layui.form;
		            form.render();
		        });
		    }
		    
			//表单组件
			layui.use('form', function(){
			  var form = layui.form;	
				form.on('submit(formDemo)', function(data){	
				  var info={
				      years:$("#years").val(),
					  months:$("#months").val(),
					  days:$("#days").val(),
					  wei:$("#weiNum").find("option:selected").text(),
					  jin:$("#jinNum").find("option:selected").text(),
					  numbers:$("#clothsNum").val()
				  }			
				  console.log(info)    
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
						       data:info,
							   url:'/bootable/upDaycloths',
							   success:function(data){
							     layer.msg('添加成功！', {icon: 1}); 
							   }
						  });
					   }
					   
					});    
				  return false; 
				});												
		    
		    form.render();			
		    		  		 			 
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
			
								
            //动态获取所有的经纬参数表
            var brandId = $("select[name=weiNum]").val();   
		    $("select[name=weiNum]").empty();      //清空  
		    $.ajax({
		        url:'/bootable/getWeiNumList',  
		        type:"post",  
		        cache: false,  
		        error:function(){  
		        },   
		        success:function(data){  
 		            var modelList = JSON.parse(data);  
 		            var str="";
		            if(modelList && modelList.length != 0){  
		                for(var i=0; i<modelList.length; i++){                            
                           str += "<option value='" + modelList[i].pid
										+ "'>" + modelList[i].pname
										+ "</option>";
		                }  
		               $("#weiNum").append(str); 
		               renderForm();
		          } 
		        }  
		    }); 
		    
		    var jinId = $("select[name=jinNum]").val();   
		    $("select[name=jinNum]").empty();      //清空  
		    $.ajax({
		        url:'/bootable/getJinNumList',  
		        type:"post",  
		        cache: false,  
		        error:function(){  
		        },   
		        success:function(data){  
 		            var model = JSON.parse(data);  
 		            var st="";
		            if(model && model.length != 0){  
		                for(var i=0; i<model.length; i++){                            
                           st += "<option value='" + model[i].uid
										+ "'>" + model[i].uname
										+ "</option>";
		                }  
		               $("#jinNum").append(st); 
		               renderForm();
		          } 
		        }  
		    });	              										     		                  
       </script>	
		<script src="js/layer.js"></script>	       	
 </body>
</html>