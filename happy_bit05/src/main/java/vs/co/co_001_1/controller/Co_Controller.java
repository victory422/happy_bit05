package vs.co.co_001_1.controller;

import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibleaders.utility.ib_json.JSONObject;

import lombok.extern.log4j.Log4j;
import vs.ac.ac_001_1.vo.AcVO;
import vs.co.co_001_1.dto.Page_DTO;
import vs.co.co_001_1.service.Co_Service;
import vs.co.co_001_1.vo.CoVO;
import vs.co.co_001_1.vo.PageUtil;
import vs.lo.lo_001.vo.LO_001_VO;

@Controller
@RequestMapping("/co/*")
public class Co_Controller {
	
	@Autowired
	private Co_Service co_service;
	
	@GetMapping(value="/co_003_1")
	public void co_List(Model model,Page_DTO dto) throws Exception{
		
		List<AcVO> acvo = co_service.co_List(dto);
		//리스트 썸네일 인코딩, 디코딩 작업.
        for(int i = 0; i < acvo.size(); i++) {
           
           AcVO vo = acvo.get(i);
            
           if(vo.getCo_thumbnail() != null) {
              
              byte[] imageContent = Base64.getEncoder().encode(vo.getCo_thumbnail());
              
              //System.out.println("대체 뭐야........" + imageContent);
              String thumbnail = new String(imageContent);
              
              System.out.println(vo.getCo_request() + "ㅇㅇㅇㅇㅇ");	
              //System.out.println(thumbnail);
           
              vo.setCo_request(thumbnail);
           // model.addAttribute("thumbnail"+i, thumbnail);
           }else {
              vo.setCo_request("");
           }
        }

		System.out.println(dto.getType());
		
		model.addAttribute("data", acvo);
		model.addAttribute("pageUtil",new PageUtil(dto,co_service.get_total(dto)));
		model.addAttribute("type",dto.getTypeArr());
		model.addAttribute("page", dto.getPage());
		System.out.println("page : " + dto.getPage());
		System.out.println("Amount : " + dto.getAmount());
		

		for(int i= 0; i<dto.getTypeArr().length; i++) {
		model.addAttribute("type"+i,dto.getTypeArr()[i]);
		}
		
	}
	 //대회 상세페이지
	@GetMapping("/co_004_1")
	public void co_detail(Model model, @RequestParam("co_b_index") String co_b_index) {

		System.out.println("대회 상세페이지  index" + co_b_index);
		
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
		public String ap_insert(CoVO covo, HttpServletRequest request, HttpServletResponse response) throws Exception {
			HttpSession session = request.getSession();
			LO_001_VO vo = (LO_001_VO) session.getAttribute("sessionVO");
			
			System.out.println("aaaaaaaaaaaa"+vo);
			System.out.println(covo.getCo_area());
			System.out.println(covo.getCo_m_event() + "기념품");
			

			covo.setM_index(vo.getM_index());
			co_service.ap_insert(covo);
			
			return "redirect:/co/co_003_1?test1=1";
		}		
	
	
	
}
