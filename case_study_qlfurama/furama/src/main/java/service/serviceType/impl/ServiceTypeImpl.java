package service.serviceType.impl;

import model.ServiceType;
import repository.serviceType.IServiceTypeRepository;
import repository.serviceType.impl.ServiceTypeRepositoryImpl;
import service.serviceType.IServiceType;

import java.util.List;

public class ServiceTypeImpl implements IServiceType {
    private IServiceTypeRepository serviceTypeRepository = new ServiceTypeRepositoryImpl();
    @Override
    public List<ServiceType> findAll() {
        return serviceTypeRepository.findAll();
    }
}
