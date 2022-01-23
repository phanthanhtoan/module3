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

    private static final String SELECT_CUSTOMER_BY_ID_SQL = "select * from customer where customer.customer_id=?;";

    private static final String CREATE_CUSTOMER = "insert into customer(customer_type_id,customer_name,customer_birthday,customer_gender," + " customer_id_card, customer_phone,customer_email, customer_address ) value (?,?,?,?,?,?,?,?)";

    private static final String DELETE_CUSTOMER = "delete from customer where customer.customer_id=?;";

    private final String UPDATE_CUSTOMER = "update customer set customer_type_id = ?, customer_name =? , customer_birthday = ?," +
            "customer_gender = ?,customer_id_card = ?,customer_phone = ?,customer_email = ?,customer_address = ?" +
            " where customer_id = ?;";

    @Override
    public List<Customer> findAll() throws SQLException {
        List<Customer> customerList = new ArrayList<>();
        try {

            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            Customer customer;
            while (resultSet.next()) {
                customer = new Customer();
                customer.setCustomer_id(resultSet.getInt("customer_id"));
                customer.setCustomer_type_id(resultSet.getInt("customer_type_id"));
                customer.setCustomer_name(resultSet.getString("customer_name"));
                customer.setCustomer_birthday(resultSet.getString("customer_birthday"));
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
    public Customer findById(int customer_id) throws SQLException {
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement(SELECT_CUSTOMER_BY_ID_SQL);
            preparedStatement.setString(1, String.valueOf(customer_id));
            ResultSet resultSet = preparedStatement.executeQuery();
            Customer customer = null;
            while (resultSet.next()) {
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
                break;
            }
            return customer;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void createCustomer(Customer customer) {
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement(CREATE_CUSTOMER);
            preparedStatement.setInt(1, customer.getCustomer_type_id());
            preparedStatement.setString(2, customer.getCustomer_name());
            preparedStatement.setDate(3, Date.valueOf(customer.getCustomer_birthday()));
            preparedStatement.setByte(4, Byte.parseByte(customer.getCustomer_gender()));
            preparedStatement.setString(5, customer.getCustomer_id_card());
            preparedStatement.setString(6, customer.getCustomer_phone());
            preparedStatement.setString(7, customer.getCustomer_email());
            preparedStatement.setString(8, customer.getCustomer_address());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean deleteCustomer(int customer_id) {

        int row = 0;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(DELETE_CUSTOMER);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            preparedStatement.setInt(1, customer_id);
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
    public void editCustomer(Customer customer) {
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement(UPDATE_CUSTOMER);
            preparedStatement.setInt(1, customer.getCustomer_type_id());
            preparedStatement.setString(2, customer.getCustomer_name());
            preparedStatement.setString(3, customer.getCustomer_birthday());
            preparedStatement.setByte(4, Byte.parseByte(customer.getCustomer_gender()));
            preparedStatement.setString(5, customer.getCustomer_id_card());
            preparedStatement.setString(6, customer.getCustomer_phone());
            preparedStatement.setString(7, customer.getCustomer_email());
            preparedStatement.setString(8, customer.getCustomer_address());
            preparedStatement.setInt(9, customer.getCustomer_id());
            int num = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
