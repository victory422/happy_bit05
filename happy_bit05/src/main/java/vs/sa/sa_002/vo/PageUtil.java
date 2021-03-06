package vs.sa.sa_002.vo;


import org.springframework.beans.factory.annotation.Autowired;

import lombok.Getter;
import lombok.ToString;
import vs.sa.sa_002.dto.Page_DTO;

@Getter
@ToString
public class PageUtil {

	@Autowired
	private Page_DTO dto;
	private int total, start, end;
	private boolean prev, next;

	public PageUtil(Page_DTO dto, int total) {

		this.dto = dto;
		this.total = total;

		int pageNum = dto.getPage();
		int tempEnd = (int) (Math.ceil(pageNum / 10.0) * 10);
		System.out.println("tempEnd: "+tempEnd);
		
		this.start = tempEnd - 9 < 0 ? 1 : tempEnd - 9;
		this.prev = this.start != 1;

		// Ǯ��
		int realEnd = (int) (Math.ceil(total / 10.0));
		System.out.println("realEnd : "+realEnd);
		
		this.next = realEnd > tempEnd;
		if (realEnd > tempEnd) {
			this.end = tempEnd;

		} else {
			this.end = realEnd;
		}

	}

}