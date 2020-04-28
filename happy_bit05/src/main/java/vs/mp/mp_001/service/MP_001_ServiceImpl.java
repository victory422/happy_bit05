package vs.mp.mp_001.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.mp.mp_001.dao.MP_001_Dao;
import vs.mp.mp_001.dto.Page_DTO;
import vs.mp.mp_001.vo.MP_001_3_VO;
import vs.mp.mp_001.vo.PageUtil;

@Service
@Log4j
public class MP_001_ServiceImpl implements MP_001_Service{
	
	@Autowired
	private MP_001_Dao dao;
	private PageUtil pageutil;

	@Override
	public MP_001_3_VO getMC(String lc_index) {
		System.out.println("서비스 단에서 번호는 : " + lc_index);
		return dao.getMC(lc_index);
	}
	
	@Override
	public List<MP_001_3_VO> getList(Page_DTO dto) {
		// TODO Auto-generated method stub
		log.info("코스 리스트 조회.......!");
		log.info(dto);
		List<MP_001_3_VO> list = dao.getList(dto);
		return list;
	}

	@Override
	public boolean modifyMC(MP_001_3_VO vo) {
		// TODO Auto-generated method stub
		return dao.modifyMC(vo) == 1;
	}

	@Override
	public boolean modifyMC_thumbnail(Map<String, Object> hmap) {
		// TODO Auto-generated method stub
		return dao.modifyMC_thumbnail(hmap) == 1;
	}

	@Override
	public boolean deleteMC(String lc_index) {
		// TODO Auto-generated method stub
		return dao.deleteMC(lc_index) == 1;
	}

	@Override
	public boolean deleteMC_map(String lc_index) {
		// TODO Auto-generated method stub
		return dao.deleteMC_map(lc_index) == 1;
	}

	@Override
	public PageUtil paging(Page_DTO dto) {
		pageutil = dao.GetTotal(dto);
		return pageutil;
	}
	
}
