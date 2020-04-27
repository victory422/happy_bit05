package vs.ms.ms_001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import vs.ms.ms_001.service.MS_001_SaService;
import vs.ms.ms_001.vo.MS_001_VO;

@Controller
public class MS_001_ControllerImpl implements MS_001_Controller {
	
	@Autowired
	private MS_001_SaService ms_001_Service;
	private MS_001_VO ms_001_vo;
	
	
	@Override
	@RequestMapping(value="/ms")
	public  ModelAndView MS_001_1 (HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("ms회원가입 페이지 mav");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ms/ms_001_1");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/ms/regist")
	public  ModelAndView test(MS_001_VO ms_001_vo,
			HttpServletRequest request, HttpServletResponse respons) throws Exception {
		
		System.out.println("ms회원가입 regist mav");
		System.out.println(ms_001_vo);
		ms_001_Service.memberVO(ms_001_vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("lo/lo_001_1");
		request.setAttribute("memberList", ms_001_vo);
		return mav;
	}
	
	
	


}
