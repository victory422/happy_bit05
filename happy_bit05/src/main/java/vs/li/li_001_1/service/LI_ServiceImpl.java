package vs.li.li_001_1.service;

import java.util.List;

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
	private SqlSession session;

	
	
	@Override
	public void li_regist(LI_VO vo) {
		try {
		session.insert("li.insert", vo);
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
			vvo = session.selectList("li.get_list", vo);
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
			
			//log.info("게시글 목록 확인 : "+session.selectList("li.get_list", dto));
			vvo = session.selectList("li.get_list", dto);
			
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
			return session.selectOne("li.get_total",dto);
		} catch (Exception e) {
			System.out.println("서비스 에러 : "+e);
			return 0;
		}
	}
	
	@Override
	public List<LI_VO> search_list(LI_VO vo) {
		try {
			return session.selectList("li.search_list", vo);
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
			vvo = session.selectList("li.detail_page",index); //상세페이지 불러오기
			log.info("LI_VO 리턴성공 --------------------");
			return vvo;
		} catch (Exception e) {
			log.info(e);
			
			return null;
		}
	}
}
