package service.customer;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerService {
    List<Customer> findAll() throws SQLException;

    Customer findById(int customer_id) throws SQLException;

//    void save(int customer_id, int customer_type_id, String customer_name, String customer_birthday, String customer_gender,
//              String customer_id_card, String customer_phone, String customer_email, String customer_address) throws SQLException;
    boolean createCustomer(Customer customer) throws SQLException;
    boolean deleteCustomer(int customer_id);
}
