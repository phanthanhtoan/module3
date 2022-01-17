package service.impl;

import model.Product;
import service.ProductService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1,new Product(1,"Tivi",5000000,"television","Sony"));
        products.put(2,new Product(2,"Máy ảnh",6000000,"Máy ảnh công nghệ","Sony"));
        products.put(3,new Product(3,"Điện thoại",7000000,"Điện thoại thông minh 6,1'","Samsung"));
        products.put(4,new Product(4,"Bàn phím NJ80",8000000,"Bàn phím cơ siêu xịn","NJ"));
        products.put(5,new Product(5,"Chuột không dây G304",9000000,"Dpi 12000, không dây","Logitech"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}
