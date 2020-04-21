package vs.lc.lc_002_1.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_002_1.dao.LC_002_1_Dao;
import vs.lc.lc_002_1.vo.Criteria;
import vs.lc.lc_002_1.vo.LC_002_1_VO;

@Log4j
@Service
@AllArgsConstructor
public class LC_002_1_ServiceImpl implements LC_002_1_Service{
	
	private LC_002_1_Dao dao;

	@Override
	public List<LC_002_1_VO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		
		log.info("코스 리스트 조회.......");
		return dao.getList(cri);
	}

	@Override
	public List<LC_002_1_VO> getGood() {
		// TODO Auto-generated method stub
		
		return dao.getGood();
	}

	@Override
	public List<LC_002_1_VO> getSearch(String keyword) {
		// TODO Auto-generated method stub
		return dao.getSearch(keyword);
	}

	@Override
	public List<LC_002_1_VO> getSearch_good(String keyword) {
		// TODO Auto-generated method stub
		return dao.getSearch_good(keyword);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return dao.getTotalCount(cri);
	}

}
