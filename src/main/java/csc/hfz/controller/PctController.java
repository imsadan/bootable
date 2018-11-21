package csc.hfz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import csc.hfz.common.JsonUtils;
import csc.hfz.pojo.City;
import csc.hfz.pojo.Province;
import csc.hfz.pojo.Town;
import csc.hfz.service.PctService;

@Controller
public class PctController {
	 
	@Autowired
	private PctService pctService;

	
	//加载页面
	@RequestMapping("/pct")
	public String page(){
		return "ld";
	}
	
	//获取所有的省信息，动态加载到option中去
	@RequestMapping(value="/getProvinceList",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getAllProvince(){
		List<Province> provinceList=pctService.queryProvince();
		String str=JsonUtils.objectToJson(provinceList);
		return str;
	}
	
	//获取所有的城市信息
	@RequestMapping(value="/getAllCity",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getAllCity(@RequestParam Integer pid){
		List<City> cityList=pctService.queryCity(pid);
		String str=JsonUtils.objectToJson(cityList);
		return str;
	}
	
	//获取所有的乡镇信息
	@RequestMapping(value="/getAlltown",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getAlltown(@RequestParam Integer cid){
		List<Town> townList=pctService.queryTown(cid);
		String str=JsonUtils.objectToJson(townList);
		return str;
	}

}
