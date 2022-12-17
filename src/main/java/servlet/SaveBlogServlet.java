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
import java.util.Date;

@WebServlet("/saveBlogServlet")
public class SaveBlogServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");

        BlogsDao blogsDao = new BlogsDao();

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String flag = null;

        if(request.getParameter("flag.id").equals("1")){
            flag = "原创";
        }else if(request.getParameter("flag.id").equals("2")){
            flag = "转载";
        }else if(request.getParameter("flag.id").equals("3")){
            flag = "翻译";
        }

        Long type_id = Long.valueOf(Integer.valueOf(request.getParameter("type.id")));

        /**
         * 后期封装tags
         */

        String indexPicture = request.getParameter("indexPicture");

        //是否推荐
        boolean recommend = false;

        boolean shareStatment = false;
        //评论开关
        boolean commentabled = false;
        //是否公开展示
        boolean published = false;
        boolean appreciation = false;

        Date currentDate = new Date();

        Blog blog = new Blog();
        blog.setContent(content);
        blog.setViews(0);
        blog.setCommentabled(commentabled);
        blog.setRecommend(recommend);
        blog.setCreateTime(currentDate);
        blog.setShareStatment(shareStatment);
        blog.setPublished(published);
        blog.setPublisherName(user.getUsername());
        blog.setTitle(title);
        blog.setFlag(flag);
        blog.setFirstPicture(indexPicture);
        blog.setAppreciation(appreciation);
        blog.setUpdateTime(currentDate);
        blog.setTypeID(type_id);

        Blog targetBlog = (Blog)session.getAttribute("editBlog");

        if(session.getAttribute("editBlog") == null){
            blogsDao.creatNewBlogByUser(blog);
        }else if(session.getAttribute("editBlog") != null){
            blogsDao.updateBlog(blog,targetBlog.getId());
        }
    }
}
