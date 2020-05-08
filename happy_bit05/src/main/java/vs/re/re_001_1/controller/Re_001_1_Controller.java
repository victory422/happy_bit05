package vs.re.re_001_1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import vs.co.co_001_1.dto.Page_DTO;
import vs.co.co_001_1.service.Co_Service;
import vs.cr.cr_001_1.service.Cr_Service;
import vs.lc.lc_003_1.service.LC_003_1_Service;
import vs.li.li_001_1.service.LI_Service;
import vs.pr.pr_003_1.service.Pr_003_1_Service;
import vs.re.re_001_1.service.Re_001_1_Service;
import vs.re.re_001_1.vo.ReVO;

@Controller
@RequestMapping("/re/*")
public class Re_001_1_Controller {

	@Autowired
	private Co_Service co_service;
	
	@Autowired
	private Re_001_1_Service re_service;
	
	@Autowired
	private Cr_Service cr_service;
	
	@Autowired
	private Pr_003_1_Service pr_service;
	
	@Autowired
	private LC_003_1_Service lc_service;
	
	@Autowired
	private LI_Service li_service;
	
	//신고하기 창띄우기
	@GetMapping("/report")
	public void report_co(Model model,@RequestParam("re_type") String re_type,@RequestParam("board_index") String board_index){
		
		System.out.println("타입 : " +re_type);
		System.out.println("co_b_index : "+  board_index);
		if(re_type.equals("co")) {			
			model.addAttribute("data",co_service.co_detail(board_index));		
		}else if(re_type.equals("cr")) {		
			model.addAttribute("data",cr_service.cr_detail(board_index));
		}else if(re_type.equals("pr")) {			
			model.addAttribute("data",pr_service.pr_detail(board_index));
		}else if(re_type.equals("lc")) {
			model.addAttribute("data",lc_service.getLC(board_index));
		}else if(re_type.equals("li")) {
			model.addAttribute("data", li_service.detail_page(board_index));
		}
			
		
	}
		
	
	//신고 작성
	@PostMapping("/re_insert")
	@ResponseBody
	public int re_insert(Model model,ReVO revo,@RequestParam("radio") String radio,@RequestParam("title") String title,
						@RequestParam("m_index") String m_index,@RequestParam("board_index") String board_index) throws Exception{
		
		System.out.println("radio?" + radio);
		System.out.println("title?" + title);
		System.out.println("m_index?" + m_index);
		System.out.println("board_index?" + board_index);
		
		
		revo.setDe_target(title);
		revo.setM_index(m_index);
		revo.setDe_type(radio);
		revo.setBoard_index(board_index);
		
		System.out.println("제목"+revo.getDe_target());
		System.out.println("작성자"+revo.getM_index());
		System.out.println("사유"+revo.getDe_type());
		
		return re_service.re_insert(revo);
	}
	
	
	
}
