package applicazione;

import java.sql.*;

public class ese13 {
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
					query.executeQuery("SELECT CategoriaAccessoria.* , COUNT(Appartenenza2) AS NumMacchBaseAssociati"
							+ "FROM CategoriaAccessoria as ca JOIN Macchinario AS m"
							+ "ON m.Appartenenza2 = ca.Nome"
							+ "WHERE m.Appartenenza2 IS NOT NULL"
							+ "GROUP BY ca.Nome;");

			while (result.next()){
				String nome = result.getString("nome");
				String desUso = result.getString("destinazioneUso");
				String numBA = result.getString("NumMacchBaseAssociati");
				System.out.println(nome+" \t "+desUso+" \t "+numBA);
			}
		}
		catch (Exception e){
			System.out.println("Errore nell'interrogazione");
		}
	}
}
