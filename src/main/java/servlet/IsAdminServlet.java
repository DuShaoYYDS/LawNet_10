package servlet;

import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/isAdminServlet")
public class IsAdminServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if(user.getId() <= 10){
            response.sendRedirect(request.getContextPath() + "/static/admin/blogs-input.jsp");
        }else{
            session.setAttribute("error","非超级管理员静止进入");
        }
    }
}
