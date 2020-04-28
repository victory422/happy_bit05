package vs.mp.mp_001.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import vs.lo.lo_001.controller.MemberLoginInterceptor;
import vs.lo.lo_001.vo.LO_001_VO;
import vs.mp.mp_001.dto.Page_DTO;
import vs.mp.mp_001.service.MP_001_Service;
import vs.mp.mp_001.vo.MP_001_3_VO;
import vs.mp.mp_001.vo.PageUtil;

@Controller
public class MP_001_ControllerImpl implements MP_001_Controller {
	
	@Autowired
	private MP_001_Service service;
	private PageUtil pageutil;
	private LO_001_VO sessionVO;
	MemberLoginInterceptor login = new MemberLoginInterceptor();
	
	@Override
	@RequestMapping(value="/mp")
	public  ModelAndView MP_001_1 (HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("mp MYpage mapping");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		login.preHandle(request, response, session);
		mav.addObject("sessionVO", session.getAttribute("sessionVO"));
		mav.setViewName("mp/mp_001_1");
		System.out.println("session : "+session.getAttribute("sessionVO"));
		System.out.println(mav + "mav완료");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/mp/myCourse")
	public  ModelAndView MP_001_3 (@ModelAttribute Page_DTO dto,
			HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("mp myCourse mapping");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		login.preHandle(request, response, session);
		mav.setViewName("mp/mp_001_3");
		sessionVO = (LO_001_VO) session.getAttribute("sessionVO");
		System.out.println("session : "+sessionVO);
		if(session.getAttribute("sessionVO") != null) {
			String m_index = sessionVO.getM_index();
			dto.setM_index(m_index);
		}
		List<MP_001_3_VO> listVO = service.getList(dto);
		mav.addObject("listVO", listVO);
		mav.addObject("sessionVO", sessionVO);
		pageutil = service.paging(dto);
		request.setAttribute("pageUtil", pageutil);
		
		System.out.println("MP_001_3 mav완료");
		
		return mav;
	}


}
