package vs.mb.mb_001_1.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.board.good.vo.GOOD_VO;
import vs.lc.lc_002_1.service.LC_002_1_Service;
import vs.lc.lc_002_1.vo.Criteria;
import vs.lc.lc_002_1.vo.LC_002_1_VO;
import vs.lc.lc_003_1.service.LC_003_1_Service;
import vs.lc.lc_003_1.vo.LC_003_1_VO;
import vs.lo.lo_001.controller.MemberLoginInterceptor;
import vs.lo.lo_001.service.LO_001_Service;
import vs.lo.lo_001.vo.LO_001_VO;
import vs.mb.mb_001_1.service.MB_service;
import vs.mb.mb_001_1.vo.PR_VO;
import vs.mp.mp_001.dto.Page_DTO;
import vs.mp.mp_001.service.MP_001_Service;
import vs.mp.mp_001.vo.MP_001_3_VO;
import vs.pr.pr_002_1.vo.Pr_002_1VO;
import vs.pr.pr_002_1.vo.Upload_pr_vo;
import vs.pr.pr_003_1.service.Pr_003_1_Service;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/mb/*")
public class MB_controller {

	private MB_service service;
	LO_001_Service LO_Service;
	
	
	private LC_002_1_Service lc_002_1_service;
	
	private LO_001_VO member;
	private LC_003_1_VO lc_003_1_vo;
	private LC_003_1_Service lc_003_1_service;
	private MP_001_Service mp_001_service;
	
	private Pr_003_1_Service pr_service;
	
	
	@RequestMapping(value="/mb_001_1")
	public  ModelAndView MB_001_1 (HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("login page");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mb/mb_001_1");
		return mav;
	}
	@RequestMapping("/mb_003_1")
	public void mb_003_1(HttpSession session,Model model) {
		log.info("--------------------------------모바일 홈 페이지 mobile home------------------------------");

		member = (LO_001_VO) session.getAttribute("sessionVO");
		
		model.addAttribute("member",member);

	}
	
	@RequestMapping("/mb_004_1")
	public void mb_004_1(HttpSession session, @RequestParam String lc_index,Model model) {
		log.info("--------------------------------기록 측정 페이지 record page------------------------------");
		session.setAttribute("session_lc_index", lc_index);
		log.info("세션 lc_index : "+session.getAttribute("session_lc_index"));
		
		member = (LO_001_VO) session.getAttribute("sessionVO");
		
		LC_003_1_VO vo = service.getLC(lc_index);
		vo.setLc_index(lc_index);
		vo.setM_index(member.getM_index());
		
		System.out.println("vo : " + vo);
		
		model.addAttribute("vo",vo);
		
	}
	@RequestMapping("/mb_005_1")
	public void mb_005_1() {
		log.info("--------------------------------코스 변경 페이지 cours page------------------------------");
	}
	
	@ResponseBody
	@RequestMapping("/list")
	public List<MP_001_3_VO> list(HttpSession session,@ModelAttribute Page_DTO dto) {
		log.info("--------------------------------list------------------------------");
		
		member = (LO_001_VO) session.getAttribute("sessionVO");
		
		dto.setM_index(member.getM_index());
		List<MP_001_3_VO> listVO = mp_001_service.getMCListApp(dto);
		return listVO;
	}
	
	@ResponseBody
	@RequestMapping("/load")
	public LC_003_1_VO main(String[] args, HttpSession session) {
		
		String lc_index = (String) session.getAttribute("session_lc_index");
		
		log.info("코스 인덱스 : "+lc_index);
		
		System.out.println("컨트롤러 단에서 번호는 : " + lc_index);
		
		LC_003_1_VO vo = service.getLC(lc_index);
		
		return vo;
	}
	
	@ResponseBody
	@RequestMapping("/courselist")
	public List<LC_003_1_VO> list(String lc_index){

		return service.get_CourseList();
	}
	
	@ResponseBody
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public String login(LO_001_VO LO_vo, HttpServletRequest request, HttpServletResponse response,Model model){
		
		System.out.println("id : "+LO_vo.getM_id());
		System.out.println("pw : "+LO_vo.getM_pw());
		Boolean check = false;
		String msg = "";
		
		check = service.login(LO_vo);

		//세션 생성
		HttpSession session = request.getSession();
			

		
		if(check) {
			
			//lo 로그인 소스 긁어왔음
			List<LO_001_VO> list = LO_Service.login(LO_vo);
			LO_vo = list.get(0);
			session.setAttribute("sessionVO", LO_vo);
			
			msg = "ok";
				log.info("로그인 성공");
		}else {
			
			//model.addAttribute("msg", "fail");
			msg = "fail";
			log.info("로그인실패");
		}
		return msg;
	}
	
	
	//앱에서 개인기록 보여주는 페이지 (기록 불러오기)
	@ResponseBody
	@RequestMapping(value="/mb_007_1")
	public  ModelAndView mb_006_1 (HttpServletRequest request, HttpServletResponse response) 
			throws JsonProcessingException  {
			log.info("app/myCourse/detail");
			HttpSession session = request.getSession();
			ModelAndView mav = new ModelAndView();
			LO_001_VO loVo = new LO_001_VO();
			String m_index = "";
			
			//세션 주입 (m_index : 멤버번호)
			if(session.getAttribute("sessionVO")==null) {
				log.info("session null! : "+session.getAttribute("sessionVO"));
			}else {
				loVo = (LO_001_VO) session.getAttribute("sessionVO");
				m_index = loVo.getM_index();
				log.info(m_index);
			}
			
			List<Map<String,String>> list = service.getMyRecordList(m_index);
			log.info(list);
			
			mav.addObject("list", list);
			mav.setViewName("/mb/mb_007_1");
			log.info("/mb/mb_007_1 view완료");
			return mav;
	}
	
	
	@RequestMapping(value="/mb_007_1/sort", method = RequestMethod.POST, produces = "application/text;charset=utf8")
	@ResponseBody
	public  String mb_006_1_sort (@RequestParam("searchType")String searchType, 
			@RequestParam("m_index")String m_index, @RequestParam("sort")String sort,
			HttpServletRequest request, HttpServletResponse response) 
			throws JsonProcessingException  {
		log.info("app/myCourse/detail-ajax "+searchType);
		log.info("app/myCourse/detail-ajax "+sort);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_index", m_index);
		map.put("searchType", searchType);
		map.put("sort", sort);
		List<Map<String,String>> list = service.getMyRecordListSort(map);
		
		log.info(list);
		String jsonStr = new ObjectMapper().writeValueAsString(list);
		//글자 인코딩 설정 (JSON 파싱) //이거보단 위의 produce로 해결된 듯 혹은 둘 다 일 수도.
		try {
			jsonStr = URLDecoder.decode(jsonStr, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			log.info("json parsing error");
		}
		return jsonStr;
	}
	
	
	//모바일 로그아웃
	@RequestMapping(value="/logout")
	public  ModelAndView Logout (HttpSession session, 
			HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		log.info("로그아웃 컨트롤러");
			System.out.println("logout page");
			ModelAndView mav = new ModelAndView();
			mav.setViewName("mb/mb_001_1");
			session.removeAttribute("sessionVO");
			System.out.println("session : "+session.getAttribute("sessionVO"));
		
		return mav;
	}

	@RequestMapping("/lc_002_1")
	public void lc_list(Criteria cri, Model model,HttpServletRequest request) {
		cri.setAmount(10000);
		List<LC_002_1_VO> listVO = lc_002_1_service.getList(cri);
		List<LC_002_1_VO> listGood = lc_002_1_service.getGood(cri);
		
		//리스트 썸네일 인코딩, 디코딩 작업.
		for(int i = 0; i < listVO.size(); i++) {
			
			LC_002_1_VO vo = listVO.get(i);
			
			if(vo.getLc_thumbnail() != null) {
				
				byte[] imageContent = Base64.getEncoder().encode(vo.getLc_thumbnail());
				
				//System.out.println("대체 뭐야........" + imageContent);
				String thumbnail = new String(imageContent);
				
				//System.out.println(thumbnail);
			
				vo.setLc_request(thumbnail);
			// model.addAttribute("thumbnail"+i, thumbnail);
			}else {
				vo.setLc_request("");
			}
		}
		
		//추천수 썸네일 인코딩, 디코딩 작업.
		for(int i = 0; i < listGood.size(); i++) {
			
			LC_002_1_VO vo = listGood.get(i);
			
			if(vo.getLc_thumbnail() != null) {
				
				byte[] imageContent = Base64.getEncoder().encode(vo.getLc_thumbnail());
				
				//System.out.println("대체 뭐야........" + imageContent);
				String thumbnail = new String(imageContent);
				
				//System.out.println(thumbnail);
			
				vo.setLc_request(thumbnail);
			// model.addAttribute("thumbnail"+i, thumbnail);
			}else {
				vo.setLc_request("");
			}
		}
		
		
		if(cri.getType() == null) {
			model.addAttribute("lc_good", listGood);
		}else if(!(cri.getType().equals("normal"))) {
			model.addAttribute("lc_good", listGood);
		}
		
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("sessionVO") != null) {
			LO_001_VO vo = (LO_001_VO) session.getAttribute("sessionVO");
			model.addAttribute("m_index", vo.getM_index());
			model.addAttribute("sessionVO", session.getAttribute("sessionVO"));
		}
		model.addAttribute("type",listVO.get(0).getLc_type());
		model.addAttribute("lc_list", listVO);
		
	}
	
	@RequestMapping("/lc_get")
	public String getLC(@RequestParam("lc_index") String lc_index, Model model,
			@ModelAttribute("cri") Criteria cri, HttpServletRequest request, HttpServletResponse response)
		throws Exception{
	
	System.out.println("번호는:????? " + lc_index);
	System.out.println("검색어 : ??????" + cri.getKeyword());
	
	HttpSession session = request.getSession();
	
	System.out.println(session.getAttribute("sessionVO"));
	
	lc_003_1_vo.setLc_index(lc_index);
	
	//관심코스 등록되있는지 확인.
	if(session.getAttribute("sessionVO") != null) {
		
		member = (LO_001_VO) session.getAttribute("sessionVO");
		lc_003_1_vo.setM_index(member.getM_index());
		
		System.out.println("관심코스를 위한 회원 번호 : " + lc_003_1_vo.getM_index());
		System.out.println("관심코스를 위한 게시글 번호 : " + lc_003_1_vo.getLc_index());
		
		if(lc_003_1_service.myCourseSearch(lc_003_1_vo) == true) {
			model.addAttribute("search", "not_empty");
		}else {
			model.addAttribute("search", "empty");
		}

		model.addAttribute("member", session.getAttribute("sessionVO"));
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	lc_003_1_service.increse_see(lc_003_1_vo, session);
	log.info("increse_service 실행완료------------------------------");
	
	HashMap<String,Object> hashmap = new HashMap<String,Object>();
	
	hashmap.put("board_index", lc_index);
	hashmap.put("m_index",  lc_003_1_vo.getM_index());
	
	log.info("난 빡빡이다. : "+hashmap.get("board_index"));
	//log.info("나는 쀅붺이다."+hashmap.get("m_index"));
	log.info("지랄: " + lc_003_1_vo.getLc_index());
	
	//로그인 했을 경우에만 좋아요 체크. 없으면 에러남.
	if(member.getM_index() != null) {
		int row_check = lc_003_1_service.good_count(hashmap);
		
		if(row_check == 0) {
			log.info("로우 생성중");
			lc_003_1_service.good_insert(hashmap);
			log.info("로우 생성완료");
		}else {
			log.info("로우가 이미 생성되어있음");
		}
	}
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	model.addAttribute("lc_get",lc_003_1_service.getLC(lc_index));
	return "mb/lc_003_1";

}

	//like@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@ResponseBody
	@RequestMapping(value="/like", produces = "application/text; charset=utf8")
	public String like(LC_003_1_VO vo, GOOD_VO good_vo, HttpSession session) {
		member = (LO_001_VO) session.getAttribute("sessionVO");
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
			
			good_check = lc_003_1_service.good_check(hashmap);
			good_cnt = lc_003_1_service.good_cnt(hashmap);
			
			log.info(lc_003_1_service.good_check(hashmap));
			
			//service.increse_good(hashMap);
	
			
			if(good_check == 0) {
			      msgs="좋아요!";
			      lc_003_1_service.increse_good(hashmap);
			      good_check++;
			      good_cnt++;
	//		      boardProc.like_cnt_up(boardno);   //좋아요 갯수 증가
			    } else {
			      msgs="좋아요 취소";
			      lc_003_1_service.decrese_good(hashmap);
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
		member = (LO_001_VO) session.getAttribute("sessionVO");
		if(member.getM_index() != null) {
			log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@좋아요 눌렀는지 확인하는 메소드 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			int good_check = 0;
			
			JsonObject obj = new JsonObject();
			HashMap<String,Object> hashMap = new HashMap<String,Object>();
			
			System.out.println("m_index = " + member.getM_index());
			
			hashMap.put("board_index", vo.getLc_index());
			hashMap.put("m_index",member.getM_index());
			
			good_check = lc_003_1_service.good_check(hashMap);
			
			log.info("좋아요 체크 :"+ good_check);
			log.info("회원 : "+member.getM_index());
			log.info("게시물 : "+vo.getLc_index());
			
			obj.addProperty("m_index", member.getM_index());
			obj.addProperty("board", vo.getLc_index());
			obj.addProperty("good_check", good_check);
			log.info("good_췤"+good_check);
			
			return obj.toString();
		}else {
			return null;
		}
	}
	
	@RequestMapping(value="/myCourse")
	public  ModelAndView m_MP_001_3 (@ModelAttribute Page_DTO dto,
			HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		MemberLoginInterceptor login = new MemberLoginInterceptor();
		dto.setAmount(1000);
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		login.preHandle(request, response, session);
		member = (LO_001_VO) session.getAttribute("sessionVO");
		log.info("mp myCourse mapping +mp_index is :" +dto.getLc_index()+" "+dto.getM_index());
		
		if(session.getAttribute("sessionVO")==null) {
			log.info("session null! : "+session.getAttribute("sessionVO"));
		}else {
			dto.setM_index(member.getM_index());
			List<MP_001_3_VO> list = mp_001_service.getMCListApp(dto);
			mav.addObject("list", list);
			log.info("list : "+list);
			
			log.info("mb_006_1 mav완료");
		}
		
		mav.setViewName("/mb/mb_006_1");
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/regist")
	public void regist(@RequestParam("lc_index")String lc_index, @RequestParam("m_index")String m_index, 
			@RequestParam("time") String time, @RequestParam("lc_title")String lc_title, @RequestParam("lc_type")String lc_type, PR_VO pr_vo) {
		
		pr_vo.setM_index(m_index);
		pr_vo.setLc_index(lc_index);
		pr_vo.setPr_record(time);
		pr_vo.setLc_title(lc_title);
		pr_vo.setPr_public("0");
		pr_vo.setPr_type(lc_type);
		
		service.regist(pr_vo);
		
	}
	//모바일 정보처리 방침
	@RequestMapping("/mobile_info")
	public String mobile(){
		log.info("개인정보처리방침 페이지");
		return "/mb/member_info";
	}
	
	
	@RequestMapping("/upload")
	public String upload(HttpSession session, @RequestParam String pr_index,Model model){
		log.info("업로드 페이지");
		log.info("기록 게시글 인덱스 : "+pr_index);
		Pr_002_1VO vo = service.upload(pr_index);
		model.addAttribute("lc_get", vo);
		log.info("기록 업로드에서 LC_INDEX : "+vo.getLc_index());
		return "/mb/mb_008_1";
	}
	
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public String update(Upload_pr_vo vo,Model model) {
		service.update1(vo);
		
		Map<String, Object> hmap = new HashMap<String, Object>();

		try {
			hmap.put("pr_thumbnail", vo.getPr_thumbnail().getBytes());
			hmap.put("pr_index",vo.getPr_index());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		service.update2(hmap);
		
		//리스트뿌려주기
		model.addAttribute("data", service.pr_list());
		
		return "/mb/mb_010_1";
	}
	
	
	@RequestMapping("/pr_list")
	public String pr_list(Model model) {
		
		model.addAttribute("data", service.pr_list());
	
		return "/mb/mb_010_1";
	}
	
	@RequestMapping("/pr_003_1")
	public void move_pr_003(Model model,@RequestParam String pr_index,HttpSession session) {
		
		model.addAttribute("data",service.upload(pr_index));
		Pr_002_1VO vo =new Pr_002_1VO();
		vo.setPr_index(pr_index);
		
		//좋아요 조회수 소스
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		  pr_service.increse_see(vo, session);
		  System.out.println("increse_service 실행완료------------------------------");
	      System.out.println(member.getM_index());
	      HashMap<String,Object> hashmap = new HashMap<String,Object>();
	      
	      hashmap.put("board_index", pr_index);
	      hashmap.put("m_index",  member.getM_index());
	      
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
	      
		
	}
	
}
