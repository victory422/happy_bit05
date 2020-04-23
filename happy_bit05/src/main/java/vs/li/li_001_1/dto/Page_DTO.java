package vs.li.li_001_1.dto;


import lombok.Data;

@Data
public class Page_DTO {
	
	//페이징 관련 변수-----------------
	private int page; 
	private int amount; 
	
	//-----------------------------
	private String board;
	
	//검색 필터 관련 변수----------------------------
	private String input_text; //입력 텍스트
	private String type; //필터 옵션 밸류
	private String search_filter;
	
	
	public Page_DTO(int page, int amount) {
		this.page = page;
		this.amount = amount;
	}
	public Page_DTO() {
		page = 1;
		amount = 10;
		
	}

	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split(",");
	}
	
	public String[] getSearch_filterArr() {
		return search_filter == null? new String[] {}: search_filter.split("");
	}
}
