package controller.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import service.BoardServiceImpl;
import service.BoradService;
import service.ReviewService;
import service.ReviewServiceImpl;

@WebServlet("/review/delete")
public class Delete extends HttpServlet{
	private ReviewService service = new ReviewServiceImpl();
	
	




	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long bno = Long.parseLong(req.getParameter("bno"));
		service.remove(bno);
	
		
	}
	
}