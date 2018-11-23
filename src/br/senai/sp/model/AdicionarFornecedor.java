package br.senai.sp.model;

import br.senai.sp.dao.FornecedorDAO;

public class AdicionarFornecedor {

	private String fornecedor;
	private String telefone;
	private String celular;
	private String email;
	private String cnpj;

	Fornecedor fornecedorAtualizar;

	private boolean atualizacao=false;

	FornecedorDAO dao = new FornecedorDAO();


	public AdicionarFornecedor(String fornecedor, String telefone, String celular, String email, String cnpj) {
		this.fornecedor = fornecedor;
		this.telefone = telefone;
		this.celular = celular;
		this.email = email;
		this.cnpj = cnpj;
	}

	public String getFornecedor(){
		return fornecedor;
	}
	public String getTelefone(){
		return telefone;
	}
	public String getCelular(){
		return celular;
	}
	public String getEmail(){
		return email;
	}
	public String getCnpj(){
		return cnpj;
	}




}
