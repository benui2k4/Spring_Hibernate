package cate_pro.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cate_pro.entities.CustomUserDetails;

@Controller
public class HomeController {

	@RequestMapping("/home")
	public String home(Model model, HttpServletRequest session) {

		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		session.setAttribute("user", user);
		model.addAttribute("success", "Logged in successfully!");
		return "home";
	}
}
