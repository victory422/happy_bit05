package vs.lc.lc_001_1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_001_1.service.LC_001_1_Service;
import vs.lc.lc_001_1.vo.LC_001_1_MapVO;
import vs.lc.lc_001_1.vo.LC_001_1_VO;

@Controller
@RequestMapping("/lc/*")
@Log4j
@AllArgsConstructor
public class LC_001_1_Controller {
	
	private LC_001_1_Service service;

	@RequestMapping(value = "uploadCourse", method = {RequestMethod.GET})
	public String insertCourse(LC_001_1_VO vo, LC_001_1_MapVO vo2, Model model) {
		
		System.out.println("컨트롤러 : " + vo);
		System.out.println("컨트롤러 : " + vo2);
		System.out.println("모델 : " + model);
		
		service.courseInsert(vo, vo2);
		
		return "redirect:/";
	}
}
