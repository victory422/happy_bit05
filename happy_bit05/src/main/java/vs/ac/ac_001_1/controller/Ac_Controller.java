package vs.ac.ac_001_1.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vs.ac.ac_001_1.service.Ac_Service;
import vs.ac.ac_001_1.vo.AcVO;
import vs.co.co_001_1.dto.Page_DTO;
import vs.co.co_001_1.service.Co_Service;
import vs.co.co_001_1.vo.CoVO;
import vs.co.co_001_1.vo.PageUtil;
import vs.lo.lo_001.vo.LO_001_VO;

@Controller
@RequestMapping("/ac/*")
public class Ac_Controller {
	
	@Autowired
	private Ac_Service ac_service;
	@Autowired
	private Co_Service co_service;
	@GetMapping(value="/ac_002_1")
	public void ac_List(Model model,Page_DTO dto) throws Exception {
		
		 model.addAttribute("data", ac_service.ac_List(dto));
		 model.addAttribute("pageUtil",new PageUtil(dto,co_service.get_total(dto)));
		 
		 
	}
	//대회 글작성
	@RequestMapping(value = "ac_001_1.do", method = RequestMethod.POST)
	public String ac_register(AcVO acvo, RedirectAttributes rttr,HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		LO_001_VO vo = (LO_001_VO) session.getAttribute("sessionVO");
		
		System.out.println(acvo.getCo_b_thumbnail());
		
		try {
	         Map<String, Object> hmap = new HashMap<String, Object>();
	         hmap.put("co_b_thumbnail", acvo.getCo_b_thumbnail().getBytes());
	         
	         acvo.setCo_b_index("guest");
	         acvo.setM_index(vo.getM_index());
	         ac_service.ac_insert(acvo);
	         ac_service.insertTu(hmap);
	      } catch (Exception e) {
	         // TODO: handle exception
	         e.printStackTrace();
	      }
		System.out.println("register:" + acvo);
		
		
		
		rttr.addFlashAttribute("result", acvo.getCo_b_index());
		
		return "redirect:/ac/ac_002_1";
	}
	@GetMapping("/ac_001_1")
	public void ac_register() {
		
	}
	
	 //대회 참가자 상세페이지
	@GetMapping("/ac_003_1")
	public void co_detail(Model model, @RequestParam("co_b_index") String co_b_index) throws Exception  {
		
		System.out.println(co_b_index);
		
		model.addAttribute("member", ac_service.ac_member(co_b_index));
		model.addAttribute("data", ac_service.ac_detail(co_b_index));
	}
	
	//대회 접수상태 변경 
	@PostMapping("/statechange")
	@ResponseBody
	public int statechange(@RequestParam("co_b_index") String co_b_index) {
		
		System.out.println(co_b_index);
		
		return ac_service.statechange(co_b_index);
	}
	//참가자대회 접수상태 변경 
	@PostMapping("/m_statechange")
	@ResponseBody
	public int m_statechange(@RequestParam("m_index") String m_index,@RequestParam("co_b_index") String co_b_index) {
			
		System.out.println(m_index);
		System.out.println(co_b_index);
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("co_b_index", co_b_index);
		hmap.put("m_index", m_index);
		
		return ac_service.m_statechange(hmap);
	}
	//대회 참가자 리스트
	@GetMapping("/ac_004_1")
	public void memberlist(Model model,Page_DTO dto) throws Exception{
		
		System.out.println("대회 참가자 리스트점 뽑아주라");

		dto.setAmount(10);
		System.out.println("dddddddddd" + new PageUtil(dto,ac_service.get_total(dto)));
		
		model.addAttribute("memberlist", ac_service.ac_memberlist(dto));
		model.addAttribute("pageUtil",new PageUtil(dto,ac_service.get_total(dto)));
		model.addAttribute("type",dto.getTypeArr());
		model.addAttribute("page", dto.getPage());
	}
	
	
}
