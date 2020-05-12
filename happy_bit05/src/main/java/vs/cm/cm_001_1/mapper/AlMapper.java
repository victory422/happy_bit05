package vs.cm.cm_001_1.mapper;

import java.util.List;

import vs.al.al_001_1.vo.AlVO;
import vs.co.co_001_1.dto.Page_DTO;
import vs.re.re_001_1.vo.ReVO;

public interface AlMapper {

	//모든 게시글 조회
	public List<AlVO> al_list(Page_DTO dto);
	
	//신고된 게시글 조회
	public List<ReVO> re_list(Page_DTO dto); 
	//처리 상태 변경
	public int disposechange(String de_index);
	//게시글 갯수
	public int get_total(Page_DTO dto);
	//게시글 갯수
	public int get_total1(Page_DTO dto);
		
}
