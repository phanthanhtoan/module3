package service.employee.impl;

import model.Employee;
import repository.employee.IEmployeeRepository;
import repository.employee.impl.EmployeeRepositoryImpl;
import service.employee.IEmployeeService;

import java.sql.SQLException;
import java.util.List;

public class EmployeeServiceImpl implements IEmployeeService {

    private IEmployeeRepository employeeRepository = new EmployeeRepositoryImpl();

    @Override
    public List<Employee> findAll() throws SQLException {
        return employeeRepository.findAll();
    }

    @Override
    public Employee findById(int employee_id) throws SQLException {
        return employeeRepository.findById(employee_id);
    }

    @Override
    public boolean createEmployee(Employee employee) throws SQLException {
        Employee employee1 = findById(employee.getEmployee_id());
        if (employee1 != null) {
            return false;
        } else {
            employeeRepository.createEmployee(employee);
            return true;
        }
    }

    @Override
    public boolean deleleteEmployee(int employee_id) {
        return employeeRepository.deleleteEmployee(employee_id);
    }
}
