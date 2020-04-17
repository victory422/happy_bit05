package vs.lc.lc_002_1.controller;

import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_002_1.service.LC_002_1_Service;
import vs.lc.lc_002_1.vo.LC_002_1_VO;

@Controller
@RequestMapping("/lc/002/*")
@Log4j
@AllArgsConstructor
public class LC_002_1_Controller {
	
	private LC_002_1_Service service;

	@RequestMapping(value="list")
	public String getList(Model model) {
			log.info("컨트롤러 list....");
			log.info(service);
			
			List<LC_002_1_VO> listVO = service.getList();
			
			for(int i = 0; i < listVO.size(); i++) {
				
				LC_002_1_VO vo = listVO.get(i);
				
				if(vo.getLc_thumbnail() != null) {
					
					byte[] imageContent = Base64.getEncoder().encode(vo.getLc_thumbnail());
					
					System.out.println("대체 뭐야........" + imageContent);
					String thumbnail = new String(imageContent);
					
					System.out.println(thumbnail);
				
					vo.setLc_request(thumbnail);
				// model.addAttribute("thumbnail"+i, thumbnail);
				}else {
					vo.setLc_request("");
				}
			}
			
			model.addAttribute("lc_list", listVO);
			
			return "LC/LC_002_1";
	}
}
