package vs.cr.cr_001_1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.cm.cm_001_1.mapper.CrMapper;
import vs.co.co_001_1.dto.Page_DTO;
import vs.cr.cr_001_1.vo.CrVO;

@Service
public class Cr_ServiceImpl implements Cr_Service {

	@Autowired
	private CrMapper crmapper;

	//대회 후기 리스트
	@Override 
	public List<CrVO> Cr_List(Page_DTO dto) throws Exception{
		
		try {
			if(dto.getInput_text() == null || dto.getInput_text().equals("")) {
				dto.setInput_text("");
			}
			
			
			return crmapper.cr_list(dto);
			
		}catch(Exception e) {
			System.out.println("Cr_LIst" + e);
			return null;
		}
		
	}
 
	//대회 후기 작성
	@Override
	public int cr_insert(CrVO crvo) throws Exception {
		 
		return crmapper.cr_insert(crvo);
	} 

	@Override
	public List<CrVO> search_list(CrVO crvo) {
		
		try {
			return crmapper.search_list(crvo);
		}catch(Exception e) {
			System.out.println("검색필터 에러" + e);
			return null;
		}
	}
	 
	@Override
	public int get_total(Page_DTO dto) {
		
		try {
			
			return crmapper.get_total(dto);
			
		}catch(Exception e) {
			System.out.println("get_total" + e);
		}
		return 0;
	}
	
	
	
}
