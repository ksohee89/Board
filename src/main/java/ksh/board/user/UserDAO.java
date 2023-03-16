package ksh.board.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDAO {
	public List<UserDTO> listUsers();
	public int addUser(UserDTO user);
	public UserDTO getUser(int id);
	public UserDTO getUserByUserId(String userid);
	public int updateUser(UserDTO user);
	public int deleteUser(int id);
	public int checkUserId(String userid);
	public int checkUserName(String username);
	public int checkEmail(String email);
}
