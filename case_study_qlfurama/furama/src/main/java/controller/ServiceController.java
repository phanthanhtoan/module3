package controller;

import model.Service;
import service.service.IService;
import service.service.impl.ServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceController", value = {"/services"})
public class ServiceController extends HttpServlet {
    private IService iService = new ServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                createService(request,response);
                break;
        }
    }

    private void createService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int service_id = Integer.parseInt(request.getParameter("service_id"));
        String service_name = request.getParameter("service_name");
        int service_area = Integer.parseInt(request.getParameter("service_area"));
        Double service_cost = Double.valueOf(request.getParameter("service_cost"));
        int service_max_people = Integer.parseInt(request.getParameter("service_max_people"));
        int rent_type_id = Integer.parseInt(request.getParameter("rent_type_id"));
        int service_type_id = Integer.parseInt(request.getParameter("service_type_id"));
        String standard_room = request.getParameter("standard_room");
        String description_other_convenience = request.getParameter("description_other_convenience");
        Double pool_area = Double.valueOf(request.getParameter("pool_area"));
        int number_of_floors = Integer.parseInt(request.getParameter("number_of_floors"));
        Service service = new Service(service_id,service_name, service_area, service_cost, service_max_people, rent_type_id,service_type_id,standard_room, description_other_convenience, pool_area, number_of_floors);
        if (iService.createService(service)){
            request.setAttribute("msg", "Thêm mới thành công");
            List<Service> serviceList = iService.findAll();
            request.setAttribute("serviceList", serviceList);
            request.getRequestDispatcher("service/list_service.jsp").forward(request,response);
        }else {
            request.setAttribute("msg", "Thêm mới thất bại");
            request.getRequestDispatcher("service/create_service.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action ==null){
            action = "";
        }
        switch (action){
            case "create":
                showFormCreateService(request,response);
            default:
                showFormService(request, response);
                break;
        }
    }

    private void showFormCreateService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("service/create_service.jsp").forward(request,response);
    }

    private void showFormService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Service> serviceList =  iService.findAll();
        request.setAttribute("serviceList", serviceList);
        request.getRequestDispatcher("service/list_service.jsp").forward(request,response);
    }
}
