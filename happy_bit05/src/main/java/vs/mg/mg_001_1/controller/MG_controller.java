package vs.mg.mg_001_1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("/mg/*")
public class MG_controller {
	
	@RequestMapping("/mg_001_1")
	public void mg_001_1() {
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@메세지함 호출@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		log.info("......................................................................................");
		log.info("......................................................................................");
		log.info("......................................................................................");
		
	}
	@RequestMapping("/mg_002_1")
	public void mg_002_1() {
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@에티 에딧@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		log.info("......................................................................................");
		log.info("......................................................................................");
		log.info("......................................................................................");
		
	}
	
	

}
