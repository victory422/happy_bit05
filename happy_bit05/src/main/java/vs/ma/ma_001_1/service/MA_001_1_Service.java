package vs.ma.ma_001_1.service;

import java.util.List;
import java.util.Map;

import vs.ma.ma_001_1.vo.MA_001_1_VO;
import vs.ma.ma_001_1.vo.MA_002_2_VO;

public interface MA_001_1_Service {
	
	public List<MA_001_1_VO> mainList(String lc_area2, String lc_area3, String lc_type);
	
	public void insertAd(Map<String, Object> hmap);
	
	public List<MA_002_2_VO> listAd();
}
