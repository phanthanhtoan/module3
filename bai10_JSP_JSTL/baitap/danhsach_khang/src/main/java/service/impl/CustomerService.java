package service.impl;

import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository iCustomerRepository = new CustomerRepository();

    @Override
    public List<Customer> findAll() {
        return iCustomerRepository.findAll();
    }

    @Override
    public Customer findById(String id) {
        return iCustomerRepository.findById(id);
    }

    @Override
    public void save(String id, String ten, String ngaysinh, String diachi) {
        if (!ten.matches("^[A-Za-z ]{4,}$")) {

        }
        iCustomerRepository.save(id, ten, ngaysinh, diachi);
    }

    @Override
    public boolean create_Customer(Customer customer) {
        Customer customer1 = findById(String.valueOf(customer.getId()));
        if (customer1!= null){
             return  false;
        }else {
            iCustomerRepository.create_Customer(customer);
            return true;
        }
    }

}