package ksh.board.comment;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentDTO {
	int id;
	int pid;
	int uid;
	String username;
	String content;
	String regdate;
	String moddate;
}
