package vs.ac.ac_001_1.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vs.ac.ac_001_1.service.Ac_Service;
import vs.ac.ac_001_1.vo.AcVO;
import vs.co.co_001_1.dto.Page_DTO;
import vs.co.co_001_1.service.Co_Service; 
import vs.co.co_001_1.vo.PageUtil;

@Controller
@RequestMapping("/ac/*")
public class Ac_Controller {
	
	@Autowired
	private Ac_Service ac_service;
	@Autowired
	private Co_Service co_service;
	@GetMapping(value="/ac_002_1")
	public void ac_List(Model model,Page_DTO dto) throws Exception {
		
		 model.addAttribute("data", dto);
		 model.addAttribute("pageUtil",new PageUtil(dto,co_service.get_total(dto)));
		
	}
	
	@RequestMapping(value = "ac_001_1.do", method = RequestMethod.POST)
	public String ac_register(AcVO acvo, RedirectAttributes rttr) {
		
		System.out.println(acvo.getCo_b_thumbnail());
		
		try {
	         Map<String, Object> hmap = new HashMap<String, Object>();
	         hmap.put("co_b_thumbnail", acvo.getCo_b_thumbnail().getBytes());
	         
	         acvo.setCo_b_index("guest");
	         
	         ac_service.ac_insert(acvo);
	         ac_service.insertTu(hmap);
	      } catch (Exception e) {
	         // TODO: handle exception
	         e.printStackTrace();
	      }
		System.out.println("register:" + acvo);
		
		
		
		rttr.addFlashAttribute("result", acvo.getCo_b_index());
		
		return "redirect:/ac/ac_002_1";
	}
	@GetMapping("/ac_001_1")
	public void ac_register() {
		
	}
	
	 //대회 상세페이지
	@GetMapping("/ac_003_1")
	public void co_detail(Model model, @RequestParam("co_b_index") String co_b_index) {

		model.addAttribute("data", co_service.co_detail(co_b_index));
	}
	
	
}
