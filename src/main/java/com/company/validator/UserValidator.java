package com.company.validator;

import com.company.model.User;
import com.company.service.UserService;
import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class UserValidator implements Validator {
    private static final Pattern patternForName = Pattern.compile("/^[a-z ,.'-]+$/i");

    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        if (user.getEmail().isEmpty()){
            errors.rejectValue("email", "Required");
        } else {
            EmailValidator emailValidator = EmailValidator.getInstance();
            if (!emailValidator.isValid(user.getEmail())) {
                errors.rejectValue("email", "Email.isn't.correct");
            }
        }

        if (user.getPassword().isEmpty()){
            errors.rejectValue("password", "Required");
        } else {
            if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
                errors.rejectValue("password", "Size.userForm.password");
            }
        }

        if (user.getConfirmPassword().isEmpty()){
            errors.rejectValue("confirmPassword", "Required");
        } else {
            if (!user.getConfirmPassword().equals(user.getPassword())) {
                errors.rejectValue("confirmPassword", "Different.userForm.password");
            }
        }

        if (user.getFirstName().isEmpty()){
            errors.rejectValue("firstName", "Required");
        } else {
            Matcher matcher = patternForName.matcher(user.getFirstName());
            if (!matcher.matches()) {
                errors.rejectValue("firstName", "Name.isn't.correct");
            }
        }

        if (user.getLastName().isEmpty()){
            errors.rejectValue("lastName", "Required");
        } else {
            Matcher matcher = patternForName.matcher(user.getLastName());
            if (!matcher.matches()) {
                errors.rejectValue("lastName", "Name.isn't.correct");
            }
        }
    }

    public void isEmailDuplicate(User user, Errors errors) {
        if (userService.findByEmail(user.getEmail()) != null) {
            errors.rejectValue("email", "Duplicate.userForm.email");
        }
    }
}
