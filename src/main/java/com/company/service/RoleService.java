package com.company.service;

import com.company.model.Role;
import java.util.UUID;

public interface RoleService extends ModelService<Role, UUID>{
    Role findByName(String name);
}
