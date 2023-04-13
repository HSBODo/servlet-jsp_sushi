package service;
import java.util.List;

import vo.Attach;
import vo.Board;
import vo.Criteria;
public interface BoradService {
	
	//글쓰기
	Long write(Board board);

	//글조회
	Board read(Long bno);
	
	//목록조회
	
	List<Board> list();
	
	//게시글 목록조히
	List<Board> list(Criteria cri);
	
	//글수정
	void modify(Board board);
	
	//글삭제
	void remove(Long bno);
	
	//글 수정 
	
	String findOriginBy(String uuid);
	
	//글&갤러리 개수
	int getCount(Criteria cri);

	List<Attach> readAttachsByPath(String path);
	

	

}
