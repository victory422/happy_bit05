package vs.mb.mb_001_1.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.gson.JsonObject;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_003_1.vo.LC_003_1_VO;
import vs.lo.lo_001.vo.LO_001_VO;
import vs.mb.mb_001_1.service.MB_service;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/mb/*")
public class MB_controller {

	private MB_service service;
	private LC_003_1_VO vo;
	private final Boolean DEBUG = true;
	
	@RequestMapping(value="/mb_001_1")
	public  ModelAndView MB_001_1 (HttpServletRequest request, HttpServletResponse response 
			) throws Exception {
		System.out.println("login page");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mb/mb_001_1");
		return mav;
	}
	@RequestMapping("/mb_003_1")
	public void mb_003_1() {
		log.info("--------------------------------모바일 홈 페이지 mobile home------------------------------");
		
	}
	
	@RequestMapping("/mb_004_1")
	public void mb_004_1() {
		log.info("--------------------------------기록 측정 페이지 record page------------------------------");
		
	}
	@RequestMapping("/mb_005_1")
	public void mb_005_1() {
		if(DEBUG) {
		log.info("--------------------------------코스 변경 페이지 cours page------------------------------");
		}
	}
	
	@RequestMapping("/test")
	public void test() {
		log.info("--------------------------------test------------------------------");
		
	}
	
	@ResponseBody
	@RequestMapping("/load")
	public LC_003_1_VO main(String[] args, String lc_index) {
		
		JsonObject obj = new JsonObject();
		
		
		lc_index = "lc_0000000121";
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
		
		if(check) {
			
			//model.addAttribute("msg", "ok");
			msg = "ok";
			if(DEBUG) {
				log.info("로그인 성공");
			}
		}else {
			
			//model.addAttribute("msg", "fail");
			msg = "fail";
			if(DEBUG) {
			log.info("로그인실패");
			}
		}
		return msg;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/mb_006_1")
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
			mav.setViewName("/mb/mb_006_1");
			log.info("/mb/mb_006_1 view완료");
			return mav;
	}
	
	
}
