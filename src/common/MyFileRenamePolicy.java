package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File originFile) {
		
		long currentTime=System.currentTimeMillis();//현재시간을 millisceond형태로 가져와서 변수에 담는다!
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum=(int)(Math.random()*100000);
		
		String name=originFile.getName();
		String ext=null;
		
		int dot=name.lastIndexOf(".");
		//this.is.my.dog.image.png이런식으로 이름 되있으면 png이 확장자일것이다!
		//->lastIndexOf는  가장 마지막에 있는 .의 위치를 추출!
		if(dot !=-1) {
			ext=name.substring(dot);
		}else {
			ext="";
		}
		String fileName=sdf.format(new Date(currentTime))+ranNum+ext;
		File newFile=new File(originFile.getParent(),fileName);//Webcontent안에 저장되게된다!
		 
		return newFile;
	}

}

