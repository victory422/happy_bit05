package vs.sa.sa_002.controller;

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
public class SA_002_ControllerImpl implements SA_002_Controller {
	
	@Autowired
	private SA_002_SaService sa_002_Service;
	private PageUtil pageutil;
	private Page_DTO pagedto = new Page_DTO();

	
	@Override
	@RequestMapping(value= "/sa/products/page={pageNum}")
	public ModelAndView SaproductsPaging(@PathVariable("pageNum") int pageNum, @ModelAttribute Page_DTO pagedto,
		HttpServletRequest request, HttpServletResponse response) throws Exception {
		pagedto.setPage(pageNum);
		System.out.println("/sa/product?page= mapping : (dto)"+pagedto);
		List<Map<String,String>> list = sa_002_Service.searchProducts(pagedto);
		System.out.println("this page is : "+pagedto.getPage());
		pageutil = sa_002_Service.paging(pagedto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/sa/sa_002_4");
		request.setAttribute("list", list);
		request.setAttribute("pageUtil", pageutil);
		System.out.println("mav완료");
		
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/sa/SearchProducts/page={pageNum}")
	public ModelAndView P_SA_002_4 (@RequestParam(defaultValue="")String input_text, 
			@PathVariable("pageNum") int pageNum, 
			HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("/sa/SearchProducts mapping");
		pagedto.setPage(pageNum);
		pagedto.setAmount(10);
		pagedto.setInput_text(input_text);
		System.out.println("search word : "+input_text);
		ModelAndView mav = new ModelAndView();
		List<Map<String, String>> list = sa_002_Service.searchProducts(pagedto);
		pageutil = sa_002_Service.paging(pagedto);
		mav.setViewName("/sa/p_sa_002_4");
		request.setAttribute("list", list);
		request.setAttribute("pageUtil", pageutil);
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
