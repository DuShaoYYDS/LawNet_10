package utils;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.alibaba.druid.support.json.JSONUtils;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JdbcUtils {
    public static DataSource dataSource;

    static {
        try {
            //1.加载配置文件
            Properties properties = new Properties();
            properties.load(JdbcUtils.class.getClassLoader().getResourceAsStream("/druid.properties"));
            dataSource = DruidDataSourceFactory.createDataSource(properties);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
    public static void close(Statement statement,Connection connection){
        close(null,statement,connection);
    }
    public static void close(ResultSet resultSet, Statement statement, Connection connection){
        if(resultSet != null){
            try {
                resultSet.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        if(statement != null){
            try {
                statement.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        if(connection != null){
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
    public static DataSource getDataSource(){
        return dataSource;
    }
}
