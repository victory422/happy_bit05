package vs.sp.sp_003.contoller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SP_003_controllerImpl implements SP_003_Controller{
	
	@Override
	@RequestMapping(value="/sp/payment")
	public ModelAndView SP_003_1(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("/sp/payment mapping");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/sp/sp_003_1");

		return mav;
		
		
	}
	
		
	
	
	
}
