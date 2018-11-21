$(function() {
	var username=$("#user-name").val();
	 $('.school-register1').bind('click',function () {
			  /*   ----- 点击事件 -----  */
              var username=$("#user-name").val();
              var passWord=$(".passWord").val();
              var passWord1=$(".passWord1").val();
              var studentName=$(".student-name").val();
              var studentNumber=$(".student-number").val();
              var classId=$("#class-number").val();
              var schoolName=$("#school-number").val();
              
              var schoolTermYear=$("#school-term-year").val();
              var schoolTermMonth=$("#school-term-month").val();
              var schoolTermDay=$("#school-term-day").val();
              
              var sex=$(".sex").val();
              
              var birthTermYear=$("#birth-term-year").val();
              var birthTermMonth=$("#birth-term-month").val();
              var birthTermDay=$("#birth-term-day").val();
              
              var idCard=$(".idCard").val();
              var mobil=$(".mobil").val();
              var qq=$(".qq").val();
              var email=$(".email").val();
              var address=$(".address").val();
              
//            alert(username+':'+passWord+':'+
//            passWord1+':'+studentName+':'+studentNumber+':'+classId+':'+schoolName+':'+
//            schoolTermYear+'-'+schoolTermMonth+'-'+schoolTermDay+':'+
//            sex+':'+birthTermYear+'-'+birthTermMonth+'-'+birthTermDay+':'+
//            idCard+':'+mobil+':'+qq+':'+email+':'+address
//            );
              if(passWord===passWord1){
              	$.ajax({
				url:'../student/addStudent',
				data:{
					"username":username,
					"password":passWord,
					"name":studentName,
					"studentNumber":studentNumber,
					"classId":classId,
					"schoolId":schoolName,
					"studentenrollment":schoolTermYear+'-'+schoolTermMonth+'-'+schoolTermDay,
					"gender":sex,
					"studentbirth":birthTermYear+'-'+birthTermMonth+'-'+birthTermDay,
					"idCard":idCard,
					"mobile":mobil,
					"qq":qq,
					"email":email,
					"address":address
				},
				dataType:'json',
				type:'post',
				success:function(data){
					if(data.length>0){
						alert("注册成功！进入登录界面");
						var href = 'school-login.jsp';
			             location.href = href;
					}
					
				},
				error:function(err){
					alert("请求出错："+err);
				}
				});
              	
              	
              	
              	
              }else{
              	alert("请重新确定密码！")
              }
          });
	
})