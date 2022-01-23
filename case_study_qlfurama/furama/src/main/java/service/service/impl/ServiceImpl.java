package service.service.impl;

import model.Service;
import repository.service.IServiceRepository;
import repository.service.impl.ServiceRepositoryImpl;
import service.service.IService;

import java.util.List;

public class ServiceImpl implements IService {
    private IServiceRepository serviceRepository = new ServiceRepositoryImpl();
    @Override
    public List<Service> findAll() {
        return serviceRepository.findAll();
    }

    @Override
    public Service findById(int service_id) {
        return serviceRepository.findById(service_id);
    }

    @Override
    public boolean createService(Service service) {
        Service service1 = findById(service.getService_id());
        if (service1!=null){
            return false;
        }else {
            serviceRepository.createService(service);
            return true;
        }
    }

    @Override
    public boolean deleteService(int service_id) {
        return serviceRepository.deleteService(service_id);
    }

    @Override
    public void editService(Service service) {
        if (!service.getService_name().matches("^[A-Za-z ]{4,}$")){

        }
        serviceRepository.editService(service);
    }
}
