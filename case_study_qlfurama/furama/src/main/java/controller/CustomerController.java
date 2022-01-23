package controller;

import model.Customer;
import service.customer.ICustomerService;
import service.customer.impl.CustomerServiceImpl;
import service.customerType.ICustomerTypeService;
import service.customerType.impl.CustomerTypeServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerController", value = {"/customers"})
public class CustomerController extends HttpServlet {
    private ICustomerService customerService = new CustomerServiceImpl();

    private ICustomerTypeService customerTypeService = new CustomerTypeServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    createCustomer(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "edit":
                try {
                    editCustomer(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "search":
                break;
        }

    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int customer_id = Integer.parseInt(request.getParameter("customer_id"));
        int customer_type_id = Integer.parseInt(request.getParameter("customer_type_id"));
        String customer_name = request.getParameter("customer_name");
        String customer_birthday = request.getParameter("customer_birthday");
        String customer_gender = request.getParameter("customer_gender");
        String customer_id_card = request.getParameter("customer_id_card");
        String customer_phone = request.getParameter("customer_phone");
        String customer_email = request.getParameter("customer_email");
        String customer_address = request.getParameter("customer_address");
        Customer customer = new Customer(customer_id,customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,
                customer_phone,customer_email ,customer_address);
        customerService.editCustomer(customer);
        request.setAttribute("customerList", customerService.findAll());
        request.setAttribute("customerTypeList", customerTypeService.findAll());
        response.sendRedirect("/customers");
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int customer_id = Integer.parseInt(request.getParameter("customer_id"));
        int customer_type_id = Integer.parseInt(request.getParameter("customer_type_id"));
        String customer_name = request.getParameter("customer_name");
        String customer_birthday = request.getParameter("customer_birthday");
        String customer_gender = request.getParameter("customer_gender");
        String customer_id_card = request.getParameter("customer_id_card");
        String customer_phone = request.getParameter("customer_phone");
        String customer_email = request.getParameter("customer_email");
        String customer_address = request.getParameter("customer_address");
        Customer customer = new Customer(customer_id, customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card,
                customer_phone, customer_email, customer_address);
        if (customerService.createCustomer(customer)) {
            request.setAttribute("message", "Thêm mới thành công");
            List<Customer> customerList = customerService.findAll();
            request.setAttribute("customerTypeList", customerTypeService.findAll());
            request.setAttribute("customerList", customerList);
            request.getRequestDispatcher("customer/list_customer.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Thêm mới thất bại");
            request.getRequestDispatcher("customer/create_customer.jsp").forward(request, response);
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateFormCustomer(request, response);
                break;
            case "edit":
                try {
                    showEditFormCustomer(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "delete":
                showFormDeleteCustomer(request, response);
                break;
            case "search":
                break;
            default: {
                try {
                    showFormCustomer(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void showEditFormCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String customer_id = request.getParameter("customer_id");
        Customer customer = customerService.findById(Integer.parseInt(customer_id));
        request.setAttribute("customerTypeList", customerTypeService.findAll());
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("customer/edit_customer.jsp").forward(request, response);
    }

    private void showFormDeleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.deleteCustomer(id);
        List<Customer> customerList = null;
        try {
            customerList = customerService.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("customer/list_customer.jsp").forward(request, response);
    }


    private void showCreateFormCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerTypeList", customerTypeService.findAll());
        request.getRequestDispatcher("customer/create_customer.jsp").forward(request, response);
    }


    private void showFormCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/list_customer.jsp");
//        List<Customer> customerList = iCustomerService.findAll();
//        request.setAttribute("customerList", customerList);
        request.setAttribute("customerList", customerService.findAll());
        request.setAttribute("customerTypeList", customerTypeService.findAll());
        requestDispatcher.forward(request,response);
//        request.getRequestDispatcher("customer/list_customer.jsp").forward(request, response);
    }
}
