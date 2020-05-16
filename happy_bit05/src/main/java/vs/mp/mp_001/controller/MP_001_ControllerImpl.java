package vs.mp.mp_001.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j;
import vs.ac.ac_001_1.vo.AcVO;
import vs.co.co_001_1.service.Co_Service;
import vs.lo.lo_001.controller.MemberLoginInterceptor;
import vs.lo.lo_001.service.LO_001_Service;
import vs.lo.lo_001.vo.LO_001_VO;
import vs.mp.mp_001.dto.Page_DTO;
import vs.mp.mp_001.service.MP_001_Service;
import vs.mp.mp_001.vo.MP_001_3_VO;
import vs.mp.mp_001.vo.PageUtil;
import vs.ms.ms_001.vo.MS_001_VO;

@Controller
@Log4j
public class MP_001_ControllerImpl implements MP_001_Controller {
	
	private static final int ResponseEntity = 0;
	@Autowired
	private MP_001_Service service;
	private PageUtil pageutil;
	private LO_001_VO sessionVO;
	MemberLoginInterceptor login = new MemberLoginInterceptor();
	private LO_001_Service LOservice;
	private Page_DTO dto;
	private Co_Service co_service;
	
	@Override
	@RequestMapping(value="/mp")
	public  ModelAndView MP_001_1 (HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("mp MYpage mapping");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		login.preHandle(request, response, session);
		Page_DTO dto = new Page_DTO();
		List<MP_001_3_VO> listVO = new ArrayList<MP_001_3_VO>();
		sessionVO = (LO_001_VO) session.getAttribute("sessionVO");
		log.info(sessionVO);
		
		try {
			//썸네일 주입
			if(sessionVO.getRequest_thumbnail() != null) {
				byte[] imageContent = Base64.getEncoder().encode(sessionVO.getRequest_thumbnail());
				String thumbnail = new String(imageContent);
				sessionVO.setM_picture(thumbnail);
				log.info("m_index : "+sessionVO.getM_index());
	
				//나의 관심코스 리스트
				dto.setM_index(sessionVO.getM_index());
				listVO = service.getMCList(dto);
				mav.addObject("listVO", listVO);
				
				//나의 대회 리스트
				log.info("my competition list");
				List<AcVO> acvo = service.compeptition_myList(dto);
				log.info(acvo);
				mav.addObject("listCompetition", acvo);
				
				//내 모든 글 리스트
				log.info("my post list");
				List<Map<String, String>> postList = service.getAllMyPost(dto);
				mav.addObject("getAllMyPost", postList);
				log.info(postList);
				
				//내 글의 댓글
		        List<Map<String, String>> replyList = service.myReplys(dto);	
				mav.addObject("replyList", replyList);

			}else {
				sessionVO.setM_picture("");
				System.out.println("썸네일 없음.");
				}
		}catch (Exception e) {
			// TODO: handle exception
			log.info(e);
		}
		

		
			mav.addObject("sessionVO", sessionVO);
			mav.setViewName("mp/mp_001_1");
			return mav;
	}
	
	
	@Override
	@RequestMapping(value="/mp/myCourse")
	public  ModelAndView MP_001_3 ( 
			HttpServletRequest request, HttpServletResponse response ) 
			throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		login.preHandle(request, response, session);
		sessionVO = (LO_001_VO) session.getAttribute("sessionVO");
		dto = new Page_DTO();
		
		//페이지주입
		if(request.getParameter("page")!=null) {
			int page = Integer.parseInt((request.getParameter("page")));
			dto.setPage(page);
		}
		
		try {
			if(session.getAttribute("sessionVO")==null) {
				log.info("session null! : "+session.getAttribute("sessionVO"));
			}else {
				dto.setM_index(sessionVO.getM_index()); //터짐
				List<MP_001_3_VO> listVO = service.getMCList(dto);
				mav.addObject("listVO", listVO);
				log.info("getMCList : "+listVO);
				
				pageutil = service.paging(dto);
				mav.addObject("pageUtil", pageutil);
				log.info("pageutil : "+pageutil);
				log.info("MP_001_3 mav완료");
			}
		}catch (Exception e) {
			log.info(e);
			// TODO: handle exception
		}
		
		mav.setViewName("mp/mp_001_3");
		
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/mp/myCourse/detail" , method=RequestMethod.POST , produces = "application/text;charset=utf8")
	@ResponseBody
	public  String myCourse (Page_DTO dto, 
			ServletRequest request) throws JsonProcessingException  {

			//리턴객체 생성
			List<Map<String, String>> list = new ArrayList<Map<String,String>>();
			
			//session 설정
			//페이지주입
			pageutil = service.pagingDownPage(dto);
			log.info("pageutil : "+pageutil);
			
			//개인기록 주입
			list = service.getMyCourseDetail(dto);
			
			//1번에 페이지정보
			int count = list.size(); //개인기록 리스트 카운트 == rn
			log.info(count);
			Map<String, String> pageutilMap = new HashMap<String, String>();
			pageutilMap.put("end", Integer.toString(pageutil.getEnd()));
			pageutilMap.put("start", Integer.toString(pageutil.getStart()));
			pageutilMap.put("page", Integer.toString(dto.getPage()));
			pageutilMap.put("next", String.valueOf(pageutil.isNext()));
			pageutilMap.put("prev", String.valueOf(pageutil.isPrev()));
			list.add(count, pageutilMap);
			
			log.info("listVO2 : "+list);
			
			String jsonStr = new ObjectMapper().writeValueAsString(list);

			log.info("jsonStr : "+ jsonStr);
			log.info("MP_001_3 mav완료");

			return jsonStr;
	}
	
	
	@Override
	@RequestMapping(value="/mp/memberUpdate")
	public  ModelAndView memberUpdate (MS_001_VO vo,
			HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		sessionVO = (LO_001_VO) session.getAttribute("sessionVO");
		Map<String, Object> hmap = new HashMap<String, Object>();
		log.info("memberUpdate 중 : "+vo);
		
		//vo에 부족한 값 sessionVO 에서 주입
		vo.setM_index(sessionVO.getM_index());
		vo.setM_id(sessionVO.getM_id());
		log.info("vo.m_index : "+vo.getM_index());
		//썸네일 업데이트 체크 및 실행
		if(vo.getM_picture()==null || vo.getM_picture().equals("")) {
			log.info("업로드된 이미지 없음");
		}else {
			hmap.put("m_picture", vo.getM_picture().getBytes());
			hmap.put("m_index", vo.getM_index());
			service.updateThumbnail(hmap);
			sessionVO.setRequest_thumbnail(vo.getM_picture().getBytes());
		}
		
		//멤버 업데이트 실행
		int check = service.memberUpdate(vo);
		log.info(check); //1일 경우 성공
		
		//바뀐 내용으로 세션처리!
		
		//바뀐 내용 세션 주입
		sessionVO.setM_nickName(vo.getM_nickName());
		sessionVO.setM_email_1(vo.getM_email_1());
		sessionVO.setM_pw(vo.getM_pw1());
		sessionVO.setM_tel(vo.getM_tel());
		sessionVO.setM_address(vo.getM_address());
		sessionVO.setM_name(vo.getM_name());
		
		//sessionVO에 새로운 정보 받아오기
		sessionVO = service.getMemberList(sessionVO);
		//썸네일 불러오기
		if(sessionVO.getRequest_thumbnail() != null) {
			byte[] imageContent = Base64.getEncoder().encode(sessionVO.getRequest_thumbnail());
			String thumbnail = new String(imageContent);
			log.info(thumbnail);
			sessionVO.setM_picture(thumbnail);
		}else {
			sessionVO.setM_picture("");
			System.out.println("썸네일 없음.");
			}

		//session에 sessionVO주입
		session.setAttribute("sessionVO", sessionVO);
		
		
		mav.addObject("sessionVO", sessionVO);
		mav.setViewName("mp/mp_001_1");
		
		return mav;
	}
	
	@Override
	@GetMapping(value="/mp/myCompetition")
	public String mp_co_list(Model model,Page_DTO dto, HttpServletRequest request) throws Exception{
		//세션주입
		HttpSession session = request.getSession();
		sessionVO = (LO_001_VO) session.getAttribute("sessionVO");
		
		//dto 주입.
		dto.setM_index(sessionVO.getM_index());
		List<AcVO> acvo = service.compeptition_myList(dto);
		
		//리스트 썸네일 인코딩, 디코딩 작업.
        for(int i = 0; i < acvo.size(); i++) {
           
           AcVO vo = acvo.get(i);
           if(vo.getCo_thumbnail() != null) {
              byte[] imageContent = Base64.getEncoder().encode(vo.getCo_thumbnail());
              String thumbnail = new String(imageContent);
              vo.setCo_request(thumbnail);
           }else {
              vo.setCo_request("");
           }
        }
        pageutil = service.competition_paging(dto);
		System.out.println(dto.getType());
		
		model.addAttribute("data", acvo);
		model.addAttribute("pageUtil", pageutil);
		
		return "mp/mp_001_2";
	}
	
	
	@Override
	@GetMapping(value="/mp/myPost")
	public String myPost(Model model,Page_DTO dto, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		sessionVO = (LO_001_VO) session.getAttribute("sessionVO");
		//dto 주입.
		dto.setM_index(sessionVO.getM_index());
		
        List<Map<String, String>> postList = service.getAllMyPost(dto);		
        pageutil = service.post_paging(dto);
		model.addAttribute("postList", postList);
		model.addAttribute("pageUtil", pageutil);
		
		return "mp/mp_001_4";
	}
	
	
	@Override
	@GetMapping(value="/mp/replys")
	public String myReplys(Model model,Page_DTO dto, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		sessionVO = (LO_001_VO) session.getAttribute("sessionVO");
		//dto 주입.
		dto.setM_index(sessionVO.getM_index());
		
        List<Map<String, String>> replyList = service.myReplys(dto);	
        pageutil = service.replys_paging(dto);
		model.addAttribute("replyList", replyList);
		model.addAttribute("pageUtil", pageutil);
		
		return "mp/mp_001_5";
	}

	
}
