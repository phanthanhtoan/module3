package service.customerType.impl;

import model.CustomerType;
import repository.CustomerType.ICustomerTypeRepository;
import repository.CustomerType.impl.CustomerTypeRepositoryImpl;
import service.customerType.ICustomerTypeService;

import java.util.List;

public class CustomerTypeServiceImpl implements ICustomerTypeService {
    private ICustomerTypeRepository customerTypeRepository = new CustomerTypeRepositoryImpl();
    @Override
    public List<CustomerType> findAll() {
        return customerTypeRepository.findAll();
    }
}
