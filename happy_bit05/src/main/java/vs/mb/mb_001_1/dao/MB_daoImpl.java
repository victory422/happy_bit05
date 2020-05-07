package vs.mb.mb_001_1.dao;

import java.util.List;
<<<<<<< HEAD
=======
import java.util.Map;
>>>>>>> OJG

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_003_1.vo.LC_003_1_VO;
import vs.lo.lo_001.vo.LO_001_VO;

@Component
@Log4j
@AllArgsConstructor
@Log4j
public class MB_daoImpl implements MB_dao{

	private SqlSession session;
	
	@Override
	public LC_003_1_VO getLC(String lc_index) {
		// TODO Auto-generated method stub
		System.out.println("DAO에서 번호는??? : " + lc_index);
		return session.selectOne("lc.lc_003_01", lc_index);
	}
	
	@Override
<<<<<<< HEAD
	public List<LC_003_1_VO> getCourseList() {
		System.out.println("다오");
		return session.selectList("mb.getlist");
	}
	
	
	@Override
	public Boolean login(LO_001_VO vo) {
		int count = 0;
		try {
			count = session.selectOne("mb.login",vo);
			
			//로그인 정보 체크
			if(count == 0) {
				log.info("로그인 실패");
				return false;
			}else if(count == 1) {
				log.info("로그인 성공");
				return true;	
			}else {
				log.info("회원정보 error");
				return false;
			}
			
		} catch (Exception e) {
			//에러
			log.info("아이디 못찾음");
			return false;
		}
		
		
	}
=======
	public List<Map<String, String>> getMyRecordList(String m_index) {
		return session.selectList("lc.getMyRecordList", m_index);
	}
	
>>>>>>> OJG
}
