package vs.mp.mp_001.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.mp.mp_001.dto.Page_DTO;
import vs.mp.mp_001.vo.MP_001_3_VO;
import vs.mp.mp_001.vo.PageUtil;

@Component
@Log4j
public class MP_001_DaoImpl implements MP_001_Dao{
	
	@Autowired
	private SqlSession session;
	private PageUtil pageutil;

	@Override
	public List<MP_001_3_VO> getList(Page_DTO dto) {
		// TODO Auto-generated method stub
		log.info("getList : "+dto);
		log.info("My코스 리스트 DAO.....");
		log.info("----------------");
		List<MP_001_3_VO> list = session.selectList("member.getMCList", dto);
		log.info("getList : "+list);
		return list;
	}
	
	@Override
	public List<MP_001_3_VO> getMyCourse(Page_DTO dto) {
		// TODO Auto-generated method stub
		log.info("my코스  상세조회.....DAO");
		log.info("getMyCourse : "+dto);
		List<MP_001_3_VO> list = session.selectList("member.getMyCourse", dto);
		log.info(list);
		return list;
	}
	
	@Override
	public PageUtil GetTotal(Page_DTO dto) {
		log.info("GetTotal DAO.....");
		System.out.println("dao getTotal : " +dto);
		int total = session.selectOne("member.mc_paging_total", dto);
		log.info("total : "+total);
		pageutil = new PageUtil(dto, total);
		
		return pageutil;
	}
	
	
	@Override
	public MP_001_3_VO getMC(String lc_index) {
		// TODO Auto-generated method stub
		System.out.println("DAO에서 번호는??? : " + lc_index);
		return session.selectOne("lc_003_01", lc_index);
	}
	

	@Override
	public int modifyMC(MP_001_3_VO vo) {
		// TODO Auto-generated method stub
		
		System.out.println(vo.getLc_index());
		return session.update("lc_003_02", vo);
	}

	@Override
	public int modifyMC_thumbnail(Map<String, Object> hmap) {
		// TODO Auto-generated method stub
		return session.update("lc_003_02_thumbnail", hmap);
	}

	@Override
	public int deleteMC(String lc_index) {
		// TODO Auto-generated method stub
		return session.delete("lc_003_03", lc_index);
	}

	@Override
	public int deleteMC_map(String lc_index) {
		// TODO Auto-generated method stub
		return session.delete("lc_003_03_map", lc_index);
	}


}
