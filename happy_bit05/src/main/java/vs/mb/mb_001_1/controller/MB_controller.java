package vs.mb.mb_001_1.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.StyledEditorKit.BoldAction;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_003_1.vo.LC_003_1_VO;
import vs.lo.lo_001.service.LO_001_Service;
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
	
	
}
