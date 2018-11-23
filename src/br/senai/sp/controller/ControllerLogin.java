package br.senai.sp.controller;

import br.senai.sp.dao.MainDAO;
import br.senai.sp.model.Login;
import javafx.fxml.FXML;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;

public class ControllerLogin {

	@FXML TextField txtUsuario;
	@FXML PasswordField txtSenha;

	MainDAO dao = MainDAO.getInstance();

	@FXML
	public void Autenticar(){
		String login = txtUsuario.getText();
		String senha = txtSenha.getText();

		Login Autenticar = new Login(login, senha);

		dao.autenticar(Autenticar);

	}
}
