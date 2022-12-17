package servlet;

import dao.BlogsDao;
import entity.Blog;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/editorBlogServlet")
public class EditorBlogServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        BlogsDao blogsDao = new BlogsDao();
        Blog editBlog = blogsDao.getBlogDetailsByID(id);

        session.setAttribute("editBlog",editBlog);
        response.sendRedirect(request.getContextPath() + "/static/admin/blogs-input.jsp");
    }
}
