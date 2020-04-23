package vs.li.li_001_01.vo;


import lombok.Data;

@Data
public class Page_VO {

	//페이징 관련 변수-----------------
	private int page; 
	private int amount; 

	//검색 필터 관련 변수----------------------------
	private String input_text; //입력 텍스트
	private String type; //필터 옵션 밸류

	public Page_VO() {
		page = 1;
		amount = 10;
	}

	public String[] getType() {
		return type == null? new String[] {}: type.split("");
	}

}
