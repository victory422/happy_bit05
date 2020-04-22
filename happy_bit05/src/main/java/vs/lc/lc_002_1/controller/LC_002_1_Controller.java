package vs.lc.lc_002_1.controller;

import java.util.Base64;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_002_1.service.LC_002_1_Service;
import vs.lc.lc_002_1.vo.Criteria;
import vs.lc.lc_002_1.vo.LC_002_1_VO;
import vs.lc.lc_002_1.vo.PageDTO;

@Controller
@RequestMapping("/lc/002/*")
@Log4j
@AllArgsConstructor
public class LC_002_1_Controller {
	
	private LC_002_1_Service service;

	//리스트 가져오기
	@RequestMapping(value="list")
	public String getList(Criteria cri, Model model) {
			
			List<LC_002_1_VO> listVO = service.getList(cri);
			List<LC_002_1_VO> listGood = service.getGood(cri);
			int total = service.getTotal(cri);
			
			//리스트 썸네일 인코딩, 디코딩 작업.
			for(int i = 0; i < listVO.size(); i++) {
				
				LC_002_1_VO vo = listVO.get(i);
				
				if(vo.getLc_thumbnail() != null) {
					
					byte[] imageContent = Base64.getEncoder().encode(vo.getLc_thumbnail());
					
					//System.out.println("대체 뭐야........" + imageContent);
					String thumbnail = new String(imageContent);
					
					//System.out.println(thumbnail);
				
					vo.setLc_request(thumbnail);
				// model.addAttribute("thumbnail"+i, thumbnail);
				}else {
					vo.setLc_request("");
				}
			}
			
			//추천수 썸네일 인코딩, 디코딩 작업.
			for(int i = 0; i < listGood.size(); i++) {
				
				LC_002_1_VO vo = listGood.get(i);
				
				if(vo.getLc_thumbnail() != null) {
					
					byte[] imageContent = Base64.getEncoder().encode(vo.getLc_thumbnail());
					
					//System.out.println("대체 뭐야........" + imageContent);
					String thumbnail = new String(imageContent);
					
					//System.out.println(thumbnail);
				
					vo.setLc_request(thumbnail);
				// model.addAttribute("thumbnail"+i, thumbnail);
				}else {
					vo.setLc_request("");
				}
			}
			
			if(cri.getType() == null) {
				model.addAttribute("lc_good", listGood);
			}else if(!(cri.getType().equals("normal"))) {
				model.addAttribute("lc_good", listGood);
			}
			
			model.addAttribute("lc_list", listVO);
			model.addAttribute("pageUtil", new PageDTO(cri, total));
			
			return "LC/LC_002_1";
	}
	
	
	
}
