package vs.lc.lc_003_1.dao;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import vs.lc.lc_003_1.vo.LC_003_1_VO;
import vs.li.li_001_01.vo.LI_VO; 

public interface LC_003_1_Dao {

	public LC_003_1_VO getLC(String lc_index);
	
	public int modifyLC(LC_003_1_VO vo);
	
	public int modifyLC_thumbnail(Map<String, Object> hmap);
	
	public int deleteLC(String lc_index);
	
	public int deleteLC_map(String lc_index);
	
	public int myCourseSearch(LC_003_1_VO vo);
	
	public void myCourseInsert(LC_003_1_VO vo);
	
	public int myCourseDelete(LC_003_1_VO vo);
	
	//조회수 , 추천수@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	//조회수
	public void increse_see(LC_003_1_VO vo, HttpSession session);
	
	//추천수 증가
	public int increse_good(HashMap<String, Object> hashMap);
	
	//추천수 감소
	public int decrese_good(HashMap<String, Object> hashMap);
	
	//추천여부 체크
	public int good_check(HashMap<String, Object> hashMap);

	public int good_cnt(HashMap<String, Object> hashmap);
	
	//좋아요 체크 로우가 만들어졌는지 확인하는 쿼리
	public int good_count(HashMap<String, Object> hashmap);

	public void good_insert(HashMap<String, Object> hashmap);
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
}
