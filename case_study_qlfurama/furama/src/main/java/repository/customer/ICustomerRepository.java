package repository.customer;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll() throws SQLException;
    Customer findById(int customer_id) throws SQLException;
//    void save(int customer_id, int customer_type_id, String customer_name, String customer_birthday, String customer_gender,
//              String customer_id_card, String customer_phone, String customer_email, String customer_address) throws SQLException;
    void createCustomer(Customer customer);

    boolean deleteCustomer(int customer_id);
}
