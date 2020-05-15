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
	public List<CoVO> ac_member(String co_b_index) throws Exception {
	
		
		System.out.println(co_b_index + "service");
		
		return comapper.ac_member(co_b_index);
	}
	@Override
	public int statechange(String co_b_index) {
		 
		return comapper.statechange(co_b_index);
	}
	@Override
	public List<AcVO> ac_detail(String co_b_index) throws Exception {
		
		return comapper.ac_detail(co_b_index);
	}
	@Override
	public List<CoVO> ac_memberlist(Page_DTO dto) throws Exception {
		
			System.out.println("대회 참가자 리스트 서비스");
			
		return comapper.ac_memberlist(dto);
	}
	@Override
	public int m_statechange(Map<String, Object> hmap) {
		
		
		return comapper.m_statechange(hmap);
	}
	@Override
	public int get_total(Page_DTO dto) {
		
		return comapper.get_total(dto);
	}
	
	
	
}
