package vs.lo.lo_001.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vs.lo.lo_001.dao.LO_001_DAO;
import vs.lo.lo_001.vo.LO_001_VO;

@Service
public class LO_001_ServiceImpl implements LO_001_Service {

	@Autowired
	private LO_001_DAO dao;
	

	@Override
	public List<LO_001_VO> login(LO_001_VO vo) {
		List<LO_001_VO> list = dao.login(vo);
		if(list.get(0).getLoginCheck() > 1) {
			list.get(0).setLoginMsg("중복된 아이디가 생성되어 있으니 개발자 잘못입니다.");
		}else if(list.get(0).getLoginCheck()==1) {
			list.get(0).setLoginMsg("로그인에 성공하였습니다.");
		}else list.get(0).setLoginMsg("아이디 또는 비밀번호가 잘못되었습니다.");
		System.out.println("service/checkLogin number : "+list.get(0).getLoginCheck());
		
		return list;
	}


	
}
