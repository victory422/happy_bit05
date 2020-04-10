package vs.sa.sa_002.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vs.sa.sa_002.dao.SA_002_DAO;

@Service
public class SA_002_ServiceImpl implements SA_002_SaService {

	@Autowired
	private SA_002_DAO saDao;
	
	@Override
	public List<Map<String, String>> SaProductsList() {
		List<Map<String, String>> data = saDao.SaProductsList();
		return data;
	}

	@Override
	public List<Map<String, String>> searchProducts(String searchProducts) {
		List<Map<String, String>> list = saDao.searchProducts(searchProducts);
		return list;
	}
	
}
