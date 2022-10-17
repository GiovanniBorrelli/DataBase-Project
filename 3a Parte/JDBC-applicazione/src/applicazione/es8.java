package applicazione;

import java.sql.*;

public class es8 {
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
    			  query.executeQuery("SELECT DatiLavorativi.CodiceID, COUNT(Coinvolgimento1.CodiceID) AS NumeroMacchinariRiparati"
    			  		+ "FROM Datilavorativi AS dl INNER JOIN Coinvolgimento1 AS c1 on dl.CodiceID = C.CodiceID"
    			  		+ "GROUP BY DatiLavorativi.CodiceID");

    	  while (result.next()){
    		  String numMarRip = result.getString("NumeroMacchinariRiparati");
    		  String codiceID = result.getString("codiceID");
    		  System.out.println(numMarRip+" \t "+codiceID);
    	  }
       }
      	catch (Exception e){
      		System.out.println("Errore nell'interrogazione");
      }
   }
}