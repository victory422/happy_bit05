package vs.lc.lc_003_1.dao;

import java.util.Map;

import vs.lc.lc_003_1.vo.LC_003_1_VO; 

public interface LC_003_1_Dao {

	public LC_003_1_VO getLC(String lc_index);
	
	public int modifyLC(LC_003_1_VO vo);
	
	public int modifyLC_thumbnail(Map<String, Object> hmap);
	
	public int deleteLC(String lc_index);
	
	public int deleteLC_map(String lc_index);
	
	public int myCourseSearch(LC_003_1_VO vo);
	
	public void myCourseInsert(LC_003_1_VO vo);
	
	public int myCourseDelete(LC_003_1_VO vo);
}
