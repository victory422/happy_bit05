package vs.ms.ms_001.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import vs.sa.sa_002.dto.Page_DTO;
import vs.sa.sa_002.vo.PageUtil;

public interface MS_001_SaService {

	PageUtil paging(Page_DTO dto);
	List<Map<String, String>> SaProductsList(Page_DTO dto);
	List<Map<String, String>> searchProducts(Page_DTO dto);

}
