package com.company.controller;

import com.company.model.Role;
import com.company.service.impl.RoleServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import javax.validation.Valid;
import java.util.List;
import java.util.UUID;

@Controller
public class RoleController {
    @Autowired
    private RoleServiceImpl roleService;

    @GetMapping("/list-roles")
    private String getAll(Model model) {
        List<Role> roles = roleService.findAll();
        model.addAttribute("roles", roles);
        return "role/listRoles";
    }

    @GetMapping("/new-role")
    private String create(Model model) {
        Role role = new Role();
        role.setId(UUID.randomUUID());
        return addDataToRoleForm(model, role);
    }

    @PostMapping("/new-role")
    private String save(@ModelAttribute("role") @Valid Role role, BindingResult result, Model model) {
        return null;
    }

    private String addDataToRoleForm(Model model, Role role) {
        model.addAttribute("roleForm", role);
        model.addAttribute("loggedUser", MainController.getPrincipal());
        return "role";
    }
}
