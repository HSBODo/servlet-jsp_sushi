package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardServiceImpl;
import service.BoradService;

@WebServlet("/display")
public class Display  extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
						
		String fileName = req.getParameter("filename");
		String saveDirectory = "C:\\upload";
		
		String filePath = saveDirectory + File.separator+ fileName;
		
		
		System.out.println(filePath);
		
		FileInputStream fis =new FileInputStream(filePath);
		
		String mimeType = getServletContext().getMimeType(filePath);
		
	
		//응답헤더 설정
		resp.setContentType(mimeType);
		resp.setHeader("Content-DisPosition", "attachment; filename="+fileName);
		
		//출력 스트림 지정
		ServletOutputStream sos =resp.getOutputStream();
		int b;
		while((b = fis.read())!=-1) {
			sos.write(b);
		}
		
		fis.close();
		sos.close();
	}
	
}
