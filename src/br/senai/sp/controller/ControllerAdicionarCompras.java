package br.senai.sp.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import application.Main;
import br.senai.sp.dao.ComprasDAO;
import br.senai.sp.model.AdicionarCompras;
import br.senai.sp.model.AdicionarDuplicataPagar;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert.AlertType;

public class ControllerAdicionarCompras {

	@FXML TextField txtTitulo;
	@FXML TextField txtPreco;
	@FXML TextField txtDataVencimento;
	@FXML ComboBox cbFornecedor;
	@FXML TextField txtQtd;
	@FXML TextArea txtDescricao;

	ComprasDAO dao = ComprasDAO.getInstance();

	int nd = 1;

	@FXML
	public void salvar(){
		String titulo = txtTitulo.getText();
		String dataP = txtDataVencimento.getText() ;
		String descricao = txtDescricao.getText();
		float valor = Float.parseFloat(txtPreco.getText());
		String data = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		int parcela = Integer.parseInt(txtQtd.getText());
		int id1 = 0 ;

		String dd = dataP.substring(0, 2);
		String mm = dataP.substring(3, 5);
		String yyy = dataP.substring(6, 10);

		String vencimento = yyy + "-" + mm + "-" + dd ;

		AdicionarCompras CadastrarCompra = new AdicionarCompras(titulo, vencimento, descricao, valor,data,parcela);
		dao.salvarCompra(CadastrarCompra);

		String dtVencimento = vencimento;
		DecimalFormat forma = new DecimalFormat("00");

		while (nd <= parcela){
			int vencida = 0;
			int status = 0;
			String dtPagamento = "0000-00-00";
			float valorReal = valor/parcela;
			int idConta = 1;

			String yyyM = dtVencimento.substring(0, 4);
			String mmM = dtVencimento.substring(5, 7);
			String ddM = dtVencimento.substring(8, 10);

			int novoddM = Integer.parseInt(ddM);
			int novommM = Integer.parseInt(mmM);
			int novoyyyM = Integer.parseInt(yyyM);


			if(nd == 1){
				dtVencimento = vencimento;
				nd++;
			}else{
				if(novommM == 2){
					novoddM = novoddM + 30;
					String dia = forma.format(novoddM - 28);
					String mes = forma.format(novommM + 1);

					dtVencimento = novoyyyM + "-" + mes + "-" + dia ;
				}else if (novommM == 04 || novommM == 06 || novommM == 9 || novommM == 11){

					novoddM = novoddM + 30;

					String dia = forma.format(novoddM - 30);
					String mes =forma.format(novommM + 1);

					dtVencimento = novoyyyM + "-" + mes + "-" + dia ;

				}else if(novommM == 01 || novommM == 03 || novommM == 05 || novommM == 07 || novommM == 8 || novommM == 10){
					if(novoddM != 01){
						novoddM = novoddM + 30;
						String dia = forma.format(novoddM - 31);
						String mes = forma.format(novommM + 1);
						dtVencimento = novoyyyM + "-" + mes + "-" + dia ;

					}else{
						String dia = forma.format(novoddM);
						String mes = forma.format(novommM + 30);
						dtVencimento = novoyyyM + "-" + mes + "-" + dia ;
					}

				}else if(novommM == 12) {
					if(novoddM != 01 || novoddM != 1){
						novoddM = novoddM + 30;
						String dia = forma.format(novoddM - 31);
						String mes = forma.format(01);
						int ano =  novoyyyM + 1;
						dtVencimento = ano + "-" + mes + "-" + dia ;
					}else{
						String dia = forma.format(novoddM);
						dtVencimento = novoyyyM + "-" + novommM + "-" + dia ;
					}
				}

				nd = nd + 1;
			}

			AdicionarDuplicataPagar CadastrarDuplicataPagar = new AdicionarDuplicataPagar(vencida, status, dtPagamento, valorReal, dtVencimento, idConta);
			dao.salvarDuplicataPagar(CadastrarDuplicataPagar);

		}

		Alert successInfo = new Alert(AlertType.INFORMATION);
		successInfo.setTitle("Sucesso");
		successInfo.setContentText("Compra e Duplicata(s) Cadastrada(s) com Sucesso!!");
		successInfo.show();

		Main.abrirTela("Compras");

 	}

	public void voltar(){
		Main.abrirTela("Menu");
	}

	@FXML
	public void sair() {
		Main.abrirTela("Main");
	}
}
