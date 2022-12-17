package servlet;

import entity.User;
import utils.SendMail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Random;

@WebServlet("/sendMailServlet")
public class SendMailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");


        String username = request.getParameter("username");
        String mail = request.getParameter("mail");


        User registerUser = new User(username,mail);


        System.out.println(mail);
        Random random = new Random();

        //保存验证码，发回前端进行校验
        int captcha =  random.nextInt(9000) + 1000;

        SendMail sendMail = new SendMail(registerUser,captcha);
        HttpSession session = request.getSession();
        session.setAttribute("captcha",captcha);
        sendMail.start();
    }
}
