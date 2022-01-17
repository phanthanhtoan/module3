package service;

import model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    void save(Product customer);
    Product findById(int id);
    void update(int id, Product product);
    void remove(int id);
}
