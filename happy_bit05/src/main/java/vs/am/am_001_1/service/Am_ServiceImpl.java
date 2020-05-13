package vs.am.am_001_1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.cm.cm_001_1.mapper.AmMapper;
import vs.co.co_001_1.dto.Page_DTO;
import vs.ms.ms_001.vo.MS_001_VO;

@Service
public class Am_ServiceImpl implements Am_Service{

	@Autowired
	private AmMapper ammapper;
	
	@Override
	public List<MS_001_VO> am_list() {
		
		return ammapper.am_list();
	}

	@Override
	public List<MS_001_VO> mm_list(Page_DTO dto) {
		
		return ammapper.mm_list(dto);
	}

	@Override
	public int get_total(Page_DTO dto) {
		
		return ammapper.get_total(dto);
	}

	@Override
	public MS_001_VO am_detail(String m_index) {
		
		return ammapper.am_detail(m_index);
	}

	@Override
	public int am_del(String m_index) {

		
		return ammapper.am_del(m_index);
	}
	
	
	
}
