package repository.service;

import model.Service;

import java.util.List;

public interface IServiceRepository {
    List<Service> findAll();

    Service findById(int service_id);
    void createService(Service service);
    boolean deleteService(int service_id);
}
