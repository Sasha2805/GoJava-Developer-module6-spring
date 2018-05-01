package com.company.validator;

import com.company.model.Role;
import com.company.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class RoleValidator implements Validator {
    private static final Pattern patternForName = Pattern.compile("^[A-Z-]+");

    @Autowired
    private RoleService roleService;

    @Override
    public boolean supports(Class<?> aClass) {
        return Role.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Role role = (Role) o;

        if (role.getName().isEmpty()){
            errors.rejectValue("name", "Required");
        } else {
            Matcher matcher = patternForName.matcher(role.getName());
            if (!matcher.matches()) {
                errors.rejectValue("name", "Role.name.isn't.correct");
            }
        }
    }

    public void isNameDuplicate(Role role, Errors errors) {
        if (roleService.findByName(role.getName()) != null) {
            errors.rejectValue("name", "Duplicate.role.name");
        }
    }
}
