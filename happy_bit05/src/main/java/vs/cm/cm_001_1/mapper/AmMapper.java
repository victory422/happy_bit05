package vs.cm.cm_001_1.mapper;

import java.util.List;

import vs.ms.ms_001.vo.MS_001_VO;

public interface AmMapper {

	//신고 회원 리스트
	public List<MS_001_VO> am_list();
	//회원 관리 리스트
	public List<MS_001_VO> mm_list();
	
	
}
