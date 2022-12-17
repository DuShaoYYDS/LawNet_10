package dao;

import entity.Comment;
import utils.JdbcUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentDao {

    public void saveComment(Comment comment){
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Connection connection = null;

        try {
            connection = JdbcUtils.getConnection();
            //保存评论
            StringBuffer stringBuffer = new StringBuffer("insert into comment(email,content,avatar,create_time,username,blog_id,parent_id) values(?,?,?,?,?,?,?)");
            preparedStatement =connection.prepareStatement(stringBuffer.toString());
            preparedStatement.setString(1,comment.getEmail());
            preparedStatement.setString(2,comment.getContent());
            preparedStatement.setString(3, comment.getAvatar());
            Date date = new Date(comment.getCreateTime().getTime());
            preparedStatement.setDate(4,date);
            preparedStatement.setString(5,comment.getUsername());
            preparedStatement.setLong(6,comment.getBlog_id());
            preparedStatement.setLong(7,comment.getParent_id());


            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtils.close(resultSet,preparedStatement,connection);
        }
    }

    public List<Comment> getAllComment(){

        List<Comment> comments = new ArrayList<>();

        PreparedStatement preparedStatement = null;
        Connection connection = null;
        ResultSet resultSet = null;

        try {
            connection = JdbcUtils.getConnection();
            connection.setAutoCommit(false);


            StringBuffer stringBuffer = new StringBuffer("select * from comment");

            preparedStatement = connection.prepareStatement(stringBuffer.toString());
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                Comment comment = new Comment();
                comment.setId(resultSet.getLong("id"));
                comment.setEmail(resultSet.getString("email"));
                comment.setContent(resultSet.getString("content"));
                comment.setCreateTime(resultSet.getDate("create_time"));
                comment.setUsername(resultSet.getString("username"));
                comments.add(comment);
            }
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            JdbcUtils.close(resultSet,preparedStatement,connection);
        }
        return comments;
    }

    public List<Comment> getCommentByBlogId(String id){
        List<Comment> comments = new ArrayList<>();

        PreparedStatement preparedStatement = null;
        Connection connection = null;
        ResultSet resultSet = null;

        try {
            connection = JdbcUtils.getConnection();
            connection.setAutoCommit(false);


            StringBuffer stringBuffer = new StringBuffer("select * from comment where blog_id = ? and parent_id != 0");

            preparedStatement = connection.prepareStatement(stringBuffer.toString());
            preparedStatement.setString(1,id);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                Comment comment = new Comment();
                comment.setId(resultSet.getLong("id"));
                comment.setEmail(resultSet.getString("email"));
                comment.setAvatar(resultSet.getString("avatar"));
                comment.setContent(resultSet.getString("content"));
                comment.setCreateTime(resultSet.getDate("create_time"));
                comment.setUsername(resultSet.getString("username"));
                comment.setBlog_id(resultSet.getLong("blog_id"));
                comment.setParent_id(resultSet.getLong("parent_id"));
                comments.add(comment);
            }

            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            JdbcUtils.close(resultSet,preparedStatement,connection);
        }



        return comments;
    }
    public List<Comment> getCommentByBlogIdParentNull(String id){
        List<Comment> comments = new ArrayList<>();

        PreparedStatement preparedStatement = null;
        Connection connection = null;
        ResultSet resultSet = null;

        try {
            connection = JdbcUtils.getConnection();
            connection.setAutoCommit(false);


            StringBuffer stringBuffer = new StringBuffer("select * from comment where blog_id = ? and parent_id = 0");

            preparedStatement = connection.prepareStatement(stringBuffer.toString());
            preparedStatement.setString(1,id);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                Comment comment = new Comment();
                comment.setId(resultSet.getLong("id"));
                comment.setEmail(resultSet.getString("email"));
                comment.setAvatar(resultSet.getString("avatar"));
                comment.setContent(resultSet.getString("content"));
                comment.setCreateTime(resultSet.getDate("create_time"));
                comment.setUsername(resultSet.getString("username"));
                comment.setBlog_id(resultSet.getLong("blog_id"));
                comment.setParent_id(resultSet.getLong("parent_id"));
                comments.add(comment);
            }
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            JdbcUtils.close(resultSet,preparedStatement,connection);
        }


        List<Comment> allComments = getCommentByBlogId(id);


        for(int i = 0; i < comments.size(); i++){

            List<Comment> allReplyComment = help(allComments,comments.get(i).getId(),0,comments.get(i));

            comments.get(i).setReplyComments(allReplyComment);;
        }



        /*
        *       commentList
        * 临时保存comments中的所有信息
        * 避免在执行eachComment()函数的时候造成数据变化不可控
        *
        * */
        commentList.addAll(comments);
        for(int i = 0; i < commentList.size(); i++){
            if(comments.get(i).getReplyComments() != null){
                for(int j = 0; j < commentList.get(i).getReplyComments().size(); j++){
                    eachComment(comments.get(i),commentList.get(i).getReplyComments().get(j).getReplyComments());
                }
            }
        }


        /*for(int i = 0; i < comments.size(); i++){
            help2(comments.get(i));
        }*/
        return comments;
    }


    /*
    * @ 测试使用
    * */
    private void help2(Comment comment) {
        System.out.println(comment.getContent());
        if(comment.getReplyComments() == null) return;
        for(int i = 0; i < comment.getReplyComments().size(); i++){
            help2(comment.getReplyComments().get(i));
        }
        System.out.println("-------------------------");
    }


    /*
    *                   递归
    * 将所有的评论顺序化，子评论按照子父类关系放入comments中
    * comments中只存放第一级别的评论
    *
    * */
    private List<Comment> help(List<Comment> allComments,Long parent_id,int i,Comment parentComment){
        List<Comment> ans = new ArrayList<>();
        if(++i >= allComments.size()) return  null;

        for(int j = 0; j < allComments.size(); j++){
            if(allComments.get(j).getParent_id() == parent_id){
                allComments.get(j).setParentComment(parentComment);
                ans.add(allComments.get(j));
            }
        }
        List<Comment> allReplyComment = help(allComments,allComments.get(i).getId(),i,allComments.get(i));
        allComments.get(i).setReplyComments(allReplyComment);
        return ans;
    }


    /*
    *                     递归
    * 将所有的子评论的子评论...
    * 都提取出来放入父评论的replyComments中
    * 方便前端页面展示
    *
    * */


    /*
    *     commentList变量用于临时存储comments中的数据，避免造成comments中的数据改变导致不可控因素
    *
    * */
    private List<Comment> commentList = new ArrayList<>();
    private void eachComment(Comment comment,List<Comment> currentComment){

        if(currentComment == null) return;

        for(int j = 0; j < currentComment.size(); j++){

            comment.getReplyComments().add(currentComment.get(j));

            eachComment(comment,currentComment.get(j).getReplyComments());

        }
    }
}
