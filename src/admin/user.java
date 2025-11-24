/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package admin;

public class user {
    public static int id;   // para acceder desde cualquier parte

    public static void setId(int idUser){
        id = idUser;
    }
    
    public static int getId(){
        return id;
    }
}
