package repository.customer;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll() throws SQLException;
    Customer findById(int customer_id) throws SQLException;

    void createCustomer(Customer customer);

    boolean deleteCustomer(int customer_id);

    void editCustomer(Customer customer);
    List<Customer> findByNameAndGenderAndAddressAndEmail(String name, String gender,  String address, String email);

}
