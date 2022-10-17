package applicazione;

import java.sql.*;

public class es3 {
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
    			  query.executeQuery("INSERT INTO Macchinario(Corriere) "
    			  		+ "SELECT Corriere.Consegna"
    			  		+ "FROM Corriere JOIN Macchinario;"
    			  		+ "SELECT Indirizzo.* "
    			  		+ "FROM Indirizzo AS i JOIN Cliente AS c JOIN Macchinario AS m"
    			  		+ "WHERE i.CodiceID = c.Residenza AND c.CodiceFiscale = m.Cliente"
    			  		+ "GROUP BY c.CodiceFiscale;");

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