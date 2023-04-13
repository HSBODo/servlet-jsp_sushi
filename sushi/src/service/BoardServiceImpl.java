package service;

import java.util.List;

import dao.BoardDao;
import vo.Attach;
import vo.Board;
import vo.Criteria;

public class BoardServiceImpl implements BoradService{
	private BoardDao dao = new BoardDao();
	
	
	
	@Override
	public Long write(Board board) {
		// TODO Auto-generated method stub
		
		//글작성 >후 글 번호 반환
		Long bno = dao.insert(board);
		
		// 각 첨부파일에 글번호 부여
		for(Attach attach:board.getAttachs()) {
			attach.setBno(bno);
			//첨부 파일 작성 
			dao.writeAttach(attach);
		}
		
		return bno;
	}

	
	
	@Override
	public Board read(Long bno) {
		Board board=dao.read(bno);
		board.setAttachs(dao.readAttachs(bno));
		return board;
	}

	@Override
	public List<Board> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}
	@Override
	public List<Board> list(Criteria cri) {
		// TODO Auto-generated method stub
		List<Board>list = dao.list(cri);
		
		list.forEach(b -> b.setAttachs(dao.readAttachs(b.getBno())));
		
		return list;
	}

	@Override
	public void modify(Board board) {
		dao.update(board);
		
	}

	@Override
	public void remove(Long bno) {
		dao.delete(bno);
		
	}

	@Override
	public String findOriginBy(String uuid) {
		// TODO Auto-generated method stub
		return dao.findOriginBy(uuid);
	}

	@Override
	public int getCount(Criteria cri) {
		// TODO Auto-generated method stub
		return dao.getCount(cri);
	}

	@Override
	public List<Attach> readAttachsByPath(String path) {
		// TODO Auto-generated method stub
		return dao.readAttachsByPath(path);
	}


	

}
