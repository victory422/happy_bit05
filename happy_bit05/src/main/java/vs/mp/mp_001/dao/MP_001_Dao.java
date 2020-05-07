package vs.mp.mp_001.dao;

import java.util.List;
import java.util.Map;
import vs.mp.mp_001.dto.Page_DTO;
import vs.mp.mp_001.vo.MP_001_3_VO;
import vs.mp.mp_001.vo.PageUtil;

public interface MP_001_Dao {

	public MP_001_3_VO getMC(String lc_index);
	
	public int modifyMC(MP_001_3_VO vo);
	
	public int modifyMC_thumbnail(Map<String, Object> hmap);
	
	public int deleteMC(String lc_index);
	
	public int deleteMC_map(String lc_index);

	List<MP_001_3_VO> getList(Page_DTO dto);

	PageUtil GetTotal(Page_DTO dto);

	List<MP_001_3_VO> getMyCourse(Page_DTO dto);

}
