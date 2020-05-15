package vs.pr.pr_003_1.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

import vs.board.good.vo.GOOD_VO;
import vs.lo.lo_001.vo.LO_001_VO;
import vs.mb.mb_001_1.service.MB_service;
import vs.pr.pr_002_1.vo.Pr_002_1VO;
import vs.pr.pr_003_1.service.Pr_003_1_Service;

@Controller
@RequestMapping("/pr/*")
public class Pr_003_1_Controller {

	@Autowired
	private Pr_003_1_Service pr_service;
	@Autowired
	private MB_service service;
	//개인기록 상세보기
	@GetMapping("/pr_003_1")
	public String pr_detail(Model model,@RequestParam("pr_index") String pr_index,HttpServletRequest request,Pr_002_1VO prvo) {
		
		HttpSession session = request.getSession();
		LO_001_VO member = (LO_001_VO) session.getAttribute("sessionVO");
		Pr_002_1VO vo = service.upload(pr_index);
		model.addAttribute("lc_get", vo);
		model.addAttribute("data", pr_service.pr_detail(pr_index));
		model.addAttribute("member",member);
		if(member == null) {
			model.addAttribute("data",pr_service.pr_detail(pr_index));
			return "/pr/pr_003_1";
		}

		model.addAttribute("data",pr_service.pr_detail(pr_index));
		System.out.println("회원정보" + member);
			  
			//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		  pr_service.increse_see(prvo, session);
		  System.out.println("increse_service 실행완료------------------------------");
	      System.out.println(member.getM_index());
	      HashMap<String,Object> hashmap = new HashMap<String,Object>();
	      
	      hashmap.put("board_index", pr_index);
	      hashmap.put("m_index",  member.getM_index());
	      
	      System.out.println("난 빡빡이다. : "+hashmap.get("board_index"));
	      System.out.println("나는 쀅붺이다."+hashmap.get("m_index"));
	      System.out.println("지랄: " + prvo.getPr_index());
	      
	      if(member.getM_index() != null) {
	      //로그인 했을 경우에만 좋아요 체크. 없으면 에러남.
	         int row_check = pr_service.good_count(hashmap);
	         
	         if(row_check == 0) {
	            System.out.println("로우 생성중");
	            pr_service.good_insert(hashmap);
	            System.out.println("로우 생성완료");
	         }else {
	            System.out.println("로우가 이미 생성되어있음");
	         }
	      }else {
	    	  System.out.println("ㅇㅇㅇㅇㅇㅇㅇ");
	      }
	      //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	      
	      return "/pr/pr_003_1";	
	
	}
	//개인기록 수정폼
	@GetMapping("/pr_004_1")
	public void pr_updateform(Model model, @RequestParam("pr_index") String pr_index) {
		System.out.println("수정하기 폼");
		Pr_002_1VO vo = service.upload(pr_index);
		model.addAttribute("lc_get", vo);
		
	}
	//개인기록 수정
	@PostMapping("/update.do")
	public String pr_update(Pr_002_1VO vo) {
		System.out.println("안오는거야?1");

		pr_service.update(vo);
		System.out.println("ddddddddd : " + vo.getPr_index());
		return "redirect:/pr/pr_003_1?pr_index="+vo.getPr_index();
	}
	//개인기록 삭제
	@GetMapping("/pr_delete")
	public String cr_delete(@RequestParam("pr_index") String pr_index) {
		
		pr_service.pr_delete(pr_index);
		
		return "redirect:/pr/pr_002_1";
		
	}
	
	
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		 //like@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		  @ResponseBody
			@RequestMapping(value="/like", produces = "application/text; charset=utf8")
			public String like(Pr_002_1VO vo, GOOD_VO good_vo, HttpSession session) {
				
			   LO_001_VO member = (LO_001_VO) session.getAttribute("sessionVO");
				System.out.println("컨트롤러 like~~~~");
				
				//세션에 멤버 인덱스를 저장해야하지만  기능테스트를위해 임의로 인덱스 지정
				int good_check = 0;
				int good_cnt = 0;	
				
				JsonObject obj = new JsonObject();
				System.out.println("----------------------좋아요 -----------------------");
				
				//구글링에선 어레이리스트인데 스트링으로 해도될거같음
				//ArrayList<String> msgs = new ArrayList<String>();
				String msgs;
				HashMap<String,Object> hashmap = new HashMap<String,Object>();
				
				if(member == null) {
					obj.addProperty("msg", "no");
					return obj.toString();
				}else {
				
				
				System.out.println("like : cr_index : "+vo.getPr_index());
				System.out.println("로그인 회원 인덱스 : " +member.getM_index());
				//hashmap에 게시판,멤버 index 저장
				hashmap.put("board_index", vo.getPr_index());
				hashmap.put("m_index", member.getM_index());
				System.out.println(hashmap);
				good_check = pr_service.good_check(hashmap);
				good_cnt = pr_service.good_cnt(hashmap);
				
				System.out.println("good_check : " + pr_service.good_check(hashmap));
				
				//service.increse_good(hashMap);

				
				if(good_check == 0) {
				      msgs="좋아요!";
//				      liketoProc.like_check(hashMap);
				      pr_service.increse_good(hashmap);
				      good_check++;
				      good_cnt++;
//				      boardProc.like_cnt_up(boardno);   //좋아요 갯수 증가
				    } else {
				      msgs="좋아요 취소";
//				      liketoProc.like_check_cancel(hashmap);
				      pr_service.decrese_good(hashmap);
				      good_check--;
				      good_cnt--;
//				      boardProc.like_cnt_down(boardno);   //좋아요 갯수 감소
				    }
				
//				    obj.put("boardno", liketoVO.getBoardno());
//				    obj.put("like_check", like_check);
//				    obj.put("like_cnt", like_cnt);
//				    obj.put("msg", msgs);

				System.out.println("체크 : "+good_check);
				System.out.println("좋아요갯수 : "+good_cnt);
				System.out.println("메세지 : "+msgs);
				
				obj.addProperty("good_cnt", good_cnt);
				obj.addProperty("m_index", member.getM_index());
				obj.addProperty("board", vo.getPr_index());
				obj.addProperty("good_check", good_check);
				obj.addProperty("msg",msgs);
				
				/*
				 * int like_cnt = vo.getLi_good(); int like_check = 0; like_check =
				 * service.increse_good(hashMap);
				 * 
				 * 
				 * System.out.println(vo.getLi_index()); obj.addProperty("hi", "hi");
				 */
			
				return obj.toString();
				}
			}
			
			
			@ResponseBody
			@RequestMapping(value="/like_check" , produces = "application/text; charset=utf8") //produces는 json을 보낼떄 한글이 꺠져서 encoding 맞춰주기위해서 사용
			public String like_check(Pr_002_1VO vo ,HttpSession session) {
				System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@좋아요 눌렀는지 확인하는 메소드 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				LO_001_VO member = (LO_001_VO) session.getAttribute("sessionVO");
				int good_check = 0;
				
				if(member != null) {
					
				
				JsonObject obj = new JsonObject();
				HashMap<String,Object> hashMap = new HashMap<String,Object>();
				
				hashMap.put("board_index", vo.getPr_index());
				hashMap.put("m_index",member.getM_index());
				System.out.println("로그인 회원 아이디 확인 : " +member.getM_index());
				good_check = pr_service.good_check(hashMap);
				
				System.out.println("좋아요 체크 :"+ good_check);
				
				obj.addProperty("m_index", member.getM_index());
				obj.addProperty("board", vo.getPr_index());
				obj.addProperty("good_check", good_check);
				
				return obj.toString();
				
				}else {
					return null;
				}
				
			}
}
