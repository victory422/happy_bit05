package vs.re.re_001_1.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.cm.cm_001_1.mapper.ReMapper;
import vs.re.re_001_1.vo.ReVO;

@Service
public class Re_001_1_ServiceImpl implements Re_001_1_Service{

	@Autowired
	private ReMapper remapper;
	@Autowired
	private SqlSession sqlSession;
	
	
	//신고 작성
	@Override
	public int re_insert(ReVO revo) throws Exception {
		 System.out.println("가겠지?");
		 System.out.println("m_index" + revo.getM_index());
		sqlSession.update("vs.cm.cm_001_1.mapper.ReMapper.updateCount", revo);
		String count = sqlSession.selectOne("vs.cm.cm_001_1.mapper.ReMapper.countselect", revo.getM_index());
		//카운트가 5이상일때 state 값 2로 변경
		if(count.equals("5")) {
			sqlSession.update("vs.cm.cm_001_1.mapper.ReMapper.updatestate", revo.getM_index());
		}
		return remapper.re_insert(revo);
	}
	
}
