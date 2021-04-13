package com.kh.like.model.service;


import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.like.model.dao.LikeDao;
import com.kh.like.model.vo.Like;

public class LikeService {

	private LikeDao likeDao;
	
	public LikeService() {
		this.likeDao = new LikeDao();
	}
	public boolean islike(int userId, int prodNo) {
		Connection conn = getConnection();
		close(conn);
		return likeDao.isLike(conn, userId, prodNo);
		
	}
	/*
	public ArrayList<Like> selectLikeList() {
		Connection conn = getConnection();
		
		ArrayList<Like> list = new LikeDao().selectLikeList(conn);
		
		close(conn);
		
		return list;
	}
	*/
}
