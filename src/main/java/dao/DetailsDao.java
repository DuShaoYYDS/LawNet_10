package dao;

import entity.Blog;
import entity.User;
import utils.JdbcUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DetailsDao {

    public Blog getBlogDetailsByID(String id,User writeUser){
        Blog blog = null;

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = JdbcUtils.getConnection();
            StringBuffer stringBuffer = new StringBuffer("select * from blog,user where blog.id = ? and publishername=username");
            preparedStatement = connection.prepareStatement(stringBuffer.toString());
            preparedStatement.setString(1,id);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                blog = new Blog();
                blog.setId(resultSet.getLong("id"));
                blog.setTitle(resultSet.getString("titel"));
                blog.setContent(resultSet.getString("content"));
                blog.setFlag(resultSet.getString("flag"));
                blog.setViews(resultSet.getInt("views"));
                blog.setAppreciation(resultSet.getInt("appreciation") == 1 ? true : false);
                blog.setShareStatment(resultSet.getInt("share_statment") == 1 ? true : false);
                blog.setCommentabled(resultSet.getInt("commentabled") == 1 ? true : false);
                blog.setPublished(resultSet.getInt("published") == 1 ? true : false);
                blog.setRecommend(resultSet.getInt("recommend") == 1 ? true : false);
                blog.setCreateTime(resultSet.getDate("create_time"));
                blog.setFirstPicture(resultSet.getString("first_picture"));
                blog.setPublisherName(resultSet.getString("publishername"));
                writeUser.setAvatar(resultSet.getString("avatar"));
                writeUser.setUsername(resultSet.getString("username"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtils.close(resultSet,preparedStatement,connection);
        }


        return blog;
    }
}
