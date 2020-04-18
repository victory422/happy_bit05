package vs.ac.ac_001_1.dao;

import java.util.List;
import java.util.Map;

import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import vs.ac.ac_001_1.domain.AcVO;
 
@Service
@Repository
public class AcDAOImpl implements AcDAO{

	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public List<AcVO> Ac_List() {
		
		System.out.println("����� DAOImpl");
		
		List<AcVO> list = sqlSession.selectList("ac.ac_list");
		
		System.out.println(list + "dao : list");
		
		return list;
		
	}
	
}
