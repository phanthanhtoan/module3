package controller;

import model.Customer;
import model.Employee;
import service.employee.IEmployeeService;
import service.employee.impl.EmployeeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "EmployeeController", value = {"/employees", ""})
public class EmployeeController extends HttpServlet {
    private IEmployeeService iEmployeeService = new EmployeeServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    createEmployee(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "edit":
                try {
                    editEmployee(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "search":
                break;
        }

    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int employee_id = Integer.parseInt(request.getParameter("employee_id"));
        String employee_name = request.getParameter("employee_name");
        String employee_birthday = request.getParameter("employee_birthday");
        String employee_id_card = request.getParameter("employee_id_card");
        Double employee_salary= Double.valueOf(request.getParameter("employee_salary"));
        String employee_phone = request.getParameter("employee_phone");
        String employee_email = request.getParameter("employee_email");
        String employee_address = request.getParameter("employee_address");
        int position_id = Integer.parseInt(request.getParameter("position_id"));
        int education_degree_id = Integer.parseInt(request.getParameter("education_degree_id"));
        int division_id = Integer.parseInt(request.getParameter("division_id"));
        String username = request.getParameter("username");
        Employee  employee = new Employee(employee_id,employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,
                employee_email,employee_address,position_id,education_degree_id,division_id,username);
        iEmployeeService.editEmployee(employee);
        response.sendRedirect("/employees");
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int employee_id = Integer.parseInt(request.getParameter("employee_id"));
        String employee_name = request.getParameter("employee_name");
        String employee_birthday = request.getParameter("employee_birthday");
        String employee_id_card = request.getParameter("employee_id_card");
        Double employee_salary = Double.valueOf(request.getParameter("employee_salary"));
        String employee_phone = request.getParameter("employee_phone");
        String employee_email = request.getParameter("employee_email");
        String employee_address = request.getParameter("employee_address");
        int position_id = Integer.parseInt(request.getParameter("position_id"));
        int education_degree_id = Integer.parseInt(request.getParameter("education_degree_id"));
        int division_id = Integer.parseInt(request.getParameter("division_id"));
        String username = request.getParameter("username");
        Employee employee = new Employee(employee_id, employee_name, employee_birthday, employee_id_card, employee_salary,
                employee_phone, employee_email, employee_address, position_id, education_degree_id, division_id, username);
        if (iEmployeeService.createEmployee(employee)) {
            request.setAttribute("msg", "Thêm mới thành công");
            List<Employee> employeeList = iEmployeeService.findAll();
            request.setAttribute("employeeList", employeeList);
            request.getRequestDispatcher("employee/list_employee.jsp").forward(request, response);
        } else {
            request.setAttribute("msg", "Thêm mới thất bại");
            request.getRequestDispatcher("employee/create_employee.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateFormEmployee(request, response);
                break;
            case "edit":
                try {
                    showEditFormEmployee(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "delete":
                showFormDeleteEmployee(request, response);
                break;
            case "search":
                break;
            default:
                try {
                    showFormEmployee(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;

        }
    }

    private void showEditFormEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String employee_id = request.getParameter("employee_id");
        Employee employee = iEmployeeService.findById(Integer.parseInt(employee_id));
        request.setAttribute("employee", employee);
        request.getRequestDispatcher("employee/edit_employee.jsp").forward(request, response);
    }

    private void showFormDeleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        iEmployeeService.deleteEmployee(id);
        List<Employee> employeeList = null;
        try {
            employeeList = iEmployeeService.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("employeeList", employeeList);
        request.getRequestDispatcher("employee/list_employee.jsp").forward(request, response);
    }

    private void showCreateFormEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("employee/create_employee.jsp").forward(request, response);
    }

    private void showFormEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Employee> employeeList = iEmployeeService.findAll();
        request.setAttribute("employeeList", employeeList);
        request.getRequestDispatcher("employee/list_employee.jsp").forward(request, response);
    }
}
