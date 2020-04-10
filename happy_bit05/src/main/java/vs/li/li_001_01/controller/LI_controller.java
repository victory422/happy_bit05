package vs.li.li_001_01.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;
import vs.li.li_001_01.vo.LI_VO;
import vs.li.li_001_1.service.LI_Service;
import lombok.AllArgsConstructor;

@Controller
@Log4j
@RequestMapping("/li/*")
public class LI_controller {

	@Autowired
	private LI_Service service;

	@RequestMapping(value = "/li_001_1", method = RequestMethod.GET)
	public void li_review(Model model,LI_VO vo) {

		log.info("----------------------후기 게시판view-------------------");

		vo.setLi_b_type("장비게시판");
		
		model.addAttribute("list", service.get_list(vo));

	}
	
	@RequestMapping(value = "/li_002_1", method = RequestMethod.GET)
	public void li_recommendation() {

		log.info("-----------------------추천 게시판view-------------------");
		
	}
	@RequestMapping(value = "/li_003_1", method = RequestMethod.GET)
	public void li_management() {

		log.info("-----------------------관리 게시판view-------------------");
		
	}
	@RequestMapping(value = "/li_004_1", method = RequestMethod.GET)
	public void li_boast() {

		log.info("-----------------------자랑 게시판view-------------------");
		
	}
	
	@RequestMapping(value = "/li_005_1", method = RequestMethod.GET)
	public void li_edit() {

		log.info("-----------------------글 작성view-------------------");
		
	}

	@RequestMapping(value = "/li_005_1", method = RequestMethod.POST)
	public String regist(LI_VO vo,Model model) {
		log.info("저장");
		
		log.info("텍스트------"+vo.getLi_text());
		log.info("타입"+vo.getLi_type());
		log.info("카테고리-----"+vo.getLi_category());
		log.info("게시판유형@@@@@"+vo.getLi_b_type());
		
		service.li_regist(vo);

		log.info("---------작성 완료----------------");
		model.addAttribute("message", "글작성이 완료되었습니다.");
		return "redirect:/li/li001_1";
	}
	
}
