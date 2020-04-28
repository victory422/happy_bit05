package vs.cm.cm_001_1.mapper;

import java.util.List;

import vs.ac.ac_001_1.vo.AcVO;
import vs.co.co_001_1.vo.CoVO;

public interface CoMapper {
	
	//대회 접수 리스트
	public List<AcVO> ap_list(String co_b_index) throws Exception; 

	//대회 접수 
	public int ap_insert(CoVO covo) throws Exception;
	
	//대회 참가자 리스트
	public List<CoVO> ac_detail(String co_b_index) throws Exception;

}
