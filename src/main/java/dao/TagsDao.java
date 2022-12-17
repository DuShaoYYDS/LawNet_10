package dao;

import entity.Tag;
import utils.JdbcUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TagsDao {
    public List<Tag> getAllTags(){

        List<Tag> tags = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        Connection connection = null;
        ResultSet resultSet = null;

        try {
            connection = JdbcUtils.getConnection();
            connection.setAutoCommit(false);
            StringBuffer stringBuffer = new StringBuffer("select id,name,count from tag");
            preparedStatement = connection.prepareStatement(stringBuffer.toString());

            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                Tag tag = new Tag();
                tag.setName(resultSet.getString("name"));
                tag.setId(resultSet.getLong("id"));
                tag.setCount(resultSet.getInt("count"));
                tags.add(tag);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtils.close(resultSet,preparedStatement,connection);
        }
        return tags;
    }
}
