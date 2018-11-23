package br.senai.sp.controller;

import application.Main;
import br.senai.sp.dao.ContasPagarDAO;
import br.senai.sp.model.ContasPagar;
import br.senai.sp.model.Fornecedor;
import javafx.collections.FXCollections;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

public class ControllerVisualizarContasPagar {

	@FXML TableView tblContas;
	@FXML TableColumn colunId;
	@FXML TableColumn colunNome;
	@FXML TableColumn colunData;
	@FXML TableColumn colunValor;
	@FXML TableColumn colunBaixa;

	ContasPagarDAO dao = ContasPagarDAO.getInstance();

	public void initialize(){

		colunId.setCellValueFactory(new PropertyValueFactory<ContasPagar, Integer>("id"));
		colunNome.setCellValueFactory(new PropertyValueFactory<ContasPagar, String>("nome"));
		colunData.setCellValueFactory(new PropertyValueFactory<ContasPagar, String>("vencimento"));
		colunValor.setCellValueFactory(new PropertyValueFactory<ContasPagar, String>("valor"));

		tblContas.setItems(FXCollections.observableArrayList(dao.selectAll()));
	}

	public void voltar(){
		Main.abrirTela("Menu");
	}

	public void Adicionar(){
		Main.abrirTela("AdicionarContasPagar");
	}

	public void Baixa(){

		Main.abrirTela("BaixaContasPagar");
	}

	@FXML
	public void sair() {
		Main.abrirTela("Main");
	}

}
