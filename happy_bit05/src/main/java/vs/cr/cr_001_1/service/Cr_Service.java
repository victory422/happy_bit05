package vs.cr.cr_001_1.service;

import java.util.List;

import vs.cr.cr_001_1.vo.CrVO;

public interface Cr_Service {

	//대회 후기 리스트
	public List<CrVO> Cr_List(CrVO crvo) throws Exception;
	//대회 후기 작성
	public int cr_insert(CrVO crvo) throws Exception; 
}
