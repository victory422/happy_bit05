package vs.cm.cm_001_1.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import vs.cm.cm_001_1.vo.CommentVO;

@Repository
public interface CmMapper {

	//댓글 리스트
 	public List<CommentVO> commentList(String data) throws Exception;
	//댓글 작성
	public int commentInsert(CommentVO comment) throws Exception;
	//댓글 수정
	public int commentUpdate(CommentVO comment) throws Exception;
	//댓글 삭제
	public int commentDelete(String com_index ) throws Exception;
	//대댓글 작성
	public int dcommentInsert(CommentVO comment) throws Exception;
	//대댓글 리스트
	public List<CommentVO> dcommentList(String com_index) throws Exception;
	
	

}
