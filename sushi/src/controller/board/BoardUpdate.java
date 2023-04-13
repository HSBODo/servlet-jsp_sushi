package controller.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import service.BoardServiceImpl;
import service.MemberService;
import service.MemberServiceImpl;
import util.MyFileRenamePolicy;
import vo.Attach;
import vo.Board;
import vo.Member;

@WebServlet("/board/boardUpdate")
public class BoardUpdate extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		Long bno = Long.parseLong(req.getParameter("bno"));
		req.setAttribute("board", new BoardServiceImpl().read(bno));
		req.getRequestDispatcher("/WEB-INF/jsp/board/boardUpdate.jsp").forward(req, resp);;
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		
		String saveDirectory = "c:\\upload";
		String path = getPath();
		
		File uploadePath = new File(saveDirectory + File.separator+path);
		if(!uploadePath.exists()) {
			uploadePath.mkdirs();
		}
		
		
		int maxPostSize = 10 * 1024 * 1024;
		String encoding = "utf-8";
		FileRenamePolicy policy =new MyFileRenamePolicy();
		
		MultipartRequest multi;
		multi =new MultipartRequest(req,uploadePath.getAbsolutePath(), maxPostSize, encoding, policy);
		
		Enumeration<String> files = multi.getFileNames();
		List<Attach> attachs = new ArrayList<Attach>();
		while(files.hasMoreElements()) {
			String file = files.nextElement();
			String uuid = multi.getFilesystemName(file);
			String origin = multi.getOriginalFileName(file);
			if(uuid == null) {continue;}
			Attach attach = new Attach(uuid,origin,null,path);
			attachs.add(attach);
		}
		attachs.forEach(System.out::println);
		
		
		BoardServiceImpl service = new BoardServiceImpl();
		
		String title= multi.getParameter("title");
		String content= multi.getParameter("content");
		Long bno = Long.parseLong(req.getParameter("bno"));
		
		System.out.println(content);
		
		Board board = new Board(bno,title,content);
		board.setAttachs(attachs);
		
		System.out.println(board);
		
		service.modify(board);
		
		resp.sendRedirect("list");
				
	}

	private String getPath() {
		
		return  new SimpleDateFormat("yyMMdd").format(new Date());
	}
	
	

}
