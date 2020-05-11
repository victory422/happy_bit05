package vs.am.am_001_1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import vs.am.am_001_1.service.Am_Service;
import vs.ms.ms_001.vo.MS_001_VO;

@Controller
@RequestMapping("/am/*")
public class Am_Controller {

	@Autowired
	private Am_Service am_service;
	
	@GetMapping("/am_001_1")
	public void am_list(Model model) {
		
		System.out.println(am_service.am_list());
		
		model.addAttribute("data",am_service.am_list());
		
	}
	
	@GetMapping("/am_002_1")
	public void mm_list(Model model) {
		
		System.out.println("회원 관리");
		
		model.addAttribute("data",am_service.mm_list());
		
	}
	
}
