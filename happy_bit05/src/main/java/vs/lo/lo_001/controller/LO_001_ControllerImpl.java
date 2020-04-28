package vs.lo.lo_001.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vs.lo.lo_001.service.LO_001_Service;
import vs.lo.lo_001.vo.LO_001_VO;

@Controller
public class LO_001_ControllerImpl implements LO_001_Controller {
	
	@Autowired
	private LO_001_Service service;
	
	@Override
	@RequestMapping(value="/lo")
	public  ModelAndView LO_001_1 (HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("login page");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("lo/lo_001_1");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/lo/login")
	public  ModelAndView LO_001_2 (LO_001_VO vo, HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("login page"+vo);
		List<LO_001_VO> list = service.login(vo);
		vo = list.get(0);
		ModelAndView mav = new ModelAndView();
		mav.addObject("loginVO", vo);
		mav.setViewName("lo/p_lo_001_1");
		
		if(vo.getLoginCheck()==1) {
			HttpSession session = request.getSession();
			session.setAttribute("sessionVO", vo);
			System.out.println("session value : "+session.getAttribute("sessionVO"));
		}
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/lo/logout")
	public  ModelAndView Logout (HttpSession session, 
			HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
			System.out.println("logout page");
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/home");
			session.removeAttribute("sessionVO");
			System.out.println(session);
		
		return mav;
	}



}
