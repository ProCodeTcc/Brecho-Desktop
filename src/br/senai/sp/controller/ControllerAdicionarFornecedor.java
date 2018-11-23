package br.senai.sp.controller;

import application.Main;
import br.senai.sp.dao.FornecedorDAO;
import br.senai.sp.model.AdicionarFornecedor;
import br.senai.sp.model.Fornecedor;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.TextField;
import javafx.scene.text.Text;
import javafx.scene.control.Alert.AlertType;

public class ControllerAdicionarFornecedor {

	@FXML TextField txtFornecedor;
	@FXML TextField txtTelefone;
	@FXML TextField txtCelular;
	@FXML TextField txtEmail;
	@FXML TextField txtCnpj;

	Fornecedor fornecedorAtualizar;

	private boolean atualizacao=false;

	public void initialize(){
		if (fornecedorAtualizar != null){
			txtFornecedor.setText(fornecedorAtualizar.getNome());
			txtTelefone.setText(fornecedorAtualizar.getTelefone());
			txtCelular.setText(fornecedorAtualizar.getCelular());
			txtEmail.setText(fornecedorAtualizar.getEmail());
			txtCnpj.setText(fornecedorAtualizar.getCnpj());
			atualizacao = true;
		}


	}

	FornecedorDAO dao = FornecedorDAO.getInstance();

	@FXML
	public void salvar(){
		if(atualizacao){

			fornecedorAtualizar.setNome(txtFornecedor.getText());
			fornecedorAtualizar.setTelefone(txtTelefone.getText());
			fornecedorAtualizar.setCelular(txtCelular.getText());
			fornecedorAtualizar.setEmail(txtEmail.getText());
			fornecedorAtualizar.setCnpj(txtCnpj.getText());

			dao.atualizar(fornecedorAtualizar);

			Alert successInfo = new Alert(AlertType.INFORMATION);
			successInfo.setTitle("Sucesso");
			successInfo.setHeaderText(null);
			successInfo.setContentText("Fornecedor Editado com Sucesso!!");
			successInfo.show();
			Main.abrirTela("Fornecedor");

		}else{
			String fornecedor = txtFornecedor.getText();
			String telefone = txtTelefone.getText();
			String celular = txtCelular.getText();
			String email = txtEmail.getText();
			String cnpj = txtCnpj.getText();
			AdicionarFornecedor CadastrarFornecedor = new AdicionarFornecedor(fornecedor, telefone, celular, email, cnpj);

			dao.salvarFornecedor(CadastrarFornecedor);

			Alert successInfo = new Alert(AlertType.INFORMATION);
			successInfo.setTitle("Sucesso");
			successInfo.setContentText("Fornecedor Cadastrado com Sucesso!!");
			successInfo.show();
			limpar();

		}
	}

	public void voltar(){
		Main.abrirTela("Fornecedor");
	}

	private void limpar(){
		txtFornecedor.setText("");
		txtTelefone.setText("");
		txtCelular.setText("");
		txtEmail.setText("");
		txtCnpj.setText("");
	}

	@FXML
	public void sair() {
		Main.abrirTela("Main");
	}

}
