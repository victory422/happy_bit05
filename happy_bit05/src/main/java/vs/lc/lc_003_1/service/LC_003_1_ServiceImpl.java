package vs.lc.lc_003_1.service;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_003_1.dao.LC_003_1_Dao;
import vs.lc.lc_003_1.vo.LC_003_1_VO;

@Service
@Log4j
@AllArgsConstructor
public class LC_003_1_ServiceImpl implements LC_003_1_Service{
	
	private LC_003_1_Dao dao;

	@Override
	public LC_003_1_VO getLC(String lc_index) {
		
		return dao.getLC(lc_index);
	}

}
