package service;

import java.util.List;

import dao.BoardDao;
import dao.ReviewDao;
import vo.Attach;
import vo.Board;
import vo.Criteria;
import vo.Review;

public class ReviewServiceImpl implements ReviewService{
	private ReviewDao dao = new ReviewDao();
	
	
	
	@Override
	public Long write(Review review) {
		// TODO Auto-generated method stub
		
		//글작성 >후 글 번호 반환
		Long bno = dao.insert(review);
		
		// 각 첨부파일에 글번호 부여
		for(Attach attach:review.getAttachs()) {
			attach.setBno(bno);
			//첨부 파일 작성 
			dao.writeAttach(attach);
		}
		
		return bno;
	}

	
	
	@Override
	public Review read(Long bno) {
		Review review = dao.read(bno);
		review.setAttachs(dao.readAttachs(bno));
		return review;
	}

	@Override
	public List<Review> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}
	@Override
	public List<Review> list(Criteria cri) {
		// TODO Auto-generated method stub
		List<Review>list = dao.list(cri);
		
		list.forEach(b -> b.setAttachs(dao.readAttachs(b.getBno())));
		
		return list;
	}

	@Override
	public void modify(Review review) {
		dao.update(review);
		
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
