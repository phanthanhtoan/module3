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

    @Override
    public void editCustomer(Customer customer) throws SQLException {
        if (!customer.getCustomer_name().matches("^[A-Za-z ]{4,}$")) {

        }
        customerRepository.editCustomer(customer);
    }


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

    @Override
    public List<Customer> findByNameAndGenderAndAddressAndEmail(String name, String gender, String address, String email) {
        return customerRepository.findByNameAndGenderAndAddressAndEmail(name,gender,address,email);
    }


}
