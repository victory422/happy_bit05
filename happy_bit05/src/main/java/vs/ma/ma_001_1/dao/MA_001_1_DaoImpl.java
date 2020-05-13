package vs.ma.ma_001_1.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.ma.ma_001_1.vo.MA_001_1_VO;

@Component
@Log4j
@AllArgsConstructor
public class MA_001_1_DaoImpl implements MA_001_1_Dao{

	private SqlSession session;
	
	@Override
	public List<MA_001_1_VO> mainList(String lc_area2, String lc_area3, String lc_type) {
		// TODO Auto-generated method stub
		
		Map<String, Object> area = new HashMap<String, Object>();
		area.put("lc_area2", lc_area2);
		area.put("lc_area3", lc_area3);
		area.put("lc_type", lc_type);
		return session.selectList("lc.ma_001_1", area);
	}

}
