package com.company.service;

import com.company.model.User;
import java.util.UUID;

public interface UserService extends ModelService<User, UUID> {
    User findByEmail(String email);
}
