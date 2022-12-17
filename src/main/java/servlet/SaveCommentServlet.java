package servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.CommentDao;
import entity.Comment;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

@WebServlet("/saveCommentServlet")
public class SaveCommentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        Long blog_id = Long.valueOf(request.getParameter("id"));
        User user = (User) session.getAttribute("user");
        //获取用户的新增评论
        String content = request.getParameter("com-cont");
        String username = user.getUsername();
        String email = user.getEmail();
        String avatar = user.getAvatar();

        Long parent_id = Long.valueOf(String.valueOf(request.getParameter("parent_id") == null ? 0 : request.getParameter("parent_id")));

        Date date = new Date();

        Comment comment = new Comment();
        comment.setContent(content);
        comment.setAvatar(avatar);
        comment.setUsername(username);
        comment.setBlog_id(blog_id);
        comment.setParent_id(parent_id);
        comment.setCreateTime(date);
        comment.setEmail(email);

        //将评论保存进数据库
        CommentDao commentDao = new CommentDao();
        commentDao.saveComment(comment);

        /*List<Comment> comments = (List<Comment>) session.getAttribute("comments");*/

        ObjectMapper objectMapper = new ObjectMapper();
        String str = objectMapper.writeValueAsString(comment);
        System.out.println(str);

        response.getWriter().write(str);

        //服务器重定向进入博客详情页面
        /*response.sendRedirect(request.getContextPath() + "/static/pages/detail.jsp");*/
    }
}
