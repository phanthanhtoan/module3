package repository.serviceType;

import model.ServiceType;

import java.util.List;

public interface IServiceTypeRepository {
    List<ServiceType> findAll();
}
