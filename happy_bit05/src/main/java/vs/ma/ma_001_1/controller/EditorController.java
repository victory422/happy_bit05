package vs.ma.ma_001_1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/edit/*")
public class EditorController {

	@RequestMapping("/edit_page")
	public void edit() {
		log.info("edit--------------------");
	}
	@RequestMapping("/updateForm")
	public void edit5() {
		log.info("edit--------------------");
	}
	/*
	 * @RequestMapping("/index_editor") public void edit_index1() {
	 * log.info("index1--------------------"); }
	 * 
	 * @RequestMapping("/index_finder") public void edit_index2() {
	 * log.info("index2--------------------"); }
	 * 
	 * @RequestMapping("/") public void edit_index3() {
	 * log.info("index3--------------------"); }
	 */
}
