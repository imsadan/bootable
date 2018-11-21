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
           <button class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe654;</i><a href="/bootable/adddaycloths" style="color:#fff;">出库布料添加</a></button>
           <button class="layui-btn layui-btn-sm"><i class="layui-icon">&#x1002;</i><a href="/bootable/dayoutcloths" style="color:#fff;">强制刷新</a></button>                   
           <button class="layui-btn layui-btn-sm"  onclick="method5('example1')"><i class="layui-icon">&#xe63c;</i><a href="#" style="color:#fff;">导出布料</a></i></button> 
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
				 <div class="layui-form-item">				 
	             	<label class="layui-form-label" style="color:red;width:100px;">日期(可选)</label>
	             	<div class="layui-input-block" style="width:20%;">
					    <div class="layui-input-inline">
					      <input type="text" class="layui-input" id="days" placeholder="具体日期(几号)">
					    </div>	
				    </div>
				  </div>
		    </form>	
		    <br>
		    <p style="color:red;">点击对应序号单查看相应经纬布料增减幅<p>	      
		      <div class="box-body">
              <table id="example1" class="table table-bordered table-striped" style="table-layout:fixed;">            
                <thead>
                <tr>
                  <th>序号单</th>
                  <th>纬数</th>
                  <th>经数</th>
                  <th>对应布匹数量</th>
                  <th>记录日期</th>
                </tr>
                </thead>
                <tbody id="tbody" style="text-align:center;">        
                </tbody>
              </table>
              <div id="pagination3" class="page fl"></div>	 
              </div><br>
              <div id="clothsStatic">                
              </div>          
         </div> 
         <div id="addContain"> 
           <div id="container" style="width:auto; height: 350px;display:none;"></div>
         </div>         				
	 </div>	
	<script src="js/layui.js"></script>
    <script src="js/layer.js"></script>	
    <script type="text/javascript" src="js/highcharts.js"></script>			
    <script type="text/javascript">    
         var selectYear=null;
		 var selectMonth=null;
		 var selectDay=null;
		 var param=null;
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
	                       loadData();  
	                       $("#pagination3").removeClass("oddplay");		                  
 					});							
 									                    
			 }); 									
													 
	  }); 
	 

     var currPage=1;
	 //默认总页数
	 var totalPage=1;         							 
	 function loadData(temp){	
	   	  $("tr").remove("#tbody tr"); 
	   	  var param={
              years:selectYear,
              months:selectMonth,
              currentPage:currPage
		   }; 	                  
       $.ajax({
          type:'post',
          data:param,
          url:'/bootable/getDayoutcloths',
		  success:function(data){
		  	var res=eval(data);	  
		    var table="";  								     
		    for(var i=0;i<res.length;i++){
		        totalPage=res[i].totalPage;
                currPage=res[i].currPage;
                for(var j=0;j<res[i].lists.length;j++){
                  for(var k=j+1;k<res[i].lists.length;k++){
                     var day=res[i].lists[j].days.substring(res[i].lists[j].days.length-2);
                     var day_next=res[i].lists[k].days.substring(res[i].lists[k].days.length-2);
                     if(parseInt(day)>parseInt(day_next)){
                       var temp=res[i].lists[j];
                       res[i].lists[j]=res[i].lists[k];
                       res[i].lists[k]=temp;
                     }
                  }
                    table+="<tr>";	                
	                table+="<td onclick='LookStatic(this)'>"+res[i].lists[j].id+"</td>";
	                table+="<td>"+res[i].lists[j].wei+"</td>";
	                table+="<td>"+res[i].lists[j].jin+"</td>";
	                table+="<td>"+res[i].lists[j].numbers+"</td>";
	                table+="<td>"+res[i].lists[j].days+"</td>";	 			                            						                 
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
	  
	    layui.use('laydate', function(){
			  var laydate = layui.laydate;						  
			 //日
			 laydate.render({
			    elem: '#days',
			    done:function(value){		    		                               
                      var param={
			              years:selectYear,
			              months:selectMonth,
			              days:value
					   };
					   $("tr").remove("#tbody tr"); 
					   $.ajax({
					      type:'post',
				          data:param,
				          url:'/bootable/getDayoutclothsFindByDay',
				          success:function(da){
				             var tab="";
				             var result=JSON.parse(da);
				             for(var i=0;i<result.length;i++){
				                    tab+="<tr>";	                
					                tab+="<td onclick='LookStatic(this)'>"+result[i].id+"</td>";
					                tab+="<td>"+result[i].wei+"</td>";
					                tab+="<td>"+result[i].jin+"</td>";
					                tab+="<td>"+result[i].numbers+"</td>";
					                tab+="<td>"+result[i].days+"</td>";	 			                            						                 
					                tab+="</tr>";								    
						      }  
						      
						      $("#tbody").append(tab);
						      $("#pagination3").addClass("oddplay");
				         }
					 });
			      }
			  });			  
		});		 
		
		function LookStatic(temp){
		   var id=temp.innerText;
		   var xtext=[];  //x轴文本
		   var nametext=null;
		   var laytitle=null;
		   var seriesData=[];	  
		   $.ajax({
		      type:'post',
	          data:{id:id},
	          url:'/bootable/lookStaticOfDayByWei',
	          success:function(data){
	            var res=JSON.parse(data);
			    var table=""; 
			    var newtb=""; 	
			    nametext=res[0].jin;
			    laytitle=res[0].wei;
			    var title = {
				    text:nametext
				};
			    for(var i=0;i<res.length;i++){			    
                    xtext.push(res[i].days);
                    seriesData.push(res[i].numbers);				       
			    }		    			
			    chart.series[0].setData(seriesData);
			    chart.setTitle(title);
 			    var index=layer.open({
			          skin: 'layui-layer-molv',
			          title:[laytitle+'对应参数规格记录','font-size:18'], 
					  anim:1,
					  content:$('#container'),						  
					  zIndex:19950618,
					  area:['550px','450px'],
					  maxmin:true,
					  scrollbar:true,
					  btn:0,
					  cancel:function(){
					     newtb+="<div id='container' style='width:auto; height: 350px;display:none;''></div>";
					     $("#addContain").append(newtb);
					  }				  
				 });  
				 
				 layer.full(index);       
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
				                text:'数量/匹' 						
				            }						
				        },
				        series:[{
				           name:"支(规格)"
				        }]						
				  });	   

		   
		} 	
   </script>
 				
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