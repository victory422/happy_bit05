package vs.lt.lt_001_01.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import vs.lo.lo_001.vo.LO_001_VO;
import vs.lt.lt_001_01.service.LT_Service;
import vs.lt.lt_001_01.vo.LT_VO;

@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("/lt/*")
public class LT_controller {
	
	private LT_Service service;
	private LO_001_VO member;
	
	@RequestMapping("/lt_001_1")
	public void lt_001_1(Model model,Page_DTO dto,HttpSession session) {
		member = (LO_001_VO) session.getAttribute("sessionVO");
		
		if(member != null) {
			//////////////////////////////////로그인 세션
			model.addAttribute("member", member);
			}
		
		for(int i= 0; i<dto.getTypeArr().length; i++) {
			model.addAttribute("type"+i,dto.getTypeArr()[i]);
			}
		
		
		log.info(" -----------------------------질문 게시판 ------------------------------");
		dto.setBoard("질문게시판");
		
		log.info("게시판 유형" +dto.getBoard());

		
		List<LT_VO> vo = service.get_list(dto);

		
		
		model.addAttribute("type",dto.getTypeArr());
		model.addAttribute("list", vo);
		model.addAttribute("pageUtil",new PageUtil(dto,service.get_total(dto)));
		model.addAttribute("page", dto.getPage());
		log.info("검색 type : "+dto.getType());
		

		
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
	public String upload(LT_VO vo , Model model,HttpSession session) {
		member = (LO_001_VO) session.getAttribute("sessionVO");
		vo.setM_index(member.getM_index());
		vo.setM_nickname(member.getM_nickName());
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
