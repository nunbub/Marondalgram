package com.nunbub.marondalgram.post.model;

import com.nunbub.marondalgram.user.model.User;

public class PostDetail {
	
	private Post post;
	private User user;
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	

}
