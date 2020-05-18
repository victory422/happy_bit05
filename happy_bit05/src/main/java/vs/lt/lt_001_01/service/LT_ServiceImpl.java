package vs.lt.lt_001_01.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import vs.li.li_001_1.dto.Page_DTO;
import vs.lt.lt_001_01.vo.LT_VO;

@Log4j
@Service
public class LT_ServiceImpl implements LT_Service{
	
	@Autowired
	private SqlSession sqlsession;
	
	//인서트 -----------------------------------------------------
	@Override
	public void regist(LT_VO vo) {
		try {
			log.info("글 등록중-------------------");
			sqlsession.insert("lt.insert", vo);
			log.info("글등록 완료");
			
		} catch (Exception e) {
			log.info("lt_regist"+e);
		}
		
	}
	
	//리스트--------------------------------------------------------
	
	
	@Override
	public List<LT_VO> get_list(Page_DTO dto) {
		try {
			
			if(dto.getInput_text() == null || dto.getInput_text().equals("")) {
				dto.setInput_text("");
			}
			
			return sqlsession.selectList("lt.get_list", dto);
			
		} catch (Exception e) {
			log.info(e);
		}
		return null;
	}
	
	
	//게시물 갯수 불러오는 쿼리---------------------------------------------------
	
	@Override
	public int get_total(Page_DTO dto) {
		try {
			
			return sqlsession.selectOne("lt.get_total", dto);
			
		} catch (Exception e) {
			log.info(e);
			return 0;
		}
	}
	
	//서치 (사용안함)---------------------------------------------------
	@Override
	public List<LT_VO> search_list(LT_VO vo) {
		try {
			return sqlsession.selectList("lt.search_list", vo);
		} catch (Exception e) {
			log.info(e);
			return null;
		}
	}
	
	
	//페이지 데이터출력 쿼리---------------------------------------------------
	
	@Override
	public List<LT_VO> detail_page(String index) {

		try {
			return sqlsession.selectList("lt.detail_page",index);
			
		} catch (Exception e) {
			log.info(e);
			
			return null;
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
	public int increse_good(HashMap<String, Object> hashmap) {
		// TODO Auto-generated method stub
		try {
			int good_cnt = sqlsession.update("li.good_increse",hashmap);
			log.info("좋아요 수 : "+good_cnt);
			return sqlsession.update("good.like_check",hashmap);
		} catch (Exception e) {
			log.info("good_check_increse 에러: "+e);
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
			log.info("good_check_decrese 에러: "+e);
			return 0;
			// TODO: handle exception
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
		// TODO Auto-generated method stub
		sqlsession.insert("good.check_row_insert",hashmap);
		
		log.info("로우 인서트 ");
	}

}
