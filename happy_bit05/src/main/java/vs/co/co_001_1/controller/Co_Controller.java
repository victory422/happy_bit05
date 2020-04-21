package vs.co.co_001_1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibleaders.utility.ib_json.JSONObject;

import vs.ac.ac_001_1.vo.AcVO;
import vs.co.co_001_1.service.Co_Service;
import vs.co.co_001_1.vo.CoVO;

@Controller
@RequestMapping("/co/*")
public class Co_Controller {
	
	@Autowired
	private Co_Service co_service;
	
	@GetMapping(value="/co_003_1")
	public void co_List(Model model, AcVO acvo) throws Exception{
		
		 model.addAttribute("data", co_service.co_List(acvo)); 
		
	}
	
	@GetMapping("/co_004_1")
	public void co_detail(Model model, @RequestParam("co_b_index") String co_b_index) {

		model.addAttribute("data", co_service.co_detail(co_b_index));
		
	}
	
	//대회 접수 페이지
	@GetMapping("/co_001_1")
	public void co_001_1_view(Model model, @RequestParam("co_b_index") String co_b_index) throws Exception {
		System.out.println("대회 신청서 페이지");
		System.out.println(co_b_index);
	 
		model.addAttribute("data", co_service.ap_list(co_b_index));
		
	} 
	
	
	//대회 접수
	@PostMapping("/ap_001_1")
	public String ap_insert(CoVO covo) throws Exception {
		
		co_service.ap_insert(covo);
		
		return "redirect:/co/co_003_1";
		
	}
	
	
}
