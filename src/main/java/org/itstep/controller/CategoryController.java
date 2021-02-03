package org.itstep.controller;

import org.itstep.controller.domain.dao.CategoryDao;
import org.itstep.controller.domain.entity.Category;
import org.itstep.controller.domain.entity.Task;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
public class CategoryController {
    private final CategoryDao categoryDao;

    public CategoryController(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }

    @GetMapping("/allCategories")
    public String showAllCategories(Model model) {
        model.addAttribute("categories", categoryDao.findAll());
        return "allCategories";
    }

    @GetMapping("/deleteCategory/{id}")
    public String delete(@PathVariable Integer id, Model model) {
        List<Category> deleteCategory = new ArrayList<>();
        Category category = categoryDao.findById(id);
        categoryDao.delete(category);
        deleteCategory.add(category);
        model.addAttribute("deleteCategories", deleteCategory);
        return "deleteCategory";
    }
}
