package br.senai.sp.controller;

import application.Main;
import javafx.fxml.FXML;

public class ControllerMenu{

	@FXML
	public void sair() {
		Main.abrirTela("Main");
	}

	@FXML
	public void abrirCompras() {

		Main.abrirTela("Compras");

	}

	@FXML
	public void abrirCPagar(){

		Main.abrirTela("ContasPagar");

	}

	@FXML
	public void abrirCReceber(){

		Main.abrirTela("ContasReceber");

	}

	@FXML
	public void abrirFCaixa(){

		Main.abrirTela("FluxoCaixa");
	}

	@FXML
	public void abrirCBancaria(){

		Main.abrirTela("ConciliacaoBancaria");

	}

	@FXML
	public void abrirFornecedor(){

		Main.abrirTela("Fornecedor");

	}


}

