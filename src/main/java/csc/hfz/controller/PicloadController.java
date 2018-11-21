package csc.hfz.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import csc.hfz.common.JsonUtils;




@Controller
public class PicloadController {
	
	
	@RequestMapping("/pic/upload")
	@ResponseBody
	public String pictureUpload(MultipartFile file) {
		String result=null;
		if(file!=null && !file.isEmpty()){
			Date date=new Date();
			long timeStamp=date.getTime();
			String[] fileStr=file.getOriginalFilename().split("\\.");
			String img=timeStamp+"."+fileStr[1];
			
			String separator = File.separator;
			
			File destinationFile=new File("d:"+"/"+"image", img);
			try {
				
				file.transferTo(destinationFile);
				Map resultMap = new HashMap<>();
				resultMap.put("error", 0);
				resultMap.put("url", "/xpimages"+"/"+img);
				result=JsonUtils.objectToJson(resultMap);
				return result;
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
		
		
	}
}
