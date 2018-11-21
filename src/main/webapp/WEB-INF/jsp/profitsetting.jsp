<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link href="css/font-awesome.min.css" rel="stylesheet">
		<script src="js/layui.js"></script>
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
			   <button class="layui-btn"><i class="fa fa-refresh"></i><a href="/bootable/profitsetting" style="color:#fff;">&nbsp;刷新经纬参数</a></button>		      
			</div> 			
			<form class="layui-form" action="">
			  <div class="layui-form-item">
			    <label class="layui-form-label">利润价格</label>
			    <div class="layui-input-block" style="width:20%;">
			      <input type="text" name="price" id="nprice" required  lay-verify="required" placeholder="请输入现单价" autocomplete="off" class="layui-input"><br>			     
			    </div>
			  </div>			  			  			  
			  <div class="layui-form-item" style="width:50%;">
			    <label class="layui-form-label">纬数</label>
				    <div class="layui-input-block" style="width:20%;">
				      <select name="pname" lay-verify="required" id="pname">
				        <option>请选择</option>			        
				      </select>
				    </div>		   
			  </div>	    
			  <div class="layui-form-item" style="width:50%;">
			    <label class="layui-form-label">经数</label>
				    <div class="layui-input-block" style="width:20%;">
				      <select name="uname" lay-verify="required" id="uname">
				        <option>请选择</option>			        
				      </select>
				    </div>		   
			  </div>
			  <div class="layui-form-item">
             	<label class="layui-form-label">具体日期</label>
			    <div class="layui-input-inline" style="width:20%;">
			      <input type="text" class="layui-input" id="days" placeholder="变更日期">
			    </div>	
			  </div>			  				  				  			  	      			  			  		  					  	  			  
			  <div class="layui-form-item">
			    <div class="layui-input-block">
			      <button class="layui-btn" lay-submit lay-filter="addDemo">立即提交</button>
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
				form.on('submit(addDemo)', function(data){	
				  var info={
					  updatetime:$("#days").val(),
					  pname:$("#pname").find("option:selected").text(),
					  uname:$("#uname").find("option:selected").text(),
					  price:$("#nprice").val()
				  }			
				  console.log(info)    
				  layer.open({
				          skin: 'layui-layer-molv',
				          title:'年年利润菜单',
						  anim:1,
						  content:'更新现状？',						  
						  btn:['是的','我再看看'],
						  zIndex:19950618,
						  yes:function(index){
						  $.ajax({
						       type:'post',
						       data:info,
							   url:'/bootable/updatePrice',
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
			  						  
			 //日
			 laydate.render({
			    elem: '#days'
			  });			  
			}); 
			
								
            //动态获取所有的经纬参数表
            var brandId = $("select[name=pname]").val();   
		    $("select[name=pname]").empty();      //清空  
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
		               $("#pname").append(str); 
		               renderForm();
		          } 
		        }  
		    }); 
		    
		    var jinId = $("select[name=uname]").val();   
		    $("select[name=uname]").empty();      //清空  
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
		               $("#uname").append(st); 
		               renderForm();
		          } 
		        }  
		    });	              										     		                  
       </script>	
		<script src="js/layer.js"></script>	       	
 </body>
</html>