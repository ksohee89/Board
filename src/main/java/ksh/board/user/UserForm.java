package ksh.board.user;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserForm {
	int id;
	
	@NotBlank(message = "아이디는 필수 입력 값입니다.")
	String userid;
	
	@NotBlank(message = "비밀번호는 필수 입력 값입니다.")
	String password;
	
	@NotBlank(message = "비밀번호 확인은 필수 입력 값입니다.")
	String pwcheck;
	
	@NotBlank(message = "닉네임은 필수 입력 값입니다.")
	String username;
	
	@NotBlank(message = "이메일은 필수 입력 값입니다.")
	@Email(message = "올바른 이메일 형식이 아닙니다.")
	String email;
	
	String regdate;
	String moddate;
}