package br.senai.sp.controller;

import java.text.DecimalFormat;

import application.Main;
import br.senai.sp.dao.ContasPagarDAO;
import br.senai.sp.model.AdicionarContasPagar;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert.AlertType;

public class ControllerAdicionarContasPagar {

	@FXML TextField txtDespesa;
	@FXML TextField txtDataVencimento;
	@FXML TextField txtValor;

	ContasPagarDAO dao = ContasPagarDAO.getInstance();

	public void salvar(){
		DecimalFormat dec = new DecimalFormat("###,###,##0.00");

		String despesas = txtDespesa.getText();
		String dataP = txtDataVencimento.getText();
		float valor = Float.parseFloat(txtValor.getText());

		String dd = dataP.substring(0, 2);
		String mm = dataP.substring(3, 5);
		String yyy = dataP.substring(6, 10);

		String vencimento = yyy + "-" + mm + "-" + dd ;

		AdicionarContasPagar CadastrarConta = new AdicionarContasPagar(despesas, vencimento, valor);


		dao.salvarConta(CadastrarConta);

		Alert successInfo = new Alert(AlertType.INFORMATION);
		successInfo.setTitle("Sucesso");
		successInfo.setHeaderText(null);
		successInfo.setContentText("Conta Adicionada com Sucesso!!");

		successInfo.show();
		limpar();
	}


	public void voltar(){
		Main.abrirTela("ContasPagar");
	}

	private void limpar(){
		txtDespesa.setText("");
		txtDataVencimento.setText("");
		txtValor.setText("");
	}

	@FXML
	public void sair() {
		Main.abrirTela("Main");
	}
}
