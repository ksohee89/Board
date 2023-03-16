package ksh.board.post;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PostDAO {
	public List<PostDTO> getAllPosts();
	public int addPost(PostDTO post);
	public PostDTO getPost (int pid);
	public int updateCnt (int pid);
	public int updatePost(PostDTO post);
	public int deletePost(int pid);
}
