package vs.mb.mb_001_1.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_003_1.vo.LC_003_1_VO;

@Component
@AllArgsConstructor
@Log4j
public class MB_daoImpl implements MB_dao{

	private SqlSession session;
	
	@Override
	public LC_003_1_VO getLC(String lc_index) {
		// TODO Auto-generated method stub
		System.out.println("DAO에서 번호는??? : " + lc_index);
		return session.selectOne("lc.lc_003_01", lc_index);
	}
	
	@Override
	public List<Map<String, String>> getMyRecordList(String m_index) {
		return session.selectList("lc.getMyRecordList", m_index);
	}
	
}
