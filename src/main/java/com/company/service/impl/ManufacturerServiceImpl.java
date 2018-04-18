package com.company.service.impl;

import com.company.model.Manufacturer;
import com.company.repository.ManufacturerRepository;
import com.company.service.ManufacturerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.UUID;

@Service
public class ManufacturerServiceImpl implements ManufacturerService {
    @Autowired
    private ManufacturerRepository manufacturerRepository;

    @Override
    public Manufacturer findByName(String name) {
        return manufacturerRepository.findByName(name);
    }

    @Override
    public void save(Manufacturer manufacturer) {
        manufacturerRepository.save(manufacturer);
    }

    @Override
    public Manufacturer findById(UUID uuid) {
        return manufacturerRepository.findOne(uuid);
    }

    @Override
    public List<Manufacturer> findAll() {
        return manufacturerRepository.findAll();
    }

    @Override
    public void update(Manufacturer manufacturer) {
        manufacturerRepository.save(manufacturer);
    }

    @Override
    public void deleteById(UUID uuid) {
        manufacturerRepository.delete(uuid);
    }
}
