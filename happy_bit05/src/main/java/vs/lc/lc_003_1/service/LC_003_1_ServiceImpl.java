package vs.lc.lc_003_1.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_003_1.dao.LC_003_1_Dao;
import vs.lc.lc_003_1.vo.LC_003_1_VO;
import vs.li.li_001_01.vo.LI_VO;

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

	@Override
	public boolean deleteLC(String lc_index) {
		// TODO Auto-generated method stub
		return dao.deleteLC(lc_index) == 1;
	}

	@Override
	public boolean deleteLC_map(String lc_index) {
		// TODO Auto-generated method stub
		return dao.deleteLC_map(lc_index) == 1;
	}

	@Override
	public boolean myCourseSearch(LC_003_1_VO vo) {
		// TODO Auto-generated method stub
		return dao.myCourseSearch(vo) == 1;
	}

	@Override
	public void myCourseInsert(LC_003_1_VO vo) {
		// TODO Auto-generated method stub
		dao.myCourseInsert(vo);
	}

	@Override
	public boolean myCourseDelete(LC_003_1_VO vo) {
		// TODO Auto-generated method stub
		return dao.myCourseDelete(vo) == 1;
	}

	@Override
	public void increse_see(LC_003_1_VO vo, HttpSession session) {
		dao.increse_see(vo, session);
	}

	@Override
	public int increse_good(HashMap<String, Object> hashMap) {
		return dao.increse_good(hashMap);
	}

	@Override
	public int decrese_good(HashMap<String, Object> hashMap) {
		
		// TODO Auto-generated method stub
		return dao.decrese_good(hashMap);
	}

	@Override
	public int good_check(HashMap<String, Object> hashMap) {
		// TODO Auto-generated method stub
		return dao.good_check(hashMap);
		
	}

	@Override
	public int good_cnt(HashMap<String, Object> hashmap) {
		// TODO Auto-generated method stub
		return dao.good_cnt(hashmap);
	}

	@Override
	public int good_count(HashMap<String, Object> hashmap) {
		// TODO Auto-generated method stub
		return dao.good_count(hashmap);
	}

	@Override
	public void good_insert(HashMap<String, Object> hashmap) {
		dao.good_insert(hashmap);
		// TODO Auto-generated method stub
		
	}

}
