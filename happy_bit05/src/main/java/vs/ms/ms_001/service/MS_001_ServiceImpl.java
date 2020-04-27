package vs.ms.ms_001.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.ms.ms_001.dao.MS_001_DAO;
import vs.ms.ms_001.vo.MS_001_VO;

@Service
public class MS_001_ServiceImpl implements MS_001_SaService {

	@Autowired
	private MS_001_DAO msDao;
	
	@Override
	public MS_001_VO memberVO(MS_001_VO list) {
		list = msDao.memberVO(list);
		return list;
	}


	
}
