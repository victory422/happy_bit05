package vs.lt.lt_001_01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.li.li_001_01.vo.LI_VO;
import vs.li.li_001_01.vo.PageUtil;
import vs.li.li_001_1.dto.Page_DTO;
import vs.lt.lt_001_01.service.LT_Service;
import vs.lt.lt_001_01.vo.LT_VO;

@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("/lt/*")
public class LT_controller {
	
	private LT_Service service;
	
	@RequestMapping("/lt_001_1")
	public void lt_001_1(Model model,Page_DTO dto) {
		log.info(" -----------------------------질문 게시판 ------------------------------");
		dto.setBoard("질문게시판");
		
		log.info("게시판 유형" +dto.getBoard());
		

		model.addAttribute("list", service.get_list(dto));
		model.addAttribute("pageUtil",new PageUtil(dto,service.get_total(dto)));
	}
	@RequestMapping("/lt_002_1")
	public void lt_002_1(Model model,Page_DTO dto) {
		log.info(" -----------------------------공유 게시판------------------------------");
		dto.setBoard("공유게시판");
		
		model.addAttribute("list", service.get_list(dto));
		model.addAttribute("pageUtil",new PageUtil(dto,service.get_total(dto)));
	}
	
	@RequestMapping("/lt_003_1")
	public void lt_edit(Model model,LT_VO vo) {
		log.info(" -----------------------------글 작성 ------------------------------");
		
		model.addAttribute("b_type", vo.getLt_b_type());
		log.info(vo.getLt_b_type());

	}
	
	@RequestMapping(value = "/lt_003_1", method = RequestMethod.POST)
	public String upload(LT_VO vo , Model model) {
		
		service.regist(vo);
		
		return url_mapping(vo.getLt_b_type());
	}
	
	
	
	@RequestMapping(value = "/lt_004_1", method = RequestMethod.GET)
	public void page(LI_VO vo,Model model,@RequestParam String index) {
		
		model.addAttribute("page",service.detail_page(index));
		
	}
	
	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public void error_page() {

		log.info("-----------------------맵핑  error-------------------");
		
	}
	 
	//<-----------------------------------함수 쓰는 곳 ----------------------------------------->
	
	
	
	
	
	
	
	
	//url 맵핑하는 함수
	public String url_mapping(String board_type) {
		String url_value = "";
		log.info("넘어가는 페이지 "+board_type);
		if(board_type.equals("질문게시판")) {
			url_value="redirect:/lt/lt_001_1";
		}else if(board_type.equals("공유게시판")){
			url_value="redirect:/lt/lt_002_1";
		}else {
			url_value="redirect:/lt/404";
			log.info("BoardValue 에러 url_mapping(method)"+url_value);
		}
		return url_value;
	}
	
}
