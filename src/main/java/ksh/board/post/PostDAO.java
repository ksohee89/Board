package ksh.board.post;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PostDAO {
	public List<PostDTO> getAllPosts();
	public int addPost(PostDTO post);
	public PostDTO getPost (int id);
	public int updateCnt (int id);
	public int updatePost(PostDTO post);
	public int deletePost(int id);
	public int countPost(String searchType, String query);
	public List<PostDTO> listPage(int displayPost, int limit);
	public List<PostDTO> SearchPost(int displayPost, int limit, String searchType, String query);
}
