package vs.sa.sa_002.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
@Repository
public interface SA_002_DAO {

	List<Map<String, String>> SaProductsList();
	List<Map<String, String>> searchProducts(String searchProducts);
	
}
