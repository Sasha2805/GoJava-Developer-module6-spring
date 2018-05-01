package com.company.controller;

import com.company.model.Role;
import com.company.model.User;
import com.company.service.RoleService;
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
import java.util.Set;
import java.util.UUID;

@Controller
public class UserController {
    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private RoleService roleService;

    @GetMapping({"/registration", "/new-user"})
    public String getRegistrationForm(Model model) {
        User user = new User();
        user.setId(UUID.randomUUID());
        return addDataToRegistrationForm(model, user, false);
    }

    @PostMapping({"/registration", "/new-user"})
    public String getRegistration(@ModelAttribute("user") @Valid User user, BindingResult result, Model model) {
        return getInfo(user, result, model, false);
    }

    @GetMapping("/list-users")
    public String getAll(Model model) {
        List<User> users = userService.findAll();
        model.addAttribute("users", users);
        model.addAttribute("loggedUser", MainController.getPrincipal());
        return "user/listUsers";
    }

    @GetMapping("/edit-user-{id}")
    public String edit(@PathVariable String id, Model model) {
        User user = userService.findById(UUID.fromString(id));
        return addDataToRegistrationForm(model, user, true);
    }

    @PostMapping("/edit-user-{id}")
    public String saveEdit(@ModelAttribute("user") @Valid User user, BindingResult result, Model model) {
        return getInfo(user, result, model, true);
    }

    @GetMapping("/delete-user-{id}")
    public String deleteUser(@PathVariable String id) {
        userService.deleteById(UUID.fromString(id));
        return "redirect:/list-users";
    }

    @GetMapping("/user-roles-{id}")
    public String getUserRoles(@PathVariable String id, Model model) {
        User user = userService.findById(UUID.fromString(id));
        model.addAttribute("user", user);
        model.addAttribute("loggedUser", MainController.getPrincipal());
        return "user/userRoles";
    }

    @GetMapping("/add-role-to-user-{id}")
    public String addRole(@PathVariable String id, Model model) {
        Set<Role> userRoles = userService.findById(UUID.fromString(id)).getRoles();
        List<Role> roles = roleService.findAll();
        roles.removeAll(userRoles);
        model.addAttribute("userId", id);
        model.addAttribute("roles", roles);
        model.addAttribute("loggedUser", MainController.getPrincipal());
        return "user/addRoleToUser";
    }

    @PostMapping("/add-role-to-user-{id}")
    public String saveRole(@ModelAttribute("role") @Valid Role role, @PathVariable String id, Model model) {
        User user = userService.findById(UUID.fromString(id));
        user.getRoles().add(role);
        userService.update(user);
        return getUserRoles(id, model);
    }

    @GetMapping("/delete-user-role-{userId}/{roleId}")
    public String deleteRole(@PathVariable String userId, @PathVariable String roleId, Model model) {
        User user = userService.findById(UUID.fromString(userId));
        user.getRoles().remove(roleService.findById(UUID.fromString(roleId)));
        userService.update(user);
        return getUserRoles(userId, model);
    }

    private String addDataToRegistrationForm(Model model, User user, boolean edit) {
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
            return addDataToRegistrationForm(model, user, false);
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
