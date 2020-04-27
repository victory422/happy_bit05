package vs.cm.cm_001_1.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import vs.co.co_001_1.dto.Page_DTO;
import vs.pr.pr_002_1.vo.Pr_002_1VO;

@Repository
public interface PrMapper {

	public List<Pr_002_1VO> pr_list(Page_DTO dto);
	
	public int get_total(Page_DTO dto);
}
