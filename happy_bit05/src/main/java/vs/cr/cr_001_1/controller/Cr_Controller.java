package vs.cr.cr_001_1.controller;

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

import vs.co.co_001_1.dto.Page_DTO;
import vs.co.co_001_1.vo.PageUtil;
import vs.cr.cr_001_1.service.Cr_Service;
import vs.cr.cr_001_1.vo.CrVO;
import vs.lo.lo_001.vo.LO_001_VO;

@Controller
@RequestMapping("/cr/*")
public class Cr_Controller {

	@Autowired
	private Cr_Service cr_service;
	
	
	//대회 후기 리스트
	@GetMapping("cr_001_1")
	public void cr_List(Model model, Page_DTO dto) throws Exception {
		
		model.addAttribute("data", cr_service.Cr_List(dto));
		model.addAttribute("pageUtil",new PageUtil(dto,cr_service.get_total(dto)));
		model.addAttribute("type",dto.getTypeArr());
		model.addAttribute("page", dto.getPage());
		
	}
	//대회 후기 작성폼이동
	@GetMapping("cr_002_1")
	public void cr_register() {
			
		
	}
	
	//대회 후기 작성
	@PostMapping("/cr_002_1")
	public String cr_insert(CrVO crvo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		LO_001_VO vo = (LO_001_VO) session.getAttribute("sessionVO");
		System.out.println("aaaaaaaaaaaa"+vo);
		crvo.setM_index(vo.getM_index());
		cr_service.cr_insert(crvo);
		
		return "redirect:/cr/cr_001_1";
	}
	
	
	//대회 후기 상세보기
	@GetMapping("/cr_003_1")
	public void cr_detail(Model model,@RequestParam("co_r_index") String co_r_index) {
		
		System.out.println("cr_r_index : " + co_r_index);
		
		model.addAttribute("data", cr_service.cr_detail(co_r_index));
		
	}
	
	//대회 후기 수정폼
	@GetMapping("/cr_004_1")
	public void cr_update(CrVO crvo,Model model,@RequestParam("co_r_index") String co_r_index) throws Exception	{
		
		model.addAttribute("data", cr_service.cr_detail(co_r_index));
		
	}
	
	//대회 후기 삭제
	@GetMapping("/cr_delete")
	public String cr_delete(@RequestParam("co_r_index") String cr_index) {
		
		cr_service.cr_delete(cr_index);
		
		return "redirect:/cr/cr_001_1";
		
	}
	
	//대회 후기 수정
	@PostMapping("/cr_004_1.do")
	public String cr_update(CrVO crvo) {
		
		cr_service.cr_update(crvo);
		
		return "redirect:/cr/cr_001_1";
	}
	
}
