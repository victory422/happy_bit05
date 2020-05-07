package vs.sa.sa_003.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import vs.sa.sa_003.dao.SA_003_DAO;

@Service
public class SA_003_ServiceImpl implements SA_003_SaService {

	@Autowired
	private SA_003_DAO saDao;
	
	@Override
	public Map saleInsert(Map map) {
		saDao.SaleInsert(map);
		return map;
	}
	
	@Override
	public List<Map<String, String>> SaProductsList() {
		List<Map<String, String>> data = saDao.SaProductsList();
		return data;
	}
	
	@Override
	public List<Map> CallDb() {
		return null;
	}

	@Override
	public List<Map> InsertDb() {

		return null;
	}

	@Override
	public String getTime() {
		String data = saDao.getTime();
		return data;
	}



	
}
