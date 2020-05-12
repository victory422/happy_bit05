package vs.pr.pr_003_1.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.cm.cm_001_1.mapper.PrMapper;
import vs.cr.cr_001_1.vo.CrVO;
import vs.pr.pr_002_1.vo.Pr_002_1VO;

@Service
public class Pr_003_1_ServiceImpl implements Pr_003_1_Service {

	@Autowired
	private PrMapper prmapper;
	@Autowired
	SqlSession session;

	//개인기록 상세보기
	@Override
	public List<Pr_002_1VO> pr_detail(String pr_index) {
		
		return prmapper.pr_detail(pr_index);
		
	}
	//좋아요 추천수@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		@Override
		public void increse_see(Pr_002_1VO vo, HttpSession httpsession) {
			try {
				long update_time = 0; //null을 방지하기 위해 초기값을 null로 설정함
		        if(httpsession.getAttribute("update_time_"+vo.getPr_index())!=null) {
		            //최근에 조회수를 올린 시간이 null이 아니면
		        	System.out.println("요기야?");
		            update_time = (long)httpsession.getAttribute("update_time_"+vo.getPr_index());
		        }
		       
		        long current_time = System.currentTimeMillis();
		        //일정 시간이 경과한 후에 조회수를 증가시킨다.
		        System.out.println("지난시간 : ");
		        System.out.println(current_time - update_time);
		        
		        //10분 후에 조회수 증가할수있게 제어문
		        if(current_time - update_time > 10*60*1000) {
		            
		        //조회수가 1증가했을때로부터 5000초 후에 다시 클릭을 해야 조회수가 다시 1 증가한다는 말이다.
		        //조회수 증가 처리
		        	System.out.println("보드 인덱스: : "+ vo.getPr_index());
		        	String index = vo.getPr_index();
		        	System.out.println(index);
		            session.update("vs.cm.cm_001_1.mapper.PrMapper.board_see",index);
		            System.out.println("조회수 증가");
		            
		            //조회수를 올린 시간을 저장함
		            httpsession.setAttribute("update_time_"+vo.getPr_index(), current_time);
		        }else
		        	System.out.println("조회수 유지");
		
			} catch (Exception e) {
				System.out.println("조회수 증가 함수 에러 메세지 : "+e);
			}
	        		
		}

		@Override
		public int increse_good(HashMap<String, Object> hashmap) {
			try {
				System.out.println("여기야? 그치? 여기지?");
				int good_cnt = session.update("vs.cm.cm_001_1.mapper.PrMapper.good_increse",hashmap);
				System.out.println("좋아요 수 : "+good_cnt);
				return session.update("good.like_check",hashmap);
			} catch (Exception e) {
				System.out.println("good_check 에러: "+e);
				return 0;
			}
		}

		@Override
		public int decrese_good(HashMap<String, Object> hashmap) {
			try {
				int good_cnt = session.update("vs.cm.cm_001_1.mapper.PrMapper.good_decrese",hashmap);
				System.out.println("좋아요 수 : "+good_cnt);
				return session.update("good.like_check_cancel",hashmap);
			} catch (Exception e) {
				System.out.println("good_check 에러: "+e);
				return 0;
				// TODO: handle exception
			}
		}

		@Override
		public int good_check(HashMap<String, Object> hashmap) {
			try {
				System.out.println("게시글 인덱스  : " +hashmap.get("board_index"));
				System.out.println("로그인 회원 인덱스 : " + hashmap.get("m_index"));
				System.out.println("뭘까?" +session.selectOne("good.check",hashmap));
				//good_check 테이블에서   good_check 컬럼을 조회해서 리턴해준다.
				return session.selectOne("good.check",hashmap); 
				}catch(Exception e){
					System.out.println("good_check 에러: "+e);
					return 0;
					}
		}

		@Override
		public int good_cnt(HashMap<String, Object> hashmap) {		
			System.out.println("여기야?" + session.selectOne("vs.cm.cm_001_1.mapper.PrMapper.good_cnt", hashmap));
			return session.selectOne("vs.cm.cm_001_1.mapper.PrMapper.good_cnt", hashmap);
		}

		@Override
		public int good_count(HashMap<String, Object> hashmap) {
			try {
				return session.selectOne("good.good_count",hashmap);
			} catch (Exception e) {
				System.out.println("--good_count 에러   : "+e);
				return 0;
			}
		}

		@Override
		public void good_insert(HashMap<String, Object> hashmap) {
			session.insert("good.check_row_insert",hashmap);
			
			System.out.println("로우 인서트 ");
			
		}
	
	
}
