package cate_pro.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cate_pro.dao.RoleDAO;
import cate_pro.dao.UserDAO;
import cate_pro.dao.UserRoleDAO;
import cate_pro.entities.Role;
import cate_pro.entities.User;
import cate_pro.entities.User_Role;

@Controller
public class AppController {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private RoleDAO roleDAO;
	@Autowired
	private UserRoleDAO userRoleDAO;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sf, true));
	}

	@RequestMapping(value = { "/", "/login" })
	public String login(@RequestParam(value = "error", required = false) String error, Model model) {
		if (error != null) {
	        model.addAttribute("mess", "Account name or password is incorrect. Login failed!");
	    } 
		
		return "login";
	}
	@RequestMapping("/logout")
    public String logout(RedirectAttributes attributes) {
        attributes.addFlashAttribute("out", "Has Logged out!!!");
        return "redirect:/login";
    }

	@RequestMapping("/initInsertUser")
	public String initInsertUser(Model model) {
		User u = new User();
		model.addAttribute("u", u);
		return "registerUser";
	}

	@RequestMapping("/registerUser")
	public String registerUser(@Valid @ModelAttribute("u") User u, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("u", u);
			return "registerUser";
		}

		String hashedPassword = BCrypt.hashpw(u.getPassWord(), BCrypt.gensalt(12));
		u.setPassWord(hashedPassword);

		u.setEnabled(true);
		boolean bl = userDAO.insertUser(u);
		if (bl) {
			Role role_admin = new Role();
			role_admin.setId(1L);
			
			
			User_Role ur1 = new User_Role();
			ur1.setRole(role_admin);
			ur1.setUser(u);
			userRoleDAO.insertRole(ur1);
			
			Role role_user = new Role();
			role_user.setId(2L);
			User_Role ur2 = new User_Role();
			ur1.setRole(role_user);
			ur1.setUser(u);
			userRoleDAO.insertRole(ur2);
			
			model.addAttribute("mess", "Register Successfully!");
			return "redirect:/login";
		} else {
			model.addAttribute("mess", "Register Failed DataBase!");
			return "registerUser";
		}
	}
}
