package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();

    Customer findById(String id);
    void save(String id, String ten, String ngaysinh, String diachi);

    void create_Customer(Customer customer);
}