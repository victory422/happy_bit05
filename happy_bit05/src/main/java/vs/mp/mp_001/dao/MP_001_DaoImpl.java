package vs.mp.mp_001.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import lombok.extern.log4j.Log4j;
import vs.ac.ac_001_1.vo.AcVO;
import vs.lo.lo_001.vo.LO_001_VO;
import vs.mp.mp_001.dto.Page_DTO;
import vs.mp.mp_001.vo.MP_001_3_VO;
import vs.mp.mp_001.vo.PageUtil;
import vs.ms.ms_001.vo.MS_001_VO;

@Component
@Log4j
public class MP_001_DaoImpl implements MP_001_Dao{
	
	@Autowired
	private SqlSession session;
	private PageUtil pageutil;

	@Override
	public List<MP_001_3_VO> getMCList(Page_DTO dto) {
		// TODO Auto-generated method stub
		log.info("getList : "+dto);
		log.info("getMCList DAO.....");
		log.info("----------------");
		List<MP_001_3_VO> list = session.selectList("member.getMCList", dto);
		return list;
	}
	
	
	@Override
	public List<MP_001_3_VO> getMCListApp(Page_DTO dto) {
		// TODO Auto-generated method stub
		log.info("getList : "+dto);
		log.info("getMCListApp DAO.....");
		log.info("----------------");
		List<MP_001_3_VO> list = session.selectList("mb.getMCListApp", dto);
		return list;
	}
	
	@Override
	public List<Map<String, String>> getMyCourseDetail(Page_DTO dto) {
		// TODO Auto-generated method stub
		log.info("getMyCourseDetail...DAO");
		log.info("getMyCourse : "+dto);
		List<Map<String, String>> list = session.selectList("member.getMyCourseDetail", dto);
		return list;
	}
	
	@Override
	public PageUtil GetTotal(Page_DTO dto) {
		int total = session.selectOne("member.mc_paging_total", dto);
		pageutil = new PageUtil(dto, total);
		
		return pageutil;
	}
	
	
	@Override
	public MP_001_3_VO getMC(String lc_index) {
		// TODO Auto-generated method stub
		return session.selectOne("lc_003_01", lc_index);
	}
	

	@Override
	public int memberUpdate(MS_001_VO vo) {
		// TODO Auto-generated method stub
		return session.update("member.memberUpdate", vo);
	}

	@Override
	public void updateThumbnail(Map<String, Object> hmap) {
		// TODO Auto-generated method stub
		session.update("member.update_member_thumbnail", hmap);
		
	}

	@Override
	public LO_001_VO getMemberList(LO_001_VO list) {
		List<LO_001_VO> vo = new ArrayList<LO_001_VO>();
		
		vo = session.selectList("member.getMemberList", list);
		
		return vo.get(0);
	}

	@Override
	public PageUtil pagingDownPage(Page_DTO dto) {
		log.info("GetTotal DAO.....(downpage)");
		System.out.println("dao getTotal : " +dto);
		int total = session.selectOne("member.pagingDownPage", dto);
		log.info("pagingDownPage total : "+total);
		pageutil = new PageUtil(dto, total);
		
		return pageutil;
	}
	
	@Override
	public List<AcVO> compeptition_myList(Page_DTO dto) {
		log.info("compeptition_myList dto : "+dto);
		
		return session.selectList("member.compeptition_myList", dto);
	}


	@Override
	public PageUtil competition_paging(Page_DTO dto) {
		int total = session.selectOne("member.competition_paging", dto);
		pageutil = new PageUtil(dto, total);
		log.info("competition_paging....."+pageutil);
		return pageutil;
	}


	@Override
	public List<Map<String, String>> getAllMyPost(Page_DTO dto) {
		// TODO Auto-generated method stub
		log.info("getAllMyPost : "+dto);
		return session.selectList("member.getAllMyPost", dto);
	}


	@Override
	public PageUtil post_paging(Page_DTO dto) {
		int total = session.selectOne("member.post_paging", dto);
		pageutil = new PageUtil(dto, total);
		log.info("post_paging....."+pageutil);
		return pageutil;
	}


	@Override
	public PageUtil replys_paging(Page_DTO dto) {
		int total = session.selectOne("member.replys_paging", dto);
		pageutil = new PageUtil(dto, total);
		log.info("replys_paging....."+pageutil);
		return pageutil;
	}


	@Override
	public List<Map<String, String>> myReplys(Page_DTO dto) {
		// TODO Auto-generated method stub
		return session.selectList("member.myReplys", dto);
	}


	@Override
	public List<Map<String, String>> replysExceptionX(Page_DTO dto) {
		// TODO Auto-generated method stub
		log.info("replysExceptionX : "+dto);
		return session.selectList("member.replysExceptionX", dto);
	}

	@Override
	public void replyX(Page_DTO dto) {
		// TODO Auto-generated method stub
		log.info(dto);
		int a = session.update("member.replyX", dto);
		log.info("replyX update : "+a);
		
	}
	
	
	


}
