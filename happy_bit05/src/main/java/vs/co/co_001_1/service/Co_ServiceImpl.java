package vs.co.co_001_1.service;


import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.ac.ac_001_1.vo.AcVO;


@Service
public class Co_ServiceImpl implements Co_Service {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AcVO> co_List(AcVO acvo) {
		List<AcVO> list;
		 
		try {
 
			list = sqlSession.selectList("ac.ac_list", acvo);

			return list;

		} catch (Exception e) {
			System.out.println("ac_List 에러 " + e);
			return null;
		}

	}
	@Override
	public List<AcVO> co_detail(String co_b_index) {
 
		
		try {
			System.out.println("co_service" + co_b_index);
		
		List<AcVO> co_detail = sqlSession.selectList("co.co_detail", co_b_index);
		
		return co_detail;
		
		}catch(Exception e) {
			System.out.println("co.co_detail에러 : " + e);
			
			return null;
		}
	}
	
	
	
	
}
