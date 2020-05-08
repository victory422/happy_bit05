package vs.cm.cm_001_1.mapper;

import org.springframework.stereotype.Repository;

import vs.re.re_001_1.vo.ReVO;

@Repository
public interface ReMapper {
	
	//신고 접수
	public int re_insert(ReVO revo) throws Exception;
	
}
