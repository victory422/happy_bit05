package vs.lc.lc_001_1.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_001_1.dao.LC_001_1_Dao;
import vs.lc.lc_001_1.vo.LC_001_1_MapVO;
import vs.lc.lc_001_1.vo.LC_001_1_VO;

@Component
@Log4j
@Service
@AllArgsConstructor
public class LC_001_1_ServiceImpl implements LC_001_1_Service{

	private LC_001_1_Dao dao; 
	
	@Override
	public void courseInsert(LC_001_1_VO vo, LC_001_1_MapVO vo2) {
		// TODO Auto-generated method stub
		
		
		dao.insert(vo, vo2);
	}

	@Override
	public void thumbnailInsert(Map<String, Object> hmap) {
		dao.insertThumbnail(hmap);
		
	}

	
}
