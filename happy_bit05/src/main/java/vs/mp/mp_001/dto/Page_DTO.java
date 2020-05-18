package vs.mp.mp_001.dto;


import lombok.Data;

@Data
public class Page_DTO {
	
	//페이징 관련 변수-----------------
	private int page; 
	private int amount; 
	
	//검색 필터 관련 변수----------------------------
	private String lc_type;
	private String type;
	private String keyword;
	private String m_index;
	private String lc_index;
	private String com_index;
	
	
	
	public Page_DTO(int page, int amount) {
		this.page = page;
		this.amount = amount;
	}
	public Page_DTO() {
		page = 1;
		amount = 5;
	}

	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}
	
}
