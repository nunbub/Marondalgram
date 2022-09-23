package com.nunbub.marondalgram.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.nunbub.marondalgram.post.bo.PostBO;
import com.nunbub.marondalgram.post.model.PostDetail;

@Controller
public class PostController {

	@Autowired
	private PostBO postBO;
	
	@GetMapping("/post/timeline/view")
	public String timeline(Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postList = postBO.getPostList(userId);
		
		model.addAttribute("postList", postList);
		
		return "post/timeline";
	}
}
