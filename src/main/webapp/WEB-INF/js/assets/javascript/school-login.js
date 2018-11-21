$(function() {
	$('.school-login').bind('click',function () {
			  /*   ----- 点击事件 -----  */
                var username=$("#user-name").val();
                var passWord=$(".passWord").val();
                
                	$.ajax({
				url:'<%=basePath%>/student/addStudent',
				data:{
					"userName":username,
					"passWord":passWord,
				},
				dataType:'json',
				type:'post',
				success:function(data){
					if(data.length>0){
						alert("注册成功！进入登录界面");
						//var href = 'school-register.jsp';
			         //    location.href = href;
					}
					
				},
				error:function(err){
					alert("请求出错："+err);
				}
				});
            });
	
})