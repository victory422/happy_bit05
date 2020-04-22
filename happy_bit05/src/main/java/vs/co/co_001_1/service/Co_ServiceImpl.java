package vs.co.co_001_1.service;


import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.ac.ac_001_1.vo.AcVO;
import vs.cm.cm_001_1.mapper.CoMapper;
import vs.co.co_001_1.dto.Page_DTO;
import vs.co.co_001_1.vo.CoVO;


@Service
public class Co_ServiceImpl implements Co_Service {

	@Autowired
	private CoMapper comapper;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int get_total(Page_DTO dto) {
		
		try {
			
			return sqlSession.selectOne("ac.get_total",dto);
			
		}catch(Exception e) {
			System.out.println("get_total : " + e);
		}
		
		return 0;
	}
	
	//대회 게시판 리스트 
	@Override
	public List<AcVO> co_List(Page_DTO dto) {
		List<AcVO> list;
		 
		try {
 
			list = sqlSession.selectList("ac.ac_list", dto);

			return list;

		} catch (Exception e) {
			System.out.println("ac_List ���� " + e);
			return null;
		}

	}
	//대회 게시판 상세보기
	@Override
	public List<AcVO> co_detail(String co_b_index) {
 
		
		try {
			System.out.println("co_service" + co_b_index);
		
		List<AcVO> co_detail = sqlSession.selectList("co.co_detail", co_b_index);
		
		return co_detail;
		
		}catch(Exception e) {
			System.out.println("co.co_detail���� : " + e);
			
			return null;
		}
	}
	//대회 접수 리스트
	@Override
	public List<AcVO> ap_list(String co_b_index) throws Exception{
		 
		 
		return comapper.ap_list(co_b_index);
		
	}
	 
	//대회 접수 
	@Override
	public int ap_insert(CoVO covo) throws Exception{
		 
		return comapper.ap_insert(covo); 
	}
	
	
}
