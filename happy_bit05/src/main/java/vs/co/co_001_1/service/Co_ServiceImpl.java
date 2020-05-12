package vs.co.co_001_1.service;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.ac.ac_001_1.vo.AcVO;
import vs.cm.cm_001_1.mapper.CoMapper;
import vs.co.co_001_1.dto.Page_DTO;
import vs.co.co_001_1.vo.CoVO;
import vs.cr.cr_001_1.vo.CrVO;


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
			if(dto.getInput_text() == null || dto.getInput_text().equals("")){
				dto.setInput_text("");
			}
			
		
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
		
		System.out.println("대회 인덱스 : " + covo.getCo_b_index());
		System.out.println("대회 참가자 업데이트 하러옴@@@@@@@@@@@");
		sqlSession.update("ac.updateCount", covo.getCo_b_index());
		System.out.println("대회 참가자 업데이트 완료@@@@@@@@@@@@@@@@@@@@2");
		
		return comapper.ap_insert(covo); 
	}

	@Override
	public List<AcVO> search_list(AcVO vo) {
		
		try {
			return sqlSession.selectList("ac.search_list", vo);
		} catch (Exception e) {
			System.out.println("검색필터 에러"+e);
			return null;
		}
	}
	
	//좋아요 추천수@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		@Override
		public void increse_see(AcVO vo, HttpSession httpsession) {
			try {
				long update_time = 0; //null을 방지하기 위해 초기값을 null로 설정함
		        if(httpsession.getAttribute("update_time_"+vo.getCo_b_index())!=null) {
		            //최근에 조회수를 올린 시간이 null이 아니면
		        	System.out.println("요기야?");
		            update_time = (long)httpsession.getAttribute("update_time_"+vo.getCo_b_index());
		        }
		       
		        long current_time = System.currentTimeMillis();
		        //일정 시간이 경과한 후에 조회수를 증가시킨다.
		        System.out.println("지난시간 : ");
		        System.out.println(current_time - update_time);
		        
		        //10분 후에 조회수 증가할수있게 제어문
		        if(current_time - update_time > 10*60*1000) {
		            
		        //조회수가 1증가했을때로부터 5000초 후에 다시 클릭을 해야 조회수가 다시 1 증가한다는 말이다.
		        //조회수 증가 처리
		        	System.out.println("보드 인덱스: : "+ vo.getCo_b_index());
		        	String index = vo.getCo_b_index();
		        	System.out.println(index);
		        	sqlSession.update("co.board_see",index);
		            System.out.println("조회수 증가");
		            
		            //조회수를 올린 시간을 저장함
		            httpsession.setAttribute("update_time_"+vo.getCo_b_index(), current_time);
		        }else
		        	System.out.println("조회수 유지");
		
			} catch (Exception e) {
				System.out.println("조회수 증가 함수 에러 메세지 : "+e);
			}
	        		
		}

		@Override
		public int increse_good(HashMap<String, Object> hashmap) {
			try {
				System.out.println("여기야? 그치? 여기지?");
				int good_cnt = sqlSession.update("co.good_increse",hashmap);
				System.out.println("좋아요 수 : "+good_cnt);
				return sqlSession.update("good.like_check",hashmap);
			} catch (Exception e) {
				System.out.println("good_check 에러: "+e);
				return 0;
			}
		}

		@Override
		public int decrese_good(HashMap<String, Object> hashmap) {
			try {
				int good_cnt = sqlSession.update("co.good_decrese",hashmap);
				System.out.println("좋아요 수 : "+good_cnt);
				return sqlSession.update("good.like_check_cancel",hashmap);
			} catch (Exception e) {
				System.out.println("good_check 에러: "+e);
				return 0;
				// TODO: handle exception
			}
		}

		@Override
		public int good_check(HashMap<String, Object> hashmap) {
			try {
				System.out.println("게시글 인덱스  : " +hashmap.get("board_index"));
				System.out.println("로그인 회원 인덱스 : " + hashmap.get("m_index"));
				System.out.println("뭘까?" +sqlSession.selectOne("good.check",hashmap));
				//good_check 테이블에서   good_check 컬럼을 조회해서 리턴해준다.
				return sqlSession.selectOne("good.check",hashmap); 
				}catch(Exception e){
					System.out.println("good_check 에러: "+e);
					return 0;
					}
		}

		@Override
		public int good_cnt(HashMap<String, Object> hashmap) {		
			System.out.println("여기야?" + sqlSession.selectOne("co.good_cnt", hashmap));
			return sqlSession.selectOne("co.good_cnt", hashmap);
		}

		@Override
		public int good_count(HashMap<String, Object> hashmap) {
			try {
				return sqlSession.selectOne("good.good_count",hashmap);
			} catch (Exception e) {
				System.out.println("--good_count 에러   : "+e);
				return 0;
			}
		}

		@Override
		public void good_insert(HashMap<String, Object> hashmap) {
			sqlSession.insert("good.check_row_insert",hashmap);
			
			System.out.println("로우 인서트 ");
			
		}
	
	
	
}
