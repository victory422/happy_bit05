package vs.pr.pr_002_1.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.cm.cm_001_1.mapper.PrMapper;
import vs.co.co_001_1.dto.Page_DTO;
import vs.pr.pr_002_1.vo.Pr_002_1VO;

@Service
public class Pr_002_1_ServiceImpl implements Pr_002_1_Service{

	@Autowired
	private PrMapper prmapper;
	
	
	@Override
	public List<Pr_002_1VO> pr_list(Page_DTO dto) {
		
		return prmapper.pr_list(dto);
	}


	@Override
	public int get_total(Page_DTO dto) {
		
		try {
			
			return prmapper.get_total(dto);
			
		}catch(Exception e) {
			System.out.println("get_total" + e);
		}
		
		
		return 0;
	}


	@Override
	public List<Pr_002_1VO> chart_list() {
		
		return prmapper.chart_list();
	}

}
