package vs.sa.sa_002.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import vs.sa.sa_002.service.SA_002_SaService;

@Controller
public class SA_002_ControllerImpl implements SA_002_Controller {
	
	@Autowired
	SA_002_SaService sa_002_Service;

	@Override
	@RequestMapping(value="/sa/products")
	public ModelAndView SA_002_4(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("/sa/product mapping");
		List<Map<String,String>> list = sa_002_Service.SaProductsList();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/sa/sa_002_4");
		request.setAttribute("list", list);
		System.out.println("mav완료");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/sa/SearchProducts/", method=RequestMethod.POST)
	public ModelAndView P_SA_002_4 (@RequestParam(defaultValue="")String str, 
			HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("/sa/SearchProducts mapping");
		System.out.println(str);
		ModelAndView mav = new ModelAndView();
		List<Map<String, String>> list = sa_002_Service.searchProducts(str);
		mav.setViewName("/sa/p_sa_002_4");
		request.setAttribute("list", list);
		System.out.println("mav완료");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/sa/SearchProducts/select")
	public  ModelAndView P_SA_002_4_response (@RequestParam(defaultValue="")String str, 
			HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("P_SA_002_4_response");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sa/sa_003_1");
		request.setAttribute("prod_id", str);
		System.out.println(str + "mav완료");
		
		return mav;
	}

}
