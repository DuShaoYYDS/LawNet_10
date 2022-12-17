package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/getNextBlogsServlet")
public class GetNextBlogsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int start = (int) session.getAttribute("start");
        if(start + 4 >= (int)session.getAttribute("blogSize")) {
            resp.sendRedirect(req.getContextPath() + "/static/pages/blog.jsp");
            return;
        }
        session.setAttribute("start",start + 4);
        resp.sendRedirect(req.getContextPath() + "/static/pages/blog.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
