package vs.lc.lc_001_1.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.soap.AddressingFeature.Responses;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_001_1.service.LC_001_1_Service;
import vs.lc.lc_001_1.vo.LC_001_1_MapVO;
import vs.lc.lc_001_1.vo.LC_001_1_VO;
import vs.lo.lo_001.vo.LO_001_VO;

@Controller
@RequestMapping("/lc/001/*")
@Log4j
@AllArgsConstructor
public class LC_001_1_Controller {
	
	private LC_001_1_Service service;
	
	@RequestMapping(value = "write")
	public String writeLC() {
		return "LC/LC_001_1";
	}

	@RequestMapping(value = "uploadCourse", method = RequestMethod.POST)
	public String insertCourse(LC_001_1_VO vo, LC_001_1_MapVO vo2, Model model, HttpServletRequest request) {
		
		System.out.println("컨트롤러 : " + vo);
		//System.out.println("컨트롤러 : " + vo2);
		System.out.println("모델 : " + model);
		System.out.println("뭐야..------------" + vo.getLc_title());
		
		try {
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("lc_thumbnail", vo.getLc_thumbnail().getBytes());
			
			HttpSession session = request.getSession();
			LO_001_VO sessionVO = (LO_001_VO) session.getAttribute("sessionVO");
			
			vo.setM_index(sessionVO.getM_index());
			
			service.courseInsert(vo, vo2);
			service.thumbnailInsert(hmap);
			
			System.out.println("값이 잘 가니? : " + vo.getLc_type());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return "../../lc/002/list?lc_type=" + vo.getLc_type();
	}
	
	@RequestMapping(value = "uploadCourse2", method = RequestMethod.POST)
	public String insertCourse2(LC_001_1_VO vo, Model model) {
		System.out.println("==================================================>>" + vo);
		return "redirect:/";
	}
}
