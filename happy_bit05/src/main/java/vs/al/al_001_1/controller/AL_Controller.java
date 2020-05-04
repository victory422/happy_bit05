package vs.al.al_001_1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import vs.co.co_001_1.dto.Page_DTO;
import vs.co.co_001_1.service.Co_Service;
import vs.co.co_001_1.vo.PageUtil;
import vs.cr.cr_001_1.service.Cr_Service;

@Controller
@RequestMapping("/al/*")
public class AL_Controller {

	@Autowired
	private Cr_Service cr_service;
	
	@Autowired
	private Co_Service co_service;
	
	
	
	@GetMapping(value="/al_001_1")
	public void ac_List(Model model,Page_DTO dto) throws Exception {
		
		List cr_list = cr_service.Cr_List(dto);
		List co_list = co_service.co_List(dto);
		
		 model.addAttribute("cr_list", cr_list);
		 model.addAttribute("co_list", co_list);
		 model.addAttribute("pageUtil",new PageUtil(dto,co_service.get_total(dto)));
		 
	}
	
}
