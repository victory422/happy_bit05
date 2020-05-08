package vs.li.li_001_1.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vs.li.li_001_01.vo.LI_VO;
import vs.li.li_001_1.dto.Page_DTO;

public interface LI_Service {

	public void li_regist(LI_VO vo);
	

//	public List<LI_VO> get_list(LI_VO vo);
	
	public List<LI_VO> get_list(Page_DTO dto);
	
	public int get_total(Page_DTO dto);
	
	public List<LI_VO> search_list(LI_VO vo);
	
	public List<LI_VO> detail_page(String index);
	
	//조회수
	//public void increse_see(LI_VO vo,HttpServletRequest request, HttpServletResponse response);
	public void increse_see(LI_VO vo,HttpSession session);
	
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
	
	public void modify(LI_VO vo);
}
