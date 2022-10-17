package applicazione;

import java.sql.*;

public class ese12 {
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
    			  query.executeQuery("SELECT DatiLavorativi.* , DatiIntervento.* "
    			  		+ "FROM Datilavorativi AS dl JOIN DatiAnagrafici AS da JOIN Macchinario AS m JOIN Partecipazione1 AS p1"
    			  		+ "ON dl.CodiceID = p1.CodiceID2 AND p1.CodiceID1 = m.Progetto AND da.CodiceLavorativo = dl.CodiceID"
    			  		+ "WHERE dl.Tipo = 'ingegnere' AND m.Appartenenza1 IS NOT NULL"
    			  		+ "GROUP BY da.CodiceFiscale;");

    	  while (result.next()){
    		  String codFis = result.getString("codiceFiscale");
    		  String codID = result.getString("codiceID");
    		  System.out.println(codFis+" \t "+codID);
    	  }
       }
      	catch (Exception e){
      		System.out.println("Errore nell'interrogazione");
      }
   }
}