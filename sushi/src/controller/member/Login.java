package controller.member;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.membership.Membership;

import service.MemberService;
import service.MemberServiceImpl;
import vo.Member;

@WebServlet("/login")
public class Login extends HttpServlet{
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 폼 화면 : forwarding
		
		req.getRequestDispatcher("WEB-INF/jsp/member/login.jsp").forward(req, resp)
		;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 처리
		
		 
	
	 	
		String id =req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		String msg = "";
		String redirectUrl = "login";
	
		// boolean 두가지 경우 처리  (로그인 성공,실패)
		MemberService service = new MemberServiceImpl();
		boolean success	=service.login(id,pwd);
		
		if(success) {
			//세션 생성
			HttpSession session = req.getSession();
			session.setAttribute("member", service.findBy(id));
			msg="로그인 성공";
		
			//아이디 저장
			Cookie cookie = new Cookie("savedId",id);
			cookie.setMaxAge(req.getParameter("savedId")==null?0:60*60*24*365);
			resp.addCookie(cookie);
				
			redirectUrl="index.html";
			}
			
		 else {
			
			msg="비밀번호와 아이디를 확인해주세요.";
		}
		
		resp.sendRedirect(redirectUrl+ "?msg="+ URLEncoder.encode(msg,"utf-8")); 		
		
		} 
	
}
