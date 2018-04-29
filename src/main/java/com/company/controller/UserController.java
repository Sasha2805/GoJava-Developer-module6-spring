package com.company.controller;

import com.company.model.User;
//import com.company.service.SecurityService;
import com.company.service.UserService;
import com.company.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import java.util.List;
import java.util.UUID;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;
/*
    @Autowired
    private SecurityService securityService;*/

    @GetMapping({"/registration", "/new-user"})
    public String getRegistrationForm(Model model) {
        User user = new User();
        user.setId(UUID.randomUUID());
        return AddDataToRegistrationForm(user, model, false);
    }

    @PostMapping({"/registration", "/new-user"})
    public String getRegistration(@ModelAttribute("userForm") User userForm, BindingResult result, Model model) {
        return getUserInfo(userForm, result, model, false);
    }

    @GetMapping("/list_users")
    public String getAll(Model model) {
        List<User> users = userService.findAll();
        model.addAttribute("users", users);
        model.addAttribute("loggedinuser", MainController.getPrincipal());
        return "user/listUsers";
    }

    @GetMapping("/edit-user-{id}")
    public String edit(@PathVariable String id, Model model) {
        User user = userService.findById(UUID.fromString(id));
        return AddDataToRegistrationForm(user, model, true);
    }

    @PostMapping("/edit-user-{id}")
    public String saveEdit(@ModelAttribute("userForm") User userForm, BindingResult result, Model model) {
        return getUserInfo(userForm, result, model, true);
    }

    @GetMapping("/delete-user-{id}")
    public String deleteUser(@PathVariable String id) {
        userService.deleteById(UUID.fromString(id));
        return "redirect:/list_users";
    }

    private String AddDataToRegistrationForm(User user, Model model, boolean edit) {
        model.addAttribute("userForm", user);
        model.addAttribute("listRoles", userService.findAllRoles());
        model.addAttribute("edit", edit);
        model.addAttribute("loggedUser", MainController.getPrincipal());
        return "registration";
    }

    private String getUserInfo(User userForm, BindingResult result, Model model, boolean edit) {
        userValidator.validate(userForm, result);
        if (!edit) {
            userValidator.isEmailDuplicate(userForm, result);
        }

        if (result.hasErrors()) {
            return AddDataToRegistrationForm(userForm, model, true);
        }

        userService.save(userForm);
       // securityService.autologin(userForm.getEmail(), userForm.getConfirmPassword());
        model.addAttribute("user", userForm);
        model.addAttribute("loggedUser", MainController.getPrincipal());

        if (edit) {
            return "redirect:product/listUsers";
        }
        return "index";
    }
}
