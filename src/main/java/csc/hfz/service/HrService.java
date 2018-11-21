package csc.hfz.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import csc.hfz.common.commonReturn;
import csc.hfz.controller.Page;
import csc.hfz.pojo.Daycloths;
import csc.hfz.pojo.Dayplans;
import csc.hfz.pojo.Jinnum;
import csc.hfz.pojo.Profit;
import csc.hfz.pojo.Profitstatic;
import csc.hfz.pojo.Weinum;
import csc.hfz.pojo.Yeartotal;

public interface HrService {
    
	//获取日记录信息（年，月限制）
	List<Dayplans> showMonthStatisc(String years,String months);
	//更新审核状态
	public commonReturn updateByContentId(long id,int stauts);
	
	//分页
	public Page<Dayplans> findByPage(int currentPage,String years,String months);
	
	//添加每日的账单
	public commonReturn addDayplans(Dayplans dayplans);
	//判断审核状态
	public int JudgeIsStauts(long id);
	
	//修改错误
	public commonReturn editErrorItem(long id,Dayplans dayplans);
	
	//获取经纬参数
	public List<Weinum> getAllWeiNum();
	
	//经度参数
	public List<Jinnum> getAllJinNum();
	
	//添加每日的布料数
	public commonReturn addDaycloths(Daycloths daycloths);
	
	//获取每月的日布料
	public Page<Daycloths> findclothsByPage(int currentPage,String years,String months);
	
	//按日期插每日布料信息
	public List<Daycloths> getClothsByDays(String years,String months,String days);
	
	//查看每个月以纬数为参数的变化数据
	public List<Daycloths> LookStaticOfDayByWei(long id);
	
	//单价变化分页统计
	public Map<String, Object> getallList(Map<String,Object> param);
	
	//修改或添加
	public commonReturn addOrUpdatePrice(Profit profit);
	
	//经纬参数统计价格
	public List<Profitstatic> LookStaticOfPrice(String pname,String uname);
	
	//经纬度参数新增
	public commonReturn addWei(String pname);
	public commonReturn addJin(String uname);
	
	//年统计数据添加
	public commonReturn addYearstotal(Yeartotal yeartotal);
	
	//年统计数据图
	public List<Yeartotal> showYeartotals(String years);
	
	//登录
	public commonReturn userLogin(String name,String password,HttpSession httpSession);
	
	//注销
	commonReturn loginOut(HttpSession httpSession);
}
