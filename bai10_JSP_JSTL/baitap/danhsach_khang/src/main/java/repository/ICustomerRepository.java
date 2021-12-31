package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();

    Customer findById(String id);
    void save(String ten, String ngaysinh, String diachi);
}

