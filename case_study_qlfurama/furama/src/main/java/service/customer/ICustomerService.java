package service.customer;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerService {
    List<Customer> findAll() throws SQLException;
    Customer findById(int id) throws SQLException;
    boolean editCustomer(Customer customer,int id) throws SQLException;
    boolean createCustomer(Customer customer) throws SQLException;
}
