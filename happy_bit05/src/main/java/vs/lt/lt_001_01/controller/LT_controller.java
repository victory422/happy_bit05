package vs.lt.lt_001_01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.li.li_001_1.service.LI_Service;

@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("/lt/*")
public class LT_controller {

	
	@RequestMapping("/lt_003_1")
	public void lt_edit() {
		log.info(" -----------------------------글 작성 ------------------------------");

	}
}
