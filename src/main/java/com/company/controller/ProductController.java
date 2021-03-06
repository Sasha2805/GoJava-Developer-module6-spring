package com.company.controller;

import com.company.model.Product;
import com.company.service.impl.ManufacturerServiceImpl;
import com.company.service.impl.ProductServiceImpl;
import com.company.validator.ProductValidator;
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
public class ProductController {
    @Autowired
    private ProductServiceImpl productService;

    @Autowired
    private ProductValidator productValidator;

    @Autowired
    private ManufacturerServiceImpl manufacturerService;

    @GetMapping("/list-products")
    private String getAll(Model model) {
        List<Product> products = productService.findAll();
        model.addAttribute("products", products);
        model.addAttribute("loggedUser", MainController.getPrincipal());
        return "product/listProducts";
    }

    @GetMapping("/new-product")
    private String create(Model model) {
        Product product = new Product();
        product.setId(UUID.randomUUID());
        return addDataToProductForm(model, product, false);
    }

    @PostMapping("/new-product")
    private String save(@ModelAttribute("product") @Valid Product product, BindingResult result, Model model) {
        return getInfo(product, result, model, false);
    }

    @GetMapping("/edit-product-{id}")
    private String edit(@PathVariable String id, Model model) {
        Product product = productService.findById(UUID.fromString(id));
        return addDataToProductForm(model, product, true);
    }

    @PostMapping("/edit-product-{id}")
    private String saveEdit(@ModelAttribute("product") @Valid Product product, BindingResult result, Model model) {
        return getInfo(product, result, model, true);
    }

    @GetMapping("/delete-product-{id}")
    public String delete(@PathVariable String id) {
        productService.deleteById(UUID.fromString(id));
        return "redirect:/list-products";
    }

    private String getInfo(Product product, BindingResult result, Model model, boolean edit) {
        productValidator.validate(product, result);

        if (!edit) {
            productValidator.isNameDuplicate(product, result);
        }

        if (result.hasErrors()) {
            return addDataToProductForm(model, product, false);
        }

        productService.save(product);
        return getAll(model);
    }

    private String addDataToProductForm(Model model, Product product, boolean edit) {
        model.addAttribute("product", product);
        model.addAttribute("manufacturers", manufacturerService.findAll());
        model.addAttribute("edit", edit);
        model.addAttribute("loggedUser", MainController.getPrincipal());
        return "product/product";
    }
}

