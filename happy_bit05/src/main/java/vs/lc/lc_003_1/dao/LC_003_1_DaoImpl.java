package vs.lc.lc_003_1.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_002_1.dao.LC_002_1_DaoImpl;
import vs.lc.lc_003_1.vo.LC_003_1_VO;

@Component
@Log4j
@AllArgsConstructor
public class LC_003_1_DaoImpl implements LC_003_1_Dao{
	
	private SqlSession session;

	@Override
	public LC_003_1_VO getLC(String lc_index) {
		// TODO Auto-generated method stub
		return session.selectOne("LC_003_01", lc_index);
	}


}
