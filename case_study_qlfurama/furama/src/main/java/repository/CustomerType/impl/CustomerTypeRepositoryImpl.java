package repository.CustomerType.impl;

import model.CustomerType;
import repository.BaseRepository;
import repository.CustomerType.ICustomerTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepositoryImpl implements ICustomerTypeRepository {
    private BaseRepository baseRepository = new BaseRepository();

    private static final String SELECT_ALL_CUSTOMER_TYPE = "select *from customer_type;";

    @Override
    public List<CustomerType> findAll() {
        List<CustomerType> customerTypes = new ArrayList<>();
        Connection connection = this.baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int customer_type_id = resultSet.getInt("customer_type_id");
                String customer_type_name = resultSet.getString("customer_type_name");
                customerTypes.add(new CustomerType(customer_type_id, customer_type_name));
            }

            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypes;
    }
}
