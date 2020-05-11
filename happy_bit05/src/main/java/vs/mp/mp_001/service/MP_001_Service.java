package vs.mp.mp_001.service;

import java.util.List;
import java.util.Map;

import vs.lo.lo_001.vo.LO_001_VO;
import vs.mp.mp_001.dto.Page_DTO;
import vs.mp.mp_001.vo.MP_001_3_VO;
import vs.mp.mp_001.vo.PageUtil;
import vs.ms.ms_001.vo.MS_001_VO;

public interface MP_001_Service {
	
	public MP_001_3_VO getMC(String lc_index);

	
	PageUtil paging(Page_DTO dto);

	List<MP_001_3_VO> getList(Page_DTO dto);

	List<MP_001_3_VO> getMyCourse(Page_DTO dto);

	int memberUpdate(MS_001_VO vo);

	public void updateThumbnail(Map<String, Object> hmap);
	
	public LO_001_VO getMemberList(LO_001_VO list);

	public List<Map<String, String>> getMyCourseDetail(Page_DTO dto);
}
