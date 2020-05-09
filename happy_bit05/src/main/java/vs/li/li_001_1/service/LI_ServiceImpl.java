package vs.li.li_001_1.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import vs.li.li_001_01.vo.LI_VO;
import vs.li.li_001_1.dto.Page_DTO;

@Log4j
@Service
public class LI_ServiceImpl implements LI_Service {

	@Autowired
	private SqlSession sqlsession;

	
	
	@Override
	public void li_regist(LI_VO vo) {
		try {
		vo.setM_index("husker");
		sqlsession.insert("li.insert", vo);
		} catch (Exception e) {
			log.info("서비스 인서트 에러 : "+ e);
		}
	}

	
	
	
	@Override
	public List<LI_VO> get_list(/*LI_VO vo*/Page_DTO dto) {
		List<LI_VO> vvo;
		try {
/*			log.info(vo.getLi_b_type());
			log.info("서비스 쿼리문 확인");
			vvo = sqlsessionselectList("li.get_list", vo);
			log.info(vo.getLi_text());
			log.info("서비스 쿼리문 전송 성공");
			*/
			//텍스트가 null로 넘어왔을때 공백으로 바꿔줘서 전체검색을 하게 한다.------------------------------------------------------------
			if(dto.getInput_text() == null || dto.getInput_text().equals("")) {
				dto.setInput_text("");
			}
			
			log.info(dto.getType());
			log.info(dto.getTypeArr());
			
			log.info("---------------");
			log.info(dto.getSearch_filter());
			log.info(dto.getSearch_filterArr());
			
			//log.info("게시글 목록 확인 : "+sqlsessionselectList("li.get_list", dto));
			log.info("서비스 Sort"+dto.getSort());
			vvo = sqlsession.selectList("li.get_list", dto);
			
			return vvo;
		} catch (Exception e) {
			System.out.println(""
					+ "서비스 에러 : "+e);
			return null;
		}

	}
	
	
	
	
	@Override
	public int get_total(Page_DTO dto) {
		try {
			log.info( "get_total 쿼리문 확인");
			return sqlsession.selectOne("li.get_total",dto);
		} catch (Exception e) {
			System.out.println("서비스 에러 : "+e);
			return 0;
		}
	}
	
	@Override
	public List<LI_VO> search_list(LI_VO vo) {
		try {
			return sqlsession.selectList("li.search_list", vo);
		} catch (Exception e) {
			log.info("검색필터 에러"+e);
			return null;
		}
	}
	
	
	
	
	@Override
	public List<LI_VO> detail_page(String index) {
		// TODO Auto-generated method stub
		List<LI_VO> vvo;
		try {
			log.info("페이지 데이터 불러오기");
			log.info(index);
			vvo = sqlsession.selectList("li.detail_page",index); //상세페이지 불러오기
			log.info("LI_VO 리턴성공 --------------------");
			return vvo;
		} catch (Exception e) {
			log.info(e);
			
			return null;
		}
	}
	
	//조회수를 증가하게하는 쿼리
    //조회수 처리를 할때 일정 시간이 지난후 다시 클릭할때만 조회수가 증가하도록 설정
	@Override
	public void increse_see(LI_VO vo, HttpSession session ) {
		try {
			long update_time = 0; //null을 방지하기 위해 초기값을 null로 설정함
	        if(session.getAttribute("update_time_"+vo.getLi_index())!=null) {
	            //최근에 조회수를 올린 시간이 null이 아니면
	            update_time = (long)session.getAttribute("update_time_"+vo.getLi_index());
	        }
	       
	        long current_time = System.currentTimeMillis();
	        //일정 시간이 경과한 후에 조회수를 증가시킨다.
	        log.info("지난시간 : ");
	        log.info(current_time - update_time);
	        
	        //10분 후에 조회수 증가할수있게 제어문
	        if(current_time - update_time > 10*60*1000) {
	            
	        //조회수가 1증가했을때로부터 5000초 후에 다시 클릭을 해야 조회수가 다시 1 증가한다는 말이다.
	        //조회수 증가 처리
	        	log.info("보드 인덱스: : "+ vo.getLi_index());
	        	String index = (String)vo.getLi_index();
	            sqlsession.update("li.board_see",index);
	            log.info("조회수 증가");
	            
	            //조회수를 올린 시간을 저장함
	            session.setAttribute("update_time_"+vo.getLi_index(), current_time);
	        }else
	        	log.info("조회수 유지");
	
		} catch (Exception e) {
			log.info("조회수 증가 함수 에러 메세지 : "+e);
		}
        
	}
	
	
	@Override
	public int increse_good(HashMap<String, Object> hashmap) {
		try {
			int good_cnt = sqlsession.update("li.good_increse",hashmap);
			log.info("좋아요 수 : "+good_cnt);
			return sqlsession.update("good.like_check",hashmap);
		} catch (Exception e) {
			log.info("good_check 에러: "+e);
			return 0;
		}
	}
	
	@Override
	public int decrese_good(HashMap<String, Object> hashmap) {
		try {
			int good_cnt = sqlsession.update("li.good_decrese",hashmap);
			log.info("좋아요 수 : "+good_cnt);
			return sqlsession.update("good.like_check_cancel",hashmap);
		} catch (Exception e) {
			log.info("good_check 에러: "+e);
			return 0;
			// TODO: handle exception
		}
		
	}
	
	@Override
	public int good_check(HashMap<String, Object> hashmap) {
		try {
		log.info(hashmap.get("board_index"));
		log.info(hashmap.get("m_index"));
		//good_check 테이블에서   good_check 컬럼을 조회해서 리턴해준다.
		return sqlsession.selectOne("good.check",hashmap); 
		}catch(Exception e){
			log.info("good_check 에러: "+e);
			return 0;
			}
		}
	
	@Override
	public int good_cnt(HashMap<String, Object> hashmap) {
		return sqlsession.selectOne("li.good_cnt", hashmap);
	}
	
	@Override
	public int good_count(HashMap<String, Object> hashmap) {
		try {
			return sqlsession.selectOne("good.good_count",hashmap);
		} catch (Exception e) {
			log.info("--good_count 에러   : "+e);
			return 0;
		}
		
		
	}
	@Override
	public void good_insert(HashMap<String, Object> hashmap) {

		sqlsession.insert("good.check_row_insert",hashmap);
		
		log.info("로우 인서트 ");
	}
	
	@Override
	public void modify(LI_VO vo) {
		// TODO Auto-generated method stub
		
	}

}

