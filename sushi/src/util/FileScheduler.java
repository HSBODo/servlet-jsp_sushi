package util;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import service.BoardServiceImpl;
import vo.Attach;

public class FileScheduler {
	public static void main(String[] args) {
		File file =  new File("c:\\upload\\210913"); 
		File[] files = file.listFiles();
//		for(File a:dbL) {
//			System.out.println(f);
//			System.out.println("------------------------------------");
//			for(Attach a : dbList) {
//				System.out.println(a);
//			}
			
			List<Attach> dbList = new BoardServiceImpl().readAttachsByPath("210913");
			List<File> fileList = new ArrayList<>(Arrays.asList(files));
			List<File> exisFile = new ArrayList<File>();
			for(File f: fileList) {
				for(Attach a : dbList) {
					if(f.getAbsolutePath().contains(a.getUuid())) {
						exisFile.add(f);
					}
				}
			}
			
			
			fileList.removeAll(exisFile);
			for(File f : fileList) {
				f.delete();
			}
			
			
		}
		
	}

