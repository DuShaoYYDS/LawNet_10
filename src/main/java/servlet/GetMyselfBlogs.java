package servlet;


import dao.BlogsDao;
import entity.Blog;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/getMyselfBlogs")
public class GetMyselfBlogs extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        BlogsDao blogsDao = new BlogsDao();
        System.out.println(session.getAttribute("user"));
        if(session.getAttribute("user") == null){
            response.sendRedirect(request.getContextPath() + "/static/pages/blog.jsp");
        }
        List<Blog> myBlogs = blogsDao.getMyselfBlogByUsername((User) session.getAttribute("user"));


        session.setAttribute("myBlogs",myBlogs);


        response.sendRedirect(request.getContextPath() + "/static/pages/aboutMyself.jsp");
    }
}
