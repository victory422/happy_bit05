package vs.li.li_001_01.vo;


import lombok.Getter;
import lombok.ToString;
import vs.li.li_001_1.dto.Page_DTO;

@Getter
@ToString
public class PageUtil {

	private Page_DTO dto;
	private int total, start, end;
	private boolean prev, next;

	public PageUtil(Page_DTO dto, int total) {

		this.dto = dto;
		this.total = total;

		int pageNum = dto.getPage();
		int tempEnd = (int) (Math.ceil(pageNum / 10.0) * 10);
		
		this.start = tempEnd - 9 < 0 ? 1 : tempEnd - 9;
		this.prev = this.start != 1;

		// Ǯ��
		int realEnd = (int) (total / 10.0);

		this.next = realEnd > tempEnd;

		if (realEnd > tempEnd) {
			this.end = tempEnd;

		} else {
			this.end = realEnd + 1;
		}

	}

}