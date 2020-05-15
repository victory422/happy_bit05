package vs.lc.lc_002_1.controller;

import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_002_1.service.LC_002_1_Service;
import vs.lc.lc_002_1.vo.Criteria;
import vs.lc.lc_002_1.vo.LC_002_1_VO;
import vs.lc.lc_002_1.vo.PageDTO;
import vs.lo.lo_001.vo.LO_001_VO;

@Controller
@RequestMapping("/lc/002/*")
@Log4j
@AllArgsConstructor
public class LC_002_1_Controller {
	
	private LC_002_1_Service service;

	//리스트 가져오기
	@RequestMapping(value="list")
	public String getList(Criteria cri, Model model,HttpServletRequest request) {
			
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
					vo.setLc_request(null);
				}
				
				if(vo.getLc_type().equals("육상")) {
					vo.setLc_type2(0);
				}else {
					vo.setLc_type2(1);
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
			
			
			HttpSession session = request.getSession();
			
			if(session.getAttribute("sessionVO") != null) {
				LO_001_VO vo = (LO_001_VO) session.getAttribute("sessionVO");
				model.addAttribute("m_index", vo.getM_index());
				model.addAttribute("sessionVO", session.getAttribute("sessionVO"));
			}
			
			model.addAttribute("lc_list", listVO);
			model.addAttribute("pageUtil", new PageDTO(cri, total));
			model.addAttribute("lc_good", listGood);
			
			return "LC/LC_002_1";
	}
	
	
	
}
