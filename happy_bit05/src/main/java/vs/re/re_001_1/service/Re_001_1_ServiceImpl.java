package vs.re.re_001_1.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.cm.cm_001_1.mapper.ReMapper;
import vs.re.re_001_1.vo.ReVO;

@Service
public class Re_001_1_ServiceImpl implements Re_001_1_Service{

	@Autowired
	private ReMapper remapper;
	
	//신고 작성
	@Override
	public int re_insert(ReVO revo) throws Exception {
		 
		return remapper.re_insert(revo);
	}
	
}
