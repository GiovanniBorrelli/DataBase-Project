package applicazione;

import java.sql.*;

public class es7 {
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
    			  query.executeQuery("INSERT INTO Coinvolgimento1(DataInizio,DataFine,#OreManodopera)"
    			  		+ "VALUES (2021-2-24, 2021-03-20, 25:45)"
    			  		+ "INSERT INTO Coinvolgimento1(CodiceID,#Progressivo,Macchinario)"
    			  		+ "SELECT DatiLavorativi.CodiceID, Intervento.#Progressivo, Intervento.Macchinario"
    			  		+ "FROM DatiLavorativi JOIN Intervento"
    			  		+ "INSERT INTO Coinvolgimento2(DataInizio,DataFine,#OreManodopera)"
    			  		+ "VALUES (2021-2-24, 2021-03-20, 25:45)"
    			  		+ "INSERT INTO Coinvolgimento2(CodiceFiscale,#Progressivo,Macchinario)"
    			  		+ "SELECT DatiAnagrafici.CodiceFiscale,Intervento.#Progressivo,Intervento.Macchinario"
    			  		+ "FROM DatiAnagrafici JOIN Intervento");

    	  while (result.next()){
    		  String oreMan = result.getString("#OreManodopera");
    		  String codiceID = result.getString("codiceID");
    		  System.out.println(oreMan+" \t "+codiceID);
    	  }
       }
      	catch (Exception e){
      		System.out.println("Errore nell'interrogazione");
      }
   }
}