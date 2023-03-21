package ksh.board.post;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PostDTO {
	int id;
	int writer;
	String username;
	
	String title;
	String content;
	String regdate;
	String moddate;
	int read_cnt;
}
