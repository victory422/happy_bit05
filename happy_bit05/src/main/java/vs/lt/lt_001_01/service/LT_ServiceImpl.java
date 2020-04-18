package vs.lt.lt_001_01.service;

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
	private SqlSession session;
	
	//인서트 -----------------------------------------------------
	@Override
	public void regist(LT_VO vo) {
		try {
			log.info("글 등록중-------------------");
			session.insert("lt.insert", vo);
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
			
			return session.selectList("lt.get_list", dto);
			
		} catch (Exception e) {
			log.info(e);
		}
		return null;
	}
	
	
	//게시물 갯수 불러오는 쿼리---------------------------------------------------
	
	@Override
	public int get_total(Page_DTO dto) {
		try {
			
			return session.selectOne("lt.get_total", dto);
			
		} catch (Exception e) {
			log.info(e);
			return 0;
		}
	}
	
	//서치 (사용안함)---------------------------------------------------
	@Override
	public List<LT_VO> search_list(LT_VO vo) {
		try {
			return session.selectList("lt.search_list", vo);
		} catch (Exception e) {
			log.info(e);
			return null;
		}
	}
	
	
	//페이지 데이터출력 쿼리---------------------------------------------------
	
	@Override
	public List<LT_VO> detail_page(String index) {

		try {
			return session.selectList("lt.detail_page",index);
			
		} catch (Exception e) {
			log.info(e);
			
			return null;
		}
	}




	

}
