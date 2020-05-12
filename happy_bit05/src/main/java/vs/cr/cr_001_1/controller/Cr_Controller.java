package vs.cr.cr_001_1.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import vs.co.co_001_1.dto.Page_DTO;
import vs.co.co_001_1.service.Co_Service;
import vs.co.co_001_1.vo.PageUtil;
import vs.cr.cr_001_1.service.Cr_Service;
import vs.cr.cr_001_1.vo.CrVO;
import vs.li.li_001_01.vo.LI_VO;
import vs.lo.lo_001.vo.LO_001_VO;

@Controller
@RequestMapping("/cr/*")
public class Cr_Controller {

	@Autowired
	private Cr_Service cr_service;
	@Autowired
	private Co_Service co_service;

	
	//대회 후기 리스트
	@GetMapping("cr_001_1")
	public void cr_List(Model model, Page_DTO dto) throws Exception {
		
		dto.setAmount(10);
		
		model.addAttribute("data", cr_service.Cr_List(dto));
		model.addAttribute("pageUtil",new PageUtil(dto,cr_service.get_total(dto)));
		model.addAttribute("type",dto.getTypeArr());
		model.addAttribute("page", dto.getPage());
		
		
	}
	//대회 후기 작성폼이동
	@GetMapping("cr_002_1")
	public void cr_register(Model model) {
		//대회 리스트 출력
		model.addAttribute("data",cr_service.co_list());
		
	}
	
	//대회 후기 작성
	@PostMapping("/cr_002_1")
	public String cr_insert(CrVO crvo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		LO_001_VO vo = (LO_001_VO) session.getAttribute("sessionVO");
		System.out.println("aaaaaaaaaaaa"+vo);
		crvo.setM_index(vo.getM_index());
		crvo.setM_nickname(vo.getM_nickName());
		cr_service.cr_insert(crvo);
		
		return "redirect:/cr/cr_001_1";
	}
	
	
	//대회 후기 상세보기
	@GetMapping("/cr_003_1")
	public String cr_detail(CrVO crvo,Model model,@RequestParam("co_r_index") String co_r_index,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		LO_001_VO member = (LO_001_VO) session.getAttribute("sessionVO");
		
		if(member == null) {
			model.addAttribute("data",cr_service.cr_detail(co_r_index));
			return "/cr/cr_003_1";
		}

		model.addAttribute("data",cr_service.cr_detail(co_r_index));
		model.addAttribute("member",member);
		System.out.println("회원정보" + member);
			
			//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	      cr_service.increse_see(crvo, session);
	      System.out.println("increse_service 실행완료------------------------------");
	      System.out.println(member.getM_index());
	      HashMap<String,Object> hashmap = new HashMap<String,Object>();
	      
	      hashmap.put("board_index", co_r_index);
	      hashmap.put("m_index",  member.getM_index());
	      
	      System.out.println("난 빡빡이다. : "+hashmap.get("board_index"));
	      System.out.println("나는 쀅붺이다."+hashmap.get("m_index"));
	      System.out.println("지랄: " + crvo.getCo_r_index());
	      
	      if(member.getM_index() != null) {
	      //로그인 했을 경우에만 좋아요 체크. 없으면 에러남.
	         int row_check = cr_service.good_count(hashmap);
	         
	         if(row_check == 0) {
	            System.out.println("로우 생성중");
	            cr_service.good_insert(hashmap);
	            System.out.println("로우 생성완료");
	         }else {
	            System.out.println("로우가 이미 생성되어있음");
	         }
	      }else {
	    	  System.out.println("ㅇㅇㅇㅇㅇㅇㅇ");
	      }
	      System.out.println("닉네임 : " +crvo.getM_nickname());  
	      return "/cr/cr_003_1";
		}
		
	
	
		
		
	
	//대회 후기 수정폼
	@GetMapping("/cr_004_1")
	public void cr_update(CrVO crvo,Model model,@RequestParam("co_r_index") String co_r_index) throws Exception	{
		
		model.addAttribute("data", cr_service.cr_detail(co_r_index));
		
	}
	
	//대회 후기 삭제
	@GetMapping("/cr_delete")
	public String cr_delete(@RequestParam("co_r_index") String cr_index) {
		
		cr_service.cr_delete(cr_index);
		
		return "redirect:/cr/cr_001_1";
		
	}
	
	//대회 후기 수정
	@PostMapping("/cr_004_1.do")
	public String cr_update(CrVO crvo) {
		
		cr_service.cr_update(crvo);
		
		return "redirect:/cr/cr_001_1";
	}
	
	
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	 //like@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	  @ResponseBody
		@RequestMapping(value="/like", produces = "application/text; charset=utf8")
		public String like(CrVO vo, GOOD_VO good_vo, HttpSession session) {
			
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
			
			
			System.out.println("like : cr_index : "+vo.getCo_r_index());
			System.out.println("로그인 회원 인덱스 : " +member.getM_index());
			//hashmap에 게시판,멤버 index 저장
			hashmap.put("board_index", vo.getCo_r_index());
			hashmap.put("m_index", member.getM_index());
			System.out.println(hashmap);
			good_check = cr_service.good_check(hashmap);
			good_cnt = cr_service.good_cnt(hashmap);
			
			System.out.println("good_check : " + cr_service.good_check(hashmap));
			
			//service.increse_good(hashMap);

			
			if(good_check == 0) {
			      msgs="좋아요!";
//			      liketoProc.like_check(hashMap);
			      cr_service.increse_good(hashmap);
			      good_check++;
			      good_cnt++;
//			      boardProc.like_cnt_up(boardno);   //좋아요 갯수 증가
			    } else {
			      msgs="좋아요 취소";
//			      liketoProc.like_check_cancel(hashmap);
			      cr_service.decrese_good(hashmap);
			      good_check--;
			      good_cnt--;
//			      boardProc.like_cnt_down(boardno);   //좋아요 갯수 감소
			    }
			
//			    obj.put("boardno", liketoVO.getBoardno());
//			    obj.put("like_check", like_check);
//			    obj.put("like_cnt", like_cnt);
//			    obj.put("msg", msgs);

			System.out.println("체크 : "+good_check);
			System.out.println("좋아요갯수 : "+good_cnt);
			System.out.println("메세지 : "+msgs);
			
			obj.addProperty("good_cnt", good_cnt);
			obj.addProperty("m_index", member.getM_index());
			obj.addProperty("board", vo.getCo_r_index());
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
		public String like_check(CrVO vo ,HttpSession session) {
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@좋아요 눌렀는지 확인하는 메소드 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			LO_001_VO member = (LO_001_VO) session.getAttribute("sessionVO");
			int good_check = 0;
			
			if(member != null) {
				
			
			JsonObject obj = new JsonObject();
			HashMap<String,Object> hashMap = new HashMap<String,Object>();
			
			hashMap.put("board_index", vo.getCo_r_index());
			hashMap.put("m_index",member.getM_index());
			System.out.println("로그인 회원 아이디 확인 : " +member.getM_index());
			good_check = cr_service.good_check(hashMap);
			
			System.out.println("좋아요 체크 :"+ good_check);
			
			obj.addProperty("m_index", member.getM_index());
			obj.addProperty("board", vo.getCo_r_index());
			obj.addProperty("good_check", good_check);
			
			return obj.toString();
			
			}else {
				return null;
			}
			
		}
		
	
	
	
	
}
