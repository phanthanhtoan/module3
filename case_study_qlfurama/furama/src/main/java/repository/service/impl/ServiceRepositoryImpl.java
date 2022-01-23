package repository.service.impl;

import model.Service;
import repository.BaseRepository;
import repository.service.IServiceRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepositoryImpl implements IServiceRepository {
    private BaseRepository baseRepository = new BaseRepository();

    private static final String SELECT_ALL_SERVICE = "select * from service;";
    private static final String SELECT_SERVICE_BY_ID_SQL = " select * from service where service.service_id=?;";
    private static final String CREATE_SERVICE = "insert into service(service_name, service_area, service_cost, service_max_people, rent_type_id,service_type_id,standard_room, description_other_convenience, pool_area, number_of_floors )\n" +
            "            value (?,?,?,?,?,?,?,?,?,?);";

    private static final String DELETE_SERVICE = "delete from service where service.service_id=?;";

    private static final String UPDATE_SERVICE = "update service set service_name =?, service_area =?, service_cost =?, " +
            "service_max_people =?, rent_type_id =?, service_type_id =?, standard_room =?, description_other_convenience =?," +
            " pool_area =?, number_of_floors =? where service_id=?; ";

    @Override
    public List<Service> findAll() {
        List<Service> serviceList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement(SELECT_ALL_SERVICE);
            ResultSet resultSet = preparedStatement.executeQuery();
            Service service;
            while (resultSet.next()) {
                service = new Service();
                service.setService_id(resultSet.getInt("service_id"));
                service.setService_name(resultSet.getString("service_name"));
                service.setService_area(resultSet.getInt("service_area"));
                service.setService_cost(resultSet.getDouble("service_cost"));
                service.setService_max_people(resultSet.getInt("service_max_people"));
                service.setRent_type_id(resultSet.getInt("rent_type_id"));
                service.setService_type_id(resultSet.getInt("service_type_id"));
                service.setStandard_room(resultSet.getString("standard_room"));
                service.setDescription_other_convenience(resultSet.getString("description_other_convenience"));
                service.setPool_area(resultSet.getDouble("pool_area"));
                service.setNumber_of_floors(resultSet.getInt("number_of_floors"));
                serviceList.add(service);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceList;
    }

    @Override
    public Service findById(int service_id) {
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement(SELECT_SERVICE_BY_ID_SQL);
            preparedStatement.setString(1, String.valueOf(service_id));
            ResultSet resultSet = preparedStatement.executeQuery();
            Service service = null;
            while (resultSet.next()) {
                service = new Service();
                service.setService_id(resultSet.getInt("service_id"));
                service.setService_name(resultSet.getString("service_name"));
                service.setService_area(resultSet.getInt("service_area"));
                service.setService_cost(resultSet.getDouble("service_cost"));
                service.setService_max_people(resultSet.getInt("service_max_people"));
                service.setRent_type_id(resultSet.getInt("rent_type_id"));
                service.setService_type_id(resultSet.getInt("service_type_id"));
                service.setStandard_room(resultSet.getString("standard_room"));
                service.setDescription_other_convenience(resultSet.getString("description_other_convenience"));
                service.setPool_area(resultSet.getDouble("pool_area"));
                service.setNumber_of_floors(resultSet.getInt("number_of_floors"));
                break;
            }
            return service;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void createService(Service service) {
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement(CREATE_SERVICE);

            preparedStatement.setString(1, service.getService_name());
            preparedStatement.setInt(2, service.getService_area());
            preparedStatement.setDouble(3, service.getService_cost());
            preparedStatement.setInt(4, service.getService_max_people());
            preparedStatement.setInt(5, service.getRent_type_id());
            preparedStatement.setInt(6, service.getService_type_id());
            preparedStatement.setString(7, service.getStandard_room());
            preparedStatement.setString(8, service.getDescription_other_convenience());
            preparedStatement.setDouble(9, service.getPool_area());
            preparedStatement.setInt(10, service.getNumber_of_floors());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean deleteService(int service_id) {
        int row = 0;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(DELETE_SERVICE);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            preparedStatement.setInt(1, service_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            row = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row > 0;
    }

    @Override
    public void editService(Service service) {
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement(UPDATE_SERVICE);
            preparedStatement.setString(1, service.getService_name());
            preparedStatement.setInt(2, service.getService_area());
            preparedStatement.setDouble(3, service.getService_cost());
            preparedStatement.setInt(4, service.getService_max_people());
            preparedStatement.setInt(5, service.getRent_type_id());
            preparedStatement.setInt(6, service.getService_type_id());
            preparedStatement.setString(7, service.getStandard_room());
            preparedStatement.setString(8, service.getDescription_other_convenience());
            preparedStatement.setDouble(9, service.getPool_area());
            preparedStatement.setInt(10, service.getNumber_of_floors());
            preparedStatement.setInt(11, service.getService_id());
            int num = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
