package vs.ms.ms_001.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import vs.lo.lo_001.vo.LO_001_VO;
import vs.ms.ms_001.vo.MS_001_VO;
import vs.sa.sa_002.dto.Page_DTO;
import vs.sa.sa_002.vo.PageUtil;

@Service
@Repository
public interface MS_001_DAO {


	MS_001_VO memberVO(MS_001_VO list);
	
	public void registThumbnail(Map<String, Object> hmap);

	int idCheck(String m_id);

	int nickCheck(String data);

}
