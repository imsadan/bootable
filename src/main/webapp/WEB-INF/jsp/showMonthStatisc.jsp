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
         <button class="layui-btn layui-btn-sm"><i class="fa fa-arrow-left"></i><a href="/bootable/dayplans" style="color:#fff;">返回</a></button>       
           <br><form class="layui-form" action="">
		           <div class="layui-form-item">
		           <label class="layui-form-label" style="color:red;">选择年</label>
				    <div class="layui-input-block" style="width:20%;">
				      <select name="years" lay-verify="required" lay-filter="years">
				        <option value="0">请选择年份...</option>
				        <option value="2017">2017年</option>
				        <option value="2018">2018年</option>
				        <option value="2019">2019年</option>
				      </select>
				     </div>
				  </div>    
			      <div class="layui-form-item">
				    <label class="layui-form-label" style="color:red;">选择月</label>
				    <div class="layui-input-block" style="width:20%;">
				      <select name="months" lay-verify="required" lay-filter="months">
					        <option value="0">请选择月份...</option>
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
		    </form>	
		    <div id="container" style="width:auto; height: 400px;"></div>  	               
         </div>     				
	 </div>
	<script src="js/layui.js"></script>
    <script src="js/layer.js"></script>		
    <script type="text/javascript" src="js/highcharts.js"></script>	
    <script type="text/javascript">    
         var selectYear=null;
		 var selectMonth=null;		 		 
		//默认当前页
        //表单组件
			layui.use('form', function(){
			  var form = layui.form;
			  layer.msg('该页面用于查看日利润变化趋势', {icon: 7});   	 
			  form.on('select(years)', function(data){
                     selectYear=data.value;     
                     layer.msg('选择月份(请细分到月份)', {icon: 7});   
					 form.on('select(months)', function(dat){					 
		                  selectMonth=dat.value;  
						   var param={
	                               years:selectYear,
	                               months:selectMonth,
							  };   
								    var x=[];  //x轴
									var y=[];  //y轴
									var xtext=[];  //x轴文本								  	                  
                              $.ajax({
			                      type:'post',
			                      data:param,
						          url:'/bootable/showMonthStatiscPlan',
								  success:function(data){
								    var res=JSON.parse(data);
								    var table="";  	
								    for(var i=0;i<res.length;i++){
								       res[i].y=res[i].beam;
								       xtext.push(res[i].days);
								       								       
								    }
								    	console.log(xtext)				         
								    chart.series[0].setData(res);    //数据填充到highcharts上面
								  }                          
	                          });
	                          
	                           var chart = new Highcharts.Chart({							
							        chart:{							
							            renderTo:'container',							
							            type:'column' 							
							        },	
							        credits: {
									     enabled: false
									},						
							        title:{							
							            text:'月账单统计表' 						
							        },							
							        xAxis:{							
							            categories:xtext							
							        },							
							        yAxis:{							
							            title:{							
							                text:'月利润/元' 						
							            },							
							        },							
							        series:[{							
							            name:"日期"							
							        }]							
							    });
	                           	                       		                  
 					});							
 									                    
			 }); 									
													 
	  });  			  			  			  	   					  	
	</script>
				
</body>
</html>