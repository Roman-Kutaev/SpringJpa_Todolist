package org.itstep.controller;

import org.itstep.controller.domain.dao.TaskDao;
import org.itstep.controller.domain.dto.TaskDto;
import org.itstep.controller.domain.entity.Task;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {

    private final TaskDao taskDao;

    public HomeController(TaskDao taskDao) {
        this.taskDao = taskDao;
        }

    @GetMapping
    public String index(Model model) {
        model.addAttribute("tasks", taskDao.findAll());
        return "index";
    }

    @GetMapping("/findById/{id}")
    public String findByID(@PathVariable Integer id, Model model) {
        Task task = taskDao.findById(id);
        System.out.println("id = " + id);
        System.out.println("task = " + task);
        model.addAttribute("taskById", task);
        return "findById";
    }

    @GetMapping("/allTasks")
    public String showAllTasks(Model model) {
        model.addAttribute("tasks", taskDao.findAll());
        return "allTasks";
    }

    @PostMapping
    public String create(@ModelAttribute TaskDto taskDto, BindingResult bindingResult) throws ParseException {
        if (bindingResult.hasErrors()){
            System.out.println("Error binding");
            System.out.println(bindingResult.getAllErrors());
            return "index";
        }
        taskDao.save(taskDto.toEntity());
        return "redirect:/";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id, Model model, RedirectAttributes attributes) {
        List<Task> deleteTasks = new ArrayList<>();
        Task task = taskDao.findById(id);
        taskDao.delete(task);
        deleteTasks.add(task);
        model.addAttribute("deleteTask", deleteTasks);
        attributes.addFlashAttribute("delete", "Task " + id + " deleted");
        return "delete";
    }


}
