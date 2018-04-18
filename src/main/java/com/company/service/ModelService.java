package com.company.service;

import java.util.List;

public interface ModelService <T, ID>{
    void save(T t);

    T findById(ID id);

    List<T> findAll();

    void update(T t);

    void deleteById(ID id);
}
