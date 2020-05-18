package vs.mb.mb_001_1.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_003_1.vo.LC_003_1_VO;
import vs.lo.lo_001.vo.LO_001_VO;
import vs.mb.mb_001_1.dao.MB_dao;
import vs.mb.mb_001_1.vo.PR_VO;
import vs.pr.pr_002_1.vo.Pr_002_1VO;
import vs.pr.pr_002_1.vo.Upload_pr_vo;

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
		log.info("getMyRecordListSorting");
		return dao.getMyRecordListSort(map);
	}

	@Override
	public void regist(PR_VO pr_vo) {
		// TODO Auto-generated method stub
		dao.regist(pr_vo);
	}
	
	@Override
	public Pr_002_1VO upload(String pr_index) {
		// TODO Auto-generated method stub
		return dao.upload(pr_index);
	}
	
	//썸네일
	@Override
	public void update1(Upload_pr_vo pr_vo) {
		// TODO Auto-generated method stub
		dao.update1(pr_vo);
	}
	@Override
	public void update2(Map<String, Object> hmap) {
		// TODO Auto-generated method stub
		dao.update2(hmap);
	}
	@Override
	public List<Pr_002_1VO> pr_list() {
		// TODO Auto-generated method stub
		return dao.pr_list();
	}

	@Override
	public List<Map<String, String>> getMCListAppSort(Map<String, String> map) {
		log.info("getMCList sort ing");
		return dao.getMCListAppSort(map);
	}
}
