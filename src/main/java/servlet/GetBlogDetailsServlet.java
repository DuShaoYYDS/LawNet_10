package servlet;

import dao.BlogsDao;
import dao.CommentDao;
import dao.DetailsDao;
import entity.Blog;
import entity.Comment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/getBlogDetailsServlet")
public class GetBlogDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //拿到request中的文章id
        String id = request.getParameter("id");

        //根据id获取博客的详情
        BlogsDao blogsDao = new BlogsDao();

        //修改文章格式测试
        Blog currentBlog = blogsDao.getBlogDetailsByIDConvert(id);
        /*Blog currentBlog = blogsDao.getBlogDetailsByID(id);*/

        //浏览次数加一
        blogsDao.updateViewsById(currentBlog.getId(),currentBlog.getViews() + 1);

        //根据文章id获取该文章的评论
        CommentDao commentDao = new CommentDao();
        List<Comment> comments = commentDao.getCommentByBlogIdParentNull(id);

        //向session中添加文章信息和评论信息
        HttpSession session = request.getSession();
        session.setAttribute("blog",currentBlog);
        session.setAttribute("comments",comments);

        //重定向进入博客详情页面
        response.sendRedirect(request.getContextPath() + "/static/pages/detail.jsp");
    }
}
