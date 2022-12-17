package adminServlet;

import dao.BlogsDao;
import entity.Blog;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/adminGetAllBlogs")
public class AdminGetAllBlogs extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        BlogsDao blogsDao = new BlogsDao();
        List<Blog> myBlogs = blogsDao.getAllBlogs();

        session.setAttribute("AllBlogs",myBlogs);

        response.sendRedirect(request.getContextPath() + "/static/admin/blogList.jsp");
    }

}
