package vs.cr.cr_001_1.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import vs.co.co_001_1.dto.Page_DTO;
import vs.cr.cr_001_1.vo.CrVO;
import vs.li.li_001_01.vo.LI_VO;

public interface Cr_Service {

	//대회 후기 리스트
	public List<CrVO> Cr_List(Page_DTO dto) throws Exception;
	//대회 후기 작성
	public int cr_insert(CrVO crvo) throws Exception;
	//검색
	public List<CrVO> search_list(CrVO crvo);
	
	public int get_total(Page_DTO dto);
	
	public List<CrVO> cr_detail(String co_r_index);
	//대회 후기 삭제
	public int cr_delete(String co_r_index);
	//대회 후기 수정
	public int cr_update(CrVO crvo);
	
	//좋아요 추천수@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	//조회수
		public void increse_see(CrVO vo, HttpSession session);
		
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
