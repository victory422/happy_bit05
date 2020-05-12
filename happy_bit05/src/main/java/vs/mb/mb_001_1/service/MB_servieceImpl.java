package vs.mb.mb_001_1.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_003_1.vo.LC_003_1_VO;
import vs.lo.lo_001.vo.LO_001_VO;
import vs.mb.mb_001_1.dao.MB_dao;

@Log4j
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
	public List<LC_003_1_VO> get_CourseList() {
		return dao.getCourseList();
	}
	
	@Override
	public Boolean login(LO_001_VO vo) {
		log.info("login서비스");
		return dao.login(vo);
	}
	
	@Override
	public List<Map<String, String>> getMyRecordList(String m_index) {
		return dao.getMyRecordList(m_index);
	}
	
	@Override
	public List<Map<String, String>> getMyRecordListSort(Map<String, String> map) {
		return dao.getMyRecordListSort(map);
	}
	
}
