package csc.hfz.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import csc.hfz.common.IDUtils;
import csc.hfz.common.commonReturn;
import csc.hfz.controller.Page;
import csc.hfz.mapper.DayclothsMapper;
import csc.hfz.mapper.DayplansMapper;
import csc.hfz.mapper.JinnumMapper;
import csc.hfz.mapper.ProfitMapper;
import csc.hfz.mapper.ProfitstaticMapper;
import csc.hfz.mapper.UserListMapper;
import csc.hfz.mapper.WeinumMapper;
import csc.hfz.mapper.YeartotalMapper;
import csc.hfz.pojo.Daycloths;
import csc.hfz.pojo.Dayplans;
import csc.hfz.pojo.Jinnum;
import csc.hfz.pojo.Profit;
import csc.hfz.pojo.Profitstatic;
import csc.hfz.pojo.UserList;
import csc.hfz.pojo.UserListExample;
import csc.hfz.pojo.UserListExample.Criteria;
import csc.hfz.pojo.Weinum;
import csc.hfz.pojo.Yeartotal;

@Service
public class HrServiceImpl implements HrService {

	@Autowired
	private DayplansMapper dayplansMapper;
	
	@Autowired
	private JinnumMapper jinnumMapper;
	
	@Autowired
	private WeinumMapper weinumMapper;
	
	@Autowired
	private DayclothsMapper dayclothsMapper;
	
	@Autowired
	private ProfitMapper profitMapper;
	
	@Autowired
	private ProfitstaticMapper profitstaticMapper;
	
	@Autowired
	private YeartotalMapper yeartotalMapper;
	
	@Autowired
	private UserListMapper userListMapper;

	
	@Override
	public List<Dayplans> showMonthStatisc(String years, String months) {
		return dayplansMapper.selectAllLimitByYearAndMonth(years, months);
	}

	@Override
	public commonReturn updateByContentId(long id, int stauts) {
		Dayplans dayplans=dayplansMapper.selectByPrimaryKey(id);
		dayplans.setStauts(stauts);
		dayplansMapper.updateStautsById(dayplans);
		return commonReturn.ok();
	}

	@Override
	public Page<Dayplans> findByPage(int currentPage, String years,
			String months) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		Page<Dayplans> pages=new Page<>();
		//当前页面
		pages.setCurrPage(currentPage);
		//显示数据
		int pageSize=15;
		pages.setPageSize(pageSize);
		//总数
		int totalCount=dayplansMapper.selectCount(years,months);
		pages.setTotalCount(totalCount);
		//总页数
		double tc=totalCount;
		Double number=Math.ceil(tc/pageSize);
		pages.setTotalPage(number.intValue());
		
		map.put("Year", years);
		map.put("Month", months);
		map.put("start",(currentPage-1)*pageSize);
		map.put("size",pages.getPageSize());
		//每页显示数据
		List<Dayplans> list=dayplansMapper.findByPage(map);
		pages.setLists(list);
		return pages;
	}

	@Override
	public commonReturn addDayplans(Dayplans dayplans) {
		Dayplans d=new Dayplans();
		//随机id号
		long id=IDUtils.genItemId();
		//默认未审核
		int stauts=0;
		d.setYears(dayplans.getYears());
		d.setMonths(dayplans.getMonths());
		d.setDays(dayplans.getDays());
		d.setId(id);
		d.setIntolnum(dayplans.getIntolnum());
		d.setSticksnum(dayplans.getSticksnum());
		d.setSticksweight(dayplans.getSticksweight());
		d.setBeam(dayplans.getBeam());
		d.setStauts(stauts);
		dayplansMapper.insert(d);
		return commonReturn.ok();
	}

	@Override
	public int JudgeIsStauts(long id) {
		Dayplans dayplans=dayplansMapper.selectByPrimaryKey(id);
		int returnId=dayplans.getStauts();
		return returnId;
	}

	@Override
	public commonReturn editErrorItem(long id,Dayplans dayplans) {
		Dayplans dayp=dayplansMapper.selectByPrimaryKey(id);
		dayp.setIntolnum(dayplans.getIntolnum());
		dayp.setSticksnum(dayplans.getSticksnum());
		dayp.setSticksweight(dayplans.getSticksweight());
		dayp.setBeam(dayplans.getBeam());
		dayplansMapper.updateByPrimaryKey(dayp);
		return commonReturn.ok();
	}

	@Override
	public List<Weinum> getAllWeiNum() {
		return weinumMapper.getAllWeinums();
	}

	@Override
	public List<Jinnum> getAllJinNum() {
		return jinnumMapper.getAllJinnums();
	}

	@Override
	public commonReturn addDaycloths(Daycloths daycloths) {
		Daycloths cloths=new Daycloths();
		cloths.setId(IDUtils.genItemId());
		cloths.setWei(daycloths.getWei());
		cloths.setJin(daycloths.getJin());
		cloths.setNumbers(daycloths.getNumbers());
		cloths.setYears(daycloths.getYears());
		cloths.setMonths(daycloths.getMonths());
		cloths.setDays(daycloths.getDays());
		dayclothsMapper.insert(cloths);
		return commonReturn.ok();
	}

	@Override
	public Page<Daycloths> findclothsByPage(int currentPage, String years,
			String months) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		Page<Daycloths> pages=new Page<>();
		//当前页面
		pages.setCurrPage(currentPage);
		//显示数据
		int pageSize=15;
		pages.setPageSize(pageSize);
		//总数
		int totalCount=dayclothsMapper.selectCount(years,months);
		pages.setTotalCount(totalCount);
		//总页数
		double tc=totalCount;
		Double number=Math.ceil(tc/pageSize);
		pages.setTotalPage(number.intValue());
		
		map.put("Year", years);
		map.put("Month", months);
		map.put("start",(currentPage-1)*pageSize);
		map.put("size",pages.getPageSize());
		//每页显示数据
		List<Daycloths> list=dayclothsMapper.findclothsByPage(map);
		pages.setLists(list);
		return pages;
	}

	@Override
	public List<Daycloths> getClothsByDays(String years, String months,
			String days) {
		
		return dayclothsMapper.getClothsByDays(years, months, days);
	}

	@Override
	public List<Daycloths> LookStaticOfDayByWei(long id) {
		Daycloths daycloths=dayclothsMapper.selectByPrimaryKey(id);
		String wei=daycloths.getWei();
		String jin=daycloths.getJin();
		String years=daycloths.getYears();
		String months=daycloths.getMonths();
		return dayclothsMapper.LookStaticOfDayByWei(years, months, wei, jin);
	}

	@Override
	public Map<String, Object> getallList(Map<String, Object> param) {		
		Map<String,Object> result = new HashMap<String,Object>();
		int total=profitMapper.getallList(null).size();
		List<Profit> rows=profitMapper.getallList(param);
		result.put("total",total);
        result.put("rows",rows);
        return result;
	}

	@Override
	public commonReturn addOrUpdatePrice(Profit profit) {	
		//记录保存static表做报表
		Profitstatic profitstatic=new Profitstatic();
		//统计表
		profitstatic.setId(IDUtils.genItemId());
		profitstatic.setPrice(profit.getPrice());
		profitstatic.setTimes(profit.getUpdatetime());
		profitstatic.setPname(profit.getPname());
		profitstatic.setUname(profit.getUname());
		profitstaticMapper.insert(profitstatic);
		//判断是否存在
		Profit p=profitMapper.isHaveByPUname(profit.getPname(), profit.getUname());
		if (p!=null) {
			//存在做更新
			p.setPrice(profit.getPrice());
			p.setUpdatetime(profit.getUpdatetime());
			profitMapper.updateByPrimaryKey(p);
		}else{
			Profit pro=new Profit();
			//单价记录表数据
			pro.setId(IDUtils.genItemId());
			pro.setPrice(profit.getPrice());
			pro.setUpdatetime(profit.getUpdatetime());
			//纬，经
			pro.setPname(profit.getPname());
			pro.setUname(profit.getUname());
			profitMapper.insert(pro);
		}
		return commonReturn.ok();
	}

	@Override
	public List<Profitstatic> LookStaticOfPrice(String pname, String uname) {		
		return profitstaticMapper.LookStaticOfPrice(pname, uname);
	}

	@Override
	public commonReturn addWei(String pname) {
		long id=IDUtils.genItemId();
		Weinum weinum=new Weinum();
		weinum.setPid(id);
		weinum.setPname(pname+"纬");
		weinumMapper.insert(weinum);
		return commonReturn.ok();
	}

	@Override
	public commonReturn addJin(String uname) {
		long id=IDUtils.genItemId();
		Jinnum jinnum=new Jinnum();
		jinnum.setUid(id);
		jinnum.setUname(uname+"支");
		jinnumMapper.insert(jinnum);
		return commonReturn.ok();
	}

	@Override
	public commonReturn addYearstotal(Yeartotal yeartotal) {
		//判断是否已经存在年月分账单数据字段
		Yeartotal total=yeartotalMapper.isHaveOfmonths(
				 yeartotal.getYears(),yeartotal.getMonths());
		if (total!=null){
			//存在，做更新
			total.setSumweight(yeartotal.getSumweight());
			yeartotalMapper.updateByPrimaryKey(total);
		}else {
			Yeartotal years=new Yeartotal();
			years.setId(IDUtils.genItemId());
			years.setYears(yeartotal.getYears());
			years.setMonths(yeartotal.getMonths());
			years.setSumweight(yeartotal.getSumweight());
			yeartotalMapper.insert(years);
		}
		return commonReturn.ok();
	}

	@Override
	public List<Yeartotal> showYeartotals(String years) {
		List<Yeartotal> list=yeartotalMapper.showYeartotals(years);
		return list;
	}
	
	@Override
	public commonReturn userLogin(String name, String password,HttpSession httpSession) {
		UserListExample example=new UserListExample();
		Criteria criteria=example.createCriteria();
		criteria.andUsernameEqualTo(name);
		List<UserList> list=userListMapper.selectByExample(example);
		if (list.size()==0||list==null) {
			return commonReturn.build(400,"用户名或密码错误");
		}
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
		Date date=new java.util.Date();   
		UserList user=list.get(0);
		user.setLogined(sdf.format(date));
		userListMapper.updateByPrimaryKey(user);
		//对比密码
		if (!DigestUtils.md5DigestAsHex(password.getBytes()).equals(user.getPassword())) {
			return commonReturn.build(400,"用户名或密码错误");
		}
		
		httpSession.setAttribute("userLogin",user);
		return commonReturn.ok();
	}
	
	@Override
	public commonReturn loginOut(HttpSession httpSession) {
		httpSession.removeAttribute("userLogin");
		return commonReturn.ok();
	}	

}
