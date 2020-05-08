package vs.ms.ms_001.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import vs.ms.ms_001.service.MS_001_SaService;
import vs.ms.ms_001.vo.MS_001_VO;

@Controller
@Log4j
public class MS_001_ControllerImpl implements MS_001_Controller {
	
	@Autowired
	private MS_001_SaService ms_001_Service;
	
	@Override
	@RequestMapping(value="/ms")
	public  ModelAndView MS_001_1 (HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("ms회원가입 페이지 mav");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ms/ms_001_1");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/ms2")
	public  ModelAndView MS_001_1_1 (HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("ms회원가입 페이지 mav");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ms/ms_001_1_1");
		
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/ms/regist")
	public  ModelAndView test(MS_001_VO ms_001_vo,
			HttpServletRequest request, HttpServletResponse respons) throws Exception {
		String id = (String)request.getAttribute("m_id");
		log.info(id);
		System.out.println("ms회원가입 regist mav");
		System.out.println(ms_001_vo);
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("m_picture", ms_001_vo.getM_picture().getBytes());
		ms_001_Service.memberVO(ms_001_vo);
		ms_001_Service.registThumbnail(hmap);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("lo/lo_001_1");
		request.setAttribute("memberList", ms_001_vo);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/ms/regist/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("data")String data, @RequestParam("area")String area,
			HttpServletRequest request, HttpServletResponse respons) throws Exception {
		log.info(data+","+area);
		log.info("ms회원가입 아이디 중복체크 ");
		int check = 0;
		if(area.equals("idSearch") ) {
			check = ms_001_Service.idCheck(data);
		}else if(area.equals("nickSearch") ) {
			check = ms_001_Service.nickCheck(data);
		}else check = -1;
		log.info(check);
		return check;
	}
	
	@Override
	@RequestMapping(value="/ms/regist/passwordCheck")
	@ResponseBody
	public int passwordCheck(@RequestParam("pw_1")String pw_1, @RequestParam("pw_2")String pw_2,
			HttpServletRequest request, HttpServletResponse respons) throws Exception {
		log.info(pw_1+","+pw_2);
		log.info("ms회원가입 비밀번호 체크");
		int check = 0;
		if(pw_1.equals(pw_2) ) {
			check = 0;
		}else check = -1;
		log.info(check);
		return check;
	}
	
	@Override
	@RequestMapping(value="/ms/regist/mailCheck", method = RequestMethod.POST)
	@ResponseBody
	public int mailCheck(MS_001_VO ms_001_vo,
			HttpServletRequest request, HttpServletResponse respons) throws Exception {
		log.info("ms회원가입 인증메일 전송 :"+ms_001_vo);
		
//		String key = mailsender.getKey(true, 10);
		Random ran = new Random();
		String mail = ms_001_vo.getM_email_1();
		String id = ms_001_vo.getM_id();
		int key = ran.hashCode();
		log.info("key : "+key);
		ms_001_Service.mailSender(mail, id, key, request);

		return key;
	}
	
	
	


}
