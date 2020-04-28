package vs.ac.ac_001_1.service;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.ac.ac_001_1.vo.AcVO;
import vs.cm.cm_001_1.mapper.CoMapper;
import vs.co.co_001_1.dto.Page_DTO;
import vs.co.co_001_1.vo.CoVO;

@Service
public class Ac_ServiceImpl implements Ac_Service {

	
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private CoMapper comapper;
	
	public List<AcVO> ac_List(Page_DTO dto) {
		List<AcVO> list;
		
		
		try {
 
			list = sqlSession.selectList("ac.ac_list",dto);

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
	@Override
	public void insertTu(Map<String, Object> hmap) {
		
		sqlSession.update("ac.ac_001_01_thumbnail", hmap);
		
	}
	@Override
	public List<CoVO> ac_detail(String co_b_index) throws Exception {
	
		
		System.out.println(co_b_index + "service");
		
		return comapper.ac_detail(co_b_index);
	}
	
	
	
}
