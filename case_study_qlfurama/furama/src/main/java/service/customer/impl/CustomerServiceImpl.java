package service.customer.impl;

import model.Customer;
import repository.customer.ICustomerRepository;
import repository.customer.impl.CustomerRepositoryImpl;
import service.customer.ICustomerService;

import java.sql.SQLException;
import java.util.List;

public class CustomerServiceImpl implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepositoryImpl();

    @Override
    public List<Customer> findAll() throws SQLException {
        return customerRepository.findAll();
    }

    @Override
    public Customer findById(int customer_id) throws SQLException {
        return customerRepository.findById(customer_id);
    }

//    @Override
//    public void save(int customer_id, int customer_type_id, String customer_name, String customer_birthday, String customer_gender, String customer_id_card, String customer_phone, String customer_email, String customer_address) throws SQLException {
//        if (!customer_name.matches("^[A-Za-z ]{4,}$")) {
//
//        }
//        customerRepository.save(customer_id, customer_type_id, customer_name, customer_birthday, customer_gender,
//                customer_id_card, customer_phone, customer_email, customer_address);
//    }


    @Override
    public boolean createCustomer(Customer customer) throws SQLException {
        Customer customer1 = findById(customer.getCustomer_id());
        if (customer1 != null) {
            return false;
        } else {
            customerRepository.createCustomer(customer);
            return true;
        }
    }

    @Override
    public boolean deleteCustomer(int customer_id) {
        return customerRepository.deleteCustomer(customer_id);
    }



}
