package br.senai.sp.controller;

import java.awt.Button;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Optional;

import application.Main;
import br.senai.sp.banco.Conexao;
import br.senai.sp.dao.FornecedorDAO;
import br.senai.sp.model.AdicionarFornecedor;
import br.senai.sp.model.Fornecedor;
import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.ButtonType;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.cell.PropertyValueFactory;

public class ControllerVisualizarFornecedor {

	@FXML TableView tblFornecedor;
	@FXML TableColumn colunId;
	@FXML TableColumn colunFornecedor;
	@FXML TableColumn colunTelefone;
	@FXML TableColumn colunCelular;
	@FXML TableColumn colunEmail;
	@FXML TableColumn colunCnpj;

	FornecedorDAO dao = FornecedorDAO.getInstance();

	public void initialize(){

		colunId.setCellValueFactory(new PropertyValueFactory<Fornecedor, Integer>("id"));
		colunFornecedor.setCellValueFactory(new PropertyValueFactory<Fornecedor, String>("nome"));
		colunTelefone.setCellValueFactory(new PropertyValueFactory<Fornecedor,String>("telefone"));
		colunCelular.setCellValueFactory(new PropertyValueFactory<Fornecedor,String>("celular"));
		colunEmail.setCellValueFactory(new PropertyValueFactory<Fornecedor,String>("email"));
		colunCnpj.setCellValueFactory(new PropertyValueFactory<Fornecedor,String>("cnpj"));

		tblFornecedor.setItems(FXCollections.observableArrayList(dao.selectAll()));

	}

	public void deletar(){

		Alert alert =new Alert(AlertType.CONFIRMATION);
		alert.setTitle("Confirmação de Exclusão");
		alert.setHeaderText("Deseja Excluir Este Fornecedor ?");
		alert.setContentText("Ao confirmar este fornecedor será apagado");

		Optional<ButtonType> result = alert.showAndWait();
		if(result.get()==ButtonType.OK){

			Fornecedor fornecedor = (Fornecedor)tblFornecedor.getSelectionModel().getSelectedItem();
			if(fornecedor == null){
				Alert erroInfo = new Alert(AlertType.ERROR);
				erroInfo.setTitle("Erro");
				erroInfo.setHeaderText("Fornecedor Não Selecionado");
				erroInfo.setContentText("Selecione Um Fornecedor Para Excluir");
				erroInfo.show();
			}else{
				dao.deletar(fornecedor.getId());
				Main.abrirTela("Fornecedor");
			}
		}else{

		}
	}

	@FXML
	public void atualizar(){

		Fornecedor f = (Fornecedor)tblFornecedor.getSelectionModel().getSelectedItem();

		if(f == null){
			Alert erroInfo = new Alert(AlertType.ERROR);
			erroInfo.setTitle("Erro");
			erroInfo.setHeaderText("Fornecedor Não Selecionado");
			erroInfo.setContentText("Selecione Um Fornecedor Para Editar");
			erroInfo.show();
		}else{
			ControllerAdicionarFornecedor controller = new ControllerAdicionarFornecedor();
			controller.fornecedorAtualizar = f;

			Main.abrirTela("EditarFornecedor", controller);

		}


		}

	@FXML
	public void voltar(){
		Main.abrirTela("Menu");
	}

	@FXML
	public void Adicionar(){
		Main.abrirTela("AdicionarFornecedor");
	}

	@FXML
	public void sair() {
		Main.abrirTela("Main");
	}
}
