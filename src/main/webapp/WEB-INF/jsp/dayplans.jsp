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
         <div style="width:100%;height:500px;">
           <button class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe654;</i><a href="/bootable/adddayproducts" style="color:#fff;">每日账单添加</a></button>
           <button class="layui-btn layui-btn-sm"><i class="layui-icon">&#x1002;</i><a href="/bootable/dayplans" style="color:#fff;">强制刷新</a></button>           
           <button class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe63c;</i><a href="/bootable/showMonthStatisc" style="color:#fff;">查看月净利润统计图</a></button>
           <button class="layui-btn layui-btn-sm"  onclick="method5('example1')"><i class="layui-icon">&#xe63c;</i><a href="#" style="color:#fff;">导出账单</a></i></button>            
           <br> 
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
		      <div class="box-body">
              <table id="example1" class="table table-bordered table-striped" style="table-layout:fixed;">            
                <thead>
                <tr>
                  <th>序号单</th>
                  <th>进货重量</th>
                  <th>铁管个数(个)</th>
                  <th>铁管重量(KG)</th>
                  <th>经轴重量(净重KG)</th>
                  <th>记录日期</th>
                  <th>日核对(审核防错)</th>
                  <th>操作</th>
                </tr>
                </thead>
                <tbody id="tbody" style="text-align:center;">        
                </tbody>
              </table>
              <div id="pagination3" class="page fl"></div>	 
              </div><br>
              <button class="layui-btn layui-btn-sm"  onclick="method5('example2')"><i class="layui-icon">&#xe63c;</i><a href="#" style="color:#fff;">导出布料</a></i></button> 
              <div id="monthStatic">
                  <h4><b>月统计数据(日更新):</b></h4></p>
	              <table class="table table-bordered table-striped" style="table-layout:fixed;" id="example2">            
	                <thead>
	                <tr>
	                  <th>总进货重量</th>
	                  <th>总铁管数</th>
	                  <th>总铁管重量</th>
	                  <th>总经轴净重</th>
	                </tr>
	                </thead>
	                <tbody id="SumBody" style="text-align:center;">        
	                </tbody>
	              </table>                
              </div>          
         </div>       				
	 </div>
	<script src="js/layui.js"></script>
    <script src="js/layer.js"></script>			
    <script type="text/javascript">    
         var selectYear=null;
		 var selectMonth=null;
		//默认当前页
        //表单组件
			layui.use('form', function(){
			  var form = layui.form;	
			  layer.alert('请先选择年份!', {icon: 4});  
			  form.on('select(years)', function(data){
                     selectYear=data.value;     
                     layer.msg('请再次选择月份(该页面不统计年账单)', {icon: 7});   
					 form.on('select(months)', function(dat){					 
		                  selectMonth=dat.value;  
		                  		var currPage=1;
								//默认总页数
								var totalPage=1;         							 
						 function loadData(){	
						   	  $("tr").remove("#tbody tr"); 
						   var param={
	                               years:selectYear,
	                               months:selectMonth,
	                               currentPage:currPage
							  };   	                  
                              $.ajax({
			                      type:'post',
			                      data:param,
						          url:'/bootable/getDayplan',
								  success:function(data){
								    var res=eval(data);
								    var table="";  								     
								    for(var i=0;i<res.length;i++){
								        totalPage=res[i].totalPage;
				                        currPage=res[i].currPage;
				                      for(var j=0;j<res[i].lists.length;j++){
	                                        table+="<tr>";	                
							                table+="<td>"+res[i].lists[j].id+"</td>";
							                table+="<td>"+res[i].lists[j].intolnum+"</td>";
							                table+="<td>"+res[i].lists[j].sticksnum+"</td>";
							                table+="<td>"+res[i].lists[j].sticksweight+"</td>";
							                table+="<td>"+res[i].lists[j].beam+"</td>";
							                table+="<td>"+res[i].lists[j].days+"</td>";
	 			                            if(res[i].lists[j].stauts==0){
				                              table+="<td><button class='layui-btn layui-btn-small layui-btn-danger' onclick='update_stauts(this)' id='"+res[i].lists[j].id+"'>未审核</button></td>";
				                            }else{
				                              table+="<td><button class='layui-btn layui-btn-small' onclick='update_stauts(this)' id='"+res[i].lists[j].id+"'>已审核</button></td>";
				                            }							                
							                table+="<td><button class='layui-btn layui-btn-danger' onclick='click_update(this)' id='"+res[i].lists[j].id+"'><i class='layui-icon'>&#xe640;</i>修改</button></td>";
							                table+="</tr>";								    
								      }  
									}    
									    $("#tbody").append(table);
									    if(data!=null){
									      $("#tbody .odd").addClass("oddplay");
									    }
									    $("#pagination3").pagination({
										  currentPage: currPage, //第几页
										  totalPage: totalPage,//总页数
										  count: 2, //页码个数
										  callback:function(current){
										     currPage=current;
										     loadData();
										  
										  }
									});
								    
								  }                          
	                          });
	                       } 
	                       
	                       loadData();  
	                       
	                     //月总统计数据  
	                        var param={
	                               years:selectYear,
	                               months:selectMonth
							}; 
						   
	                       $.ajax({
	                          type:'post',
			                  data:param,
						      url:'/bootable/showMonthStatiscPlan',
						      success:function(json){
						         $("#SumBody").empty(); 
						         var tab="";
						         var s=JSON.parse(json);
						         var lastIntolnum=0;
								 var lastSticksnum=0;
								 var lastSticksWeight=0;
								 var lastBeam=0;
						         for(var j=0;j<s.length;j++){
						             lastIntolnum+=s[j].intolnum;
						             lastSticksnum+=s[j].sticksnum;
						             lastSticksWeight+=s[j].sticksweight;
						             lastBeam+=s[j].beam;
						         }
						         tab+="<tr>";
						         tab+="<td style='color:red;'>"+lastIntolnum+"千克</td>";
						         tab+="<td style='color:red;'>"+lastSticksnum+"个</td>";
						         tab+="<td style='color:red;'>"+lastSticksWeight+"千克</td>";
						         tab+="<td style='color:red;'>"+lastBeam+"千克</td>";
						         tab+="</tr>";
						         
						         $("#SumBody").append(tab);
						         var yearparam={
	                               years:selectYear,
	                               months:selectMonth,
	                               sumweight:lastIntolnum
							     };
						         $.ajax({
						            type:'post',
					                data:yearparam,
								    url:'/bootable/addYeartotal',
								    success:function(data){}
						         
						         });
						      }
	                     });		                  
 					});							
 									                    
			 }); 									
													 
	  });
   			  			  
			  	  //更新状态
				  function update_stauts(temp){
				     var id=temp.id;
				     layer.open({
				          skin: 'layui-layer-molv',
				          title:['审核日记录','font-size:18'],
						  type:1, 
						  anim:1,
						  content:$('#updateStauts'),						  
						  btn:['更新','取消'],
						  zIndex:19950618,
						  area:['450px','300px'],
						  maxmin:true,
						  scrollbar:true,
						  yes:function(index){
						    var stauts=$('#updateid').val()
						    if(stauts==""){
						       layer.msg('请选择状态！',{icon:3,zIndex:19960618});
						    }else{
						       var user={
								id:id,
								stauts:$('#updateid').val()
							};
						    $.ajax({
						       type:'post',
			                   url:'/bootable/dayplan/updateStauts',
			                   data:user,
						       success:function(data){
						          layer.alert('修改成功!', {
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
				  
				  
				  //修改（出错后操作）
				  function click_update(temp){
				      var id=temp.id;
				      //先判断状态是否允许修改
				      $.ajax({
				         type:'post',
			             url:'/bootable/isStauts',
			             data:{id:id},
			             success:function(data){
			                if(data==1){
			                  layer.msg('已经审核完成，请不要更改！',{icon:2,zIndex:19960618});
			                }else{
			                  layer.open({
						          skin: 'layui-layer-molv',
						          title:['修改错误','font-size:18'],
								  type:1, 
								  anim:1,
								  content:$('#updateItem'),						  
								  btn:['修改','取消'],
								  zIndex:19950618,
								  area:['550px','400px'],
								  maxmin:true,
								  scrollbar:true,
								  yes:function(index){
								     var IntolNum=$("#IntolNum").val();
								     var sticksNum=$("#sticksNum").val();
								     var sticksWeight=$("#sticksWeight").val();
								     var Beam=$("#Beam").val();
								     if(IntolNum==null||sticksNum==null||sticksWeight==null||Beam==null){
								        layer.msg('选项不能为空',{icon:3,zIndex:19960618});
								     }else{
								        var ur={
								             id:id,
								             intolnum:IntolNum,
										     sticksnum:sticksNum,
										     sticksweight:sticksWeight,
										     beam:Beam
								        };
								        $.ajax({
									       type:'post',
						                   url:'/bootable/updataErrorItem',
						                   data:ur,
						                   success:function(data){
						                       layer.alert('修改成功!', {
										          zIndex:19960618,
										          skin: 'layui-layer-molv'
										       },function(index){
										           layer.close(index);	
										       });		
										       layer.closeAll('loading');
						                   },error:function(data){
									          layer.alert('出错!请联系管理员', {
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
			             }			             
				      });
				  }				  	
		</script>
<!-- 更新模块 -->	
<div style="display:none;margin:15px;" id="updateStauts">
	<form class="layui-form" action="">
	  <div class="layui-form-item">
	    <label class="layui-form-label">状态</label>
	    <div class="layui-input-block">
			<select name="stauts" lay-verify="" id="updateid">
			  <option value="">确认是否已审核正确？</option>
			  <option value="1">1.审核成功</option>
			  <option value="0">2.有误不审核</option>
			</select>
	    </div>
	  </div>
	</form>	    
</div>
<!--修改模块 -->	
<div style="display:none;margin:15px;" id="updateItem">
	<form class="layui-form" action="">
	  <div class="layui-form-item">
	    <label class="layui-form-label">进库</label>
	    <div class="layui-input-block">
	      <input type="text" name="intolnum" id="IntolNum" required  lay-verify="required" placeholder="请输入当天账单号的进库重量(KG)" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">铁管</label>
	    <div class="layui-input-block">
	      <input type="text" name="sticksnum" id="sticksNum" required  lay-verify="required" placeholder="请输入铁管数量(个)" autocomplete="off" class="layui-input"><br>
	      <input type="text" name="sticksweight" id="sticksWeight" required  lay-verify="required" placeholder="请输入铁管重量(KG)" autocomplete="off" class="layui-input">
	    </div>
	  </div>				  
	  <div class="layui-form-item" id="upaddBeams">
	    <label class="layui-form-label">经轴</label>	 
	    <div class="layui-input-block">
	      <input type="text" name="beam" id="Beam" required  lay-verify="required" placeholder="请输入净重(KG)" autocomplete="off" class="layui-input">		    
	    </div>		    				    		      
	  </div>	  
	</form>	    
</div> 				
</body>
<script>
        var idTmr;  
        function  getExplorer() {  
            var explorer = window.navigator.userAgent ;  
            //ie  
            if (explorer.indexOf("MSIE") >= 0) {  
                return 'ie';  
            }  
            //firefox  
            else if (explorer.indexOf("Firefox") >= 0) {  
                return 'Firefox';  
            }  
            //Chrome  
            else if(explorer.indexOf("Chrome") >= 0){  
                return 'Chrome';  
            }  
            //Opera  
            else if(explorer.indexOf("Opera") >= 0){  
                return 'Opera';  
            }  
            //Safari  
            else if(explorer.indexOf("Safari") >= 0){  
                return 'Safari';  
            }  
        }  
        function method5(tableid) {  
            if(getExplorer()=='ie')  
            {  
                var curTbl = document.getElementById(tableid);  
                var oXL = new ActiveXObject("Excel.Application");  
                var oWB = oXL.Workbooks.Add();  
                var xlsheet = oWB.Worksheets(1);  
                var sel = document.body.createTextRange();  
                sel.moveToElementText(curTbl);  
                sel.select();  
                sel.execCommand("Copy");  
                xlsheet.Paste();  
                oXL.Visible = true;  

                try {  
                    var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");  
                } catch (e) {  
                    print("Nested catch caught " + e);  
                } finally {  
                    oWB.SaveAs(fname);  
                    oWB.Close(savechanges = false);  
                    oXL.Quit();  
                    oXL = null;  
                    idTmr = window.setInterval("Cleanup();", 1);  
                }  

            }  
            else  
            {  
                tableToExcel(tableid)  
            }  
        }  
        function Cleanup() {  
            window.clearInterval(idTmr);  
            CollectGarbage();  
        }  
        var tableToExcel = (function() {  
            var uri = 'data:application/vnd.ms-excel;base64,',  
                    template = '<html><head><meta charset="UTF-8"></head><body><table>{table}</table></body></html>',  
                    base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },  
                    format = function(s, c) {  
                        return s.replace(/{(\w+)}/g,  
                                function(m, p) { return c[p]; }) }  
            return function(table, name) {  
                if (!table.nodeType) table = document.getElementById(table)  
                var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}  
                window.location.href = uri + base64(format(template, ctx))  
            }  
        })()  
</script>
</html>