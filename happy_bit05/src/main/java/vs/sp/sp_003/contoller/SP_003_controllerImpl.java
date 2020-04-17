package vs.sp.sp_003.contoller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SP_003_controllerImpl implements SP_003_Controller{
	
	@Override
	@RequestMapping(value="")
	public ModelAndView SP_003(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("/sp_003 mapping");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("");

		return mav;
		
		
	}
	
		
	
	
	
}
