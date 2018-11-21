package csc.hfz.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import csc.hfz.service.listService;

@Controller
public class tableController {
    
	@Autowired
	private listService listService;
	
	/*@RequestMapping("/")
	public String page(){
		return "table";
	}*/
	
	@RequestMapping("/list/getAllInfo")
	@ResponseBody
	public Map<String, Object> getAllList(int pageSize,int pageNumber){
		Map<String, Object> param=new HashMap<String, Object>();
		int a=(pageNumber-1)*pageSize;
        int b=pageSize;
        param.put("a", a);
        param.put("b", b);
        return listService.getallList(param);
	}
	
	@RequestMapping("/webupload")
	public String webupload(){
		return "webupload";
	}
}
