package vs.co.co_001_1.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import vs.ac.ac_001_1.vo.AcVO;
import vs.co.co_001_1.dto.Page_DTO;
import vs.co.co_001_1.vo.CoVO;
import vs.cr.cr_001_1.vo.CrVO;


public interface Co_Service {

	public List<AcVO> co_List(Page_DTO dto);
	
	public int get_total(Page_DTO dto);
	
	public List<AcVO> search_list(AcVO vo);
	
	public List<AcVO> co_detail(String co_b_index);
	
	public List<AcVO> ap_list(String co_b_index) throws Exception;
	
	public int ap_insert(CoVO crvo) throws Exception;

	//좋아요 추천수@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		//조회수
			public void increse_see(AcVO vo, HttpSession session);
			
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
			
		
	
}
