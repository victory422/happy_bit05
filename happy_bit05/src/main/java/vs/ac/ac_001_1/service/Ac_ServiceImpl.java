package vs.ac.ac_001_1.service;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.ac.ac_001_1.vo.AcVO;

@Service
public class Ac_ServiceImpl implements Ac_Service {

	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<AcVO> ac_List(AcVO acvo) {
		List<AcVO> list;
		
		
		try {
 
			list = sqlSession.selectList("ac.ac_list", acvo);

			return list;

		} catch (Exception e) {
			System.out.println("ac_List ���� " + e);
			return null;
		}

	}
	@Override
	public void ac_insert(AcVO acvo) {
		
		sqlSession.insert("ac.ac_insert" , acvo);
		
	}
	
}
