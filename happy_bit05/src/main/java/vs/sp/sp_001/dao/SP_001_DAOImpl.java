package vs.sp.sp_001.dao;

import java.util.List;
import java.util.Map;
import javax.xml.stream.events.Namespace;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

 
@Service
@Repository
public class SP_001_DAOImpl implements SP_001_DAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map> Sp_List() {
		System.out.println("gogo DAOImpl");
		
		List<Map> list = sqlSession.selectList("sp.sp_list");
		
		System.out.println(list + "dao : list");
		
		return list;
	}

	@Override
	public List<Map> SpList() {
		// TODO Auto-generated method stub
		return null;
	}
}
