package vs.ka.ka_001_1.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.RedirectView;

import vs.co.co_001_1.service.Co_Service;
import vs.ka.ka_001_1.service.kakaoPay;
import vs.lo.lo_001.vo.LO_001_VO;

@RestController
@CrossOrigin("*")
public class Ka_Controller {
	
	private String amount1 = null;

	@Autowired
	private Co_Service co_service;
	
	@Autowired
	private kakaoPay kakaopay;
	
	
	@PostMapping("/kakaopay")
	private String kakaoPay(@RequestParam("amount") String amount, @RequestParam("co_b_index") String co_b_index,
			@RequestParam("co_b_title") String co_b_title,HttpServletRequest request, HttpServletResponse response) {
		
		amount1 = amount;
		
		System.out.println(amount + "kakaoPay : 컨트롤러");
		System.out.println(co_b_index + " : co_b_index");
		System.out.println(co_b_title + " :co_b_title");
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("amount", amount);
		map.put("co_b_index", co_b_index);
		map.put("co_b_title", co_b_title);
		String kakaourl = kakaopay.kakaoPayReady(map, request, response);
		System.out.println(kakaourl + "ㅇㅇ");
		
		return kakaourl;
	}
	
	
	@GetMapping("/kakaoPaySuccess")
	public RedirectView kakaoPaySuccess(@RequestParam("pg_token") String pg_token,@RequestParam("co_b_index") String co_b_index,HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("성공시 controller");
		
		kakaopay.kakaoPayInfo(pg_token, this.amount1, request, response);
		
		System.out.println(pg_token + "보여줘");
		System.out.println(co_b_index + " : 어렵다");
		//model.addAttribute("data", co_service.ap_list(co_b_index));

		
		return new RedirectView("https://bikendrun.shop/co/co_001_1?co_b_index="+co_b_index+"&kakaotest=1");	
	}
	
	
}
