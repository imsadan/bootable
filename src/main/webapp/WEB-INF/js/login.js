		//表单渲染
		layui.use('form',function(){
	       var form=layui.form;
	    });
	    function renderForm(){
	        layui.use('form',function(){
	            var form=layui.form;
	            form.render();
	        });
	    }
			  
	  var redirectUrl = "${redirect}";      
	  var LOGIN = {
              doLogin:function() {
					$.post("/bootable/user/login", $("#formlogin").serialize(),function(data){
						if (data.status == 200) {
						    var html="<div class='layui-form'>";
						      html+="<div class='layui-form-item'>";
							    html+="<label class='layui-form-label'>验证手机</label>";
							    html+="<div class='layui-input-block'>";
							      html+="<select name='phone' lay-verify='required'>";
							        html+="<option value='1' selected>158***475</option>";
							      html+="</select>";
							    html+="</div>";
							  html+="</div>";
							  html+="<div class='layui-form-item'>";
							    html+="<label class='layui-form-label'>验证码</label>";
							    html+="<div class='layui-input-block'>";
							      html+="<input type='text' id='templeteNum' name='templeteNum' required  lay-verify='required' placeholder='请输入手机验证码' autocomplete='off' class='layui-input'>";
                                  html+="<br>";
                                  html+="<input type='button' class='layui-btn layui-btn-primary' onclick='sendMessage()' id='btnSendCode' value='点击发送验证码'></input>";						    
							    html+="</div>";
							  html+="</div>";
							html+="</div>";  	
							  layer.open({
							      skin: 'layui-layer-molv',
								  title: '短信验证',
								  area:['450px','300px'],
								  content: html,
								  anim: 2,
								  yes:function(){
									   $.ajax({
								           type:'post',
								           url:'/bootable/getSessionToken',
								           success:function(data){
                                               var str=JSON.parse(data);
                                               var input_num=$("#templeteNum").val();
                                               if(parseInt(str.TemplateParam)==parseInt(input_num)){
													location.href = "http://139.199.17.126/bootable/lay";
													str.TemplateParam=null;
                                               }else{
                                                   layer.msg('验证码错误', {icon: 2});
                                               }
								              
								           }
								       });
								  }
							  }); 
							renderForm();							  					   
						} else {
							alert("登录失败，原因是：" + data.msg);
							$("#loginname").select();
						}
					});
				},
				login:function() {			
						this.doLogin();
				}
			
		};
		$(function(){
			$("#loginsubmit").click(function(){
				LOGIN.login();
			});
		});
		
		
	   //验证码发送
	    var InterValObj; //timer变量，控制时间
		var count = 60; //间隔函数，1秒执行
		var curCount;//当前剩余秒数
		function sendMessage() {
		curCount = count;
		var dealType; //验证方式		
		//设置button效果，开始计时
			$("#btnSendCode").attr("disabled", "true");
			$("#btnSendCode").val( + curCount + "秒再获取");
			InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
		  //处理验证
			  $.ajax({
			      type:'post',
			      url:'/bootable/almessage/RecNum',
			      success:function(date){			      
			     },error:function(){
			        alert("接口错误!")
			     }
			});					
		}
		//timer处理函数
		function SetRemainTime() {
			if (curCount == 0) {                
				window.clearInterval(InterValObj);//停止计时器
				$("#btnSendCode").removeAttr("disabled");//启用按钮
				$("#btnSendCode").val("重新发送验证码"); 
			}
			else {
				curCount--;
				$("#btnSendCode").val( + curCount + "秒再获取");
			}
		}
		