package applicazione;

import java.sql.*;

public class ese14 {
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
					query.executeQuery("SELECT DatiLavorativi.* , DatiAnagrafici.* , Coinvolgimento1.#OreManodopera "
							+ "FROM DatiLavorativi AS dl JOIN DatiAnagrafici AS da JOIN Coinvolgimento1 AS c1 "
							+ "ON c1.CodiceID = dl.CodiceID AND da.CodiceLavorativo = dl.CodiceID "
							+ "WHERE dl.Tipo = 'ingegnere' GROUP BY da.CodiceFiscale;");

			while (result.next()){
				String codID = result.getString("codiceID");
				String codFis = result.getString("codiceFiscale");
				String NumOreM = result.getString("#OreManodopera");
				System.out.println(codID+" \t "+codFis+" \t "+NumOreM);
			}
		}
		catch (Exception e){
			System.out.println("Errore nell'interrogazione");
		}
	}
}
