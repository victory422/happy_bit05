package vs.sa.sa_003.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vs.sa.sa_003.service.SA_003_SaService;

@Controller
public class SA_003_ControllerImpl implements SA_003_Controller {
	
	@Autowired
	SA_003_SaService saService;

	@Override
	@RequestMapping(value="/sa/new")
	public ModelAndView SA_003(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		System.out.println("/sa mapping");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("sa/sa_003_1");

		return mav;
	}
	
	@Override
	@RequestMapping(value="/sa/*/regist/*")
	public ModelAndView SA_003_1(@RequestParam Map<String, String> map,
			 HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("/sa/regist mapping :" + map);
		saService.saleInsert(map);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/sp/sp_001_1");
		System.out.println("mav완료");
		
		return mav;
	}

	
}
