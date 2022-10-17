package applicazione;

import java.sql.*;

public class ese11 {
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
					query.executeQuery("SELECT DatiLavorativi.* , DatiIntervento.* ,"
							+ "COUNT(coinvolgimento1.CodiceID) AS NumRichiesteSostituzione"
							+ "FROM DatiLavorativi AS dl JOIN DatiAnagrafici AS da JOIN Coinvolgimento1 as c1 JOIN Intervento as i"
							+ "ON da.CodiceLavorativo = dl.CodiceID AND dl.CodiceID = c1.CodiceID AND da.CodiceLavorativo = dl.CodiceID"
							+ "WHERE i.Tipo = 'sostituzione' AND dl.Tipo = 'ingegnere'"
							+ "GROUP BY da.CodiceFiscale;");

			while (result.next()){
				String codID = result.getString("codiceID");
				String numRS = result.getString("NumRichiesteSostituzione");
				String codFis = result.getString("codiceFiscale");
				System.out.println(codFis+" \t "+codID+" \t "+numRS);
			}
		}
		catch (Exception e){
			System.out.println("Errore nell'interrogazione");
		}
	}
}
