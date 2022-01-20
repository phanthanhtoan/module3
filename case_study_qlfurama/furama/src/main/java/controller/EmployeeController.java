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

                break;
            case "search":
                break;
        }

    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        //  int customer_id = Integer.parseInt(request.getParameter("customer_id"));
        //        int customer_type_id = Integer.parseInt(request.getParameter("customer_type_id"));
        //        String customer_name = request.getParameter("customer_name");
        //        String customer_birthday = request.getParameter("customer_birthday");
        //        String customer_gender = request.getParameter("customer_gender");
        //        String customer_id_card = request.getParameter("customer_id_card");
        //        String customer_phone = request.getParameter("customer_phone");
        //        String customer_email = request.getParameter("customer_email");
        //        String customer_address = request.getParameter("customer_address");
        //        Customer customer = new Customer(customer_id, customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card,
        //                customer_phone, customer_email, customer_address);
        //        if (iCustomerService.createCustomer(customer)) {
        //            request.setAttribute("msg", "Thêm mới thành công");
        //            List<Customer> customerList = iCustomerService.findAll();
        //            request.setAttribute("customerList", customerList);
        //            request.getRequestDispatcher("customer/list_customer.jsp").forward(request, response);
        //        } else {
        //            request.setAttribute("msg", "Thêm mới thất bại");
        //            request.getRequestDispatcher("customer/create_customer.jsp").forward(request, response);
        //        }
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
//            case "edit":

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

    private void showFormDeleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        iEmployeeService.deleleteEmployee(id);
        List<Employee> employeeList = null;
        try {
            employeeList = iEmployeeService.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("employeeList", employeeList);
        request.getRequestDispatcher("employee/list_employee.jsp").forward(request,response);
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
