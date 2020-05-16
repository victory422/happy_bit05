package vs.co.co_001_1.controller;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;

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
import com.ibleaders.utility.ib_json.JSONObject;

import lombok.extern.log4j.Log4j;
import vs.ac.ac_001_1.vo.AcVO;
import vs.board.good.vo.GOOD_VO;
import vs.co.co_001_1.dto.Page_DTO;
import vs.co.co_001_1.service.Co_Service;
import vs.co.co_001_1.vo.CoVO;
import vs.co.co_001_1.vo.PageUtil;
import vs.cr.cr_001_1.vo.CrVO;
import vs.lo.lo_001.vo.LO_001_VO;

@Controller
@RequestMapping("/co/*")
public class Co_Controller {
	
	@Autowired
	private Co_Service co_service;
	
	@GetMapping(value="/co_003_1")
	public void co_List(Model model,Page_DTO dto) throws Exception{
		
		List<AcVO> acvo = co_service.co_List(dto);
		//리스트 썸네일 인코딩, 디코딩 작업.
        for(int i = 0; i < acvo.size(); i++) {
           
           AcVO vo = acvo.get(i);
            
           if(vo.getCo_thumbnail() != null) {
              
              byte[] imageContent = Base64.getEncoder().encode(vo.getCo_thumbnail());
              
              //System.out.println("대체 뭐야........" + imageContent);
              String thumbnail = new String(imageContent);
              
              System.out.println(vo.getCo_request() + "ㅇㅇㅇㅇㅇ");	
              //System.out.println(thumbnail);
           
              vo.setCo_request(thumbnail);
           // model.addAttribute("thumbnail"+i, thumbnail);
           }else {
              vo.setCo_request("");
           }
        }

		System.out.println(dto.getType());
		
		System.out.println("와와오아ㅗ아" + new PageUtil(dto,co_service.get_total(dto)));
		
		model.addAttribute("data", acvo);
		model.addAttribute("pageUtil",new PageUtil(dto,co_service.get_total(dto)));
		model.addAttribute("type",dto.getTypeArr());
		model.addAttribute("page", dto.getPage());
		System.out.println("page : " + dto.getPage());
		System.out.println("Amount : " + dto.getAmount());
		

		for(int i= 0; i<dto.getTypeArr().length; i++) {
		model.addAttribute("type"+i,dto.getTypeArr()[i]);
		}
		
	}
	 //대회 상세페이지
	@GetMapping("/co_004_1")
	public String co_detail(Model model,AcVO acvo, @RequestParam("co_b_index") String co_b_index,HttpServletRequest request) {

		System.out.println("대회 상세페이지  index" + co_b_index);
		
		HttpSession session = request.getSession();
		LO_001_VO member = (LO_001_VO) session.getAttribute("sessionVO");
		if(member == null) {
			model.addAttribute("data", co_service.co_detail(co_b_index));
			return "/co/co_004_1";
		}

		model.addAttribute("data",co_service.co_detail(co_b_index));
		model.addAttribute("member",member);
		
		System.out.println("회원정보" + member);
			 
			//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	      co_service.increse_see(acvo, session);
	      System.out.println("increse_service 실행완료------------------------------");
	      System.out.println(member.getM_index());
	      HashMap<String,Object> hashmap = new HashMap<String,Object>();
	      
	      hashmap.put("board_index", co_b_index);
	      hashmap.put("m_index",  member.getM_index());
	      
	      System.out.println("난 빡빡이다. : "+hashmap.get("board_index"));
	      System.out.println("나는 쀅붺이다."+hashmap.get("m_index"));
	      System.out.println("지랄: " + acvo.getCo_b_index());
	      
	      if(member.getM_index() != null) {
	      //로그인 했을 경우에만 좋아요 체크. 없으면 에러남.
	         int row_check = co_service.good_count(hashmap);
	         
	         if(row_check == 0) {
	            System.out.println("로우 생성중");
	            co_service.good_insert(hashmap);
	            System.out.println("로우 생성완료");
	         }else {
	            System.out.println("로우가 이미 생성되어있음");
	         }
	      }else {
	    	  System.out.println("ㅇㅇㅇㅇㅇㅇㅇ");
	      }
	      //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	      
	      return "/co/co_004_1";
	}
	
	//대회 접수 페이지
	@GetMapping("/co_001_1")
	public void co_001_1_view(Model model, @RequestParam("co_b_index") String co_b_index,HttpServletRequest request) throws Exception {
		System.out.println("대회 신청서 페이지");
		System.out.println(co_b_index);

		HttpSession session = request.getSession();
		LO_001_VO member = (LO_001_VO) session.getAttribute("sessionVO");
		if(member == null) {
		model.addAttribute("data", co_service.ap_list(co_b_index));
		}
		System.out.println("로그인 정보 : " + member);
		model.addAttribute("data", co_service.ap_list(co_b_index));
		model.addAttribute("member",member);
	} 
	
	
	//대회 접수
		@PostMapping("/ap_001_1")
		public String ap_insert(CoVO covo, HttpServletRequest request, HttpServletResponse response) throws Exception {
			HttpSession session = request.getSession();
			LO_001_VO vo = (LO_001_VO) session.getAttribute("sessionVO");
			
			System.out.println("aaaaaaaaaaaa"+vo);
			System.out.println(covo.getCo_area());
			System.out.println(covo.getCo_m_event() + "기념품");
			System.out.println("대회 번호 : " + covo.getCo_b_index());
			
			covo.setCo_b_index(covo.getCo_b_index());
			covo.setM_index(vo.getM_index());
			
			co_service.ap_insert(covo);
			
			return "redirect:/co/co_003_1?test1=1";
		}		
	
	
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		 //like@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		  @ResponseBody
			@RequestMapping(value="/like", produces = "application/text; charset=utf8")
			public String like(AcVO vo, GOOD_VO good_vo, HttpSession session) {
				
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
				
				
				System.out.println("like : cr_index : "+vo.getCo_b_index());
				System.out.println("로그인 회원 인덱스 : " +member.getM_index());
				//hashmap에 게시판,멤버 index 저장
				hashmap.put("board_index", vo.getCo_b_index());
				hashmap.put("m_index", member.getM_index());
				System.out.println(hashmap);
				good_check = co_service.good_check(hashmap);
				good_cnt = co_service.good_cnt(hashmap);
				
				System.out.println("good_check : " + co_service.good_check(hashmap));
				
				//service.increse_good(hashMap);

				
				if(good_check == 0) {
				      msgs="좋아요!";
//				      liketoProc.like_check(hashMap);
				      co_service.increse_good(hashmap);
				      good_check++;
				      good_cnt++;
//				      boardProc.like_cnt_up(boardno);   //좋아요 갯수 증가
				    } else {
				      msgs="좋아요 취소";
//				      liketoProc.like_check_cancel(hashmap);
				      co_service.decrese_good(hashmap);
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
				obj.addProperty("board", vo.getCo_b_index());
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
			public String like_check(AcVO vo ,HttpSession session) {
				System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@좋아요 눌렀는지 확인하는 메소드 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				LO_001_VO member = (LO_001_VO) session.getAttribute("sessionVO");
				int good_check = 0;
				
				if(member != null) {
					
				
				JsonObject obj = new JsonObject();
				HashMap<String,Object> hashMap = new HashMap<String,Object>();
				
				hashMap.put("board_index", vo.getCo_b_index());
				hashMap.put("m_index",member.getM_index());
				System.out.println("로그인 회원 아이디 확인 : " +member.getM_index());
				good_check = co_service.good_check(hashMap);
				
				System.out.println("좋아요 체크 :"+ good_check);
				
				obj.addProperty("m_index", member.getM_index());
				obj.addProperty("board", vo.getCo_b_index());
				obj.addProperty("good_check", good_check);
				
				return obj.toString();
				
				}else {
					return null;
				}
				
			}
}
