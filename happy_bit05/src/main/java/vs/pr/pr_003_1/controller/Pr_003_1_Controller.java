package vs.pr.pr_003_1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vs.pr.pr_003_1.service.Pr_003_1_Service;

@Controller
@RequestMapping("/pr/*")
public class Pr_003_1_Controller {

	@Autowired
	private Pr_003_1_Service pr3_service;
	
	//개인기록 상세보기
	@GetMapping("/pr_003_1")
	public void pr_detail(Model model,@RequestParam("pr_index") String pr_index) {
		
		model.addAttribute("data", pr3_service.pr_detail(pr_index));
		
	}
	
}
