package vs.sp.sp_002.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class SP_002_controllerImpl implements SP_002_Controller{
	 	
	@Override
	@RequestMapping(value="/sp/*")
	public ModelAndView SP_002(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("/spcode mapping");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sp/sp_002_1");

		return mav;
		
		
	}
	
		
	
	
	
}
