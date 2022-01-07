package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {

    List<Customer> findAll();

    Customer findById(String id);

    void save(String id, String ten, String ngaysinh, String diachi);

    boolean create_Customer(Customer customer);
}