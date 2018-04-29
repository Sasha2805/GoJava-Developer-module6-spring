package com.company.service.impl;

import com.company.model.Role;
import com.company.repository.RoleRepository;
import com.company.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.UUID;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleRepository roleRepository;

    @Override
    public void save(Role role) {
        roleRepository.save(role);
    }

    @Override
    public Role findById(UUID uuid) {
        return roleRepository.findOne(uuid);
    }

    @Override
    public List<Role> findAll() {
        return roleRepository.findAll();
    }

    @Override
    public void update(Role role) {
        roleRepository.save(role);
    }

    @Override
    public void deleteById(UUID uuid) {
        roleRepository.delete(uuid);
    }

    @Override
    public Role findByName(String name) {
        return roleRepository.findByName(name);
    }
}
