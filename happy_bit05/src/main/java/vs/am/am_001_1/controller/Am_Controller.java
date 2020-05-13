package vs.am.am_001_1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vs.am.am_001_1.service.Am_Service;
import vs.co.co_001_1.dto.Page_DTO;
import vs.co.co_001_1.vo.PageUtil;
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
	public void mm_list(Model model,Page_DTO dto) {
		
		System.out.println("회원 관리");
		dto.setAmount(10);
		
		model.addAttribute("data",am_service.mm_list(dto));
		model.addAttribute("pageUtil",new PageUtil(dto,am_service.get_total(dto)));
		model.addAttribute("type",dto.getTypeArr());
		model.addAttribute("page", dto.getPage());
		
	}
	@GetMapping("/am_003_1")
	public void am_detail(Model model,@RequestParam("m_index") String m_index) {
		System.out.println(m_index);
	
		model.addAttribute("data",am_service.am_detail(m_index));
		
	}
	
	
	@GetMapping("/am_del")
	public String am_del(@RequestParam("m_index") String m_index) {
		
		System.out.println("삭제");
		am_service.am_del(m_index);
		
		return "redirect:/am/am_002_1?del=1";
	}
	
	
	
	
	
}
