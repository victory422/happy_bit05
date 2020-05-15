package vs.cm.cm_001_1.mapper;

import java.util.List;
import java.util.Map;

import vs.ac.ac_001_1.vo.AcVO;
import vs.co.co_001_1.dto.Page_DTO;
import vs.co.co_001_1.vo.CoVO;

public interface CoMapper {
	
	//대회 접수 리스트
	public List<AcVO> ap_list(String co_b_index) throws Exception; 

	//대회 접수 
	public int ap_insert(CoVO covo) throws Exception;
	
	//대회 참가자 리스트
	public List<CoVO> ac_member(String co_b_index) throws Exception;

	//대회 접수상태 변경
	public int statechange(String co_b_index);
	 
	//대회 상세보기
	public List<AcVO> ac_detail(String co_b_index) throws Exception;
	
	//대회 참가자 리스트
	public List<CoVO> ac_memberlist(Page_DTO dto) throws Exception;
	
	public int m_statechange(Map<String, Object> hmap);
	
	public int get_total(Page_DTO dto);
	
}
