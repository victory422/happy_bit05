package vs.mp.mp_001.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ibleaders.utility.ib_json.JSONArray;
import com.ibleaders.utility.ib_json.JSONObject;

import lombok.extern.log4j.Log4j;
import vs.lo.lo_001.controller.MemberLoginInterceptor;
import vs.lo.lo_001.vo.LO_001_VO;
import vs.mp.mp_001.dto.Page_DTO;
import vs.mp.mp_001.service.MP_001_Service;
import vs.mp.mp_001.vo.MP_001_3_VO;
import vs.mp.mp_001.vo.PageUtil;

@Controller
@Log4j
public class MP_001_ControllerImpl implements MP_001_Controller {
	
	private static final int ResponseEntity = 0;
	@Autowired
	private MP_001_Service service;
	private PageUtil pageutil;
	private LO_001_VO sessionVO;
	MemberLoginInterceptor login = new MemberLoginInterceptor();
	
	@Override
	@RequestMapping(value="/mp")
	public  ModelAndView MP_001_1 (HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("mp MYpage mapping");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		login.preHandle(request, response, session);
		mav.addObject("sessionVO", session.getAttribute("sessionVO"));
		mav.setViewName("mp/mp_001_1");
		System.out.println("session : "+session.getAttribute("sessionVO"));
		System.out.println(mav + "mav완료");
		
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/mp/myCourse")
	public  ModelAndView MP_001_3 (@ModelAttribute Page_DTO dto,
			HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		login.preHandle(request, response, session);
		sessionVO = (LO_001_VO) session.getAttribute("sessionVO");
		log.info("mp myCourse mapping +mp_index is :" +dto.getLc_index()+" "+dto.getM_index());
		
		if(session.getAttribute("sessionVO")==null) {
			log.info("session null! : "+session.getAttribute("sessionVO"));
		}else {
			dto.setM_index(sessionVO.getM_index());
			List<MP_001_3_VO> listVO = service.getList(dto);
			mav.addObject("listVO", listVO);
			log.info("listVO1 : "+listVO);
			
			pageutil = service.paging(dto);
			mav.addObject("pageUtil", pageutil);
			log.info("MP_001_3 mav완료");
		}
		
		mav.setViewName("mp/mp_001_3");
		
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/mp/myCourse/detail")
	@ResponseBody
	public  String myCourse (Page_DTO dto) throws JsonProcessingException  {
			List<MP_001_3_VO> listVO2 = service.getMyCourse(dto);
			log.info("listVO2 : "+listVO2);
			
			JSONArray jsonArray = new JSONArray();
			JSONObject json = null;
			
			String jsonStr = new ObjectMapper().writeValueAsString(listVO2);
			for(int i=0; i<listVO2.size();i++){
			  json = new JSONObject();
			  MP_001_3_VO vo = listVO2.get(i);
			  json.put("lc_index", vo.getLc_index());
			  json.put("m_index", vo.getM_index());
			  json.put("mp_index", vo.getMp_index());
			  jsonArray.add(json);
			  log.info("json : "+json);
			  
			}
			pageutil = service.paging(dto);
			log.info("MP_001_3 mav완료");

			return jsonStr;
	}

	
}
