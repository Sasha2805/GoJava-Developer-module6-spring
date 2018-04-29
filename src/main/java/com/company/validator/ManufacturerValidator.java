package com.company.validator;

import com.company.model.Manufacturer;
import com.company.service.ManufacturerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class ManufacturerValidator implements Validator {
    private static final Pattern pattern = Pattern.compile("^\\s*[\\da-zA-Z][\\da-zA-Z\\s][\\d-a-z-A-Z\\s]*$");

    @Autowired
    private ManufacturerService manufacturerService;

    @Override
    public boolean supports(Class<?> aClass) {
        return Manufacturer.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Manufacturer manufacturer = (Manufacturer) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "Required");
        Matcher matcher = pattern.matcher(manufacturer.getName());
        if (!matcher.matches()) {
            errors.rejectValue("name", "Name.manufacturer.isnt.correct");
        }
    }

    public void isNameDuplicate(Manufacturer manufacturer, Errors errors) {
        if (manufacturerService.findByName(manufacturer.getName()) != null) {
            errors.rejectValue("name", "Duplicate.manufacturer.name");
        }
    }
}
