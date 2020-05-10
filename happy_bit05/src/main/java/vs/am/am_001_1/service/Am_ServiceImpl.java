package vs.am.am_001_1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.cm.cm_001_1.mapper.AmMapper;
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
	public List<MS_001_VO> mm_list() {
		
		return ammapper.mm_list();
	}
	
	
	
}
