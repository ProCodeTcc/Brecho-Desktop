package br.senai.sp.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import application.Main;
import br.senai.sp.banco.Conexao;
import br.senai.sp.model.Login;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;

public class MainDAO {

	public static MainDAO instance;

	public void autenticar(Login autenticar){
		String sql = "SELECT * FROM usuariocms WHERE login= ? AND senha= ? ";

			PreparedStatement stm;
			try {
				stm = Conexao.getConexao().prepareStatement(sql);
				stm.setString(1, autenticar.setLogin());
				stm.setString(2, autenticar.setSenha());

				ResultSet rs = stm.executeQuery();
				if(rs.next()){
					Main.abrirTela("Menu");
					Conexao.fecharConexao();
				}else{
					Alert aletInfo = new Alert(AlertType.ERROR);
					aletInfo.setTitle(null);
					aletInfo.setContentText("Nome de usuário ou senha incorretos");
					aletInfo.show();

					Conexao.fecharConexao();
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
}

	public static MainDAO getInstance(){
		if(instance == null)
			instance = new MainDAO();

		return instance;
	}
	}



