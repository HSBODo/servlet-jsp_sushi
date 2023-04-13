package service;

import java.util.List;

import vo.Member;

public interface MemberService {
	//할 일
	
	//회원가입
	void join(Member member);
	
	//로그인
	boolean login(String id, String pwd);
	
	//탈퇴
	void delete(Member member);
	//로그아웃
	
	//정보수정
	void modify(Member member);
	
	//계정 찾기 
	
	//단일 회원 조회
	Member findBy(String id);
	
	//단일 이메일 조회
	
	Member emfindBy(String email);
	//단일 비밀번호 조회
	Member pwdfindBy(String pwd);
	
	//회원 목록 조회
	List<Member> getMembers();

	

}