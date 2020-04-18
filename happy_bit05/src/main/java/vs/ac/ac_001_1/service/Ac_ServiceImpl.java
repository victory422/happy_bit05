package vs.ac.ac_001_1.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import vs.ac.ac_001_1.dao.AcDAO;
import vs.ac.ac_001_1.domain.AcVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class Ac_ServiceImpl implements Ac_Service{

	
	@Autowired
	private AcDAO acdao;
	 
	
	public List<AcVO> Ac_List() { 
		System.out.println("����� ServiceImpl");
		
		List<AcVO> list = acdao.Ac_List();
		
		System.out.println(list + "serivce : list");
		
		return list;
	}



	
}

