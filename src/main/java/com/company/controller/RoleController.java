package com.company.controller;

import com.company.model.Role;
import com.company.service.impl.RoleServiceImpl;
import com.company.validator.RoleValidator;
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
public class RoleController {
    @Autowired
    private RoleServiceImpl roleService;

    @Autowired
    private RoleValidator roleValidator;

    @GetMapping("/list-roles")
    private String getAll(Model model) {
        List<Role> roles = roleService.findAll();
        model.addAttribute("roles", roles);
        model.addAttribute("loggedUser", MainController.getPrincipal());
        return "role/listRoles";
    }

    @GetMapping("/new-role")
    private String create(Model model) {
        Role role = new Role();
        role.setId(UUID.randomUUID());
        return addDataToRoleForm(model, role, false);
    }

    @PostMapping("/new-role")
    private String save(@ModelAttribute("role") @Valid Role role, BindingResult result, Model model) {
        return getInfo(role, result, model, false);
    }

    @GetMapping("/edit-role-{id}")
    private String edit(@PathVariable String id, Model model) {
        Role role = roleService.findById(UUID.fromString(id));
        return addDataToRoleForm(model, role, true);
    }

    @PostMapping("/edit-role-{id}")
    private String saveEdit(@ModelAttribute("product") @Valid Role role, BindingResult result, Model model) {
        return getInfo(role, result, model, true);
    }

    public String addDataToRoleForm(Model model, Role role, boolean edit) {
        model.addAttribute("role", role);
        model.addAttribute("edit", edit);
        model.addAttribute("loggedUser", MainController.getPrincipal());
        return "role/role";
    }

    public String getInfo(Role role, BindingResult result, Model model, boolean edit) {
        roleValidator.validate(role, result);

        if (!edit) {
           roleValidator.isNameDuplicate(role, result);
        }

        if (result.hasErrors()) {
            return addDataToRoleForm(model, role, false);
        }

        roleService.save(role);
        return getAll(model);
    }
}
