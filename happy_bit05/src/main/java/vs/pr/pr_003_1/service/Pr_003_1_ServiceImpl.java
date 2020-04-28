package vs.pr.pr_003_1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.cm.cm_001_1.mapper.PrMapper;
import vs.pr.pr_002_1.vo.Pr_002_1VO;

@Service
public class Pr_003_1_ServiceImpl implements Pr_003_1_Service {

	@Autowired
	private PrMapper prmapper;
	
	//개인기록 상세보기
	@Override
	public List<Pr_002_1VO> pr_detail(String pr_index) {
		
		return prmapper.pr_detail(pr_index);
		
	}

	
	
}
