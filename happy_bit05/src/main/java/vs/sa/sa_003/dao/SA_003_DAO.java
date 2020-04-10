package vs.sa.sa_003.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
@Repository
public interface SA_003_DAO {

	List<Map> SaList();

	String getTime();

	List<Map<String, String>> SaProductsList();

	Map SaleInsert(Map map);
	
}
