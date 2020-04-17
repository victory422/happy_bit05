package vs.sp.sp_001.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
@Repository
public interface SP_001_DAO {

	public List<Map> Sp_List();

	List<Map> SpList();
	
}
