package vs.lc.lc_001_1.dao;

import java.util.Map;

import vs.lc.lc_001_1.vo.LC_001_1_MapVO;
import vs.lc.lc_001_1.vo.LC_001_1_VO;

public interface LC_001_1_Dao {
	
	public void insert(LC_001_1_VO vo, LC_001_1_MapVO vo2);

	public void insertThumbnail(Map<String, Object> hmap);
}
