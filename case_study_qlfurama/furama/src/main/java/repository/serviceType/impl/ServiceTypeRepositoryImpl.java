package repository.serviceType.impl;

import model.ServiceType;
import repository.BaseRepository;
import repository.serviceType.IServiceTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceTypeRepositoryImpl implements IServiceTypeRepository {

    private BaseRepository baseRepository = new BaseRepository();

    private static final String SELECT_ALL_SERVICE_TYPE = "select * from service_type;";
    @Override
    public List<ServiceType> findAll() {
        List<ServiceType> serviceTypes = new ArrayList<>();
        Connection connection = this.baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int service_type_id = resultSet.getInt("service_type_id");
                String service_type_name = resultSet.getString("service_type_name");
                serviceTypes.add(new ServiceType(service_type_id,service_type_name));
            }
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceTypes;
    }
}
