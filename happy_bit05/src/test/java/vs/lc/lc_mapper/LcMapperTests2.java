package vs.lc.lc_mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_002_1.dao.LC_002_1_Dao;
import vs.lc.lc_002_1.vo.Criteria;
import vs.lc.lc_002_1.vo.LC_002_1_VO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/action-mybatis.xml")
@Log4j
public class LcMapperTests2 {

	@Setter(onMethod_ = @Autowired)
	private LC_002_1_Dao dao;
	
	@Setter(onMethod_ = @Autowired)
	private LC_002_1_VO vo;
	
	@Test
	public void testGetList() {}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		
		List<LC_002_1_VO> list = dao.getList(cri);
		
		list.forEach(vo -> log.info(vo));
	}
}
