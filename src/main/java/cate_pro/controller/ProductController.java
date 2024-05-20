package cate_pro.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

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
import org.springframework.web.multipart.MultipartFile;

import cate_pro.dao.CategoryDAO;
import cate_pro.dao.ProductDAO;
import cate_pro.entities.Category;
import cate_pro.entities.Product;

@Controller
public class ProductController {
	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sf, true));
	}

	@RequestMapping("/listProduct")
	public String listPro(@RequestParam(value = "page", required = false) Integer page, Model model) {
		List<Product> product = productDAO.getProduct();

		model.addAttribute("listPro", product);

		Integer itemNumberPage = 5;
		Integer offset = (page != null) ? (page - 1) * itemNumberPage : 0;

		// Lấy sp cho trang hiện tại
		List<Product> listPagination = productDAO.getProductPagination(offset, itemNumberPage);
		model.addAttribute("listPro", listPagination);

		// Lấy total trang
		Long total = productDAO.getTotalProductPagination();
		Integer totalPage = (int) (total / itemNumberPage + (total % itemNumberPage == 0 ? 0 : 1));

		// Tạo list các trang 
		List<Integer> listPage = new ArrayList<>();
		for (int i = 1; i <= totalPage; i++)
			listPage.add(i);
		model.addAttribute("listPage", listPage);

		return "listProduct";
	}

	@RequestMapping("/initInsertProduct")
	public String initInsertProduct(Model model) {
		List<Category> category = categoryDAO.getCategory();
		model.addAttribute("listCate", category);
		Product p = new Product();
		model.addAttribute("p", p);
		return "insertProduct";
	}

	@RequestMapping("/insertProduct")
	public String insertProduct(@Valid @ModelAttribute("p") Product pro, BindingResult result,
			@RequestParam("imageUrl") MultipartFile imgFile, HttpServletRequest request, Model model) {

		if (result.hasErrors()) {
			model.addAttribute("p", pro);
			List<Category> category = categoryDAO.getCategory();
			model.addAttribute("listCate", category);
			return "insertProduct";
		} else {
			String path = request.getServletContext().getRealPath("/") + "resources/Img";
			File f = new File(path);
			if (imgFile != null && !imgFile.isEmpty()) {
				File dest = new File(f.getAbsolutePath() + "/" + imgFile.getOriginalFilename());
				if (!dest.exists()) {
					try {
						Files.write(dest.toPath(), imgFile.getBytes(), StandardOpenOption.CREATE_NEW);

					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			pro.setProImg(imgFile.getOriginalFilename());

			boolean bl = productDAO.insertProduct(pro);
			if (bl) {
				model.addAttribute("success", "Insert successfully!");
				return "redirect:/listProduct";

			} else {
				if (pro.getProImg() != null && !pro.getProImg().isEmpty()) {
					model.addAttribute("success", "Insert successfully!");
					return "redirect:/listProduct";
				} else {
					List<Category> category = categoryDAO.getCategory();
					model.addAttribute("listCate", category);
					model.addAttribute("error", "Insert failed!");
					return "insertProduct";
				}
			}
		}
	}

	@RequestMapping("/detailProduct")
	public String detailProduct(@RequestParam("productId") Integer productId, Model model) {
		Product productById = productDAO.getProductById(productId);
		model.addAttribute("p", productById);
		return "detailProduct";
	}

	@RequestMapping("/deleteProduct")
	public String deleteProduct(@RequestParam("productId") Integer productId, Model model) {
		boolean bl = productDAO.deleteProduct(productId);
		if (bl) {
			model.addAttribute("success", "Delete successfully!");

		} else {
			model.addAttribute("error", "Delete failed!");
		}
		List<Product> product = productDAO.getProduct();
		model.addAttribute("listPro", product);
		return "listProduct";
	}

	@RequestMapping("/preUpdateProduct")
	public String preUpdateProduct(@RequestParam("productId") Integer productId, Model model) {
		Product product = productDAO.getProductById(productId);
		model.addAttribute("p", product);
		List<Category> category = categoryDAO.getCategory();
		model.addAttribute("listCate", category);
		return "updateProduct";
	}

	@RequestMapping("/updateProduct")
	public String updateProduct(@ModelAttribute("p") Product p, Model model,
			@RequestParam("imageUrl") MultipartFile imgFile, HttpServletRequest request) {
		if (imgFile != null) {
			String path = request.getServletContext().getRealPath("/") + "resources/Img";
			File f = new File(path);
			if (imgFile != null && !imgFile.isEmpty()) {
				File dest = new File(f.getAbsolutePath() + "/" + imgFile.getOriginalFilename());
				if (!dest.exists()) {
					try {
						Files.write(dest.toPath(), imgFile.getBytes(), StandardOpenOption.CREATE_NEW);

					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			p.setProImg(imgFile.getOriginalFilename());
		}

		boolean bl = productDAO.updateProduct(p);
		if (bl) {
			return "redirect:/listProduct";
		} else {
			model.addAttribute("p", p);
			model.addAttribute("error", "Update Failed!");
			return "updateProduct";
		}
	}

	@RequestMapping("/searchProductByName")
	public String searchProductByName(@RequestParam("productName") String productName, Model model) {
		List<Product> product = productDAO.getProductByName(productName);
		model.addAttribute("listPro", product);
		return "listProduct";
	}

}
