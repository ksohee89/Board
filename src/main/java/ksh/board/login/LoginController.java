package ksh.board.login;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ksh.board.user.UserDAO;
import ksh.board.user.UserDTO;


@Controller
public class LoginController {
	@Autowired
	private UserDAO dao;
	
	// 로그인 페이지
	@GetMapping("login")
	public String loginReq(Model model) {
		return "login";
	}
	
	// 로그인
	@PostMapping("login")
	public String loginProccessing(HttpServletRequest req, Model model) {
		String userid = req.getParameter("userid");
		String password = req.getParameter("password");
		
		HashMap<String, Boolean> errors = new HashMap<>();
		if(userid== null || userid.isEmpty())
			errors.put("userid", true);
		if(password == null || password.isEmpty())
			errors.put("password", true);
		
		if(!errors.isEmpty()) {
			model.addAttribute("userid", userid);
			model.addAttribute("errors", errors);
			return "login";
		}
		
		UserDTO user = dao.getUserByUserId(userid);
		if(user == null) {
			model.addAttribute("message","가입되지 않은 아이디입니다.");
			model.addAttribute("url","login");
			return "message";
		}
		else if (!user.getPassword().equals(password)) {
			model.addAttribute("message","비밀번호가 일치하지 않습니다.");
			model.addAttribute("userid", userid);
			model.addAttribute("url","login");
			return "message";
		}
		if(!errors.isEmpty()) {
			model.addAttribute("errors", errors);
			return "login";
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("login", user);
		return "redirect:/post/list?page=1";
		
	}
	
	// 로그아웃
	@GetMapping("logout")
	public String logoutProccessing(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		// 세션에 저장된 것을 지운다.
		session.removeAttribute("login");	
		// 세션에 저장된 모든 것을 지우고 세션을 초기화
		session.invalidate();
		return "redirect:/post/list?page=1";
	}
}
