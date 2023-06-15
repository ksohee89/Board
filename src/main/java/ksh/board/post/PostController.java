package ksh.board.post;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
		model.addAttribute("url","list?page=1");
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
		model.addAttribute("url","list?page=1");
		return "message";
	}
	
	//게시글 삭제 
	@RequestMapping("post/delete")
	public String deletePost(@RequestParam("id") int id){
		// 삭제 할 게시글의 모든 댓글 삭제 후
		commentDao.deleteAllComment(id);
		// 게시글 삭제
		postDao.deletePost(id);
		return "redirect:/post/list?page=1";
	}
	
	@GetMapping("post/list")
	public String ListPage(@RequestParam("page") int page, Model model) {
		
		Paging paging  = new Paging();
		
		paging.setPage(page);
		paging.setCount(postDao.countPost("",""));
		
		List<PostDTO> posts = postDao.listPage(paging.getDisplayPost(), paging.getLimit());
		
		model.addAttribute("posts", posts); 
		model.addAttribute("pageNum", paging.getPageNum());
		model.addAttribute("page", page);
		
		if (paging.getStartPage() > 0) { 
			// 시작, 끝 페이지 번호 
			model.addAttribute("startPage", paging.getStartPage()); 
			model.addAttribute("endPage", paging.getEndPage());
			// 이전, 다음 
			model.addAttribute("prev", paging.isPrev()); 
			model.addAttribute("next", paging.isNext());
		}
		
		return "postList"; 
	}
	
	@GetMapping("post/search")
	public String searchPost(@RequestParam("page") int page, @RequestParam(value="searchType", defaultValue = "title") String searchType, 
			@RequestParam(value="query", defaultValue = "") String query, Model model) {
		
		Paging paging = new Paging();
		
		paging.setPage(page);
		paging.setCount(postDao.countPost(searchType, query));
		paging.setSearchTypeQuery(searchType, query);
		List<PostDTO> posts = postDao.SearchPost(paging.getDisplayPost(), paging.getLimit(), searchType, query);
		
		model.addAttribute("posts", posts); 
		model.addAttribute("pageNum", paging.getPageNum());
		model.addAttribute("page", page);
		model.addAttribute("searchType", searchType);
		model.addAttribute("query", query);
		model.addAttribute("searchTypeQuery", paging.getSearchTypeQuery());
		
		if (paging.getStartPage() > 0) { 
			// 시작, 끝 페이지 번호 
			model.addAttribute("startPage", paging.getStartPage()); 
			model.addAttribute("endPage", paging.getEndPage());
			// 이전, 다음 
			model.addAttribute("prev", paging.isPrev()); 
			model.addAttribute("next", paging.isNext());
		}
		
		
		return "searchPost"; 
	}
}
