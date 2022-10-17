package applicazione;

import java.sql.*;

public class ese10 {
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
    			  query.executeQuery("SELECT * "
    			  		+ "FROM Macchinario AS m JOIN Intervento AS i"
    			  		+ "EXCEPT"
    			  		+ "SELECT * "
    			  		+ "FROM Macchinario AS m JOIN Intervento AS i "
    			  		+ "WHERE m.CodiceSeriale = i.Macchinario AND i.Tipo = 'manutenzione'");

    	  while (result.next()){
    		  String codSer = result.getString("codiceSeriale");
    		  System.out.println(codSer);
    	  }
       }
      	catch (Exception e){
      		System.out.println("Errore nell'interrogazione");
      }
   }
}