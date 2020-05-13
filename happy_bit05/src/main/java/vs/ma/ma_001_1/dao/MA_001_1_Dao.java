package vs.ma.ma_001_1.dao;

import java.util.List;
import vs.ma.ma_001_1.vo.MA_001_1_VO;

public interface MA_001_1_Dao {
	
	public List<MA_001_1_VO> mainList(String lc_area2, String lc_area3, String lc_type);
}
