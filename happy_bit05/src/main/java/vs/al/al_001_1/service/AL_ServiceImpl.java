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
	public List<ReVO> re_list(Page_DTO dto) {
		
		return almapper.re_list(dto);
	}

	//처리 상태 변경
	@Override
	public int disposechange(String board_index) {
		
		return almapper.disposechange(board_index);
	}

	@Override
	public int get_total(Page_DTO dto) {
		
		try {
			
			return almapper.get_total(dto);
			
		}catch(Exception e) {
			System.out.println("get_total" + e);
		}
		return 0;
	}

	@Override
	public int get_total1(Page_DTO dto) {

		try {

			return almapper.get_total1(dto);

		} catch (Exception e) {
			System.out.println("get_total" + e);
		}
		return 0;
	}
	
}
