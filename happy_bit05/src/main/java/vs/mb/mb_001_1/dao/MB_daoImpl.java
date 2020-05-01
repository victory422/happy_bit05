package vs.mb.mb_001_1.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import vs.lc.lc_003_1.vo.LC_003_1_VO;

@Component
@AllArgsConstructor
public class MB_daoImpl implements MB_dao{

	private SqlSession session;
	
	@Override
	public LC_003_1_VO getLC(String lc_index) {
		// TODO Auto-generated method stub
		System.out.println("DAO에서 번호는??? : " + lc_index);
		return session.selectOne("lc.LC_003_01", lc_index);
	}
	
	@Override
	public List<LC_003_1_VO> getCourseList() {
		System.out.println("다오");
		return session.selectList("mb.getlist");
	}
}
