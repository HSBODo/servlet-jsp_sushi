package service;

import java.util.List;


import dao.MemberDao;
import vo.Member;

public class MemberServiceImpl  implements MemberService {
	private MemberDao dao = new MemberDao();

	@Override
	public List<Member> getMembers() {
		return dao.getMembers();
	}

	@Override
	public boolean login(String id, String pwd) {
		
		return dao.login(id, pwd);
	}

	@Override
	public void join(Member member) {
		
		dao.join(member);
	}

	@Override
	public Member findBy(String id) {
		// TODO Auto-generated method stub
		return  dao.findBy(id);
	}

	@Override
	public Member emfindBy(String email) {
		// TODO Auto-generated method stub
		return dao.emfindBy(email);
	}

	@Override
	public void modify(Member member) {
		dao.modify(member);
		
	}

	@Override
	public void delete(Member member) {
		dao.delete(member);
		
	}

	@Override
	public Member pwdfindBy(String pwd) {
		// TODO Auto-generated method stub
	return	dao.pwdfindBy(pwd);
	}
	
	
	
		
	}


