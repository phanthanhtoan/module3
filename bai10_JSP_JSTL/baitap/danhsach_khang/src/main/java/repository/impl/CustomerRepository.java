package repository.impl;

import model.Customer;
import repository.ICustomerRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class CustomerRepository implements ICustomerRepository {

    private static List<Customer> customerList = new ArrayList<>();

    static{
        customerList.add(new Customer(1,"Toan", "da nang","27/12/2000", "abc.png"));
        customerList.add(new Customer(2,"Hieu", "Quang Nam","30/08/2000", "abc.png"));
        customerList.add(new Customer(3,"Hung", "Quang Nam","08/11/2000", "abc.png"));
    }
    @Override
    public List<Customer> findAll() {
        return customerList;
    }

    @Override
    public Customer findById(String id) {
        Integer temp = Integer.parseInt(id);
        for (Customer customer: customerList){
            if (Objects.equals(customer.getId(), temp)){
                return customer;
            }
        }
        return null;
    }

    @Override
    public void save(String id, String ten, String ngaysinh, String diachi) {
        Integer temp = Integer.parseInt(id);
        for(Customer customer: customerList) {
            if(Objects.equals(customer.getId(), temp)) {
                customer.setTen(ten);
                customer.setNgaysinh(ngaysinh);
            }
        }
    }
}
