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
           <button class="layui-btn"><i class="layui-icon">&#x1002;</i><a href="/bootable/parameter" style="color:#fff;">&nbsp;刷新</a></button>
           <button class="layui-btn layui-btn-warm"><i class="layui-icon">&#xe654;</i><a href="#" style="color:#fff;" onclick="addWei()">&nbsp;新增纬度</a></button>
           <button class="layui-btn layui-btn-warm"><i class="layui-icon">&#xe654;</i><a href="#" style="color:#fff;" onclick="addJin()">&nbsp;新增经度</a></button>
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
              <h3><p>经度参数：</p></h3>      
		      <div class="box-body">
              <table id="example1" class="table table-bordered table-striped" style="table-layout:fixed;">            
                <thead>
                <tr>
                  <th>序号单</th>
                  <th>经度</th>
                </tr>
                </thead>
                <tbody id="tbody2" style="text-align:center;">        
                </tbody>
              </table>
              </div><br>                      
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
		    
          //经度列表
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
                          st+="<tr>";
                          st+="<td>"+model[i].uid+"</td>";
                          st+="<td>"+model[i].uname+"</td>";
                          st+="</tr>";
		                }  
		               $("#tbody2").append(st); 
		          } 
		        }  
		    });			   
		    
		    //新增
		    function addWei(){
				     layer.open({
				          skin: 'layui-layer-molv',
				          title:['新增纬数','font-size:18'],
				          type:1,
						  anim:1,
						  content:$('#updateStauts'),						  
						  btn:['新增','取消'],
						  zIndex:19950618,
						  area:['450px','200px'],
						  maxmin:true,
						  scrollbar:true,
						  yes:function(index){
						    var pname=$('#pname').val()
						    if(pname==""){
						       layer.msg('请填写纬数！',{icon:3,zIndex:19960618});
						    }else{						      
						    $.ajax({
						       type:'post',
			                   url:'/bootable/parameter/addWei',
			                   data:{pname:pname},
						       success:function(data){
						          layer.alert('新增成功!', {
							          zIndex:19960618,
							          skin: 'layui-layer-molv'
							       },function(index){
							            layer.close(index);
                                        		                          
							       });		
							       layer.closeAll('loading');							       					      
						       },error:function(data){
						          layer.alert('出错!', {
							          zIndex:19960618,
							          skin: 'layui-layer-molv'
							       });
						       }
						    });
						    layer.close(index);
						    }
						    	
						  }
					});
		    }
		    
		    
		    function addJin(){
				     layer.open({
				          skin: 'layui-layer-molv',
				          title:['新增纬数','font-size:18'],
				          type:1,
						  anim:1,
						  content:$('#updateStauts2'),						  
						  btn:['新增','取消'],
						  zIndex:19950618,
						  area:['450px','200px'],
						  maxmin:true,
						  scrollbar:true,
						  yes:function(index){
						    var uname=$('#uname').val()
						    if(uname==""){
						       layer.msg('请填写经数！',{icon:3,zIndex:19960618});
						    }else{						      
						    $.ajax({
						       type:'post',
			                   url:'/bootable/parameter/addJin',
			                   data:{uname:uname},
						       success:function(data){
						          layer.alert('新增成功!', {
							          zIndex:19960618,
							          skin: 'layui-layer-molv'
							       },function(index){
							            layer.close(index);
                                        		                          
							       });		
							       layer.closeAll('loading');							       					      
						       },error:function(data){
						          layer.alert('出错!', {
							          zIndex:19960618,
							          skin: 'layui-layer-molv'
							       });
						       }
						    });
						    layer.close(index);
						    }
						    	
						  }
					});
		    }
		                      	
    </script> 
<!-- 新增div -->
<div style="display:none;margin:15px;" id="updateStauts">
	<form class="layui-form" action="">
	  <div class="layui-form-item">
	    <label class="layui-form-label">纬度</label>
	    <div class="layui-input-block">
	      <input type="text" name="pname" id="pname" required  lay-verify="required" placeholder="请输入纬度参数数字即可" autocomplete="off" class="layui-input"><br>
	    </div>
	  </div>
	</form>	    
</div>  
<div style="display:none;margin:15px;" id="updateStauts2">
	<form class="layui-form" action="">
	  <div class="layui-form-item">
	    <label class="layui-form-label">经度</label>
	    <div class="layui-input-block">
	      <input type="text" name="uname" id="uname" required  lay-verify="required" placeholder="请输入经度参数数字即可" autocomplete="off" class="layui-input"><br>
	    </div>
	  </div>
	</form>	    
</div>   				
</body>
</html>