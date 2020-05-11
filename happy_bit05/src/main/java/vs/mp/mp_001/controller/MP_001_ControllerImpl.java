package vs.mp.mp_001.controller;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ibleaders.utility.ib_json.JSONArray;
import com.ibleaders.utility.ib_json.JSONObject;

import lombok.extern.log4j.Log4j;
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
	
	@Override
	@RequestMapping(value="/mp")
	public  ModelAndView MP_001_1 (HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("mp MYpage mapping");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		login.preHandle(request, response, session);
		sessionVO = (LO_001_VO) session.getAttribute("sessionVO");
		
		//썸네일 주입
		try {
		if(sessionVO.getRequest_thumbnail() != null) {
			byte[] imageContent = Base64.getEncoder().encode(sessionVO.getRequest_thumbnail());
			String thumbnail = new String(imageContent);
			sessionVO.setM_picture(thumbnail);
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
		System.out.println("session : "+ sessionVO);
		System.out.println(mav + "mav완료");
		
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/mp/myCourse")
	public  ModelAndView MP_001_3 (HttpServletRequest request,
			HttpServletResponse response ) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		login.preHandle(request, response, session);
		sessionVO = (LO_001_VO) session.getAttribute("sessionVO");
		
		if(session.getAttribute("sessionVO")==null) {
			log.info("session null! : "+session.getAttribute("sessionVO"));
		}else {
			dto.setM_index(sessionVO.getM_index());
			List<MP_001_3_VO> listVO = service.getMCList(dto);
			mav.addObject("listVO", listVO);
			log.info("getMCList : "+listVO);
			
			pageutil = service.paging(dto);
			mav.addObject("pageUtil", pageutil);
			log.info("pageutil : "+pageutil);
			log.info("MP_001_3 mav완료");
		}
		
		mav.setViewName("mp/mp_001_3");
		
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/mp/myCourse/detail")
	@ResponseBody
	public  String myCourse (Page_DTO dto) throws JsonProcessingException  {
			List<Map<String, String>> listVO2 = service.getMyCourseDetail(dto);
			log.info("listVO2 : "+listVO2);
			
			JSONArray jsonArray = new JSONArray();
			JSONObject json = null;
			
			String jsonStr = new ObjectMapper().writeValueAsString(listVO2);
			for(int i=0; i<listVO2.size();i++){
			  json = new JSONObject();
			  Map<String, String> vo = listVO2.get(i);
			  json.put("RN", vo.get("RN"));
			  json.put("PR_RECORDDATE", vo.get("PR_RECORDDATE"));
			  json.put("PR_RECORD", vo.get("PR_RECORD"));
			  //json.put("m_index", vo.get("m_index"));
			  jsonArray.add(json);
			  log.info("json : "+json);
			  
			}
			pageutil = service.paging(dto);
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
		log.info("memberUpdate 중");
		
		//vo에 부족한 값 sessionVO 에서 주입
		vo.setM_index(sessionVO.getM_index());
		vo.setM_id(sessionVO.getM_id());
		log.info("vo.m_index : "+vo.getM_index());
		//썸네일 업데이트 체크 및 실행
		if(vo.getM_picture()==null || vo.getM_picture().equals("")) {
			log.info("업로드된 이미지 없음");
		}else {
			Map<String, Object> hmap = new HashMap<String, Object>();
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

	
}
