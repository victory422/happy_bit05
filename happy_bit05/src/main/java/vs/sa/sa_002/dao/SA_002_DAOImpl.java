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
import vs.sa.sa_002.dto.Page_DTO;
import vs.sa.sa_002.vo.PageUtil;



@Service
@Repository
@Mapper
@Component
public class SA_002_DAOImpl implements SA_002_DAO{
	

	@Autowired
	private SqlSession sqlSession;
	private PageUtil pageutil;
	
	@Override
	public List<Map<String, String>> SaProductsList(Page_DTO dto) {
		System.out.println("SaProductsList DAOImpl");
		System.out.println("page number is : "+dto);
		List<Map<String, String>> list = sqlSession.selectList("shop.SaDAOImpl.get_list", dto);
		
		System.out.println(list + "dao : SaProductsList");
		
		return list;
	}
	
	@Override
	public List<Map<String, String>> searchProducts(Page_DTO dto) {
		System.out.println("searchProducts DAOImpl (dto):"+dto);
		List<Map<String, String>> list = sqlSession.selectList("shop.SaDAOImpl.searchProducts", dto);
		System.out.println(list + " dao : SearchProduct 완료");
		return list;
	}
	
	@Override
	public PageUtil SaGetTotal(Page_DTO dto) {
		System.out.println("getTotal DAOImpl");
		System.out.println("dao getTotal : " +dto);
		int total = sqlSession.selectOne("shop.SaDAOImpl.paging_total", dto);
		pageutil = new PageUtil(dto, total);
		System.out.println("total : "+total);
		System.out.println("dto : "+dto);
		
		System.out.println("pageutil : "+pageutil);
		
		return pageutil;
	}

}
