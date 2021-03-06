package com.company.controller;

import com.company.model.Manufacturer;
import com.company.service.impl.ManufacturerServiceImpl;
import com.company.service.impl.ProductServiceImpl;
import com.company.validator.ManufacturerValidator;
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
public class ManufacturerController {
    @Autowired
    private ManufacturerServiceImpl manufacturerService;

    @Autowired
    private ManufacturerValidator manufacturerValidator;

    @Autowired
    private ProductServiceImpl productService;

    @GetMapping("/list-manufacturers")
    private String getAll(Model model) {
        List<Manufacturer> manufacturers = manufacturerService.findAll();
        model.addAttribute("manufacturers", manufacturers);
        model.addAttribute("loggedUser", MainController.getPrincipal());
        return "manufacturer/listManufacturers";
    }

    @GetMapping("/new-manufacturer")
    private String create(Model model) {
        Manufacturer manufacturer = new Manufacturer();
        manufacturer.setId(UUID.randomUUID());
        return addDataToManufacturerForm(model, manufacturer, false);
    }

    @PostMapping("/new-manufacturer")
    private String save(@ModelAttribute("manufacturer") @Valid Manufacturer manufacturer, BindingResult result, Model model) {
        return getInfo(manufacturer, result, model, false);
    }

    @GetMapping("/edit-manufacturer-{id}")
    private String edit(@PathVariable String id, Model model) {
        Manufacturer manufacturer = manufacturerService.findById(UUID.fromString(id));
        return addDataToManufacturerForm(model, manufacturer, true);
    }

    @PostMapping("/edit-manufacturer-{id}")
    private String saveEdit(@ModelAttribute("manufacturer") @Valid Manufacturer manufacturer, BindingResult result, Model model) {
        return getInfo(manufacturer, result, model, true);
    }

    @GetMapping("/delete-manufacturer-{id}")
    public String delete(@PathVariable String id) {
        manufacturerService.deleteById(UUID.fromString(id));
        return "redirect:/list-manufacturers";
    }

    @GetMapping("/manufacturer-products-{id}")
    public String getProducts(@PathVariable String id, Model model) {
        Manufacturer manufacturer = manufacturerService.findById(UUID.fromString(id));
        model.addAttribute("manufacturer", manufacturer);
        model.addAttribute("loggedUser", MainController.getPrincipal());
        return "manufacturer/manufacturerProducts";
    }

    @GetMapping("/delete-product-{manufacturerId}/{productId}")
    public String deleteProduct(@PathVariable String manufacturerId, @PathVariable String productId, Model model) {
        productService.deleteById(UUID.fromString(productId));
        return getProducts(manufacturerId, model);
    }

    private String addDataToManufacturerForm(Model model, Manufacturer manufacturer, boolean edit) {
        model.addAttribute("manufacturer", manufacturer);
        model.addAttribute("edit", edit);
        model.addAttribute("loggedUser", MainController.getPrincipal());
        return "manufacturer/manufacturer";
    }

    private String getInfo(@ModelAttribute("manufacturer") Manufacturer manufacturer, BindingResult result, Model model, boolean edit) {
        manufacturerValidator.validate(manufacturer, result);

        if (!edit) {
            manufacturerValidator.isNameDuplicate(manufacturer, result);
        }

        if (result.hasErrors()) {
            model.addAttribute("manufacturer", manufacturer);
            model.addAttribute("edit", false);
            model.addAttribute("loggedUser", MainController.getPrincipal());
            return "manufacturer/manufacturer";
        }

        manufacturerService.save(manufacturer);
        return getAll(model);
    }
}
