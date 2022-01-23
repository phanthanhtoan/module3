package service.service;

import model.Service;

import java.util.List;

public interface IService {
    List<Service> findAll();

    Service findById(int service_id);
    boolean createService(Service service);
    boolean deleteService(int service_id);
}
