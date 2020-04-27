package vs.pr.pr_002_1.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vs.co.co_001_1.dto.Page_DTO;
import vs.pr.pr_002_1.vo.Pr_002_1VO;

public interface Pr_002_1_Service {
	

	//개인기록 리스트
	public List<Pr_002_1VO> pr_list(Page_DTO dto); 
	
	
	public int get_total(Page_DTO dto);
	
}
