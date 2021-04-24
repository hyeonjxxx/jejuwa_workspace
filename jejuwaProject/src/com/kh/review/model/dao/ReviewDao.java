package com.kh.review.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.util.Properties;

import com.kh.review.model.vo.Review;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		
		String fileName = ReviewDao.class.getResource("/sql/review/review-mapper.xml").getPath();
	
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

		
	}
		
		
	
	
	
	
	
		
}
	
	
	
	
	
	
	
	
	
}
