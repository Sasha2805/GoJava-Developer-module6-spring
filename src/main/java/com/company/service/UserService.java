package com.company.service;

import com.company.model.Role;
import com.company.model.User;
import java.util.List;
import java.util.UUID;

public interface UserService extends ModelService<User, UUID> {
    User findByEmail(String email);

    List<Role> findAllRoles();
}

