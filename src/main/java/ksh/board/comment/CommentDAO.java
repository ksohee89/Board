package ksh.board.comment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CommentDAO {
	public List<CommentDTO> getComments(int pid);
	public int addComment(CommentDTO comment);
	public int updateComment(CommentDTO comment);
	public int deleteComment(int pid, int id);
	public int deleteAllComment(int pid);
}
