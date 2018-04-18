package com.company.service;

import com.company.model.Product;
import java.util.UUID;

public interface ProductService extends ModelService<Product, UUID> {
    Product findByName(String name);
}
