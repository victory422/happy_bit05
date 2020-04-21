package vs.lc.lc_002_1.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_002_1.vo.Criteria;
import vs.lc.lc_002_1.vo.LC_002_1_VO;

@Component
@Log4j
@AllArgsConstructor
public class LC_002_1_DaoImpl implements LC_002_1_Dao{
	
	private SqlSession session;
	@Override
	public List<LC_002_1_VO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		
		log.info("코스 리스트 DAO.....");
		log.info("----------------" + session);
		
		System.out.println(cri.getKeyword());
		System.out.println(cri.getType());
		
		return session.selectList("lc.LC_002_01", cri);
	}
	
	@Override
	public List<LC_002_1_VO> getGood() {
		// TODO Auto-generated method stub
		
		return session.selectList("lc.LC_002_01_good");
	}

	@Override
	public List<LC_002_1_VO> getSearch(String keyword) {
		// TODO Auto-generated method stub
		return session.selectList("lc.LC_002_01_search", keyword);
	}

	@Override
	public List<LC_002_1_VO> getSearch_good(String keyword) {
		// TODO Auto-generated method stub
		return session.selectList("lc.LC_002_01_search_good", keyword);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectOne("getTotalCount", cri);
	}

}
