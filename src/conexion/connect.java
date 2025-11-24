/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conexion;
import java.sql.*;
import javax.swing.JOptionPane;
/**
 *
 * @author bryan
 */
public class connect {
    Connection con = null;
    String user = "root", psw="", bd="aputs_db", ip="localhost", port="3306";
    String chain = "jdbc:mysql://" + ip + ":" + port + "/" + bd;
    public Connection  connect(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(chain, user, psw);
            JOptionPane.showMessageDialog(null, "connected");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "not connected: " + e.toString());
        }
        return con;
    }
    
    public void disconnect(){
        try {
            if (con!= null && !con.isClosed()) {
                con.close();
                JOptionPane.showMessageDialog(null, "Closed");
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Not closed. " + e.toString());
        }
    }
}
