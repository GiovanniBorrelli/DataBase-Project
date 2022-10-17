package applicazione;

import java.sql.*;

public class es4 {
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
    			  query.executeQuery("INSERT INTO Macchinario(CodiceFiscale) "
    			  		+ "SELECT Cliente.CodiceID"
    			  		+ "FROM Macchinario JOIN Cliente"
    			  		+ "WHERE Macchinario.Appartenenza2 IS NOT NULL;"
    			  		+ "UPDATE Cliente"
    			  		+ "SET #Acquisti = #Acquisti + 1"
    			  		+ "FROM Cliente JOIN Macchinario"
    			  		+ "WHERE Macchinario.CodiceFiscale = Cliente.CodiceID");

    	  while (result.next()){
    		  String codFis = result.getString("codiceFiscale");
    		  String codSer = result.getString("codiceSeriale");
    		  String app2 = result.getString("appartenenza2");
    		  System.out.println(codFis+" \t "+codSer+" \t "+app2);
    	  }
       }
      	catch (Exception e){
      		System.out.println("Errore nell'interrogazione");
      }
   }
}