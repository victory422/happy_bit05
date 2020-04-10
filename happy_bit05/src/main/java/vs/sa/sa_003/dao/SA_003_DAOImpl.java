package vs.sa.sa_003.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

 
@Service
@Repository
@Mapper
public class SA_003_DAOImpl implements SA_003_DAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map> SaList() {
		
		return null;
	}

	@Override
	public Map SaleInsert(Map map) {
		System.out.println("sale insert DAOImpl");
		
		sqlSession.selectList("shop.SaDAOImpl.saleInsert", map);
		
		System.out.println(map + "dao : Insert");
		
		return map;
	}
	
	@Override
	public List<Map<String, String>> SaProductsList() {
		System.out.println("SaProductsList DAOImpl");
		
		List<Map<String, String>> list = sqlSession.selectList("shop.SaDAOImpl.getList2");
		
		System.out.println(list + "dao : SaProductsList");
		
		return list;
	}
	
	@Override
	public String getTime() {
		System.out.println("getTime start");
		
		String data = sqlSession.selectOne("vs.sa.sa_003.dao.SaDAOImpl.getList");
		System.out.println(data + "getTime end");
		
		return data;
	}
	
}
