package vs.mp.mp_001.service;

import java.util.List;
import java.util.Map;

import vs.lo.lo_001.vo.LO_001_VO;
import vs.mp.mp_001.dto.Page_DTO;
import vs.mp.mp_001.vo.MP_001_3_VO;
import vs.mp.mp_001.vo.PageUtil;

public interface MP_001_Service {
	
	public MP_001_3_VO getMC(String lc_index);

	public boolean modifyMC(MP_001_3_VO vo);
	
	public boolean modifyMC_thumbnail(Map<String, Object> hmap);
	
	public boolean deleteMC(String lc_index);
	
	public boolean deleteMC_map(String lc_index);

	PageUtil paging(Page_DTO dto);

	List<MP_001_3_VO> getList(Page_DTO dto);
}
