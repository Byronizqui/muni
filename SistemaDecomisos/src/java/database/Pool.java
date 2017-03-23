/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import oracle.jdbc.pool.OracleDataSource;
import oracle.jdbc.pool.OracleConnectionCacheManager;

import java.util.Properties;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class Pool {

    /**
     * private constructor for static class
     */
    public static java.sql.Connection conn;
    private Pool() {
    }


    public static Connection getConnection() throws SQLException {
        try {
            javax.naming.InitialContext ctx = new InitialContext();
            javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("jdbc/muni_pool");
            conn = ds.getConnection();
        } catch (NamingException ex) {
            Logger.getLogger(Pool.class.getName()).log(Level.SEVERE, null, ex);
            conn = null;
        }
        return conn;
    }

    public static void closePooledConnections() throws SQLException {
        if (conn != null){
            conn.close();
        }
    }

}
