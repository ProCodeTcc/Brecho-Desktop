package br.senai.sp.banco;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.swing.JOptionPane;

public class Conexao {
	private static Connection con = null;

	public static Connection getConexao(){

		try {
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/brecho","root","bcd127");
		}catch (SQLException e){
			e.printStackTrace();
		}
		return con;
	}
	public static void fecharConexao(){
		try {
			con.close();
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "Ocorreu um erro durante a tentativa de fechamento do banco de dados, contate o administrador do sistema.", "Erro", JOptionPane.ERROR_MESSAGE );
			e.printStackTrace();
		}
	}
}
