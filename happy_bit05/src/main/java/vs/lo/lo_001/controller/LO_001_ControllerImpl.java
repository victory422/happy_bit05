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
		ModelAndView mav = new ModelAndView();
			System.out.println("login page -non popup");
			mav.setViewName("lo/lo_001_1");
			return mav;
		
	}
	
	@Override
	@RequestMapping(value="/lo2")
	public  ModelAndView p_LO_001_1 (HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		System.out.println("login page-popup");
		mav.addObject("sessionVO", session.getAttribute("sessionVO"));
		mav.setViewName("lo/p_lo_001");
		return mav;
		
	}
	
	@Override
	@RequestMapping(value="/lo/login")
	public  ModelAndView LO_001_2 (LO_001_VO vo, HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("로그인 처리");
		List<LO_001_VO> list = service.login(vo);
		vo = list.get(0);
		ModelAndView mav = new ModelAndView();
		
		if(vo.getLoginCheck()==1) {
			HttpSession session = request.getSession();
			session.setAttribute("sessionVO", vo);
			System.out.println("session value : "+session.getAttribute("sessionVO"));
			mav.addObject(session.getAttribute("sessionVO"));
		}
			mav.setViewName("lo/p_lo_001_1");
		
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/lo/logout")
	public  ModelAndView Logout (HttpSession session, 
			HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
			System.out.println("logout page");
			ModelAndView mav = new ModelAndView();
			mav.setViewName("MA/MA_001");
			session.removeAttribute("sessionVO");
			System.out.println("session : "+session.getAttribute("sessionVO"));
		
		return mav;
	}



}
