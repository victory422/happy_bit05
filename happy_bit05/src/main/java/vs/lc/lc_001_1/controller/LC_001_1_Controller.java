package vs.lc.lc_001_1.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_001_1.service.LC_001_1_Service;
import vs.lc.lc_001_1.vo.LC_001_1_MapVO;
import vs.lc.lc_001_1.vo.LC_001_1_VO;

@Controller
@RequestMapping("/lc/001/*")
@Log4j
@AllArgsConstructor
public class LC_001_1_Controller {
	
	private LC_001_1_Service service;

	@RequestMapping(value = "uploadCourse", method =RequestMethod.POST)
	public String insertCourse(LC_001_1_VO vo, Model model) {
		
		
		
		System.out.println("컨트롤러 : " + vo);
		//System.out.println("컨트롤러 : " + vo2);
		System.out.println("모델 : " + model);
		System.out.println("뭐야..------------" + vo.getLc_title());
		
		try {
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("lc_thumbnail", vo.getLc_thumbnail().getBytes());
			
			vo.setM_index("guest");
			
			//service.courseInsert(vo, vo2);
			service.thumbnailInsert(hmap);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return "redirect:/";
	}
}
