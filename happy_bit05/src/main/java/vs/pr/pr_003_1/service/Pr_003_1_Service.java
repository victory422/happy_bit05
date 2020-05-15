package vs.pr.pr_003_1.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import vs.pr.pr_002_1.vo.Pr_002_1VO;

public interface Pr_003_1_Service {
	//개인기록 상세보기
	public List<Pr_002_1VO> pr_detail(String pr_index);
	
	
	//좋아요 추천수@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		//조회수
			public void increse_see(Pr_002_1VO vo, HttpSession session);
			
			//추천수 증가
			public int increse_good(HashMap<String, Object> hashMap);
			
			//추천수 감소
			public int decrese_good(HashMap<String, Object> hashMap);
			
			//추천여부 체크
			public int good_check(HashMap<String, Object> hashMap);

			public int good_cnt(HashMap<String, Object> hashmap);
			
			//좋아요 체크 로우가 만들어졌는지 확인하는 쿼리
			public int good_count(HashMap<String, Object> hashmap);

			public void good_insert(HashMap<String, Object> hashmap);
			//개인기록 수정
			public int update(Pr_002_1VO vo);
			//개인기록 삭제
			public int pr_delete(String pr_index);
			
}
