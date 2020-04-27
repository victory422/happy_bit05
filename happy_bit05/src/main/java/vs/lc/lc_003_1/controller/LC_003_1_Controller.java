package vs.lc.lc_003_1.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_002_1.vo.Criteria;
import vs.lc.lc_003_1.service.LC_003_1_Service;
import vs.lc.lc_003_1.vo.LC_003_1_VO;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("lc/003/*")
public class LC_003_1_Controller {
	
	private LC_003_1_Service service;
	private LC_003_1_VO vo;
	
	//상세보기
	@RequestMapping(value="lc_get")
	public String getLC(@RequestParam("lc_index") String lc_index, Model model,
				@ModelAttribute("cri") Criteria cri) {
		
		System.out.println("번호는:????? " + lc_index);
		System.out.println("검색어 : ??????" + cri.getKeyword());

		model.addAttribute("lc_get",service.getLC(lc_index));
		
		return "LC/LC_003_1";
	}

	//수정 패이지 가기
	@RequestMapping(value="lc_modify")
	public String modifyLC(@RequestParam("lc_index") String lc_index, Model model) {
		
		System.out.println("번호는:????? " + lc_index);

		model.addAttribute("lc_get",service.getLC(lc_index));
		
		return "LC/LC_003_2";
	}
	
	//수정하기
	@RequestMapping(value="lc_update", method = RequestMethod.POST)
	public String updateLC(LC_003_1_VO vo, Model model) {
		
		try {
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("lc_thumbnail", vo.getLc_thumbnail().getBytes());
			hmap.put("lc_index", vo.getLc_index());
			
			service.modifyLC(vo);
			service.modifyLC_thumbnail(hmap);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "../../lc/003/lc_get?lc_index=" + vo.getLc_index();
	}
	
	//삭제하기
	@RequestMapping(value="lc_delete")
	public String deleteLC(@RequestParam("lc_index") String lc_index, Model model) {
		try {
			service.deleteLC(lc_index);
			service.deleteLC_map(lc_index);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "redirect:/lc/002/list";
	}
	
	@RequestMapping(value="lc_myCourse")
	public String myCourse(LC_003_1_VO vo, Model model) {
		
		try {
			if(service.myCourseSearch(vo) == true) {
				service.myCourseDelete(vo);
			}else {
				service.myCourseInsert(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "";
	}
	
}
