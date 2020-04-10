package vs.lc.lc_mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import vs.lc.lc_001_1.dao.LC_001_1_Dao;
import vs.lc.lc_001_1.vo.LC_001_1_MapVO;
import vs.lc.lc_001_1.vo.LC_001_1_VO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/action-mybatis.xml")
@Log4j
public class LcMapperTests {

	@Setter(onMethod_ = @Autowired)
	private LC_001_1_Dao dao;
	
	@Test
	public void testInser() {
		
		LC_001_1_VO vo = new LC_001_1_VO();
		LC_001_1_MapVO vo2 = new LC_001_1_MapVO();
		vo.setLc_title("새로 작성하는 글");
		vo.setLc_text("새로 작성하는 내용.");
		
		dao.insert(vo, vo2);
		
		log.info(vo);
	}
}
