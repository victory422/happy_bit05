package vs.cm.cm_001_1.mapper;

import java.util.List;

import vs.co.co_001_1.dto.Page_DTO;
import vs.ms.ms_001.vo.MS_001_VO;

public interface AmMapper {

	//신고 회원 리스트
	public List<MS_001_VO> am_list();
	//회원 관리 리스트
	public List<MS_001_VO> mm_list(Page_DTO dto);
	//게시글 총수
	public int get_total(Page_DTO dto);
	//회원 상세보기
	public MS_001_VO am_detail(String m_index);
	
	public int am_del(String m_index);
}
