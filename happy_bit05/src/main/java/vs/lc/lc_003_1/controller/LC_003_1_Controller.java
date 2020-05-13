package vs.lc.lc_003_1.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.board.good.vo.GOOD_VO;
import vs.lc.lc_002_1.vo.Criteria;
import vs.lc.lc_003_1.service.LC_003_1_Service;
import vs.lc.lc_003_1.vo.LC_003_1_VO;
import vs.li.li_001_01.vo.LI_VO;
import vs.lo.lo_001.vo.LO_001_VO;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("lc/003/*")
public class LC_003_1_Controller {
	
	private LC_003_1_Service service;
	private LC_003_1_VO vo;
	private LO_001_VO member;
	
	//상세보기
	@RequestMapping(value="lc_get")
	public String getLC(@RequestParam("lc_index") String lc_index, Model model,
				@ModelAttribute("cri") Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		
		System.out.println("번호는:????? " + lc_index);
		System.out.println("검색어 : ??????" + cri.getKeyword());
		
		HttpSession session = request.getSession();
		
		System.out.println(session.getAttribute("sessionVO"));
		
		vo.setLc_index(lc_index);
		
		//관심코스 등록되있는지 확인.
		if(session.getAttribute("sessionVO") != null) {
			
			member = (LO_001_VO) session.getAttribute("sessionVO");
			vo.setM_index(member.getM_index());
			
			System.out.println("관심코스를 위한 회원 번호 : " + vo.getM_index());
			System.out.println("관심코스를 위한 게시글 번호 : " + vo.getLc_index());
			
			if(service.myCourseSearch(vo) == true) {
				model.addAttribute("search", "not_empty");
			}else {
				model.addAttribute("search", "empty");
			}
	
			model.addAttribute("member", session.getAttribute("sessionVO"));
		}
		
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		service.increse_see(vo, session);
		log.info("increse_service 실행완료------------------------------");
		
		HashMap<String,Object> hashmap = new HashMap<String,Object>();
		
		hashmap.put("board_index", lc_index);
		hashmap.put("m_index",  vo.getM_index());
		
		log.info("난 빡빡이다. : "+hashmap.get("board_index"));
		//log.info("나는 쀅붺이다."+hashmap.get("m_index"));
		log.info("지랄: " + vo.getLc_index());
		
		//로그인 했을 경우에만 좋아요 체크. 없으면 에러남.
		if(member.getM_index() != null) {
			int row_check = service.good_count(hashmap);
			
			if(row_check == 0) {
				log.info("로우 생성중");
				service.good_insert(hashmap);
				log.info("로우 생성완료");
			}else {
				log.info("로우가 이미 생성되어있음");
			}
		}
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
		model.addAttribute("lc_get",service.getLC(lc_index));
		
		return "LC/LC_003_1";
	}

	//수정 패이지 가기
	@RequestMapping(value="lc_modify")
	public String modifyLC(@RequestParam("lc_index") String lc_index, Model model) {
		
		System.out.println("번호는:????? " + lc_index);

		model.addAttribute("lc_get",service.getLC(lc_index));
		
		return "LC/LC_003_2";
	}
	
	//수정하기
	@RequestMapping(value="lc_update", method = RequestMethod.POST)
	public String updateLC(LC_003_1_VO vo, Model model) {
		
		try {
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("lc_thumbnail", vo.getLc_thumbnail().getBytes());
			hmap.put("lc_index", vo.getLc_index());
			
			service.modifyLC(vo);
			service.modifyLC_thumbnail(hmap);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "../../lc/003/lc_get?lc_index=" + vo.getLc_index();
	}
	
	//삭제하기
	@RequestMapping(value="lc_delete")
	public String deleteLC(@RequestParam("lc_index") String lc_index, Model model) {
		try {
			service.deleteLC(lc_index);
			service.deleteLC_map(lc_index);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "redirect:/lc/002/list";
	}
	
	@RequestMapping(value="lc_myCourse")
	public String myCourse(LC_003_1_VO vo, @RequestParam("lc_index") String lc_index,
				@RequestParam("m_index") String m_index, Model model) {
		
		vo.setLc_index(lc_index);
		vo.setM_index(m_index);
		
		
		try {
			if(service.myCourseSearch(vo) == true) {
				service.myCourseDelete(vo);
				model.addAttribute("search", "empty");
			}else {
				service.myCourseInsert(vo);
				model.addAttribute("search", "not_empty");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "LC/LC_003_1";
	}
	
	@RequestMapping(value="lc_myCourse_search")
	public String myCourse_Search(LC_003_1_VO vo, @RequestParam("lc_index") String lc_index,
			@RequestParam("m_index") String m_index, Model model) {
		
		vo.setLc_index(lc_index);
		vo.setM_index(m_index);
		
		try {
			if(service.myCourseSearch(vo) == true) {
				model.addAttribute("search", "not_empty");
			}else {
				model.addAttribute("search", "empty");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "LC/LC_003_1";
	}
	
	
	//like@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@ResponseBody
	@RequestMapping(value="/like", produces = "application/text; charset=utf8")
	public String like(LC_003_1_VO vo, GOOD_VO good_vo, HttpSession session) {
		
		if(member.getM_index() != null) {
			
			log.info("컨트롤러 like~~~~");
			
			//세션에 멤버 인덱스를 저장해야하지만  기능테스트를위해 임의로 인덱스 지정
			int good_check = 0;
			int good_cnt = 0;	
			
			JsonObject obj = new JsonObject();
			log.info("----------------------좋아요 -----------------------");
			
			member = (LO_001_VO) session.getAttribute("sessionVO");
			vo.setM_index(member.getM_index());
			vo.setLc_index(vo.getLc_index());
			
			//구글링에선 어레이리스트인데 스트링으로 해도될거같음
			//ArrayList<String> msgs = new ArrayList<String>();
			String msgs;
			HashMap<String,Object> hashmap = new HashMap<String,Object>();
			
			
			
			
			log.info("lc_index : "+vo.getLc_index());
			//hashmap에 게시판,멤버 index 저장
			hashmap.put("board_index", vo.getLc_index());
			hashmap.put("m_index", vo.getM_index());
			
			good_check = service.good_check(hashmap);
			good_cnt = service.good_cnt(hashmap);
			
			log.info(service.good_check(hashmap));
			
			//service.increse_good(hashMap);
	
			
			if(good_check == 0) {
			      msgs="좋아요!";
			      service.increse_good(hashmap);
			      good_check++;
			      good_cnt++;
	//		      boardProc.like_cnt_up(boardno);   //좋아요 갯수 증가
			    } else {
			      msgs="좋아요 취소";
			      service.decrese_good(hashmap);
			      good_check--;
			      good_cnt--;
			    }
	
			log.info("체크 : "+good_check);
			log.info("좋아요갯수 : "+good_cnt);
			log.info("메세지 : "+msgs);
			
			obj.addProperty("good_cnt", good_cnt);
			obj.addProperty("m_index", "admin");
			obj.addProperty("board", vo.getLc_index());
			obj.addProperty("good_check", good_check);
			obj.addProperty("msg",msgs);
		
			return obj.toString();
		}
		else {
			return null;
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="/like_check" , produces = "application/text; charset=utf8") //produces는 json을 보낼떄 한글이 꺠져서 encoding 맞춰주기위해서 사용
	public String like_check(LC_003_1_VO vo ,HttpSession session) {
		
		if(session.getAttribute("sessionVO") != null) {
			log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@좋아요 눌렀는지 확인하는 메소드 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			int good_check = 0;
			
			JsonObject obj = new JsonObject();
			HashMap<String,Object> hashMap = new HashMap<String,Object>();
			
			System.out.println("m_index = " + member.getM_index());
			
			hashMap.put("board_index", vo.getLc_index());
			hashMap.put("m_index",member.getM_index());
			
			good_check = service.good_check(hashMap);
			
			log.info("좋아요 체크 :"+ good_check);
			
			obj.addProperty("m_index", member.getM_index());
			obj.addProperty("board", vo.getLc_index());
			obj.addProperty("good_check", good_check);
			
			return obj.toString();
		}else {
			int good_check = 0;
			JsonObject obj = new JsonObject();
			
			obj.addProperty("good_check", good_check);
			return obj.toString();
		}
	}
	
	
}
