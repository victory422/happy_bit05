package vs.sa.sa_002.dto;


import lombok.Data;

@Data
public class Page_DTO {
	
	//페이징 관련 변수-----------------
	private int page; 
	private int amount; 
	
	//검색 필터 관련 변수----------------------------
	private String input_text; //입력 텍스트
	private String cate_id; //필터 옵션 밸류
	private String vend_id;
	
	
	public Page_DTO(int page, int amount) {
		this.page = page;
		this.amount = amount;
	}
	public Page_DTO() {
		page = 1;
		amount = 10;
		input_text = cate_id = vend_id = "";
		
		
	}

	public String[] getTypeArr() {
		return cate_id == null? new String[] {}: cate_id.split("");
	}
	
	public String[] getSearch_filterArr() {
		return vend_id == null? new String[] {}: vend_id.split("");
	}
}
