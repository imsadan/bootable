<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>		
		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
		<link rel="stylesheet" href="css/bootstrap-table.css"/>		
		<script src="js/bootstrap.min.js"></script>	
		<script src="js/bootstrap-table.js"></script>
		<script src="js/bootstrap-table-export.js"></script>	
		<script src="js/tableExport.js"></script>		
		<script src="js/bootstrap-table-zh-CN.js"></script>
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
	    <h2><p>现各规格利润单价：</p></h2>
        <table id="table"></table> 	
       </div> 
	 </div>	
	<script src="js/layui.js"></script>
    <script src="js/layer.js"></script>			
    <script type="text/javascript">
	$('#table').bootstrapTable({
	    url:"/bootable/list/getprofit",//请求数据url
	    toolbar: '#toolbar',                //工具按钮用哪个容器
	            striped: true,                      //是否显示行间隔色
	            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	            pagination: true,                   //是否显示分页（*）
	            sortable: false,                     //是否启用排序
	            sortOrder: "asc",                   //排序方式
	            queryParamsType:'', 
	            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
	            pageNumber:1,                       //初始化加载第一页，默认第一页
	            pageSize: 4,                       //每页的记录行数（*）
	            pageList: [5, 10, 25, 100],        //可供选择的每页的行数（*）                    
	            strictSearch: true,
	            showColumns: true,                  //是否显示所有的列
	            showRefresh: true,                  //是否显示刷新按钮
	            minimumCountColumns: 2,             //最少允许的列数
	            clickToSelect: true,                //是否启用点击选中行
	            height: 300,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	            uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
	            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
	            cardView: false,                    //是否显示详细视图
	            detailView: false, 
	            showExport: true,                     //是否显示导出
	            exportDataType: "basic",              
	            columns: [{
	                checkbox: true
	            }, {
	                field: 'id',
	                title: '序号'
	            }, {
	                field: 'price',
	                title: '价格(元)'
	            }, {
	                field: 'updatetime',
	                title: '价格变动时间'
	            }, {
	                field: 'pname',
	                title: '纬数'
	            }, {
	                field: 'uname',
	                title: '经数'
	            }] 
	});
	</script>
 				
</body>
</html>