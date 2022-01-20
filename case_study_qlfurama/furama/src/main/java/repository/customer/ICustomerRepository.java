package repository.customer;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll() throws SQLException;
    Customer findById(int id) throws SQLException;
    boolean editCustomer(Customer customer,int id) throws SQLException;
    void createCustomer(Customer customer);
}
