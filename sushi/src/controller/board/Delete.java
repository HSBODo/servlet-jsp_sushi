package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import service.BoardServiceImpl;
import service.BoradService;

@WebServlet("/board/delete")
public class Delete extends HttpServlet{
	private BoradService service = new BoardServiceImpl();
	
	




	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long bno = Long.parseLong(req.getParameter("bno"));
		service.remove(bno);
	
		
	}
	
}