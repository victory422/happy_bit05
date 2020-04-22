package vs.lc.lc_003_1.dao;

import java.util.Map;

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
		System.out.println("DAO에서 번호는??? : " + lc_index);
		return session.selectOne("lc_003_01", lc_index);
	}

	@Override
	public int modifyLC(LC_003_1_VO vo) {
		// TODO Auto-generated method stub
		
		System.out.println(vo.getLc_index());
		return session.update("lc_003_02", vo);
	}

	@Override
	public int modifyLC_thumbnail(Map<String, Object> hmap) {
		// TODO Auto-generated method stub
		return session.update("lc_003_02_thumbnail", hmap);
	}


}
