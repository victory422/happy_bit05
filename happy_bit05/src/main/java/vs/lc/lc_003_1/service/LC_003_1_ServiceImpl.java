package vs.lc.lc_003_1.service;

import java.util.Map;

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
		
		System.out.println("서비스 단에서 번호는 : " + lc_index);
		
		return dao.getLC(lc_index);
	}

	@Override
	public boolean modifyLC(LC_003_1_VO vo) {
		// TODO Auto-generated method stub
		return dao.modifyLC(vo) == 1;
	}

	@Override
	public boolean modifyLC_thumbnail(Map<String, Object> hmap) {
		// TODO Auto-generated method stub
		return dao.modifyLC_thumbnail(hmap) == 1;
	}

}
