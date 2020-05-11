package vs.cr.cr_001_1.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.ac.ac_001_1.vo.AcVO;
import vs.cm.cm_001_1.mapper.CrMapper;
import vs.co.co_001_1.dto.Page_DTO;
import vs.cr.cr_001_1.vo.CrVO;

@Service
public class Cr_ServiceImpl implements Cr_Service {

	@Autowired
	private CrMapper crmapper;
	@Autowired
	SqlSession session;

	//대회 후기 리스트
	@Override 
	public List<CrVO> Cr_List(Page_DTO dto) throws Exception{
		
		try {
			if(dto.getInput_text() == null || dto.getInput_text().equals("")) {
				dto.setInput_text("");
			}
			
			
			return crmapper.cr_list(dto);
			
		}catch(Exception e) {
			System.out.println("Cr_LIst" + e);
			return null;
		}
		
	}
 
	//대회 후기 작성
	@Override
	public int cr_insert(CrVO crvo) throws Exception {
		 
		return crmapper.cr_insert(crvo);
	} 

	@Override
	public List<CrVO> search_list(CrVO crvo) {
		
		try {
			return crmapper.search_list(crvo);
		}catch(Exception e) {
			System.out.println("검색필터 에러" + e);
			return null;
		}
	}
	 
	@Override
	public int get_total(Page_DTO dto) {
		
		try {
			
			return crmapper.get_total(dto);
			
		}catch(Exception e) {
			System.out.println("get_total" + e);
		}
		return 0;
	}
	//대회 후기 상세보기
	@Override
	public List<CrVO> cr_detail(String co_r_index) {
		
		return crmapper.cr_detail(co_r_index);
		
	}

	@Override
	public int cr_delete(String co_r_index) {
	
		return crmapper.cr_delete(co_r_index);
	}

	@Override
	public int cr_update(CrVO crvo) {
		
		return crmapper.cr_update(crvo);
	}

	
	//좋아요 추천수@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@Override
	public void increse_see(CrVO vo, HttpSession httpsession) {
		try {
			long update_time = 0; //null을 방지하기 위해 초기값을 null로 설정함
	        if(httpsession.getAttribute("update_time_"+vo.getCo_r_index())!=null) {
	            //최근에 조회수를 올린 시간이 null이 아니면
	        	System.out.println("요기야?");
	            update_time = (long)httpsession.getAttribute("update_time_"+vo.getCo_r_index());
	        }
	       
	        long current_time = System.currentTimeMillis();
	        //일정 시간이 경과한 후에 조회수를 증가시킨다.
	        System.out.println("지난시간 : ");
	        System.out.println(current_time - update_time);
	        
	        //10분 후에 조회수 증가할수있게 제어문
	        if(current_time - update_time > 10*60*1000) {
	            
	        //조회수가 1증가했을때로부터 5000초 후에 다시 클릭을 해야 조회수가 다시 1 증가한다는 말이다.
	        //조회수 증가 처리
	        	System.out.println("보드 인덱스: : "+ vo.getCo_r_index());
	        	String index = vo.getCo_r_index();
	        	System.out.println(index);
	            session.update("vs.cm.cm_001_1.mapper.CrMapper.board_see",index);
	            System.out.println("조회수 증가");
	            
	            //조회수를 올린 시간을 저장함
	            httpsession.setAttribute("update_time_"+vo.getCo_r_index(), current_time);
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
			int good_cnt = session.update("vs.cm.cm_001_1.mapper.CrMapper.good_increse",hashmap);
			System.out.println("좋아요 수 : "+good_cnt);
			return session.update("good.like_check",hashmap);
		} catch (Exception e) {
			System.out.println("good_check 에러: "+e);
			return 0;
		}
	}

	@Override
	public int decrese_good(HashMap<String, Object> hashmap) {
		try {
			int good_cnt = session.update("vs.cm.cm_001_1.mapper.CrMapper.good_decrese",hashmap);
			System.out.println("좋아요 수 : "+good_cnt);
			return session.update("good.like_check_cancel",hashmap);
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
			System.out.println("뭘까?" +session.selectOne("good.check",hashmap));
			//good_check 테이블에서   good_check 컬럼을 조회해서 리턴해준다.
			return session.selectOne("good.check",hashmap); 
			}catch(Exception e){
				System.out.println("good_check 에러: "+e);
				return 0;
				}
	}

	@Override
	public int good_cnt(HashMap<String, Object> hashmap) {		
		System.out.println("여기야?" + session.selectOne("vs.cm.cm_001_1.mapper.CrMapper.good_cnt", hashmap));
		return session.selectOne("vs.cm.cm_001_1.mapper.CrMapper.good_cnt", hashmap);
	}

	@Override
	public int good_count(HashMap<String, Object> hashmap) {
		try {
			return session.selectOne("good.good_count",hashmap);
		} catch (Exception e) {
			System.out.println("--good_count 에러   : "+e);
			return 0;
		}
	}

	@Override
	public void good_insert(HashMap<String, Object> hashmap) {
		session.insert("good.check_row_insert",hashmap);
		
		System.out.println("로우 인서트 ");
		
	}

	
	//대회 리스트 출력
	@Override
	public List<AcVO> co_list() {
		
		return crmapper.co_list();
	}


	
	
	
}
