package servlet;

import dao.UserDao;
import entity.User;
import utils.SendMail;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        this.doPost(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String mail = request.getParameter("mail");
        String userCaptch = request.getParameter("vercode");


        User registerUser = new User(username,password,mail);


        if(session.getAttribute("captcha") == null || session.getAttribute("captcha").toString().equals(userCaptch)){
            UserDao userDao = new UserDao();
            try {

                userDao.registerUser(registerUser);
                session.setAttribute("user",registerUser);
                session.setAttribute("visitor","false");

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else {
            response.getWriter().write("error");
        }
    }
}
