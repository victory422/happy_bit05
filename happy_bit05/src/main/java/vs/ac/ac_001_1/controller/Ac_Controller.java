package vs.ac.ac_001_1.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vs.ac.ac_001_1.service.Ac_Service;
import vs.ac.ac_001_1.vo.AcVO;
import vs.co.co_001_1.dto.Page_DTO;
 
@Controller
@RequestMapping("/ac/*")
public class Ac_Controller {
	
	@Autowired
	private Ac_Service ac_service;

	
	@GetMapping(value="/ac_002_1")
	public void ac_List(Model model ,Page_DTO dto) throws Exception {
		
		
//		 model.addAttribute("data", ac_service.ac_List(dto)); 
		
	}
	
	@PostMapping("/ac_001_1.do")
	public String ac_register(AcVO acvo, RedirectAttributes rttr) {
		
		System.out.println("register:" + acvo);
		
		ac_service.ac_insert(acvo);
		
		rttr.addFlashAttribute("result", acvo.getCo_b_index());
		
		return "redirect:/ac/ac_002_1";
	}
	@GetMapping("/ac_001_1")
	public void ac_register() {
		
	}
}
