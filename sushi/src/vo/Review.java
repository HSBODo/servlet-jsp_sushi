package vo;

import java.sql.Date;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	private Long bno;
	private String title;
	private String content;
	
	private Date regDate;
	private String id;
	private Long category;
	private String rank;
	
	private List<Attach> attachs;
	private Integer replyCnt;

	public Review(String title, String content, String id, String rank, Long category) {
		
		this.title = title;
		this.content = content;
		this.id = id;
		this.category = category;
		this.rank = rank;
	}

	
	

	public Review(Long bno, String title, String content, Date regDate, String id, Long category) {
	
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.id = id;
		this.category = category;
	}

	public Review(Long bno, String title, Date regDate, String id, Long category) {
	
		this.bno = bno;
		this.title = title;
		this.regDate = regDate;
		this.id = id;
		this.category = category;
	}


	
	public Review(Long bno, String title, String content) {
	
		this.bno = bno;
		this.title = title;
		this.content = content;
		
		
	}




	public Review(Long bno, String title, Date regDate,String content,  String id, Long category, String rank) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.rank = rank;
		this.regDate = regDate;
		this.id = id;
		this.category = category;
	}







	public Review(Long bno, String title, Date regDate, String id, Long category, String rank) {
		super();
		this.bno = bno;
		this.title = title;
		this.regDate = regDate;
		this.id = id;
		this.category = category;
		this.rank = rank;
	}








	
	





	
	
}
