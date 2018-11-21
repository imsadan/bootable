package csc.hfz.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class base64 { 
	  
    @RequestMapping(value = "/showBase/pic")  
    @ResponseBody  
    public String createFolw(HttpServletRequest request,  
            HttpServletResponse response, Model model) {  
        // response.setContentType("image/*");  
        FileInputStream fis = null;  
        OutputStream os = null;  
        try {  
            fis = new FileInputStream("c://images/1510040457205.png");  
            os = response.getOutputStream();  
            int count = 0;  
            byte[] buffer = new byte[1024 * 8];  
            while ((count = fis.read(buffer)) != -1) {  
                os.write(buffer, 0, count);  
                os.flush();  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        try {  
            fis.close();  
            os.close();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        return "ok";  
    }  
    
    
    @RequestMapping("/prop")
    public String pages(){
    	return "prop";
    }
}
