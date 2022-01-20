package service.employee;

import model.Employee;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeService {
    List<Employee> findAll() throws SQLException;
    Employee findById(int employee_id) throws SQLException;
    boolean createEmployee(Employee employee) throws SQLException;
    //  boolean deleteCustomer(int customer_id);
    boolean deleleteEmployee(int employee_id);
}
