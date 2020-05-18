package vs.lt.lt_001_01.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.board.good.vo.GOOD_VO;
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
		
		HashMap<String,Object> hashmap = new HashMap<String,Object>();
		
		hashmap.put("board_index", vo.getLt_index());
		if(member != null) {
		hashmap.put("m_index", member.getM_index());
		}
		if(member!= null) {
			
			int row_check = service.good_count(hashmap);
			
			if(row_check == 0) {
				log.info("로우 생성중");
				service.good_insert(hashmap);
				log.info("로우 생성완료");
			}else {
				log.info("로우가 이미 생성되어있음");
			}
		}
		
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
	
	@ResponseBody
	@RequestMapping(value="/like_check" , produces = "application/text; charset=utf8") //produces는 json을 보낼떄 한글이 꺠져서 encoding 맞춰주기위해서 사용
	public String like_check(LT_VO vo ,HttpServletRequest request, HttpServletResponse response) {
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@좋아요 눌렀는지 확인하는 메소드 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		HttpSession session = request.getSession();
		
		
		member = (LO_001_VO) session.getAttribute("sessionVO");
		//예비 member index
		
		if(member != null) {
		String m_index = member.getM_index();
		
		int good_check = 0;
		
		JsonObject obj = new JsonObject();
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		
		hashMap.put("board_index", vo.getLt_index());
		hashMap.put("m_index",m_index);
		
		//세션id넣어주기
		//hashMap.put("board_index", vo.getLi_index());
		//hashMap.put("m_index",session.getAttribute("id"));
		
		//좋아요를 눌렀던 게시물인지 체크
		good_check = service.good_check(hashMap);
		
		log.info("좋아요 체크 :"+ good_check);
		
		//session값으로 바꿔야함
		obj.addProperty("m_index", m_index);
		obj.addProperty("board", vo.getLt_index());
		obj.addProperty("good_check", good_check);
		
		return obj.toString();
		}else {
			
		return null;
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="/like", produces = "application/text; charset=utf8")
	public String like(LT_VO vo, GOOD_VO good_vo, HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		member = (LO_001_VO) session.getAttribute("sessionVO");
		log.info("컨트롤러 like~~~~");
		
		JsonObject obj = new JsonObject();
		
		if(member != null) {
		//세션에 멤버 인덱스를 저장해야하지만  기능테스트를위해 임의로 인덱스 지정
		int good_check = 0;
		int good_cnt = 0;	
		
		
		log.info("----------------------좋아요 -----------------------");
		
		String msgs;
		HashMap<String,Object> hashmap = new HashMap<String,Object>();
		
		
		
//=========================================================수정해야함 
		
		log.info("lt_index : "+vo.getLt_index());
		//hashmap에 게시판,멤버 index 저장
		hashmap.put("board_index", vo.getLt_index());
		//m_index 테스트설정
		
		hashmap.put("m_index", member.getM_index());
		
		//m_index 세션값으로 변경해야함 
		//hashmap.put("m_index", session.getAttribute("m_index"));
		
		
		good_check = service.good_check(hashmap);
		//good_cnt = service.good_cnt(hashmap);
		
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
		if(member != null) {
		obj.addProperty("m_index", member.getM_index());
		}else {
			obj.addProperty("m_index", "visitor");
		}
		obj.addProperty("board", vo.getLt_index());
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
		}else {
			obj.addProperty("msg", "no");
			return obj.toString();
		}
		
	}	
	
	
	
	
	
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
