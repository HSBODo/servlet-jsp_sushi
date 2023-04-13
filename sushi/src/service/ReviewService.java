package service;
import java.util.List;

import vo.Attach;
import vo.Board;
import vo.Criteria;
import vo.Review;
public interface ReviewService {
	
	//글쓰기
	Long write(Review review);

	//글조회
	Review read(Long bno);
	
	//목록조회
	
	List<Review> list();
	
	//게시글 목록조히
	List<Review> list(Criteria cri);
	
	//글수정
	void modify(Review review);
	
	//글삭제
	void remove(Long bno);
	
	
	
	String findOriginBy(String uuid);
	
	//글&갤러리 개수
	int getCount(Criteria cri);

	List<Attach> readAttachsByPath(String path);
	

	

}
