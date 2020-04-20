package vs.lc.lc_003_1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_003_1.service.LC_003_1_Service;
import vs.lc.lc_003_1.vo.LC_003_1_VO;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("lc/003/*")
public class LC_003_1_Controller {
	
	private LC_003_1_Service service;
	private LC_003_1_VO vo;
	
	@RequestMapping(value="lc_get")
	public String getLC(@RequestParam("lc_index") String lc_index, Model model) {
		
		System.out.println("번호는:????? " + lc_index);

		model.addAttribute("lc_get",service.getLC(lc_index));
		
		return "LC/LC_003_1";
	}
	
}
