package vs.sa.sa_002.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

 
@Service
@Repository
@Mapper
@Component
public class SA_002_DAOImpl implements SA_002_DAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Map<String, String>> SaProductsList() {
		System.out.println("SaProductsList DAOImpl");
		
		List<Map<String, String>> list = sqlSession.selectList("shop.SaDAOImpl.getList2");
		
		System.out.println(list + "dao : SaProductsList");
		
		return list;
	}
	
	@Override
	public List<Map<String, String>> searchProducts(String searchProducts) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("key",searchProducts);
		System.out.println(map.get("key")+"dao");
		List<Map<String, String>> list = sqlSession.selectList("shop.SaDAOImpl.searchProducts", map);
		
		System.out.println(list + " dao : SearchProduct 완료");
		
		return list;
	}
	

}
