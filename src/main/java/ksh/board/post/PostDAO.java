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
}
