package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{
	
	// 나만의 파일 리네임 클래스
	
	@Override
	public File rename(File originFile) {
		
		// 원본 파일명 ("aaa.jpg")
		String originName = originFile.getName();
		
		// 수정 파일명 : Jejuwa_파일업로드한시간(년월일시분초)_5자리랜덤값+확장자
		
		// jejuwa_ 에서 _가 특수문자라서 불가능한지 여쭤보고 빼겠습니다,,
		// 1. jejuwa_
		String jjw = "Jejuwa_";
		
		// 2. 파일 업로드 시간 (년월일시분초)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String currentTime = sdf.format(new Date());
		
		// 3. 5자리 랜덤값
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 4. 확장자(원본파일의 확장자)
		String ext = originName.substring(originName.lastIndexOf("."));  //".jpg"
		
		// 완성된 수정명
		String changeName = jjw + currentTime + ranNum + ext;
		
		return new File(originFile.getParent(), changeName);
		
		
	}

	
	
}
