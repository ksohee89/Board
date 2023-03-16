package ksh.board.post;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class PostController {
	@Autowired
	private PostDAO dao;
	
	@RequestMapping("/")
	public String root() {
		return "redirect:post/list";
	}
	
	@RequestMapping("post/list")
	public String postList(Model model) {
		List<PostDTO> posts = dao.getAllPosts();
		model.addAttribute("posts", posts);
		return "postList";
	}
	
	@GetMapping("post/write")
	public String WriteForm() {
		return "writePost";
	}

	@PostMapping("post/write")
	public String WritePost(@RequestParam String content, Model model, PostDTO postDto) {
		SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		String current = dformat.format(now);
		postDto.setRegdate(current);
		dao.addPost(postDto);
		model.addAttribute("message","글이 등록되었습니다.");
		model.addAttribute("url","list");
		return "message";
	}
	
	@RequestMapping("post/read")
	public String readPost(@RequestParam("pid") int pid, Model model){
		PostDTO post = dao.getPost(pid);
		dao.updateCnt(pid);
		model.addAttribute("post", post);
		return "readPost";
	}
	
	@GetMapping("post/update")
	public String updateForm(@RequestParam("pid") int pid, Model model){
		PostDTO post = dao.getPost(pid);
		post.setPid(pid);
		model.addAttribute("post", post);
		return "updatePost";
	}
	
	@PostMapping("post/update")
	public String updatePost(@RequestParam("pid") int pid, Model model, PostDTO post){
		SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		String current = dformat.format(now);
		post.setModdate(current);
		dao.updatePost(post);
		model.addAttribute("message","글 수정이 완료되었습니다.");
		model.addAttribute("url","list");
		return "message";
	}
	
	@RequestMapping("post/delete")
	public String deletePost(@RequestParam("pid") int pid){
		dao.deletePost(pid);
		return "redirect:/post/list";
	}
}
