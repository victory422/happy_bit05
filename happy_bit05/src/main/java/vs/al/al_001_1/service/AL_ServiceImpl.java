package vs.al.al_001_1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.al.al_001_1.vo.AlVO;
import vs.cm.cm_001_1.mapper.AlMapper;
import vs.co.co_001_1.dto.Page_DTO;
import vs.re.re_001_1.vo.ReVO;

@Service
public class AL_ServiceImpl implements AL_Service{

	@Autowired
	private AlMapper almapper;
	
	//모든 게시글 조회
	@Override
	public List<AlVO> al_list(Page_DTO dto) {
		
		return almapper.al_list(dto);
	}

	//신고된 게시글 조회
	@Override
	public List<ReVO> re_list() {
		
		return almapper.re_list();
	}

	//처리 상태 변경
	@Override
	public int disposechange(String de_index) {
		
		return almapper.disposechange(de_index);
	}

}
