package vs.ac.ac_001_1.service;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.ac.ac_001_1.vo.AcVO;
import vs.co.co_001_1.dto.Page_DTO;

@Service
public class Ac_ServiceImpl implements Ac_Service {

	
	@Autowired
	private SqlSession sqlSession;

	public Page_DTO ac_List(Page_DTO dto) {
		List<AcVO> list;
		
		
		try {
 
			list = sqlSession.selectList("ac.ac_list",dto);

			return dto;

		} catch (Exception e) {
			System.out.println("ac_List ���� " + e);
			return null;
		}

	}
	@Override
	public void ac_insert(AcVO acvo) {
		
		
		
		sqlSession.insert("ac.ac_insert" , acvo);
		
	}
	@Override
	public void insertTu(Map<String, Object> hmap) {
		
		sqlSession.update("ac.ac_001_01_thumbnail", hmap);
		
	}
	
	
	
}
