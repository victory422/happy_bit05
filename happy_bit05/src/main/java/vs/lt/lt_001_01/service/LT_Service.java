package vs.lt.lt_001_01.service;

import java.util.HashMap;
import java.util.List;

import vs.li.li_001_1.dto.Page_DTO;
import vs.lt.lt_001_01.vo.LT_VO;


public interface LT_Service {
	

	public void regist(LT_VO vo);

//	public List<LI_VO> get_list(LI_VO vo);
	
	public List<LT_VO> get_list(Page_DTO dto);
	
	public int get_total(Page_DTO dto);
	
	public List<LT_VO> search_list(LT_VO vo);
	
	public List<LT_VO> detail_page(String index);

	public int good_check(HashMap<String, Object> hashmap);

	public int increse_good(HashMap<String, Object> hashmap);

	public int decrese_good(HashMap<String, Object> hashmap);

	public int good_cnt(HashMap<String, Object> hashmap);

	public int good_count(HashMap<String, Object> hashmap);

	public void good_insert(HashMap<String, Object> hashmap);
	
}
