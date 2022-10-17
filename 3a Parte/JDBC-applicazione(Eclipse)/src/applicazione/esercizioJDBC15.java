package applicazione;

import java.sql.*;

public class esercizioJDBC15 {
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
					query.executeQuery("SELECT * "
							+ "FROM Cliente AS c JOIN Indirizzo AS i "
							+ "ON c.Residenza = i.CodiceID "
							+ "GROUP BY c.CodiceFiscale");

			while (result.next()){
				String res = result.getString("residenza");
				String numAcquisti = result.getString("#acquisti");
				String codFis = result.getString("codiceFiscale");
				String numTel = result.getString("#telefono");
				System.out.println(codFis+" \t "+numAcquisti+" \t "+res+" \t "+numTel);
			}
		}
		catch (Exception e){
			System.out.println("Errore nell'interrogazione");
		}
	}
}