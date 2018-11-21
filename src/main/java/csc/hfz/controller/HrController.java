package csc.hfz.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

import csc.hfz.common.JsonUtils;
import csc.hfz.common.commonReturn;
import csc.hfz.pojo.Daycloths;
import csc.hfz.pojo.Dayplans;
import csc.hfz.pojo.Profit;
import csc.hfz.pojo.Profitstatic;
import csc.hfz.pojo.Yeartotal;
import csc.hfz.service.HrService;

@Controller
public class HrController {
    
	@Autowired
	private HrService hrService;
	
	
	@RequestMapping("/dayplan/updateStauts")
	@ResponseBody
	public commonReturn updateAlldayPlansList(long id, int stauts){
		hrService.updateByContentId(id, stauts);
		return commonReturn.ok();
	}
	
	@RequestMapping(value="/getDayplan",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getPageNews(@RequestParam(value="currentPage",defaultValue="1",required=false)
    Integer currentPage,String years,String months){
		Page<Dayplans> page=hrService.findByPage(currentPage, years, months);
		List<Page<Dayplans>> list=new ArrayList<>();
		list.add(page);
		String s=JsonUtils.objectToJson(list);
		return s;
		
	}
	
	@RequestMapping("/upDayplan")
	@ResponseBody
	public commonReturn addDayplans(Dayplans dayplans){
		hrService.addDayplans(dayplans);
		return commonReturn.ok();
	}
	
	//统计图信息
	@RequestMapping("/showMonthStatiscPlan")
	@ResponseBody
	public String showMonthStatisc(String years,String months){
		List<Dayplans> list=hrService.showMonthStatisc(years, months);
		String string=JsonUtils.objectToJson(list);
		return string;
	}
	
	//返回状态值
	@RequestMapping("/isStauts")
	@ResponseBody
	public String returnId(@RequestParam Long id){
		int stautsId=hrService.JudgeIsStauts(id);
		String str=JsonUtils.objectToJson(stautsId);
		return str;
	}
	
	//修改错误（更新）
	@RequestMapping("/updataErrorItem")
	@ResponseBody
	public commonReturn editErrorItem(@RequestParam Long id,Dayplans dayplans){
		hrService.editErrorItem(id, dayplans);
		return commonReturn.ok();
	}
	
	//获取经纬度参数1
	@RequestMapping(value="/getWeiNumList",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getAllWeiNum(){
        return JsonUtils.objectToJson(hrService.getAllWeiNum());
    }
	
	
	//获取经纬度参数2
	@RequestMapping(value="/getJinNumList",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getAllJinNum(){
        return JsonUtils.objectToJson(hrService.getAllJinNum());
    }
	
	//添加每日布料信息
	@RequestMapping("/upDaycloths")
	@ResponseBody
	public commonReturn addDayCloths(Daycloths daycloths){
		hrService.addDaycloths(daycloths);
		return commonReturn.ok();
	}
	
	//分页获取月布料
	@RequestMapping(value="/getDayoutcloths",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getPageCloths(@RequestParam(value="currentPage",defaultValue="1",required=false)
    Integer currentPage,String years,String months){
		Page<Daycloths> page=hrService.findclothsByPage(currentPage, years, months);
		List<Page<Daycloths>> list=new ArrayList<>();
		list.add(page);
		String s=JsonUtils.objectToJson(list);
		return s;
		
	}
	
	//按年月日过滤获取每日的布料账单
	@RequestMapping(value="/getDayoutclothsFindByDay",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getClothByDays(String years,String months,String days){
		return JsonUtils.objectToJson(hrService.getClothsByDays(years, months, days));
	}
	
	//纬数参数做统计折线数据
	@RequestMapping(value="/lookStaticOfDayByWei",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String LookStaticOfDayByWei(Long id){
		List<Daycloths> list=hrService.LookStaticOfDayByWei(id);
		return JsonUtils.objectToJson(list);
		
	}
	
	/*
	 * 单价部分 
	 **/
	
	@RequestMapping("/list/getprofit")
	@ResponseBody
	public Map<String, Object> getAllList(int pageSize,int pageNumber){
		Map<String, Object> param=new HashMap<String, Object>();
		int a=(pageNumber-1)*pageSize;
        int b=pageSize;
        param.put("a", a);
        param.put("b", b);
        return hrService.getallList(param);
	}
	
	//利润单价添加
	@RequestMapping("/updatePrice")
	@ResponseBody
	public commonReturn updateOrAddprice(Profit profit){
		hrService.addOrUpdatePrice(profit);
		return commonReturn.ok();
	}
	
	
	//经纬参数统计价格趋势
	@RequestMapping(value="/lookStaticOfPrice",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String LookStaticOfPrice(String pname,String uname){
		List<Profitstatic> list=hrService.LookStaticOfPrice(pname, uname);
		return JsonUtils.objectToJson(list);
		
	}
	
	//经纬度添加
	@RequestMapping("/parameter/addWei")
	@ResponseBody
	public commonReturn addWei(String pname){
		hrService.addWei(pname);
		return commonReturn.ok();
	}
	
	@RequestMapping("/parameter/addJin")
	@ResponseBody
	public commonReturn addJin(String uname){
		hrService.addJin(uname);
		return commonReturn.ok();
	}	
	
	@RequestMapping("/addYeartotal")
	@ResponseBody
	public commonReturn addYearTotal(Yeartotal yeartotal){
		hrService.addYearstotal(yeartotal);
		return commonReturn.ok();
	}
	
	@RequestMapping("/showYearStatic")
	@ResponseBody
	public String showYearsTotal(String years){
		List<Yeartotal> list=hrService.showYeartotals(years);
		String result=JsonUtils.objectToJson(list);
		return result;
	}
	
	//登录用户
	@RequestMapping(value="/user/login",method=RequestMethod.POST)
	@ResponseBody
	public commonReturn userLogin(String name,String password,HttpSession httpSession){
		try {
			commonReturn result=hrService.userLogin(name, password, httpSession);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return commonReturn.build(500,e.getMessage());
		}
	}	
	
	//注销
	@RequestMapping("/logout")
	public String loginOut(HttpSession httpSession){
		hrService.loginOut(httpSession);
		return "redirect:/login";
	}
	
	@RequestMapping(value="/almessage/RecNum",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String sendMessage(HttpSession session) throws ClientException{
		Random random = new Random();  
		String result="";   //6位随机数${code}  ===>>>>{"code":"随机数"}
		for (int i=0;i<6;i++)  
		{  
		    result+=random.nextInt(10);  
		}  
		session.setAttribute("RandNumber", result);
				
		//设置超时时间-可自行调整
		System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
		System.setProperty("sun.net.client.defaultReadTimeout", "10000");
		//初始化ascClient需要的几个参数
		final String product = "Dysmsapi";//短信API产品名称（短信产品名固定，无需修改）
		final String domain = "dysmsapi.aliyuncs.com";//短信API产品域名（接口地址固定，无需修改）
		//替换成你的AK
		final String accessKeyId = "LTAIlBrMXX8eGk1t";
		final String accessKeySecret = "w7t2hH3nnKavOOw72XkpQ61g9IdDz6";
		IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou",accessKeyId,accessKeySecret);
		DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
		IAcsClient acsClient = new DefaultAcsClient(profile);
		 //组装请求对象
		 SendSmsRequest request = new SendSmsRequest();
		 request.setMethod(MethodType.POST);		 
		 request.setPhoneNumbers("15824338475");
		 //短信签名
		 request.setSignName("物料hfzhang");
		 //短信模板
		 request.setTemplateCode("SMS_120365446");		
		 request.setTemplateParam("{'code':'"+result+"'}");
		//请求失败这里会抛ClientException异常
		SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
		if(sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
		//请求成功
			 return JsonUtils.objectToJson(sendSmsResponse.getMessage());
		}
		return JsonUtils.objectToJson(sendSmsResponse.getMessage());		
	} 
	
	@RequestMapping("/getSessionToken")
	public @ResponseBody String getSessionToken(HttpSession session){
		String TemplateParam=(String) session.getAttribute("RandNumber");
/*		String phoneNumber=(String) session.getAttribute("OwnPhone");*/
		HashMap<String, String> map=new HashMap<>();
		map.put("TemplateParam", TemplateParam);
/*		map.put("phoneNumber", phoneNumber);*/
		String str=JsonUtils.objectToJson(map);
		session.removeAttribute("RandNumber");
		return str;
	}
	
}