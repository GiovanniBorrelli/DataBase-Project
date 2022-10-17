package applicazione;

import java.sql.*;

public class es9 {
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
    			  query.executeQuery("SELECT CodiceSeriale"
    			  		+ "FROM Macchinario"
    			  		+ "WHERE Corriere IS NOT NULL"
    			  		+ "UNION\r\n"
    			  		+ "SELECT CodiceSeriale"
    			  		+ "FROM Macchinario AS m INNER JOIN Intervento as i"
    			  		+ "ON i.Macchinario = m.CodiceSeriale"
    			  		+ "WHERE i.StatoIntervento = 'in lavorazione' AND i.Tipo = 'manutenzione'");

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