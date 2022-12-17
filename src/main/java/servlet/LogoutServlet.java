package servlet;

import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logoutServlet")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse responce) throws ServletException, IOException {
        this.doPost(request, responce);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse responce) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        User user = null;
        session.removeAttribute("user");
        session.setAttribute("visitor","true");
        responce.sendRedirect(request.getContextPath() + "static/pages/index.jsp");
    }
}
