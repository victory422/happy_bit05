package vs.mp.lo_001_1.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import vs.lo.lo_001.vo.LO_001_VO;

@Controller
public class MP_001_ControllerImpl implements MP_001_Controller {
	
	
	@Override
	@RequestMapping(value="/mp")
	public  ModelAndView MP_001_1 (HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("mp MYpage mapping");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		mav.addObject("loginVO", session.getAttribute("session"));
		mav.setViewName("mp/mp_001_1");
		System.out.println(session.getAttribute("session"));
		System.out.println(mav + "mav완료");
		
		return mav;
	}


}
