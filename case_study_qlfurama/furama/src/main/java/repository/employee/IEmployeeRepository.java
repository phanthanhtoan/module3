package repository.employee;



import model.Employee;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeRepository {
    List<Employee> findAll();

    Employee findById(int employee_id) throws SQLException;

    void createEmployee(Employee employee) throws SQLException;

    boolean deleleteEmployee(int employee_id);
}
