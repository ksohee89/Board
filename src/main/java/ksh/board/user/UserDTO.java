package ksh.board.user;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserDTO {
	int id;
	String userid;
	String password;
	String username;
	String email;
	String regdate;
	String moddate;
}
