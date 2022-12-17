package dao;

import entity.Type;
import utils.JdbcUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TypesDao {

    public List<Type> getAllTypes(){
        List<Type> types = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = JdbcUtils.getConnection();
            StringBuffer stringBuffer = new StringBuffer("select id,name,count from type");
            preparedStatement = connection.prepareStatement(stringBuffer.toString());
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                Type type = new Type();
                type.setId(resultSet.getLong("id"));
                type.setName(resultSet.getString("name"));
                type.setCount(resultSet.getInt("count"));
                types.add(type);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            JdbcUtils.close(resultSet,preparedStatement,connection);
        }
        return types;
    }


}
