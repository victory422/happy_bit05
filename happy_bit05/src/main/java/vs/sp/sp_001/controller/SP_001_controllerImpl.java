package vs.sp.sp_001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class SP_001_controllerImpl implements SP_001_Controller{
	 
	@Override
	@RequestMapping(value="/sp")
	public ModelAndView SP_001(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("/sp mapping");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sp/sp_001_1");

		return mav;
		
		
	}
	
		
	
	
	
}
