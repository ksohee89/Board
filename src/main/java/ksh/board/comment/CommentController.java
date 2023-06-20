package ksh.board.comment;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Inject
	private CommentDAO dao;
	
	// 댓글 작성
	@PostMapping("/write")
	public String CommentWrite(CommentDTO comment, Model model) throws Exception {
		SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		String current = dformat.format(now);
		// 댓글 현재 시간으로 수정
		comment.setRegdate(current);
		dao.addComment(comment);
		
		return "redirect:/post/read?id=" + comment.getPid();
	}
	
	// 댓글 수정
	@PostMapping("/update")
	public String CommentUpdate(CommentDTO comment, Model model) {
		SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		String current = dformat.format(now);
		// 수정 날짜 현재 시간으로 설정
		System.out.println(comment);
		comment.setModdate(current);
		dao.updateComment(comment);
		model.addAttribute("message","댓글 수정이 완료되었습니다.");
		model.addAttribute("url","../post/read?id="+comment.pid);
		return "message";
	}
	
	//댓글 삭제
	@RequestMapping("/delete")
	public String deletePost(@RequestParam("pid") int pid, @RequestParam("id") int id, Model model){
		dao.deleteComment(pid, id);
		model.addAttribute("message","댓글 삭제가 완료되었습니다.");
		model.addAttribute("url","../post/read?id="+pid);
		return "message";
	}

}
