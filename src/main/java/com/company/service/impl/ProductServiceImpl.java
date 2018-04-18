package com.company.service.impl;

import com.company.model.Product;
import com.company.repository.ProductRepository;
import com.company.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.UUID;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductRepository productRepository;

    @Override
    public Product findByName(String name) {
        return productRepository.findByName(name);
    }

    @Override
    public void save(Product product) {
        productRepository.save(product);
    }

    @Override
    public Product findById(UUID uuid) {
        return productRepository.findOne(uuid);
    }

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void update(Product product) {
        productRepository.save(product);
    }

    @Override
    public void deleteById(UUID uuid) {
        productRepository.delete(uuid);
    }
}
