package vs.mp.lo_001_1.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vs.sa.sa_002.dto.Page_DTO;
import vs.sa.sa_002.service.SA_002_SaService;
import vs.sa.sa_002.vo.PageUtil;

@Controller
public class MP_001_ControllerImpl implements MP_001_Controller {
	
	@Autowired
	private SA_002_SaService sa_002_Service;
	private PageUtil pageutil;
	private Page_DTO pagedto = new Page_DTO();

	
	
	@Override
	@RequestMapping(value="/mp")
	public  ModelAndView MP_001_1 (@RequestParam(defaultValue="")String str, 
			HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("ms회원가입 mav");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mp/mp_001_1");
		request.setAttribute("prod_id", str);
		System.out.println(str + "mav완료");
		
		return mav;
	}


}
