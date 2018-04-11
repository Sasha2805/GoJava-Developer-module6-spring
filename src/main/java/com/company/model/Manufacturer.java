package com.company.model;

import org.hibernate.annotations.GenericGenerator;
import javax.persistence.*;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "manufacturer")
public class Manufacturer {
    @Id
    @GeneratedValue(generator="system-uuid")
    @GenericGenerator(name="system-uuid", strategy = "uuid")
    @Column(name = "id", unique = true)
    private UUID id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "manufacturer", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<Product> products;

    public Manufacturer() {
    }

    public Manufacturer(String name, List<Product> products) {
        this.name = name;
        this.products = products;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    @Override
    public String toString() {
        return "Manufacturer{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", products=" + products +
                '}';
    }
}
