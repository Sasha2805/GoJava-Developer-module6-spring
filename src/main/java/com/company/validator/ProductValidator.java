package com.company.validator;

import com.company.model.Product;
import com.company.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import java.math.BigDecimal;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class ProductValidator implements Validator {
    private static final Pattern patternForName = Pattern.compile("^\\s*[\\da-zA-Z][\\da-zA-Z\\s][\\d-a-z-A-Z\\s]*$");

    @Autowired
    private ProductService productService;

    @Override
    public boolean supports(Class<?> aClass) {
        return Product.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Product product = (Product) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "Required");
        Matcher matcher = patternForName.matcher(product.getName());
        if (!matcher.matches()) {
            errors.rejectValue("name", "Name.isn't.correct");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cost", "Required");
        if (product.getCost() instanceof BigDecimal) {
            if (!isBetween(product.getCost(), BigDecimal.valueOf(0), BigDecimal.valueOf(1000000))) {
                errors.rejectValue("price", "typeMismatch.price");
            }
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "manufacturer", "Product.manufacturer.isn't.select");
    }

    public void isNameDuplicate(Product product, Errors errors) {
        if (productService.findByName(product.getName()) != null) {
            errors.rejectValue("name", "Duplicate.product.name");
        }
    }

    public boolean isBetween(BigDecimal price, BigDecimal start, BigDecimal end) {
        return (price.compareTo(start) > 0) && (price.compareTo(end) < 0);
    }
}
