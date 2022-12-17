package servlet;

import dao.CommentDao;
import entity.Comment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/getCommentByBlogId")
public class GetCommentByBlogId extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");


        CommentDao commentDao = new CommentDao();
        List<Comment> comments = commentDao.getCommentByBlogIdParentNull(id);

        //向session中添加文章信息和评论信息
        HttpSession session = request.getSession();
        session.setAttribute("comments",comments);

    }
}
