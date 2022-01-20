package controller;

import common.Validate;
import model.Customer;
import service.customer.ICustomerService;
import service.customer.impl.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerController", value = {"/customers", ""})
public class CustomerController extends HttpServlet {
    private ICustomerService iCustomerService = new CustomerServiceImpl();

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
                    editCustomer(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "delete":
                break;
            case "search":
                break;
        }

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
        Customer customer = new Customer(customer_id,customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card,
                customer_phone, customer_email, customer_address);
        if (iCustomerService.createCustomer(customer)) {
            request.setAttribute("msg", "Thêm mới thành công");
            List<Customer> customerList = iCustomerService.findAll();
            request.setAttribute("customerList", customerList);
            request.getRequestDispatcher("customer/list_customer.jsp").forward(request, response);
        }else {
            request.setAttribute("msg", "Thêm mới thất bại");
            request.getRequestDispatcher("customer/create_customer.jsp").forward(request, response);
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int customer_id = Integer.parseInt(request.getParameter("customer_id"));
        int customer_type_id = Integer.parseInt(request.getParameter("customer_type_id"));
        String customer_name = request.getParameter("customer_name");
        String customer_birthday = request.getParameter("customer_birthday");
        String customer_gender = request.getParameter("customer_gender");
        String customer_id_card = request.getParameter("customer_id_card");
        String customer_phone = request.getParameter("customer_phone");
        String customer_email = request.getParameter("customer_email");
        String customer_address = request.getParameter("customer_address");
        Customer customer = new Customer(customer_type_id, customer_name, customer_birthday, customer_gender,
                customer_id_card, customer_phone, customer_email, customer_address);
        boolean check = iCustomerService.editCustomer(customer, customer_id);
        if (check) {
            request.setAttribute("message", "Sửa thành công");
        } else {
            request.setAttribute("message", "Sửa thất bại");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list_customer.jsp");
        request.setAttribute("customerList", this.iCustomerService.findAll());
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customers.jsp");
//        request.setAttribute("customerList", iCustomerService.findAll());
////        request.setAttribute("customerTypeList",iCustomerService.findAll());
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
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
                    showEditFormCustomer(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "delete":
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

    private void showCreateFormCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("customer/create_customer.jsp").forward(request, response);
    }

    private void showEditFormCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/edit_customer.jsp");
//        request.setAttribute("customerList", iCustomerService.findById(id));
//        request.setAttribute("customerTypeList",iCustomerService.findAll());
//        try {
//            dispatcher.forward(request,response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/edit_customer.jsp");
        request.setAttribute("customerList", iCustomerService.findById(id));
//        request.setAttribute("customerTypeList",iCustomerService.findAll());
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
//        Customer customer = this.iCustomerService.findById(id);
//        RequestDispatcher dispatcher;
//        if (customer == null) {
//            dispatcher = request.getRequestDispatcher("error_404.jsp");
//        } else {
//            request.setAttribute("customer", customer);
//            dispatcher = request.getRequestDispatcher("customer/edit_customer.jsp");
//        }
//        try {
//            dispatcher.forward(request, response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }

    private void showFormCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Customer> customers = this.iCustomerService.findAll();
        request.setAttribute("customerList", customers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list_customer.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
