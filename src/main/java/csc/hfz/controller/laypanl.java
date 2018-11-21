package csc.hfz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class laypanl {
    
	@RequestMapping("/")
	public String show(){
		return "login";
	}
	
	@RequestMapping("/{page}")
	public String show(@PathVariable String page){
		return page;
	}
	
	
}
