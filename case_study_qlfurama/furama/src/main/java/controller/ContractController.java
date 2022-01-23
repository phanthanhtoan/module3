package controller;

import service.contract.IContractService;
import service.contract.impl.ContractServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ContractController", value = {"/contracts"})
public class ContractController extends HttpServlet {

    private IContractService contractService = new ContractServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "create":
                break;
//            case "edit":
//                break;
//            case "search":
//                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            default:
                showFormCustomer(request,response);
        }
    }

    private void showFormCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher =request.getRequestDispatcher("contract/list_contract.jsp");
        request.setAttribute("contractList", contractService.findAll());
        requestDispatcher.forward(request,response);

    }
}
