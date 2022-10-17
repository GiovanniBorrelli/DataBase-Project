package applicazione;

import java.sql.*;

public class es6 {
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
    			  query.executeQuery("SELECT DatiLavorativi.CodiceID, Tipo, COUNT(Coinvolgimento1.CodiceID) AS NumIntervento"
    			  		+ "FROM DatiLavorativi AS dl INNER JOIN Coinvolgimento1 as c1"
    			  		+ "on dl.codiceID = c1.codiceID"
    			  		+ "WHERE Tipo = 'Operaio'"
    			  		+ "GROUP BY DatiLavorativi.CodiceID"
    			  		+ "HAVING COUNT(Coinvolgimento1.CodiceID) < 3");

    	  while (result.next()){
    		  String codFis = result.getString("codiceFiscale");
    		  String codiceID = result.getString("codiceID");
    		  System.out.println(codFis+" \t "+codiceID);
    	  }
       }
      	catch (Exception e){
      		System.out.println("Errore nell'interrogazione");
      }
   }
}