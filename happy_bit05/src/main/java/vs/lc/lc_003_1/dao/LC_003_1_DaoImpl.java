package vs.lc.lc_003_1.dao;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_002_1.dao.LC_002_1_DaoImpl;
import vs.lc.lc_003_1.vo.LC_003_1_VO;

@Component
@Log4j
@AllArgsConstructor
public class LC_003_1_DaoImpl implements LC_003_1_Dao{
	
	private SqlSession session;

	@Override
	public LC_003_1_VO getLC(String lc_index) {
		// TODO Auto-generated method stub
		System.out.println("DAO에서 번호는??? : " + lc_index);
		return session.selectOne("lc_003_01", lc_index);
	}

	@Override
	public int modifyLC(LC_003_1_VO vo) {
		// TODO Auto-generated method stub
		
		System.out.println(vo.getLc_index());
		return session.update("lc_003_02", vo);
	}

	@Override
	public int modifyLC_thumbnail(Map<String, Object> hmap) {
		// TODO Auto-generated method stub
		return session.update("lc_003_02_thumbnail", hmap);
	}

	@Override
	public int deleteLC(String lc_index) {
		// TODO Auto-generated method stub
		return session.delete("lc_003_03", lc_index);
	}

	@Override
	public int deleteLC_map(String lc_index) {
		// TODO Auto-generated method stub
		return session.delete("lc_003_03_map", lc_index);
	}

	@Override
	public int myCourseSearch(LC_003_1_VO vo) {
		// TODO Auto-generated method stub
		return session.selectOne("lc_003_04_search", vo);
	}

	@Override
	public void myCourseInsert(LC_003_1_VO vo) {
		// TODO Auto-generated method stub
		session.insert("lc_003_04", vo);
	}

	@Override
	public int myCourseDelete(LC_003_1_VO vo) {
		// TODO Auto-generated method stub
		return session.delete("lc_003_04_delete", vo);
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	@Override
	public void increse_see(LC_003_1_VO vo, HttpSession httpsession) {
		// TODO Auto-generated method stub
		try {
			long update_time = 0; //null을 방지하기 위해 초기값을 null로 설정함
	        if(httpsession.getAttribute("update_time_"+vo.getLc_index())!=null) {
	            //최근에 조회수를 올린 시간이 null이 아니면
	            update_time = (long)httpsession.getAttribute("update_time_"+vo.getLc_index());
	        }
	       
	        long current_time = System.currentTimeMillis();
	        //일정 시간이 경과한 후에 조회수를 증가시킨다.
	        log.info("지난시간 : ");
	        log.info(current_time - update_time);
	        
	        //10분 후에 조회수 증가할수있게 제어문
	        if(current_time - update_time > 10*60*1000) {
	            
	        //조회수가 1증가했을때로부터 5000초 후에 다시 클릭을 해야 조회수가 다시 1 증가한다는 말이다.
	        //조회수 증가 처리
	        	log.info("보드 인덱스: : "+ vo.getLc_index());
	        	String index = (String)vo.getLc_index();
	            session.update("lc.board_see",index);
	            log.info("조회수 증가");
	            
	            //조회수를 올린 시간을 저장함
	            httpsession.setAttribute("update_time_"+vo.getLc_index(), current_time);
	        }else
	        	log.info("조회수 유지");
	
		} catch (Exception e) {
			log.info("조회수 증가 함수 에러 메세지 : "+e);
		}
		
	}

	@Override
	public int increse_good(HashMap<String, Object> hashmap) {
		// TODO Auto-generated method stub
		try {
			int good_cnt = session.update("lc.good_increse",hashmap);
			log.info("좋아요 수 : "+good_cnt);
			return session.update("good.like_check",hashmap);
		} catch (Exception e) {
			log.info("good_check 에러: "+e);
			return 0;
		}
	}

	@Override
	public int decrese_good(HashMap<String, Object> hashmap) {
		try {
			int good_cnt = session.update("lc.good_decrese",hashmap);
			log.info("좋아요 수 : "+good_cnt);
			return session.update("good.like_check_cancel",hashmap);
		} catch (Exception e) {
			log.info("good_check 에러: "+e);
			return 0;
			// TODO: handle exception
		}
	}

	@Override
	public int good_check(HashMap<String, Object> hashmap) {
		try {
		log.info("ㅇㅇㅇㅇ : " + hashmap.get("board_index"));
		log.info("ㅁㅁㅁㅁㅁㅁ : " + hashmap.get("m_index"));
		//good_check 테이블에서   good_check 컬럼을 조회해서 리턴해준다.
		return session.selectOne("good.check",hashmap); 
		}catch(Exception e){
			log.info("good_check 에러: "+e);
			return 0;
			}
	}

	@Override
	public int good_cnt(HashMap<String, Object> hashmap) {
		return session.selectOne("lc.good_cnt", hashmap);
	}

	@Override
	public int good_count(HashMap<String, Object> hashmap) {
		try {
			System.out.println("dao hashmap : " + hashmap.get("m_index"));
			System.out.println("dao hashmap : " + hashmap.get("board_index"));
			return session.selectOne("good.good_count",hashmap);
		} catch (Exception e) {
			log.info("--good_count 에러   : "+e);
			return 0;
		}
	}

	@Override
	public void good_insert(HashMap<String, Object> hashmap) {
		session.insert("good.check_row_insert",hashmap);
		
		log.info("로우 인서트 ");
		
	}



	
	
}
