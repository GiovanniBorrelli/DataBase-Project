package applicazione;

import java.sql.*;

public class es2 {
   public static void main(String[] arg){
      Connection con = null ;
      try {
          Class.forName("com.mysql.cj.jdbc.Driver");

          String url = "jdbc:mysql://localhost:3306/applicazione";
          String username = "root"; String pwd = "Secret0.";
          con = DriverManager.getConnection(url,username,pwd);
          }
      catch(Exception e){
        System.out.println("Connessione fallita");
         }
      try {
    	  Statement query = con.createStatement();
    	  ResultSet result =
    			  query.executeQuery("INSERT INTO Macchinario(Cliente) "
    					  + "SELECT Cliente.CodiceID"
    					  + "FROM Cliente JOIN Macchinario;"
    					  + "UPDATE Cliente"
    					  + "SET #Acquisti = #Acquisti + 1"
    					  + "FROM Macchinario JOIN Cliente"
    					  + "WHERE Macchinario.Cliente = Cliente.CodiceID");

    	  while (result.next()){
    		  String codFis = result.getString("codiceFiscale");
    		  String codSer = result.getString("codiceSeriale");
    		  System.out.println(codFis+" \t "+codSer);
    	  }
       }
      	catch (Exception e){
      		System.out.println("Errore nell'interrogazione");
      }
   }
}