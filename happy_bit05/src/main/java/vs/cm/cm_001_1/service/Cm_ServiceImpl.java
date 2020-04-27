package vs.cm.cm_001_1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.cm.cm_001_1.mapper.CmMapper;
import vs.cm.cm_001_1.vo.CommentVO;

@Service
public class Cm_ServiceImpl implements Cm_Service{
	
	@Autowired 
	private CmMapper commentmapper;
	 
	 
	//댓글 리스트
	@Override 
	public List<CommentVO> commentList(String data) throws Exception{
	
		return commentmapper.commentList(data);
	} 
		
	//댓글 작성
	@Override
	public int commentInsert(CommentVO comment) throws Exception{
	
		return commentmapper.commentInsert(comment);
	}
	//댓글 수정
	@Override
	public int commentUpdateService(CommentVO comment) throws Exception {
		
		return commentmapper.commentUpdate(comment);
	}
	//댓글 삭제
	@Override
	public int commentDelete(String com_index ) throws Exception{
		
		return commentmapper.commentDelete(com_index);
	}
	//대댓글 작성
	public int dcommentInsert(CommentVO comment) throws Exception{
		
		return commentmapper.dcommentInsert(comment);
	}
	
	//대댓글 리스트
	public List<CommentVO> dcommentList(String com_index) throws Exception{
		
		
		return commentmapper.dcommentList(com_index);
	}
	
}
