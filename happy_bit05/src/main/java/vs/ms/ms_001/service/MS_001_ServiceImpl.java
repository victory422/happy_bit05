package vs.ms.ms_001.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vs.sa.sa_002.dao.SA_002_DAO;
import vs.sa.sa_002.dto.Page_DTO;
import vs.sa.sa_002.vo.PageUtil;

@Service
public class MS_001_ServiceImpl implements MS_001_SaService {

	@Autowired
	private SA_002_DAO saDao;
	private PageUtil pageutil;
	private Page_DTO dto;

	
	@Override
	public List<Map<String, String>> SaProductsList(Page_DTO dto) {
		List<Map<String, String>> list = saDao.SaProductsList(dto);
		return list;
	}

	@Override
	public List<Map<String, String>> searchProducts(Page_DTO dto) {
		List<Map<String, String>> list = saDao.searchProducts(dto);
		return list;
	}
	
	@Override
	public PageUtil paging(Page_DTO dto) {
		pageutil = saDao.SaGetTotal(dto);
		return pageutil;
	}


	
}
