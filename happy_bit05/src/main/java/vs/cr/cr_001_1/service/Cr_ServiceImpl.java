package vs.cr.cr_001_1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.cm.cm_001_1.mapper.CrMapper;
import vs.cr.cr_001_1.vo.CrVO;

@Service
public class Cr_ServiceImpl implements Cr_Service {

	@Autowired
	private CrMapper crmapper;

	//대회 후기 리스트
	@Override 
	public List<CrVO> Cr_List(CrVO crvo) throws Exception{
		
		return crmapper.cr_list(crvo);
	}
 
	//대회 후기 작성
	@Override
	public int cr_insert(CrVO crvo) throws Exception {
		 
		return crmapper.cr_insert(crvo);
	}
	
	
	
}
