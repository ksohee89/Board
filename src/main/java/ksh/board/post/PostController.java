package ksh.board.post;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ksh.board.comment.CommentDAO;
import ksh.board.comment.CommentDTO;


@Controller
public class PostController {
	@Inject
	private PostDAO postDao;
	@Inject
	private CommentDAO commentDao;

	@RequestMapping("/")
	public String root() {
		return "redirect:post/list?page=1";
	}
	
	
	/*
	 * // 게시글 리스트
	 * 
	 * @RequestMapping("post/list") public String postList(Model model) {
	 * List<PostDTO> posts = postDao.getAllPosts(); model.addAttribute("posts",
	 * posts); return "postList"; }
	 */

	// 게시글 작성
	@GetMapping("post/write")
	public String WriteForm() {
		return "writePost";
	}
	
	@PostMapping("post/write")
	public String WritePost(@RequestParam String content, Model model, PostDTO postDto) {
		SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		String current = dformat.format(now);
		// 게시 날짜 현재 시간으로 설정함
		postDto.setRegdate(current);
		postDao.addPost(postDto);
		model.addAttribute("message","글이 등록되었습니다.");
		model.addAttribute("url","list");
		return "message";
	}
	
	// 게시글 조회
	@RequestMapping("post/read")
	public String readPost(@RequestParam("id") int id, Model model){
		PostDTO post = postDao.getPost(id);
		// 조회수 증가
		postDao.updateCnt(id);
		model.addAttribute("post", post);
		
		// 댓글 조회
		List<CommentDTO> comments = commentDao.getComments(id);
		model.addAttribute("comments", comments);
		
		return "readPost";
	}
	
	// 게시글 수정
	@GetMapping("post/update")
	public String updateForm(@RequestParam("id") int id, Model model){
		PostDTO post = postDao.getPost(id);
		post.setId(id);
		model.addAttribute("post", post);	
		return "updatePost";
	}
	
	@PostMapping("post/update")
	public String updatePost(@RequestParam("id") int id, Model model, PostDTO post){
		SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		String current = dformat.format(now);
		// 수정 날짜 현재 시간으로 설정함
		post.setModdate(current);
		postDao.updatePost(post);
		model.addAttribute("message","글 수정이 완료되었습니다.");
		model.addAttribute("url","list");
		return "message";
	}
	
	// 게시글 삭제 
	@RequestMapping("post/delete")
	public String deletePost(@RequestParam("id") int id){
		// 삭제 할 게시글의 모든 댓글 삭제 후
		commentDao.deleteAllComment(id);
		// 게시글 삭제
		postDao.deletePost(id);
		return "redirect:/post/list";
	}
	
	@GetMapping("post/list")
	public String ListPage(@RequestParam("page") int page, Model model) {
		
		// 게시글 총 갯수 구하기
		int count = postDao.countPost();
		
		// 한 페이지에 출력할 게시글 갯수
		int limit = 10;
		
		// 페이징 번호
		int pageNum = (int)Math.ceil((double)count/limit);
		
		// 출력할 게시글
		int displayPost = (page - 1) * limit;
		
		// 표시 될 페이징 번호 갯수
		int pageNum_cnt = 10;
		
		// 표시될 페이징 번호 중 마지막 페이지 번호
		int endPage = (int) (Math.ceil((double)page/(double)pageNum_cnt)*pageNum_cnt);
		
		// 표시될 페이징 번호 중 시작 페이지 번호
		int startPage = endPage - pageNum_cnt + 1;
		
		// 마지막 페이지 번호 재계산
		int endPage_2 = (int) (Math.ceil((double)count/(double)limit));
		if(endPage > endPage_2) {
			endPage = endPage_2;
		}
		
		boolean prev = startPage == 1 ? false : true;
		boolean next = endPage * limit >= count ? false : true;
		
		List<PostDTO> posts = postDao.listPage(displayPost, limit);
		model.addAttribute("posts", posts);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("page", page);
		
		if (startPage > 0) {
			// 시작, 끝 페이지 번호
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			
			// 이전, 다음
			model.addAttribute("prev", prev);
			model.addAttribute("next", next);
		}
		
		return "postList"; 
	}
}
