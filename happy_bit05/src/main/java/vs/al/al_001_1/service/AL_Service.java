package vs.al.al_001_1.service;

import java.util.List;

import vs.al.al_001_1.vo.AlVO;
import vs.co.co_001_1.dto.Page_DTO;
import vs.re.re_001_1.vo.ReVO;

public interface AL_Service {
	//모든 게시글 조회
	public List<AlVO> al_list(Page_DTO dto);
	//신고 게시글 조회
	public List<ReVO> re_list(Page_DTO dto);
	//처리 상태 변경
	public int disposechange(String board_index);
	//게시글 갯수
	public int get_total(Page_DTO dto);

	public int get_total1(Page_DTO dto);

	
}
