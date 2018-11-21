<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>		
		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
		<link href="css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" href="css/jquery.pagination.css" />
		<script src="js/bootstrap.min.js"></script>	
		<script src="js/jquery.pagination.min.js"></script>
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
		.oddplay{display:none;}
		a:link { 
		text-decoration: none; 
		} 
		a:visited { 
		text-decoration: none; 
		} 
		a:hover { 
		text-decoration: none; 
		} 
		a:active { 
		text-decoration: none; 
		} 
		</style>
	</head>
	<body>
	 <div class="admin-main">
         <div style="width:100%;height:500px;">         
            <div style="margin-left:40%;margin-top:50px;position:absolute;">			 
			   <button class="layui-btn"><i class="fa fa-refresh"></i><a href="/bootable/profitcharts" style="color:#fff;">&nbsp;刷新经纬参数</a></button>		      
			</div> 			
			<form class="layui-form" action="">
			  <div class="layui-form-item" style="width:50%;">
			    <label class="layui-form-label">纬数</label>
				    <div class="layui-input-block" style="width:20%;">
				      <select name="pname" lay-verify="required" id="pname" lay-filter="pname">
				        <option>请选择</option>			        
				      </select>
				    </div>		   
			  </div>	    
			  <div class="layui-form-item" style="width:50%;">
			    <label class="layui-form-label">经数</label>
				    <div class="layui-input-block" style="width:20%;">
				      <select name="uname" lay-verify="required" id="uname" lay-filter="uname">
				        <option>请选择</option>			        
				      </select>
				    </div>		   
			  </div>			
			</form><br>
		    <div id="container" style="width:auto; height: 400px;"></div>  	               
         </div>     				
	 </div>
	<script src="js/layui.js"></script>	
    <script type="text/javascript" src="js/highcharts.js"></script>	
    <script type="text/javascript">  
            function renderForm(){
		        layui.use('form',function(){
		            var form=layui.form;
		            form.render();
		        });
		    }
		      
         var selectPname=null;
		 var selectUname=null;		 		 
		//默认当前页
        //表单组件
			layui.use('form', function(){
			  var form = layui.form;
			  layer.msg('不同参数利润单价趋势图', {icon: 7});   	 
			  form.on('select(pname)', function(data){
                     selectPname=data.value;     
                     layer.msg('选择参数支', {icon: 7});   
					 form.on('select(uname)', function(dat){					 
		                  selectUname=dat.value;  
						   var param={
	                               pname:selectPname,
	                               uname:selectUname,
							  };   
						   var xtext=[];  //x轴文本
						   var nametext=null;
						   var laytitle=null;
						   var seriesData=[];	  
						   $.ajax({
						      type:'post',
					          data:param,
					          url:'/bootable/lookStaticOfPrice',
					          success:function(data){
					            var res=JSON.parse(data);
							    var table=""; 
							    var newtb=""; 	
							    for(var i=0;i<res.length;i++){			    
				                    xtext.push(res[i].times);
				                    seriesData.push(res[i].price);				       
							    }		    			
							    chart.series[0].setData(seriesData);
							}    
	                    });      
	                    
                 var chart = new Highcharts.Chart({							
				        chart:{							
				            renderTo:'container',							
				            type:'spline' 							
				        },	
				        credits: {
						     enabled: false
						},	
						title:{
						    text:'单价变化趋势图'
						},
						legend: {
					        layout: 'vertical',
					        align: 'right',
					        verticalAlign: 'middle'
					    },						
				        xAxis:{							
							categories:xtext							
						},													
				        yAxis:{							
				            title:{							
				                text:'价格/元' 						
				            }						
				        },
				        series:[{
				           name:"支(规格)"
				        }]						
				  });
	                           	                       		                  
 			});							
 									                    
		}); 									
			
			form.render();											 
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
                           str += "<option value='" + modelList[i].pname
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
                           st += "<option value='" + model[i].uname
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