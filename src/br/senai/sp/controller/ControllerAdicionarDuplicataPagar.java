package br.senai.sp.controller;

import br.senai.sp.dao.ComprasDAO;
import br.senai.sp.model.AdicionarDuplicataPagar;
import br.senai.sp.model.ContasPagar;

public class ControllerAdicionarDuplicataPagar {
	
	ComprasDAO dao = ComprasDAO.getInstance();

	public void salvar(){
		boolean vencida = false; 
		boolean status = false;
		String dtPagamento = "";
		float valor = 0;
		String dtVencimento = "";
		int idConta = 1;
		
//		AdicionarDuplicataPagar CadastrarDuplicataPagar = new AdicionarDuplicataPagar(vencida, status, dtPagamento, valor, dtVencimento, idConta); 
		
//		dao.salvarDuplicataPagar(CadastrarDuplicataPagar);
	}
}
