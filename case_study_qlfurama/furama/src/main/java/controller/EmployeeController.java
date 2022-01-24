package controller;

import model.Employee;
import service.division.IDivisionService;
import service.division.impl.DivisionServiceImpl;
import service.educationDegree.IEducationDegreeService;
import service.educationDegree.impl.EducationDegreeServiceImpl;
import service.employee.IEmployeeService;
import service.employee.impl.EmployeeServiceImpl;
import service.position.IPositionService;
import service.position.impl.PositionServiceImpl;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "EmployeeController", value = {"/employees"})
public class EmployeeController extends HttpServlet {

    private IEmployeeService employeeService = new EmployeeServiceImpl();

    private IPositionService positionService = new PositionServiceImpl();

    private IEducationDegreeService educationDegreeService = new EducationDegreeServiceImpl();

    private IDivisionService divisionService = new DivisionServiceImpl();

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
        employeeService.editEmployee(employee);
        request.setAttribute("employeeList", employeeService.findAll());
        request.setAttribute("positionList", positionService.findAll());
        request.setAttribute("divisionList", divisionService.findAll());
        request.setAttribute("educationDegreeList",educationDegreeService.findAll());
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
        if (employeeService.createEmployee(employee)) {
            request.setAttribute("msg", "Thêm mới thành công");
            List<Employee> employeeList = employeeService.findAll();
            request.setAttribute("positionList", positionService.findAll());
            request.setAttribute("educationDegreeList",educationDegreeService.findAll());
            request.setAttribute("divisionList", divisionService.findAll());
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
        String employee_id =request.getParameter("employee_id");
        Employee employee = employeeService.findById(Integer.parseInt(employee_id));
        request.setAttribute("positionList", positionService.findAll());
        request.setAttribute("educationDegreeList",educationDegreeService.findAll());
        request.setAttribute("divisionList", divisionService.findAll());
        request.setAttribute("employee", employee);
        request.getRequestDispatcher("employee/edit_employee.jsp").forward(request, response);
    }

    private void showFormDeleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.deleteEmployee(id);
        List<Employee> employeeList = null;
        try {
            employeeList = employeeService.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("employeeList", employeeList);
        request.getRequestDispatcher("employee/list_employee.jsp").forward(request, response);
    }

    private void showCreateFormEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("positionList", positionService.findAll());
        request.setAttribute("educationDegreeList",educationDegreeService.findAll());
        request.setAttribute("divisionList", divisionService.findAll());
        request.getRequestDispatcher("employee/create_employee.jsp").forward(request, response);
    }

    private void showFormEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("employee/list_employee.jsp");
//        List<Employee> employeeList = EmployeeService.findAll();
        request.setAttribute("employeeList", employeeService.findAll());
        request.setAttribute("positionList", positionService.findAll());
        request.setAttribute("educationDegreeList",educationDegreeService.findAll());
        request.setAttribute("divisionList", divisionService.findAll());
        request.getRequestDispatcher("employee/list_employee.jsp").forward(request, response);
    }
}
