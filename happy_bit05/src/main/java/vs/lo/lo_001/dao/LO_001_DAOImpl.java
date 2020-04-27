package vs.lo.lo_001.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import vs.lo.lo_001.vo.LO_001_VO;



@Service
@Repository
@Mapper
@Component
public class LO_001_DAOImpl implements LO_001_DAO{
	

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<LO_001_VO> login(LO_001_VO vo) {
		System.out.println("lo dao "+ vo);
		int loginCheck = sqlSession.selectOne("member.login", vo);
		List<LO_001_VO> list = sqlSession.selectList("member.getList", vo);
		list.get(0).setLoginCheck(loginCheck);
		System.out.println("success dao memberList : " +list);
		return list;
	}
	


}
