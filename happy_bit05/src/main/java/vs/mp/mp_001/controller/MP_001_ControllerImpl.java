package vs.mp.mp_001.controller;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import vs.mp.mp_001.dto.Page_DTO;
import vs.mp.mp_001.service.MP_001_Service;
import vs.mp.mp_001.vo.MP_001_3_VO;
import vs.mp.mp_001.vo.PageUtil;

@Controller
public class MP_001_ControllerImpl implements MP_001_Controller {
	
	@Autowired
	private MP_001_Service service;
	private PageUtil pageutil;
	private Page_DTO dto = new Page_DTO();
	
	
	@Override
	@RequestMapping(value="/mp")
	public  ModelAndView MP_001_1 (HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("mp MYpage mapping");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		mav.addObject("sessionVO", session.getAttribute("sessionVO"));
		mav.setViewName("mp/mp_001_1");
		System.out.println(session.getAttribute("sessionVO"));
		System.out.println(mav + "mav완료");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/mp/myCourse/page={pageNum}")
	public  ModelAndView MP_001_3 (@PathVariable("pageNum") int pageNum, @ModelAttribute Page_DTO dto,
			HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("mp myCourse mapping");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("sessionVO"));
		mav.setViewName("mp/mp_001_3");
		System.out.println(dto);
		List<MP_001_3_VO> listVO = service.getList(dto);
		mav.addObject("listVO", listVO);
		pageutil = service.paging(dto);
		request.setAttribute("pageUtil", pageutil);
		System.out.println(mav + "mav완료");
		
		return mav;
	}


}
