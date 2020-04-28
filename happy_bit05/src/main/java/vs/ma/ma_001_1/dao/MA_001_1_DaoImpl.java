package vs.ma.ma_001_1.dao;

import java.util.List;

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
	public List<MA_001_1_VO> mainList(String lc_area2, String lc_area3) {
		// TODO Auto-generated method stub
		return session.selectList("lc.ma_001_1", lc_area2);
	}

}
