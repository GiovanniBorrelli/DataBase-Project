package applicazione;

import java.sql.*;

public class es1 {
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
					query.executeQuery("INSERT INTO cliente "
							+ "(codiceFiscale, nome, cognome, dataNascita, #telefono, #acquisti, residenza)"
							+ "VALUES ('LFNRSO80M11F839C', 'Alfonso', 'Rosa', '1980-08-11', '0828345674', '2', 'GPXNVD')");

			while (result.next()){
				String codFis = result.getString("codFis");
				System.out.println(codFis);

			}	
		}
		catch (Exception e){
			System.out.println("Errore nell'interrogazione");
		}
	}
}