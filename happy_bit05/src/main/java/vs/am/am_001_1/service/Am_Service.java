package vs.am.am_001_1.service;

import java.util.List;

import vs.co.co_001_1.dto.Page_DTO;
import vs.ms.ms_001.vo.MS_001_VO;

public interface Am_Service {

	public List<MS_001_VO> am_list();
	
	public List<MS_001_VO> mm_list(Page_DTO dto);
	
	public int get_total(Page_DTO dto);
	
	public MS_001_VO am_detail(String m_index);
	
	public int am_del(String m_index);
}
