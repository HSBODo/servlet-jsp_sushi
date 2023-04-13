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
import vo.Criteria;
import vo.PageDTO;


@WebServlet("/review/list")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReviewService service =  new ReviewServiceImpl();
		
		String pn =req.getParameter("pageNum");
		String am =req.getParameter("amount");
		
		if(pn==null) pn="1";
		if(am==null) am="10";
		
		Criteria cri = new Criteria(Integer.parseInt(pn),Integer.parseInt(am));
		
		req.setAttribute("list", service.list(cri));
		
		req.setAttribute("page", new PageDTO(service.getCount(cri),cri));
		
	
		req.getRequestDispatcher("/WEB-INF/jsp/review/list.jsp").forward(req, resp);
	}
	

}
