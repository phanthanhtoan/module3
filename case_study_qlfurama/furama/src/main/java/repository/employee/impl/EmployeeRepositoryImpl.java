package repository.employee.impl;

import model.Employee;
import repository.BaseRepository;
import repository.employee.IEmployeeRepository;
import service.employee.IEmployeeService;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements IEmployeeRepository {
    private BaseRepository baseRepository = new BaseRepository();

    private static final String SELECT_ALL_EMPLOYEE = "select * from employee";
    private static final String SELECT_EMPLOYEE_BY_ID_SQL = "select *from employee where employee.employee_id?;";
    private static final String CREATE_EMPLOYEE = "insert into employee(employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone, \n" +
            "employee_email,employee_address, position_id, education_degree_id, division_id, username ) \n" +
            "value (?,?,?,?,?,?,?,?,?,?,?)";
    private static final String DELETE_EMPLOYEE ="delete from employee where employee.employee_id=?;";
    @Override
    public List<Employee> findAll() {
        List<Employee> employeeList = new ArrayList<>();
        try {

            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(SELECT_ALL_EMPLOYEE);
            ResultSet resultSet = preparedStatement.executeQuery();
            Employee employee;
            while (resultSet.next()) {
                employee = new Employee();
                employee.setEmployee_id(resultSet.getInt("employee_id"));
                employee.setEmployee_name(resultSet.getString("employee_name"));
                employee.setEmployee_birthday(resultSet.getString("employee_birthday"));
                employee.setEmployee_id_card(resultSet.getString("employee_id_card"));
                employee.setEmployee_salary(resultSet.getDouble("employee_salary"));
                employee.setEmployee_phone(resultSet.getString("employee_phone"));
                employee.setEmployee_email(resultSet.getString("employee_email"));
                employee.setEmployee_address(resultSet.getString("employee_address"));
                employee.setPosition_id(resultSet.getInt("position_id"));
                employee.setEducation_degree_id(resultSet.getInt("education_degree_id"));
                employee.setDivision_id(resultSet.getInt("division_id"));
                employee.setUsername(resultSet.getString("username"));
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public Employee findById(int employee_id) throws SQLException {
        try {

            PreparedStatement preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement(SELECT_EMPLOYEE_BY_ID_SQL);
            preparedStatement.setString(1, String.valueOf(employee_id));
            ResultSet resultSet = preparedStatement.executeQuery();
            Employee employee = null;
            while (resultSet.next()) {
                employee = new Employee();
                employee.setEmployee_id(resultSet.getInt("employee_id"));
                employee.setEmployee_name(resultSet.getString("employee_name"));
                employee.setEmployee_birthday(String.valueOf(resultSet.getDate("employee_birthday")));
                employee.setEmployee_id_card(resultSet.getString("employee_id_card"));
                employee.setEmployee_salary(resultSet.getDouble("employee_salary"));
                employee.setEmployee_phone(resultSet.getString("employee_phone"));
                employee.setEmployee_email(resultSet.getString("employee_email"));
                employee.setEmployee_address(resultSet.getString("employee_address"));
                employee.setPosition_id(resultSet.getInt("position_id"));
                employee.setEducation_degree_id(resultSet.getInt("education_degree_id"));
                employee.setDivision_id(resultSet.getInt("division_id"));
                employee.setUsername(resultSet.getString("username"));
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void createEmployee(Employee employee) throws SQLException {
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement(CREATE_EMPLOYEE);
            preparedStatement.setString(1, employee.getEmployee_name());
            preparedStatement.setDate(2, Date.valueOf(employee.getEmployee_birthday()));
            preparedStatement.setString(3, employee.getEmployee_id_card());
            preparedStatement.setDouble(4, employee.getEmployee_salary());
            preparedStatement.setString(5, employee.getEmployee_phone());
            preparedStatement.setString(6, employee.getEmployee_email());
            preparedStatement.setString(7, employee.getEmployee_address());
            preparedStatement.setInt(8, employee.getPosition_id());
            preparedStatement.setInt(9, employee.getEducation_degree_id());
            preparedStatement.setInt(10, employee.getDivision_id());
            preparedStatement.setString(11, employee.getUsername());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean deleleteEmployee(int employee_id) {
        int row =0;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = baseRepository.getConnection().prepareStatement(DELETE_EMPLOYEE);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            preparedStatement.setInt(1, employee_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            row = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row>0;
    }
}
