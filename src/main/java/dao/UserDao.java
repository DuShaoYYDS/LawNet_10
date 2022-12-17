package dao;

import entity.User;
import utils.JdbcUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    public void registerUser(User user) throws SQLException {
        Connection connection = null;

        //头像功能暂时设置固定
        user.setAvatar("https://pic1.imgdb.cn/item/6364d29416f2c2beb17d4f82.jpg");
        PreparedStatement preparedStatement = null;
        try {
            connection = JdbcUtils.getConnection();

            StringBuffer stringBuffer = new StringBuffer(" INSERT INTO user(username,password,email,avatar) VALUES(?,?,?,?) ");
            preparedStatement = connection.prepareStatement(stringBuffer.toString());

            preparedStatement.setString(1,user.getUsername());
            preparedStatement.setString(2,user.getPassword());
            preparedStatement.setString(3,user.getEmail());
            preparedStatement.setString(4,user.getAvatar());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtils.close(null,preparedStatement,connection);
        }
    }
    public User login(String username,String password ){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        User user = null;
        try{
            connection = JdbcUtils.getConnection();
            connection.setAutoCommit(false);

            StringBuffer stringBuffer =  new StringBuffer("SELECT * FROM user WHERE username = ? AND password = ?");
            preparedStatement = connection.prepareStatement(stringBuffer.toString());
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,password);

            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                Long id = resultSet.getLong("id");
                String email = resultSet.getString("email");
                String name = resultSet.getString("username");
                String pwd = resultSet.getString("password");
                String phone = resultSet.getString("phonenum");

                //设置头像
                String avatar = resultSet.getString("avatar");
                if(name.equals(username) && pwd.equals(password)){
                    user = new User(id,username,email);
                    user.setAvatar(avatar);
                }
            }
            connection.commit();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            JdbcUtils.close(resultSet,preparedStatement,connection);
        }
        return user;
    }
}
