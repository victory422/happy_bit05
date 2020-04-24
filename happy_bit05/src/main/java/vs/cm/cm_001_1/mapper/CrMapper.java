package vs.cm.cm_001_1.mapper;

import java.util.List;

import vs.co.co_001_1.dto.Page_DTO;
import vs.cr.cr_001_1.vo.CrVO;

public interface CrMapper {

	//대회 후기 리스트
	public List<CrVO> cr_list(Page_DTO dto) throws Exception;
	
	//대회 후기 작성
	public int cr_insert(CrVO crvo) throws Exception;
	
	//검색
	public List<CrVO> search_list(CrVO crvo);
	
	public int get_total(Page_DTO dto);
}
