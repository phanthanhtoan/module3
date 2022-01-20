package repository.customer.impl;

import java.sql.*;

import model.Customer;
import repository.BaseRepository;
import repository.customer.ICustomerRepository;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements ICustomerRepository {
    private BaseRepository baseRepository = new BaseRepository();

    private static final String SELECT_ALL_CUSTOMER = "select *from customer";
    private final String UPDATE_CUSTOMER = "UPDATE customer set customer_type_id=?, customer_name=?, customer_birthday=?," +
            "customer_gender=?,customer_id_card=?,customer_phone=?,customer_email=?,customer_address=?" +
            " where customer_id=?;";
    private static final String SELECT_CUSTOMER_BY_ID_SQL = "SELECT * from customer where customer.customer_id=?;";
    private static final String CREATE_CUSTOMER = "insert into customer(customer_type_id,customer_name,customer_birthday,customer_gender," +
            " customer_id_card, customer_phone,customer_email, customer_address ) value (?,?,?,?,?,?,?,?)";

    @Override
    public List<Customer> findAll() throws SQLException {
        List<Customer> customerList = new ArrayList<>();
        try {
            Connection connection = this.baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            Customer customer;
            while (resultSet.next()) {
//                customer = new Customer();
//                customer.setCustomer_id(resultSet.getInt("customer_id"));
//                customer.setCustomer_type_id(resultSet.getInt("customer_type_id"));
//                customer.setCustomer_name(resultSet.getString("customer_name"));
//                customer.setCustomer_birthday(resultSet.getString("customer_birthday"));
//                customer.setCustomer_gender(resultSet.getString("customer_gender"));
//                customer.setCustomer_id_card(resultSet.getString("customer_id_card"));
//                customer.setCustomer_phone(resultSet.getString("customer_phone"));
//                customer.setCustomer_email(resultSet.getString("customer_email"));
//                customer.setCustomer_address(resultSet.getString("customer_address"));
//                customerList.add(customer);
                customer = new Customer();
                customer.setCustomer_id(resultSet.getInt("customer_id"));
                customer.setCustomer_type_id(resultSet.getInt("customer_type_id"));
                customer.setCustomer_name(resultSet.getString("customer_name"));
                customer.setCustomer_birthday(String.valueOf(resultSet.getDate("customer_birthday")));
                customer.setCustomer_gender(String.valueOf(resultSet.getByte("customer_gender")));
                customer.setCustomer_id_card(resultSet.getString("customer_id_card"));
                customer.setCustomer_phone(resultSet.getString("customer_phone"));
                customer.setCustomer_email(resultSet.getString("customer_email"));
                customer.setCustomer_address(resultSet.getString("customer_address"));
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public Customer findById(int id) throws SQLException {
        Customer customer = null;
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID_SQL);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                customer = new Customer();
                customer.setCustomer_id(resultSet.getInt("customer_id"));
                customer.setCustomer_type_id(resultSet.getInt("customer_type_id"));
                customer.setCustomer_name(resultSet.getString("customer_name"));
                customer.setCustomer_birthday(resultSet.getString("customer_birthday"));
                customer.setCustomer_gender(resultSet.getString("customer_gender"));
                customer.setCustomer_id_card(resultSet.getString("customer_id_card"));
                customer.setCustomer_phone(resultSet.getString("customer_phone"));
                customer.setCustomer_email(resultSet.getString("customer_email"));
                customer.setCustomer_address(resultSet.getString("customer_address"));
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public boolean editCustomer(Customer customer,int id) throws SQLException {
        Connection connection = null;
        connection = baseRepository.getConnection();
        boolean check = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER);
            preparedStatement.setInt(1, customer.getCustomer_type_id());
            preparedStatement.setString(2, customer.getCustomer_name());
            preparedStatement.setDate(3, Date.valueOf(customer.getCustomer_birthday()));
            preparedStatement.setByte(4, Byte.parseByte(customer.getCustomer_gender()));
            preparedStatement.setString(5, customer.getCustomer_id_card());
            preparedStatement.setString(6, customer.getCustomer_phone());
            preparedStatement.setString(7, customer.getCustomer_email());
            preparedStatement.setString(8, customer.getCustomer_address());
            preparedStatement.setInt(9, id);
            check = preparedStatement.executeUpdate() > 0;
            preparedStatement.close();
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return check;

//        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER_BY_ID);
//
//        preparedStatement.setInt(1, customer.getCustomer_type_id());
//        preparedStatement.setString(2, customer.getCustomer_name());
//        preparedStatement.setString(3, customer.getCustomer_birthday());
//        preparedStatement.setString(4, customer.getCustomer_gender());
//        preparedStatement.setString(5, customer.getCustomer_id_card());
//        preparedStatement.setString(6, customer.getCustomer_phone());
//        preparedStatement.setString(7, customer.getCustomer_email());
//        preparedStatement.setString(8, customer.getCustomer_address());
//        preparedStatement.setInt(9, customer.getCustomer_id());
//        row = preparedStatement.executeUpdate();
//        return row > 0;
    }

    @Override
    public void createCustomer(Customer customer) {
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement(CREATE_CUSTOMER);
            preparedStatement.setInt(1, customer.getCustomer_type_id());
            preparedStatement.setString(2, customer.getCustomer_name());
            preparedStatement.setString(3, customer.getCustomer_birthday());
            preparedStatement.setString(4, customer.getCustomer_gender());
            preparedStatement.setString(5, customer.getCustomer_id_card());
            preparedStatement.setString(6, customer.getCustomer_phone());
            preparedStatement.setString(7, customer.getCustomer_email());
            preparedStatement.setString(8, customer.getCustomer_address());
            preparedStatement.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
