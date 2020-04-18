package vs.li.li_001_01.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;
import vs.li.li_001_01.vo.LI_VO;
import vs.li.li_001_01.vo.PageUtil;
import vs.li.li_001_1.dto.Page_DTO;
import vs.li.li_001_1.service.LI_Service;

@Controller
@Log4j
@RequestMapping("/li/*")
public class LI_controller {

	@Autowired
	private LI_Service service;

	@RequestMapping(value = "/li_001_1", method = RequestMethod.GET)
	public void li_review(Model model, /* LI_VO vo, */Page_DTO dto) {
		log.info("----------------------후기 게시판view-------------------");
		log.info("게시판 :"+dto.getBoard());
		dto.setBoard("후기게시판");
 
		/*
		 * vo.setLi_b_type("장비게시판");
		 */		
		log.info("어뤠이"+dto.getTypeArr());
		log.info("종목"+dto.getSearch_filter());
		log.info("텍스트"+dto.getInput_text());
		
		model.addAttribute("list", service.get_list(dto));
		model.addAttribute("pageUtil",new PageUtil(dto,service.get_total(dto)));
		log.info("page = "+ dto.getPage());
		log.info("게시물수" + dto.getAmount());
	}
	
	
	
	
	
	
	
	
	
	
	
/*	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String li_001_search(Model model,LI_VO vo) {
		
		String Board = "장비게시판";
		
		vo.setLi_type(Board); //jsp 화면에서 인풋 히든으로 넘겨준 게시판정보를 변수로 받아서 넣을예정
		
		
		  if(vo.getLi_type().equals("all")) { vo.setLi_type(""); }
		  if(vo.getLi_category().equals("all")) { vo.setLi_category(""); }
	
		
		vo.setLi_search_text_id(vo.getLi_search_text());
		vo.setLi_search_text_title(vo.getLi_search_text());
		log.info("서비스 실행전");
		model.addAttribute("list", service.search_list(vo));
		log.info("서비스 실행완료");
		
		//게시판유형에맞게 url 변수
				model.addAttribute("board_type", vo.getLi_b_type());
				
				log.info("넘어가는 페이지 써치써치"+vo.getLi_b_type());
				
				log.info(url_mapping(vo.getLi_b_type()));
				
				model.addAttribute("message", "ok");
				
		
				
		return "redirect:/li/"+url_mapping(vo.getLi_b_type());
	}
	*/
	
	
	
	
	
	
	
	@RequestMapping(value = "/li_002_1", method = RequestMethod.GET)
	public void li_recommendation(Model model , Page_DTO dto) {

		log.info("-----------------------추천 게시판view-------------------");
		dto.setBoard("추천게시판");
		
		model.addAttribute("list", service.get_list(dto));
		model.addAttribute("pageUtil",new PageUtil(dto,service.get_total(dto)));
		log.info("page = "+ dto.getPage());
		log.info("게시물수" + dto.getAmount());
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/li_003_1", method = RequestMethod.GET)
	public void li_management(Model model , Page_DTO dto) {

		log.info("-----------------------관리 게시판view-------------------");
		dto.setBoard("추천게시판");
		
		model.addAttribute("list", service.get_list(dto));
		model.addAttribute("pageUtil",new PageUtil(dto,service.get_total(dto)));
		log.info("page = "+ dto.getPage());
		log.info("게시물수" + dto.getAmount());
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/li_004_1", method = RequestMethod.GET)
	public void li_boast(Model model , Page_DTO dto) {

		log.info("-----------------------자랑 게시판view-------------------");

		log.info("-----------------------관리 게시판view-------------------");
		dto.setBoard("추천게시판");
		
		model.addAttribute("list", service.get_list(dto));
		model.addAttribute("pageUtil",new PageUtil(dto,service.get_total(dto)));
		log.info("page = "+ dto.getPage());
		log.info("게시물수" + dto.getAmount());
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/li_005_1", method = RequestMethod.GET)
	public void li_edit(Model model, LI_VO vo) {

		log.info("-----------------------글 작성view-------------------");
		
		model.addAttribute("b_type", vo.getLi_b_type());
		log.info(vo.getLi_b_type());
	}
	
	
	
	
	
	
	
	
	
	

	@RequestMapping(value = "/li_005_1", method = RequestMethod.POST)
	public String regist(LI_VO vo,Model model) {
		log.info("저장");
		
		log.info("텍스트------"+vo.getLi_text());
		log.info("타입"+vo.getLi_type());
		log.info("카테고리-----"+vo.getLi_category());
		log.info("제목-----"+vo.getLi_title());
		log.info("게시판유형@@@@@"+vo.getLi_b_type());
		
		service.li_regist(vo);

		log.info("---------작성 완료----------------");
		
		//게시판유형에맞게 url 변수
		model.addAttribute("board_type", vo.getLi_b_type());
		
		
		//작성 완료 메세지
		model.addAttribute("message", "ok");
		
		
		return url_mapping(vo.getLi_b_type());
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/li_006_1", method = RequestMethod.GET)
	public void board_page(LI_VO vo,Model model,@RequestParam String index) {
		
		log.info("---------------------------상세 페이지-----------------------");
		
		
		model.addAttribute("page",service.detail_page(index));
		log.info(vo.getLi_text());
		log.info(index);
		
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
		if(board_type.equals("후기게시판")) {
			url_value="redirect:/li/li_001_1";
		}else if(board_type.equals("추천게시판")){
			url_value="redirect:/li/li_002_1";
		}else if(board_type.equals("관리게시판")){
			url_value="redirect:/li/li_003_1";
		}else if(board_type.equals("자랑게시판")){
			url_value="redirect:/li/li_004_1";
		}else if(board_type.equals("장비게시판")){
			url_value="redirect:/li/li_001_1";
			log.info("test if문 (완선되면삭제)");
		}
		else {
			url_value="404";
			log.info("BoardValue 에러 url_mapping(method)"+url_value);
		}
		return url_value;
	}

}
