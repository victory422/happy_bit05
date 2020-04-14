package vs.lc.lc_002_1.controller;

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
			
			for(int i = 0; i < service.getList().size(); i++) {
				
				LC_002_1_VO vo = service.getList().get(i);
				
				byte[] imageContent = vo.getLc_thumbnail();
				
				final HttpHeaders headers = new HttpHeaders();
				headers.setContentType(MediaType.IMAGE_PNG);
				
				model.addAttribute("lc_thumbnail" + i, new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK));
			}
			
			model.addAttribute("lc_list", service.getList());
			
			return "LC/LC_002_1";
	}
}
