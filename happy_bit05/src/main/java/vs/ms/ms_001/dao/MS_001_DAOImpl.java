package vs.ms.ms_001.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import vs.lo.lo_001.vo.LO_001_VO;
import vs.ms.ms_001.vo.MS_001_VO;



@Service
@Repository
@Mapper
@Component
@Log4j
public class MS_001_DAOImpl implements MS_001_DAO{
	

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MS_001_VO memberVO(MS_001_VO vo) {
		log.info("member insert vo : "+ vo);
		sqlSession.insert("member.get_member", vo);
		return vo;
	}
	
	@Override
	public int idCheck(String data) {
		log.info("idCheck "+ data);
		int chk = sqlSession.selectOne("member.idCheck", data);
		log.info(data+"의 id개수 : "+chk);
		return chk;
	}
	
	@Override
	public int nickCheck(String data) {
		log.info("nickCheck : "+ data);
		int chk = sqlSession.selectOne("member.nickCheck", data);
		log.info(data+"의 nickName개수 : "+chk);
		return chk;
	}

	@Override
	public void registThumbnail(Map<String, Object> hmap) {
		sqlSession.update("member.set_member_thumbnail", hmap);
	}
	

	
}
