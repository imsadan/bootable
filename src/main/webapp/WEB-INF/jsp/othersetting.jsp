<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>		
		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
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
         <div style="width:100%;height:500px;"><br>
           <h3><p>纬度参数：</p></h3>      
		      <div class="box-body">
              <table id="example1" class="table table-bordered table-striped" style="table-layout:fixed;">            
                <thead>
                <tr>
                  <th>序号单</th>
                  <th>纬度</th>
                </tr>
                </thead>
                <tbody id="tbody" style="text-align:center;">        
                </tbody>
              </table>
              </div><br>
              <div id="monthStatic">
                
              </div>          
         </div>       				
	 </div>
	<script src="js/layui.js"></script>
    <script src="js/layer.js"></script>			
    <script type="text/javascript">    
          //纬度列表
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
                          str+="<tr>";
                          str+="<td>"+modelList[i].pid+"</td>";
                          str+="<td>"+modelList[i].pname+"</td>";
                          str+="</tr>";
		                }  
		              $("#tbody").append(str); 
		          } 
		        }  
		    });                    	
    </script> 				
</body>
</html>