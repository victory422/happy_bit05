package vs.li.li_001_01.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

import lombok.extern.log4j.Log4j;
import vs.board.good.vo.GOOD_VO;
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
	public void li_review(Model model, Page_DTO dto, HttpSession session) {
		
		
		log.info("----------------------후기 게시판view-------------------");
		log.info("gdgd"+dto.getPage());
		log.info("게시판 :"+dto.getBoard());
		dto.setBoard("후기게시판");
 
		log.info("어레이 : "+dto.getTypeArr());
		log.info("종목 : "+dto.getSearch_filter());
		log.info("텍스트 : "+dto.getInput_text());
		log.info("정렬 : "+dto.getSort());
		

		List<LI_VO> vo = service.get_list(dto);
		
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		//가져오는 값이없을때 오류나서 try catch
		try {
		log.info(vo.get(0));
		}catch(Exception e){
			System.out.println("검색결과가 없습니다."+e);
		}
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		
		model.addAttribute("type",dto.getTypeArr());
		model.addAttribute("list", vo);
		model.addAttribute("pageUtil",new PageUtil(dto,service.get_total(dto)));
		model.addAttribute("page", dto.getPage());
		log.info("검색 type : "+dto.getType());
		
		for(int i= 0; i<dto.getTypeArr().length; i++) {
		model.addAttribute("type"+i,dto.getTypeArr()[i]);
		}
		
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
	public void li_recommendation(Model model , Page_DTO dto, HttpSession session) {

		log.info("-----------------------추천 게시판view-------------------");
		dto.setBoard("추천게시판");
		
		log.info("게시판 :"+dto.getBoard());
		
		log.info("어레이 : "+dto.getTypeArr());
		log.info("종목 : "+dto.getSearch_filter());
		log.info("텍스트 : "+dto.getInput_text());
		log.info("정렬 : "+dto.getSort());
		
		List<LI_VO> vo = service.get_list(dto);
		
		model.addAttribute("type",dto.getTypeArr());
		model.addAttribute("list", vo);
		model.addAttribute("pageUtil",new PageUtil(dto,service.get_total(dto)));
		model.addAttribute("page", dto.getPage());
		log.info("page = "+ dto.getPage());
		log.info("게시물수" + dto.getAmount());
		
		
		log.info("검색 type : "+dto.getType());
		
		for(int i= 0; i<dto.getTypeArr().length; i++) {
		model.addAttribute("type"+i,dto.getTypeArr()[i]);
		}
		
		log.info("page = "+ dto.getPage());
		log.info("게시물수" + dto.getAmount());
		
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/li_003_1", method = RequestMethod.GET)
	public void li_management(Model model , Page_DTO dto) {

		log.info("-----------------------관리 게시판view-------------------");
		dto.setBoard("관리게시판");
		
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
		
		//화면에서 넘어온 정보를 vo에  List형식으로 담아준다.
		List<LI_VO> aa = new ArrayList<LI_VO>();
		aa.add(vo);
		
		model.addAttribute("b_type", vo.getLi_b_type());
		
		//수정시 제어문을 타서 글 데이터를 모델에 담아서 화면에 던져준다.
		if(vo.getLi_index  () != null) {	
		model.addAttribute("page",service.detail_page(vo.getLi_index()));
		}
		String msg = "작성";
		model.addAttribute("msg",msg);
		
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
		
		//상세페이지
		model.addAttribute("page",service.detail_page(vo.getLi_index()));
		
		String msg = "작성";
		model.addAttribute("msg",msg);
		
		//+url_mapping(vo.getLi_b_type())
		return "redirect:"+url_mapping(vo.getLi_b_type());
	}
	
	
	
	//수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(LI_VO vo,Model model) {
		
		service.modify(vo);
		
		return "redirect:"+url_mapping(vo.getLi_b_type());
	}
	
	
	
	
	
	@RequestMapping(value = "/li_006_1", method = RequestMethod.GET)
	public void board_page(LI_VO vo,Model model,HttpSession session,Page_DTO dto) {
		
		session.setAttribute("m_index", "admin3");
		
		//이전페이지로 넘어갈 페이지 경로
		
		log.info("---------------------------상세 페이지-----------------------");
		log.info("게시판 : "+vo.getLi_b_type());
		log.info("increse_service 실행");
		service.increse_see(vo, session);
		log.info("increse_service 실행완료------------------------------");
		log.info("상세페이지 불러오기 실행 ");
		
		model.addAttribute("page",service.detail_page(vo.getLi_index()));
		
		
		model.addAttribute("back_url",url_mapping(vo.getLi_b_type()));

		model.addAttribute("page_num", dto.getPage());
		
		log.info("상세페이지 불러오기 실행완료-------------------------------------");
		log.info(vo.getLi_text());
		log.info(vo.getLi_index());
		log.info("세션 m_index : "+session.getAttribute("m_index"));
		
		HashMap<String,Object> hashmap = new HashMap<String,Object>();
		
		hashmap.put("board_index", vo.getLi_index());
		hashmap.put("m_index",  session.getAttribute("m_index"));
		
		int row_check = service.good_count(hashmap);
		
		if(row_check == 0) {
			log.info("로우 생성중");
			service.good_insert(hashmap);
			log.info("로우 생성완료");
		}else {
			log.info("로우가 이미 생성되어있음");
		}
		
	}
	
	
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/like", produces = "application/text; charset=utf8")
	public String like(LI_VO vo, GOOD_VO good_vo, HttpSession session) {
		
		
		log.info("컨트롤러 like~~~~");
		
		//세션에 멤버 인덱스를 저장해야하지만  기능테스트를위해 임의로 인덱스 지정
		int good_check = 0;
		int good_cnt = 0;	
		
		JsonObject obj = new JsonObject();
		log.info("----------------------좋아요 -----------------------");
		
		//구글링에선 어레이리스트인데 스트링으로 해도될거같음
		//ArrayList<String> msgs = new ArrayList<String>();
		String msgs;
		HashMap<String,Object> hashmap = new HashMap<String,Object>();
		
		
		
		log.info("li_index : "+vo.getLi_index());
		//hashmap에 게시판,멤버 index 저장
		hashmap.put("board_index", vo.getLi_index());
		hashmap.put("m_index", session.getAttribute("m_index"));
		
		good_check = service.good_check(hashmap);
		good_cnt = service.good_cnt(hashmap);
		
		log.info(service.good_check(hashmap));
		
		//service.increse_good(hashMap);

		
		if(good_check == 0) {
		      msgs="좋아요!";
//		      liketoProc.like_check(hashMap);
		      service.increse_good(hashmap);
		      good_check++;
		      good_cnt++;
//		      boardProc.like_cnt_up(boardno);   //좋아요 갯수 증가
		    } else {
		      msgs="좋아요 취소";
//		      liketoProc.like_check_cancel(hashmap);
		      service.decrese_good(hashmap);
		      good_check--;
		      good_cnt--;
//		      boardProc.like_cnt_down(boardno);   //좋아요 갯수 감소
		    }
		
//		    obj.put("boardno", liketoVO.getBoardno());
//		    obj.put("like_check", like_check);
//		    obj.put("like_cnt", like_cnt);
//		    obj.put("msg", msgs);

		log.info("체크 : "+good_check);
		log.info("좋아요갯수 : "+good_cnt);
		log.info("메세지 : "+msgs);
		
		obj.addProperty("good_cnt", good_cnt);
		obj.addProperty("m_index", "admin");
		obj.addProperty("board", vo.getLi_index());
		obj.addProperty("good_check", good_check);
		obj.addProperty("msg",msgs);
		
		/*
		 * int like_cnt = vo.getLi_good(); int like_check = 0; like_check =
		 * service.increse_good(hashMap);
		 * 
		 * 
		 * log.info(vo.getLi_index()); obj.addProperty("hi", "hi");
		 */
	
		return obj.toString();
	}
	
	
	@ResponseBody
	@RequestMapping(value="/like_check" , produces = "application/text; charset=utf8") //produces는 json을 보낼떄 한글이 꺠져서 encoding 맞춰주기위해서 사용
	public String like_check(LI_VO vo ,HttpSession session) {
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@좋아요 눌렀는지 확인하는 메소드 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		String m_index = "admin";
		int good_check = 0;
		
		JsonObject obj = new JsonObject();
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		
		hashMap.put("board_index", vo.getLi_index());
		hashMap.put("m_index",session.getAttribute("m_index"));
		
		good_check = service.good_check(hashMap);
		
		log.info("좋아요 체크 :"+ good_check);
		
		obj.addProperty("m_index", m_index);
		obj.addProperty("board", vo.getLi_index());
		obj.addProperty("good_check", good_check);
		
		return obj.toString();
	}
	
	
	
	
	
	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public void error_page() {

		log.info("-----------------------맵핑  error-------------------");
		
	}  
	 
	
	 
	
	
	@ResponseBody
	@RequestMapping("/mobile")
	public String mobile(){
		JsonObject obj = new JsonObject();
		String msg = "통신성공";
		obj.addProperty("msg", msg);
		log.info("모바일 통신중");
		
		return obj.toString();
	}
	
	
	
	
	
	//<-----------------------------------함수 쓰는 곳 ----------------------------------------->
	
	
	//url 맵핑하는 함수
	public String url_mapping(String board_type) {
		String url_value = "";
		log.info("넘어가는 페이지 "+board_type);

		if (board_type.equals("후기게시판")) {
			url_value="/li/li_001_1";
		}else if(board_type.equals("추천게시판")){
			url_value="/li/li_002_1";
		}else if(board_type.equals("관리게시판")){
			url_value="/li/li_003_1";
		}else if(board_type.equals("자랑게시판")){
			url_value="/li/li_004_1";
		}else if(board_type.equals("장비게시판")){
			url_value="/li/li_001_1";
			log.info("test if문 (완선되면삭제)");
		}
		else {
			url_value="404";
			log.info("BoardValue 에러 url_mapping(method)"+url_value);
		}
		return url_value;
	}

}
