package ksh.board.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserDAO dao;

	@GetMapping("/join")
	public String joinReq(Model model) {
		return "join";
	}

	@PostMapping("join")
	public String addUser(@Valid UserForm userForm, Errors errors, Model model, BindingResult bindingResult) {
		Map<String, String> validatorResult = new HashMap<>();	
		if (errors.hasErrors()) {
			model.addAttribute("userForm", userForm);

			// 유효성 및 중복 검사에 실패한 필드 목록을 받음
			for (FieldError error : errors.getFieldErrors()) {
				String validKeyName = String.format("valid_%s", error.getField());
				validatorResult.put(validKeyName, error.getDefaultMessage());
			}

			// 유효성 통과 못한 필드와 메시지를 핸들링
			for (String key : validatorResult.keySet()) {
				model.addAttribute(key, validatorResult.get(key));
			}
			
			int chk1 = dao.checkEmail(userForm.getEmail());
			int chk2 = dao.checkUserId(userForm.getUserid());
			int chk3 = dao.checkUserName(userForm.getUsername());
			
			if(chk1+chk2+chk3 > 0) {
				if(chk1 == 1) {
					model.addAttribute("valid_email", "이미 등록된 이메일입니다.");
				}
				
				if(chk2 == 1) {
					model.addAttribute("valid_userid", "이미 등록된 아이디입니다.");
				}
				
				if(chk3 == 1) {
					model.addAttribute("valid_username", "이미 등록된 닉네임입니다.");
				}
			}
			
			if (!userForm.getPassword().equals(userForm.getPwcheck())) {
				model.addAttribute("valid_pwcheck", "입력한 비밀번호와 일치하지 않습니다.");
				return "join";
			}
			return "join";
		}
		
		SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		String current = dformat.format(now);
		UserDTO user = new UserDTO();
		user.setUserid(userForm.getUserid());
		user.setPassword(userForm.getPassword());
		user.setUsername(userForm.getUsername());
		user.setEmail(userForm.getEmail());
		user.setRegdate(current);
		dao.addUser(user);
		
		model.addAttribute("message","회원가입이 완료되었습니다.");
		model.addAttribute("url","../post/list");
		return "message";
	}
	
	@GetMapping("/info")
	public String userInfo(@RequestParam("id") int id, Model model) {
		UserDTO user = dao.getUser(id);
		model.addAttribute("user", user);
		return "userInfo";
	}

	@GetMapping("/update")
	public String updateForm(@RequestParam("id") int id, Model model) {
		UserDTO user = dao.getUser(id);
		UserForm userForm = new UserForm();
		userForm.setId(id);
		userForm.setUserid(user.getUserid());
		userForm.setUsername(user.getUsername());
		userForm.setEmail(user.getEmail());
		userForm.setRegdate(user.getRegdate());
		userForm.setModdate(user.getModdate());
		model.addAttribute("userForm", userForm);
		return "updateuser";
	}

	@PostMapping("update")
	public String updateUser(@Valid UserForm userForm, Errors errors, @RequestParam("id") int id, Model model){
		Map<String, String> validatorResult = new HashMap<>();	
		if (errors.hasErrors()) {
			model.addAttribute("userForm", userForm);
			
			// 유효성 및 중복 검사에 실패한 필드 목록을 받음
			for (FieldError error : errors.getFieldErrors()) {
				String validKeyName = String.format("valid_%s", error.getField());
				validatorResult.put(validKeyName, error.getDefaultMessage());
			}
			
			// 유효성 통과 못한 필드와 메시지를 핸들링
			for (String key : validatorResult.keySet()) {
				model.addAttribute(key, validatorResult.get(key));
			}
	
			if (!userForm.getPassword().equals(userForm.getPwcheck())) {
				model.addAttribute("valid_pwcheck", "입력한 비밀번호와 일치하지 않습니다.");
				return "join";
			}
			return "join";
		}
		
		SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		String current = dformat.format(now);
		UserDTO user = new UserDTO();
		user.setId(id);
		user.setUserid(userForm.getUserid());
		user.setPassword(userForm.getPassword());
		user.setUsername(userForm.getUsername());
		user.setEmail(userForm.getEmail());
		user.setRegdate(userForm.getRegdate());
		user.setModdate(current);
		System.out.println(user);
		dao.updateUser(user);
		
		model.addAttribute("message","회원정보 수정이 완료되었습니다.");
		model.addAttribute("url","../post/list");
		return "message";
	}

}
