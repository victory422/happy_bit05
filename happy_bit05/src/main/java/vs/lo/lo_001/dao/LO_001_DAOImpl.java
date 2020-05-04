package vs.lo.lo_001.dao;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import lombok.extern.log4j.Log4j;
import vs.lo.lo_001.vo.LO_001_VO;



@Service
@Repository
@Mapper
@Component
@Log4j
public class LO_001_DAOImpl implements LO_001_DAO{
	

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<LO_001_VO> login(LO_001_VO vo) {
		int loginCheck = sqlSession.selectOne("member.login", vo);
		List<LO_001_VO> list = new ArrayList<LO_001_VO>();
		log.info("logincheck : "+vo);
		
		if(loginCheck==1) {
			list = sqlSession.selectList("member.getList", vo);
			list.get(0).setLoginCheck(loginCheck);
		}else {
			vo.setLoginCheck(loginCheck);
			list.add(vo); 
		}
		
		log.info(list.get(0));
		return list;
	}
	


}
