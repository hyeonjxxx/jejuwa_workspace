package com.kh.like.model.vo;

public class Like {

	private int likeProductId;		//상품코드
	private int likeUserId;			//회원번호
	
	public Like(){}

	public Like(int likeProductId, int likeUserId) {
		super();
		this.likeProductId = likeProductId;
		this.likeUserId = likeUserId;
	}

	public int getLikeProductId() {
		return likeProductId;
	}

	public void setLikeProductId(int likeProductId) {
		this.likeProductId = likeProductId;
	}

	public int getLikeUserId() {
		return likeUserId;
	}

	public void setLikeUserId(int likeUserId) {
		this.likeUserId = likeUserId;
	}

	@Override
	public String toString() {
		return "Like [likeProductId=" + likeProductId + ", likeUserId=" + likeUserId + "]";
	};
	
	
}


