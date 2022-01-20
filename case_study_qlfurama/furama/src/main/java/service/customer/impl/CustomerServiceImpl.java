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
        return customerRepository.findAll()
 ;
    }

    @Override
    public Customer findById(int id) throws SQLException {
        return customerRepository.findById(id);
    }

    @Override
    public boolean editCustomer(Customer customer,int id) throws SQLException {
        return customerRepository.editCustomer(customer,id);
    }

    @Override
    public boolean createCustomer(Customer customer) throws SQLException {
        Customer customer1 = findById(customer.getCustomer_id());
        if(customer1!=null) {
            return false;
        } else {
            customerRepository.createCustomer(customer);
            return true;
        }
    }

}
