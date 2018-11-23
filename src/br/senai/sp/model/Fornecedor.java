package br.senai.sp.model;

public class Fornecedor {
	private Integer id;
	private String nome;
	private String telefone;
	private String celular;
	private String email;
	private String cnpj;

	public Fornecedor(Integer id, String nome,String telefone,String celular,String email,String cnpj){
		this.id = id;
		this.nome = nome;
		this.telefone = telefone;
		this.celular = celular;
		this.email = email;
		this.cnpj = cnpj;
	}

	public Fornecedor(Integer id, String nome){
		this.id = id;
		this.nome = nome;
	}

	//GETS

	public Integer getId(){
		return id;
	}

	public String getNome(){
		return nome;
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

	//SETS


	public void setId(Integer id){
		this.id= new Integer(id);
	}

	public void setNome(String nome){
		this.nome = nome;
	}

	public void setTelefone(String telefone){
		this.telefone = telefone;
	}

	public void setCelular(String celular){
		this.celular = celular;
	}

	public void setEmail(String email){
		this.email = email;
	}

	public void setCnpj(String cnpj){
		this.cnpj = cnpj ;
	}


}
