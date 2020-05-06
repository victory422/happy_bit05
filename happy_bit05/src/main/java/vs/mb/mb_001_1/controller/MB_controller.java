package vs.mb.mb_001_1.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_003_1.vo.LC_003_1_VO;
import vs.mb.mb_001_1.service.MB_service;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/mb/*")
public class MB_controller {

	private MB_service service;
	private LC_003_1_VO vo;
	
	@RequestMapping("/mb_004_1")
	public void mb_004_1() {
		log.info("--------------------------------기록 측정 페이지------------------------------");
		
	}
	@RequestMapping("/test")
	public void test() {
		log.info("--------------------------------test------------------------------");
		
	}
	
	@ResponseBody
	@RequestMapping("/load")
	public LC_003_1_VO main(String[] args, String lc_index, Model model) {
		
		JsonObject obj = new JsonObject();
		
		//lc_index = "lc_0000000244";
		lc_index = "lc_0000000243";
		System.out.println("컨트롤러 단에서 번호는 : " + lc_index);
		
		LC_003_1_VO vo = service.getLC(lc_index);
		
		return vo;
	}
	
	
}
