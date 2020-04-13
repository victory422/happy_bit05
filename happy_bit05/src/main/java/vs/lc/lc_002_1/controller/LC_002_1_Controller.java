package vs.lc.lc_002_1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_002_1.service.LC_002_1_Service;
import vs.lc.lc_002_1.vo.LC_002_1_VO;

@Controller
@RequestMapping("/lc/002/*")
@Log4j
@AllArgsConstructor
public class LC_002_1_Controller {
	
	private LC_002_1_Service service;

	@GetMapping("/list")
	public String getList(Model model) {
			log.info("컨트롤러 list....");
			log.info(service);
			
			model.addAttribute("lc_list", service.getList());
			
			return "LC/LC_002_1";
	}
}
