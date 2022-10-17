package applicazione;

import java.sql.*;

public class es5 {
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
    			  query.executeQuery("INSERT INTO Intervento(Macchinario)"
    			  		+ "SELECT Macchinario.CodiceSeriale"
    			  		+ "FROM Intervento JOIN Macchinario"
    			  		+ "WHERE Macchinario.Corriere IS NULL AND Macchinario.CodiceFiscale IS NOT NULL"			  		
    			  		+ "INSERT INTO Intervento(DataArrivo)"
    			  		+ "VALUES(2022-01-01)"
    			  		+ "FROM Intervento JOIN Macchinario"
    			  		+ "WHERE Macchinario.Corriere IS NULL AND Macchinario.CodiceFiscale IS NOT NULL"   		
    			  		+ "UPDATE Intervento"
    			  		+ "SET StatoIntervento = 'in lavorazione'"
    			  		+ "SET Tipo = 'manutenzione'"
    			  		+ "FROM Intervento JOIN Macchinario"
    			  		+ "WHERE Macchinario.Corriere IS NULL AND Macchinario.CodiceFiscale IS NOT NULL");

    	  while (result.next()){
    		  String codSer = result.getString("codiceSeriale");
    		  String macch = result.getString("macchinario");
    		  System.out.println(codSer+" \t "+macch);
    	  }
       }
      	catch (Exception e){
      		System.out.println("Errore nell'interrogazione");
      }
   }
}