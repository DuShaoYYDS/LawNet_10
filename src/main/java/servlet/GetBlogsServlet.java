package servlet;

import dao.BlogsDao;
import dao.TagsDao;
import dao.TypesDao;
import entity.Blog;
import entity.Tag;
import entity.Type;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/getBlogsServlet")
public class GetBlogsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();

        //获取博客列表
        BlogsDao blogsDao = new BlogsDao();
        List<Blog> blogs = blogsDao.getAllPublishedBlogs();

        session.setAttribute("blogs",blogs);

        //数据库获取tags
        TagsDao tagsDao = new TagsDao();
        List<Tag> tags = tagsDao.getAllTags();
        session.setAttribute("tags",tags);


        //从数据库中获取types
        TypesDao typesDao = new TypesDao();
        List<Type> types = typesDao.getAllTypes();
        session.setAttribute("types",types);
        session.setAttribute("start",0);
        session.setAttribute("blogSize",blogs.size());
        //重定向进入博客列表页面
        response.sendRedirect(request.getContextPath() + "/static/pages/blog.jsp");
    }
}
