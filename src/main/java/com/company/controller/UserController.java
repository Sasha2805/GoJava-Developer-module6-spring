package com.company.controller;

import com.company.model.User;
import com.company.service.SecurityService;
import com.company.service.impl.UserServiceImpl;
import com.company.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import javax.validation.Valid;
import java.util.List;
import java.util.UUID;

@Controller
public class UserController {
    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private SecurityService securityService;

    @GetMapping({"/registration", "/new-user"})
    public String getRegistrationForm(Model model) {
        User user = new User();
        user.setId(UUID.randomUUID());
        return addDataToRegistrationForm(user, model, false);
    }

    @PostMapping({"/registration", "/new-user"})
    public String getRegistration(@ModelAttribute("user") @Valid User user, BindingResult result, Model model) {
        System.out.println(user);
        return getInfo(user, result, model, false);
    }

    @GetMapping("/list_users")
    public String getAll(Model model) {
        List<User> users = userService.findAll();
        model.addAttribute("users", users);
        model.addAttribute("loggedUser", MainController.getPrincipal());
        return "user/listUsers";
    }

    @GetMapping("/edit-user-{id}")
    public String edit(@PathVariable String id, Model model) {
        User user = userService.findById(UUID.fromString(id));
        return addDataToRegistrationForm(user, model, true);
    }

    @PostMapping("/edit-user-{id}")
    public String saveEdit(@ModelAttribute("user") User userForm, BindingResult result, Model model) {
        return getInfo(userForm, result, model, true);
    }

    @GetMapping("/delete-user-{id}")
    public String deleteUser(@PathVariable String id) {
        userService.deleteById(UUID.fromString(id));
        return "redirect:user/listUsers";
    }

    private String addDataToRegistrationForm(User user, Model model, boolean edit) {
        model.addAttribute("user", user);
        model.addAttribute("listRoles", userService.findAllRoles());
        model.addAttribute("edit", edit);
        model.addAttribute("loggedUser", MainController.getPrincipal());
        return "secure/registration";
    }

    private String getInfo(User user, BindingResult result, Model model, boolean edit) {
        userValidator.validate(user, result);
        if (!edit) {
            userValidator.isEmailDuplicate(user, result);
        }

        if (result.hasErrors()) {
            return addDataToRegistrationForm(user, model, false);
        }

        userService.save(user);
        securityService.autologin(user.getEmail(), user.getConfirmPassword());
        model.addAttribute("user", user);
        model.addAttribute("loggedUser", MainController.getPrincipal());

        if (edit) {
            return getAll(model);
        }
        return "index";
    }
}