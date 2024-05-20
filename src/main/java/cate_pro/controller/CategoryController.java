package cate_pro.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import cate_pro.dao.CategoryDAO;
import cate_pro.entities.Category;

@Controller
public class CategoryController {
	@Autowired
	private CategoryDAO categoryDAO;

	@RequestMapping(value = { "/category", "/listCategory" })
	public String listCate(@RequestParam(value = "page", required = false) Integer page, Model model) {
		List<Category> category = categoryDAO.getCategory();
		model.addAttribute("listCate", category);

		Integer itemNumberPage = 5;
		Integer offset = (page != null) ? (page - 1) * itemNumberPage : 0;

		List<Category> listPagination = categoryDAO.getProductPagination(offset, itemNumberPage);
		model.addAttribute("listCate", listPagination);

		// Lấy total trang
		Long total = categoryDAO.getTotalCategoryPagination();
		Integer totalPage = (int) (total / itemNumberPage + (total % itemNumberPage == 0 ? 0 : 1));

		// Tạo list các trang
		List<Integer> listPage = new ArrayList<>();
		for (int i = 1; i <= totalPage; i++)
			listPage.add(i);
		model.addAttribute("listPage", listPage);

		return "listCategory";
	}

	@RequestMapping("/initInsertCategory")
	public String initInsertCategory(Model model) {
		Category c = new Category();
		model.addAttribute("c", c);
		return "insertCategory";
	}

	@RequestMapping("/insertCategory")
	public String insertCategory(@Valid @ModelAttribute("c") Category cate, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("error", "Insert failed!");
			List<Category> categories = categoryDAO.getCategory();
			model.addAttribute("listCate", categories);
			return "insertCategory";
		}

		// không lỗi lưu đb và chuyển hướng
		boolean bl = categoryDAO.insertCategory(cate);
		if (bl) {
			return "redirect:/listCategory";
		} else {
			model.addAttribute("error", "Insert Failed!");
			List<Category> categories = categoryDAO.getCategory();
			model.addAttribute("listCate", categories);
			return "insertCategory";
		}
	}

	@RequestMapping("/detailCategory")
	public String detailCategory(@RequestParam("categoryId") String categoryId, Model model) {
		Category category = categoryDAO.getCategoryById(categoryId);
		model.addAttribute("c", category);
		return "detailCategory";
	}

	@RequestMapping("/deleteCategory")
	public String deleteCategory(@RequestParam("categoryId") String categoryId, Model model) {
		boolean bl = categoryDAO.deleteCategory(categoryId);
		if (bl) {
			model.addAttribute("success", "Delete successfully!");

		} else {
			model.addAttribute("error", "Delete failed because has product!");
		}
		List<Category> category = categoryDAO.getCategory();
		model.addAttribute("listCate", category);
		return "listCategory";
	}

	@RequestMapping("/preUpdateCategory")
	public String preUpdateCategory(@RequestParam("categoryId") String categoryId, Model model) {
		Category categoryById = categoryDAO.getCategoryById(categoryId);
		model.addAttribute("c", categoryById);
		return "updateCategory";
	}

	@RequestMapping("/updateCategory")
	public String updateCategory(@ModelAttribute("c") Category c, Model model) {

		boolean bl = categoryDAO.updateCategory(c);
		if (bl) {
			return "redirect:/listCategory";
		} else {
			model.addAttribute("c", c);
			model.addAttribute("error", "Update Failed!");
			return "updateCategory";
		}
	}

	@RequestMapping("/searchCategoryByName")
	public String searchCategoryByName(@RequestParam("categoryName") String categoryName, Model model) {
		List<Category> category = categoryDAO.getCategorytByName(categoryName);
		model.addAttribute("listCate", category);
		return "listCategory";
	}
}
