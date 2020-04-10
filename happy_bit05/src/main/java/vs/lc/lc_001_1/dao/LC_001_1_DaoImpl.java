package vs.lc.lc_001_1.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import vs.lc.lc_001_1.vo.LC_001_1_MapVO;
import vs.lc.lc_001_1.vo.LC_001_1_VO;

@Component
@AllArgsConstructor
public class LC_001_1_DaoImpl implements LC_001_1_Dao{
	
	private SqlSession sqlSession;

	@Override
	public void insert(LC_001_1_VO vo, LC_001_1_MapVO vo2) {
		System.out.println("dao 단 : " + vo);
		
		sqlSession.insert("lc.lc_001_01", vo);
		sqlSession.insert("lc.lc_001_01_map", vo2);
	}

	@Override
	public List<LC_001_1_VO> getList() {
		// TODO Auto-generated method stub
		return null;
	}

}
