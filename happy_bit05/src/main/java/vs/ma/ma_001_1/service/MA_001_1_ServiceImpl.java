package vs.ma.ma_001_1.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.ma.ma_001_1.dao.MA_001_1_Dao;
import vs.ma.ma_001_1.vo.MA_001_1_VO;

@Service
@AllArgsConstructor
@Log4j
public class MA_001_1_ServiceImpl implements MA_001_1_Service{
	
	private MA_001_1_Dao dao;

	@Override
	public List<MA_001_1_VO> mainList(String lc_area2, String lc_area3, String lc_type) {
		// TODO Auto-generated method stub
		return dao.mainList(lc_area2, lc_area3, lc_type);
	}

}
