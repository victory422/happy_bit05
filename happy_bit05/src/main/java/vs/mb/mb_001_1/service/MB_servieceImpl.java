package vs.mb.mb_001_1.service;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import vs.lc.lc_003_1.vo.LC_003_1_VO;
import vs.mb.mb_001_1.dao.MB_dao;

@Component
@AllArgsConstructor
@Service
public class MB_servieceImpl implements MB_service{
	
	private MB_dao dao;
	
	@Override
	public LC_003_1_VO getLC(String lc_index) {
		System.out.println("서비스 단에서 번호는 : " + lc_index);
		
		return dao.getLC(lc_index);
	}
	
	@Override
	public List<LC_003_1_VO> getCourseList() {
		return dao.getCourseList();
	}
}
