package vs.cm.cm_001_1.controller;

import java.util.List;

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
	private int mCommentServiceInsert(@RequestParam("co_b_index") String com_index, @RequestParam("com_text") String com_text) throws Exception{
		 
		System.out.println(com_index);
		System.out.println(com_text);
		
		comment.setCo_b_index(com_index);
		comment.setCom_text(com_text);
		
		//comment.setCom_writer("�մ�");
		
		return cm_service.commentInsert(comment);
	}
	
	//대댓글 작성
	@RequestMapping(value="/dedetinsert" ,method = RequestMethod.POST)
	@ResponseBody
	private int dCommentServiceInsert(@RequestParam("com_index") String com_index, @RequestParam("com_text") String com_text,@RequestParam("co_b_index") String co_b_index) throws Exception {
		
		System.out.println(com_index);
		System.out.println(com_text);
		System.out.println(co_b_index);
	
		comment.setCom_indexl(com_index);
		comment.setCom_text(com_text);
		comment.setCo_b_index(co_b_index);
		return cm_service.dcommentInsert(comment);
	}
	 
	
}
