package service.customer;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerService {
    List<Customer> findAll() throws SQLException;

    Customer findById(int customer_id) throws SQLException;

    void editCustomer(Customer customer) throws SQLException;
    boolean createCustomer(Customer customer) throws SQLException;
    boolean deleteCustomer(int customer_id);
}
