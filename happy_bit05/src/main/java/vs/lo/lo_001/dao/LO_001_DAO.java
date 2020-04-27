package vs.lo.lo_001.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import vs.lo.lo_001.vo.LO_001_VO;

@Service
@Repository
public interface LO_001_DAO {

	List<LO_001_VO> login(LO_001_VO list);
	
}
