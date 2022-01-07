package controller;

import model.Customer;
import service.ICustomerService;
import service.impl.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customer", ""})
public class CustomerServlet extends HttpServlet {
    private ICustomerService iCustomerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "create": {
                String id = request.getParameter("id");
                String ten = request.getParameter("ten");
                String ngaysinh = request.getParameter("ngaysinh");
                String diachi = request.getParameter("diachi");
                String anh = request.getParameter("anh");
                Customer customer  = new Customer(Integer.parseInt(id), ten, ngaysinh, diachi, anh);
                if(iCustomerService.create_Customer(customer)){
                    request.setAttribute("msg", "Thêm mới thành công");
                    List<Customer> customerList = iCustomerService.findAll();
                    request.setAttribute("customerList", customerList);
                    request.getRequestDispatcher("list_customer.jsp").forward(request,response);
                }else {
                    request.setAttribute("msg", "Thêm mới thất bại");

                    request.getRequestDispatcher("create_customer.jsp").forward(request,response);
                }
            }
            case "update": {
                String id = request.getParameter("id");
                String ten = request.getParameter("ten");
                String ngaysinh = request.getParameter("ngaysinh");
                String diachi = request.getParameter("diachi");
                iCustomerService.save(id, ten, ngaysinh, diachi);
                response.sendRedirect("/customer");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                request.getRequestDispatcher("create_customer.jsp").forward(request,response);
            }
            case "update": {
                String id = request.getParameter("id");
                Customer customer = iCustomerService.findById(id);
                request.setAttribute("customer", customer);
                request.getRequestDispatcher("update_customer.jsp").forward(request, response);
            }
            default: {
                List<Customer> customerList = iCustomerService.findAll();
                request.setAttribute("customerList", customerList);
                request.getRequestDispatcher("list_customer.jsp").forward(request, response);
            }
        }
    }
}