package vs.cr.cr_001_1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import vs.co.co_001_1.dto.Page_DTO;
import vs.co.co_001_1.vo.PageUtil;
import vs.cr.cr_001_1.service.Cr_Service;
import vs.cr.cr_001_1.vo.CrVO;

@Controller
@RequestMapping("/cr/*")
public class Cr_Controller {

	@Autowired
	private Cr_Service cr_service;
	
	
	//대회 후기 리스트
	@GetMapping("cr_001_1")
	public void cr_List(Model model, Page_DTO dto) throws Exception {
		
		model.addAttribute("data", cr_service.Cr_List(dto));
		model.addAttribute("pageUtil",new PageUtil(dto,cr_service.get_total(dto)));
		model.addAttribute("type",dto.getTypeArr());
		model.addAttribute("page", dto.getPage());
		
	}
	//대회 후기 작성폼이동
	@GetMapping("cr_002_1")
	public void cr_register() {
			
		
	}
	
	//대회 후기 작성
	@PostMapping("/cr_002_1")
	public String cr_insert(CrVO crvo) throws Exception {
		
		
		cr_service.cr_insert(crvo);
		
		return "redirect:/cr/cr_001_1";
	}
}
