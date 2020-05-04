package vs.cm.cm_001_1.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import vs.cm.cm_001_1.service.Cm_Service;
import vs.cm.cm_001_1.vo.CommentVO;
import vs.lo.lo_001.vo.LO_001_VO;

@Controller
@RequestMapping("/comment")
public class Cm_Controller {

	@Autowired
	Cm_Service cm_service;

	@Autowired
	CommentVO comment;
	
	//댓글 리스트
	@RequestMapping("/list")
	@ResponseBody
	private List<CommentVO> mCommentServiceList(Model model,@RequestParam String data) throws Exception {
		
		System.out.println(data);
		
		return cm_service.commentList(data);
		
	}

	//대댓글 리스트
	@RequestMapping("/dedetlist")
	@ResponseBody
	private List<CommentVO> dCommentServiceList(Model model , @RequestParam("com_index") String com_index) throws Exception {
	
			return cm_service.dcommentList(com_index);
	}
	

	//댓글 수정
	@RequestMapping("/update")
	@ResponseBody
	private int mCommentServiceUpdateProc(@RequestParam("com_index") String com_index, @RequestParam("com_text") String com_text) throws Exception{
        
        comment.setCom_index(com_index);
        comment.setCom_text(com_text);
        
        return cm_service.commentUpdateService(comment);
    }
    
	//댓글 삭제
	@RequestMapping("/delete/{com_index}")
	@ResponseBody
	private int mCommentServiceDelete(@PathVariable("com_index") String com_index) throws Exception{
        
        return cm_service.commentDelete(com_index); 
        

	}

	//댓글 작성
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	@ResponseBody
	private int mCommentServiceInsert(@RequestParam("board_index") String com_index, @RequestParam("com_text") String com_text,
				HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		LO_001_VO vo = (LO_001_VO) session.getAttribute("sessionVO");
		System.out.println("aaaaaaaaaaaa"+vo);
		System.out.println(com_index);
		System.out.println(com_text);
		
		comment.setM_index(vo.getM_index());
		comment.setBoard_index(com_index);
		comment.setCom_text(com_text);
		
		//comment.setCom_writer("�մ�");
		
		return cm_service.commentInsert(comment);
	}
	
	//대댓글 작성
	@RequestMapping(value="/dedetinsert" ,method = RequestMethod.POST)
	@ResponseBody
	private int dCommentServiceInsert(@RequestParam("com_index") String com_index, @RequestParam("com_text") String com_text,@RequestParam("board_index") String board_index,
										HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		LO_001_VO vo = (LO_001_VO) session.getAttribute("sessionVO");
		System.out.println("aaaaaaaaaaaa"+vo);
		System.out.println(com_index);
		System.out.println(com_text);
		System.out.println(board_index);

		comment.setM_index(vo.getM_index());
		comment.setCom_index1(com_index);
		comment.setCom_text(com_text);
		comment.setBoard_index(board_index);
		return cm_service.dcommentInsert(comment);
	}
	 
	
}
