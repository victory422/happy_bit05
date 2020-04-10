package vs.sa.sa_002.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface SA_002_SaService {

	List<Map<String, String>> SaProductsList();
	List<Map<String, String>> searchProducts(String searchProducts); 

}
